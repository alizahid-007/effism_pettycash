<?php
header("Content-Type: application/json");
include_once __DIR__ . "/../includes/db.php";
include_once __DIR__ . "/../includes/auth.php";
require_login();

if ($_SERVER["REQUEST_METHOD"] !== "POST") {
    echo json_encode(["status" => "error", "message" => "Invalid request"]);
    exit;
}

$claimId          = intval($_POST["claim_id"] ?? 0);
$currency         = trim($_POST["currency"] ?? "");
$totalAmount      = floatval($_POST["total_amount"] ?? 0);
$deleteAttachList = json_decode($_POST["delete_attachments"] ?? "[]", true);
$items            = json_decode($_POST["items"] ?? "[]", true);

if ($claimId <= 0) {
    echo json_encode(["status" => "error", "message" => "Invalid claim ID"]);
    exit;
}

try {
    $pdo->beginTransaction();

    /* ----------------------------------------------------
       1. UPDATE CLAIM HEADER + RESET WORKFLOW
    ---------------------------------------------------- */
    $stmt = $pdo->prepare("
        UPDATE claims 
        SET currency = ?, 
            total_amount = ?, 
            status = 'Pending Review',
            assigned_role = 'reviewer',
            updated_at = NOW()
        WHERE claim_id = ?
    ");
    $stmt->execute([$currency, $totalAmount, $claimId]);

    // assign back to reviewer
    $rev = $pdo->query("SELECT user_id FROM users WHERE role_id = 2 LIMIT 1")->fetch();
    $reviewerId = $rev ? intval($rev["user_id"]) : null;

    $pdo->prepare("UPDATE claims SET assigned_to = ? WHERE claim_id = ?")
        ->execute([$reviewerId, $claimId]);

    /* ----------------------------------------------------
       2. DELETE ATTACHMENTS REQUESTED BY USER
    ---------------------------------------------------- */
    if (!empty($deleteAttachList)) {
        $delStmt = $pdo->prepare("DELETE FROM claim_attachments WHERE attachment_id = ?");
        foreach ($deleteAttachList as $attId) {
            $delStmt->execute([$attId]);
        }
    }

    /* ----------------------------------------------------
       3. FETCH EXISTING LINE ITEMS (detail_id mapping)
    ---------------------------------------------------- */
    $oldItemsStmt = $pdo->prepare("SELECT detail_id FROM claim_details WHERE claim_id = ?");
    $oldItemsStmt->execute([$claimId]);
    $oldDetailIds = $oldItemsStmt->fetchAll(PDO::FETCH_COLUMN);

    $incomingDetailIds = [];
    foreach ($items as $i) {
        if (!empty($i["detail_id"])) {
            $incomingDetailIds[] = intval($i["detail_id"]);
        }
    }

    /* ----------------------------------------------------
       4. DELETE LINE ITEMS THAT WERE REMOVED BY USER
    ---------------------------------------------------- */
    $deleteThese = array_diff($oldDetailIds, $incomingDetailIds);

    if (!empty($deleteThese)) {
        $delRow = $pdo->prepare("DELETE FROM claim_details WHERE detail_id = ?");
        foreach ($deleteThese as $did) {
            $delRow->execute([$did]);
        }
    }

    /* ----------------------------------------------------
       5. UPDATE OR INSERT EACH LINE ITEM
    ---------------------------------------------------- */
    $updateRow = $pdo->prepare("
        UPDATE claim_details 
        SET description=?, main_category=?, sub_category=?, amount=?, job_no=?, company=?, division=?
        WHERE detail_id=?
    ");

    $insertRow = $pdo->prepare("
        INSERT INTO claim_details 
        (claim_id, description, main_category, sub_category, amount, job_no, company, division)
        VALUES (?,?,?,?,?,?,?,?)
    ");

    $detailIdMap = [];   // new mapping for attachment linking

    foreach ($items as $i) {

        $detailId = intval($i["detail_id"] ?? 0);
        $desc     = $i["description"] ?? "";
        $main     = $i["main_category"] ?? "";
        $sub      = $i["sub_category"] ?? "";
        $amt      = floatval($i["amount"] ?? 0);
        $job      = $i["job_no"] ?? "";
        $company  = $i["company"] ?? "";
        $division = $i["division"] ?? "";

        if ($detailId > 0) {
            // update row
            $updateRow->execute([$desc, $main, $sub, $amt, $job, $company, $division, $detailId]);
        } else {
            // insert new row
            $insertRow->execute([$claimId, $desc, $main, $sub, $amt, $job, $company, $division]);
            $detailId = $pdo->lastInsertId();
        }

        $detailIdMap[$i["index"]] = $detailId;
    }

    /* ----------------------------------------------------
       6. PROCESS NEW ATTACHMENTS (file_0, file_1...)
    ---------------------------------------------------- */
    $attachInsert = $pdo->prepare("
        INSERT INTO claim_attachments (claim_id, detail_id, file_name)
        VALUES (?, ?, ?)
    ");

    foreach ($_FILES as $key => $file) {
        if (strpos($key, "file_") === 0 && $file["error"] === 0) {
            $idx = intval(str_replace("file_", "", $key));
            if (!isset($detailIdMap[$idx])) continue;

            $detailId = $detailIdMap[$idx];

            $fileName = time() . "_" . basename($file["name"]);
            $target = __DIR__ . "/../uploads/" . $fileName;
            move_uploaded_file($file["tmp_name"], $target);

            $attachInsert->execute([$claimId, $detailId, $fileName]);
        }
    }

    /* ----------------------------------------------------
       7. AUDIT LOG
    ---------------------------------------------------- */
    $log = $pdo->prepare("
        INSERT INTO audit_log (claim_id, user_id, action, note)
        VALUES (?,?,?,?)
    ");

    $log->execute([
        $claimId,
        $_SESSION["user_id"],
        "Resubmitted",
        "Requester resubmitted claim after clarification"
    ]);

    $pdo->commit();

    echo json_encode([
        "status" => "success",
        "message" => "Claim updated & resubmitted successfully!"
    ]);
    exit;

} catch (Exception $e) {
    if ($pdo->inTransaction()) $pdo->rollBack();

    echo json_encode([
        "status" => "error",
        "message" => $e->getMessage()
    ]);
    exit;
}
