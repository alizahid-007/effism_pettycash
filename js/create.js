// js/create.js
document.addEventListener("DOMContentLoaded", () => {
  const submitBtn = document.getElementById("submitClaimBtn");
  submitBtn.addEventListener("click", submitClaim);
});

async function submitClaim() {
  updateTotals();

  const currency = document.getElementById("currency").value;
  const total = parseFloat(document.getElementById("grandTotal").textContent);

  const user = getUser();
  if (!user) {
    alert("Session expired. Please login again.");
    window.location.href = "index.html";
    return;
  }

  if (!currency) {
    alert("Please choose currency.");
    return;
  }

  // ----------------------------------------
  // Build FORM DATA for file upload
  // ----------------------------------------
  const formData = new FormData();
  formData.append("currency", currency);
  formData.append("total_amount", total);

  const items = [];
  let rowIndex = 0;

  document.querySelectorAll(".bill-section .bill-body tr").forEach((r) => {
    const desc = r.querySelector(".desc")?.value.trim();
    const mainCat = r.querySelector(".main-cat")?.value;
    const subCat = r.querySelector(".sub-cat")?.value;
    const amt = parseFloat(r.querySelector(".amt")?.value);
    const job = r.querySelector(".job")?.value.trim();
    const company = r.querySelector(".company")?.value.trim();
    const division = r.querySelector(".division")?.value.trim();
    const file = r.querySelector(".attach")?.files[0];

    if (desc && amt > 0) {
      const item = {
        index: rowIndex,
        description: desc,
        main_category: mainCat,
        sub_category: subCat,
        amount: amt,
        job_no: job,
        company: company,
        division: division
      };

      items.push(item);

      if (file) {
        formData.append("file_" + rowIndex, file);
      }

      rowIndex++;
    }
  });

  if (items.length === 0) {
    alert("Please add at least one valid bill row.");
    return;
  }

  formData.append("items", JSON.stringify(items));

  try {
    const res = await fetch(`${BASE_URL}/create.php`, {
      method: "POST",
      credentials: "include",
      body: formData // IMPORTANT!
    });

    const data = await res.json();

    if (data.status === "success") {
      alert("Claim created successfully!");
      window.location.href = "dashboard.html";
    } else {
      alert(data.message);
    }
  } catch (err) {
    console.error("Submit Error:", err);
    alert("Error submitting claim.");
  }
}
