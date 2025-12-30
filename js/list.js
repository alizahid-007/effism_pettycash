// js/list.js
document.addEventListener("DOMContentLoaded", loadListing);

function getUser() {
  return JSON.parse(localStorage.getItem('user') || 'null');
}

async function loadListing() {
  const user = getUser();
  if (!user) {
    window.location.href = "index.html";
    return;
  }

  const claimList = document.getElementById("claim-list");
  claimList.innerHTML = `<tr><td colspan="6">Loading...</td></tr>`;

  try {
    const res = await fetch("/effism-pettycash/api/list.php", {
      method: "GET",
      credentials: "include"
    });

    // if server responds non-JSON (e.g., HTML error), catch it
    const text = await res.text();
    let data;
    try {
      data = JSON.parse(text);
    } catch (err) {
      console.error("Non-JSON response from server:", text);
      claimList.innerHTML = `<tr><td colspan="6">Error loading claims.</td></tr>`;
      return;
    }

    if (data.status !== "success" || !Array.isArray(data.data)) {
      const msg = data.message || "No claims found.";
      claimList.innerHTML = `<tr><td colspan="6">${msg}</td></tr>`;
      return;
    }

    const claims = data.data;
    if (claims.length === 0) {
      claimList.innerHTML = `<tr><td colspan="6">No claims found.</td></tr>`;
      return;
    }

    // render rows
    claimList.innerHTML = "";
    claims.forEach((claim) => {
      const tr = document.createElement("tr");
      tr.innerHTML = `
        <td>${claim.claim_no ?? claim.claim_id}</td>
        <td>${claim.requester_name ?? "-"}</td>
        <td>${claim.total_amount ?? "-"}</td>
        <td><span class="status-badge ${statusClass(claim.status)}">${escapeHtml(claim.status ?? '')}</span></td>
        <td>${claim.created_at ?? "-"}</td>
        <td><button class="btn-view" onclick="viewClaim('${claim.claim_id}')">View</button></td>
      `;
      claimList.appendChild(tr);
    });

    // cache (optional)
    localStorage.setItem('claims', JSON.stringify(claims));
  } catch (err) {
    console.error("Fetch error:", err);
    claimList.innerHTML = `<tr><td colspan="6">Error loading claims.</td></tr>`;
  }
}

function viewClaim(id) {
  if (!id) return;
  window.location.href = `review.html?id=${encodeURIComponent(id)}`;
}

function statusClass(status) {
  if (!status) return '';
  status = status.toLowerCase();
  if (status.includes('pending')) return 'status-pending';
  if (status.includes('approved')) return 'status-approved';
  if (status.includes('rejected')) return 'status-rejected';
  return '';
}

function escapeHtml(unsafe) {
  return (''+unsafe).replace(/[&<>"']/g, function(m){ return ({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#039;'})[m]; });
}
