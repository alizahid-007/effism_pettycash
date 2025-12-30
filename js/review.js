// js/review.js
document.addEventListener("DOMContentLoaded", loadClaimData);

let claimGlobal = null;
let currentUser = null;

function getUser() {
  return JSON.parse(localStorage.getItem('user') || 'null');
}

async function loadClaimData() {
  const params = new URLSearchParams(window.location.search);
  const claimId = params.get("id");
  currentUser = getUser();
  if (!currentUser) {
    alert("Session expired. Please login.");
    window.location.href = "index.html";
    return;
  }
  if (!claimId) {
    alert("Invalid Claim ID");
    window.location.href = "listing.html";
    return;
  }

  try {
    const res = await fetch(`${BASE_URL}/get_claim_details.php?id=${encodeURIComponent(claimId)}`, { credentials: "include" });
    const data = await res.json();
    if (data.status !== 'success') {
      alert('Claim not found');
      window.location.href = 'listing.html';
      return;
    }
    claimGlobal = data.claim;

    // header
    document.getElementById("claimId").textContent = "Claim ID: " + claimGlobal.claim_no || claimGlobal.claim_id;
    document.getElementById("claimRequester").textContent = claimGlobal.requester_name || '-';
    document.getElementById("claimAmount").textContent = (claimGlobal.total_amount || '-') + ' ' + (claimGlobal.currency || '');
    document.getElementById("claimStatus").textContent = claimGlobal.status || '';
    document.getElementById("claimDate").textContent = claimGlobal.created_at || '';

    // load details & attachments & logs
    loadLineItems(data.items || []);
    loadLogs(data.logs || []);

    renderActionButtons();
  } catch (err) {
    console.error(err);
    alert('Error loading claim');
  }
}

function loadLineItems(items) {
  const container = document.getElementById("attachmentList");
  container.innerHTML = `<h5 class='mt-3'>Line Items</h5>`;
  if (!items.length) {
    container.innerHTML += `<p>No items found.</p>`;
    return;
  }
  let html = `<table class="table table-bordered mt-2"><thead class="table-dark"><tr>
      <th>#</th><th>Description</th><th>Main</th><th>Sub</th><th>Amount</th><th>Job</th><th>Company</th><th>Division</th><th>Attachments</th>
    </tr></thead><tbody>`;
  items.forEach((i, idx) => {
    let attachHtml = "<span class='text-muted'>No attachment</span>";
    if (i.attachments && i.attachments.length) {
      attachHtml = i.attachments.map(a => `<a href="${BASE_URL.replace('/api','')}/uploads/${a.file_name}" target="_blank">${a.file_name}</a>`).join('<br>');
    }
    html += `<tr>
      <td>${idx+1}</td>
      <td>${escapeHtml(i.description||'')}</td>
      <td>${escapeHtml(i.main_category||'')}</td>
      <td>${escapeHtml(i.sub_category||'')}</td>
      <td>${escapeHtml(i.amount||'0')}</td>
      <td>${escapeHtml(i.job_no||'')}</td>
      <td>${escapeHtml(i.company||'')}</td>
      <td>${escapeHtml(i.division||'')}</td>
      <td>${attachHtml}</td>
    </tr>`;
  });
  html += `</tbody></table>`;
  container.innerHTML += html;
}

function loadLogs(logs) {
  const container = document.getElementById("attachmentList");
  container.innerHTML += `<h5 class='mt-4'>Approval Timeline</h5>`;
  if (!logs.length) { container.innerHTML += `<p>No history available</p>`; return; }
  let html = `<ul class='list-group'>`;
  logs.forEach(l => {
    html += `<li class='list-group-item'><strong>${escapeHtml(l.action)}</strong> — ${escapeHtml(l.note||'')} <br><small>By: ${escapeHtml(l.done_by||'')} | ${escapeHtml(l.created_at||'')}</small></li>`;
  });
  html += `</ul>`;
  container.innerHTML += html;
}

function renderActionButtons() {
  const div = document.querySelector('.actions');
  div.innerHTML = '';
  const u = currentUser;
  const c = claimGlobal;
  if (!u || !c) { div.innerHTML = "<p class='text-muted'>No actions available</p>"; return; }

  const isRequester = Number(u.user_id) === Number(c.requester_id);
  const isAssigned = Number(u.user_id) === Number(c.assigned_to);

  // Requester: if status is Clarification Required -> show Edit + Resubmit
  if (isRequester && /clarification/i.test((c.status||''))) {
    div.innerHTML = `<button class="btn-edit btn btn-warning" onclick="editClaim()">Edit</button>
                     <button class="btn-approve btn btn-success" onclick="resubmitClaim()">Resubmit</button>`;
    return;
  }

  // Assigned approver actions
  if (isAssigned && u.role !== 'requester') {
    div.innerHTML = `<button class="btn-reject btn btn-danger" onclick="updateClaimStatus('reject')">Reject</button>
                     <button class="btn-clarify btn btn-info" onclick="updateClaimStatus('clarify')">Need Clarification</button>
                     <button class="btn-approve btn btn-success" onclick="updateClaimStatus('approve')">Approve</button>`;
    return;
  }

  div.innerHTML = "<p class='text-muted'>No actions available for your role.</p>";
}

async function updateClaimStatus(action) {
  const claimId = new URLSearchParams(window.location.search).get('id');
  const note = document.getElementById('remarks').value || '';
  try {
    const res = await fetch(`${BASE_URL}/approve.php`, {
      method:'POST', headers:{'Content-Type':'application/json'}, credentials:'include',
      body: JSON.stringify({ claim_id: claimId, action, note })
    });
    const j = await res.json();
    alert(j.message || (j.status==='success'?'Done':'Failed'));
    if (j.status === 'success') window.location.href = 'dashboard.html';
  } catch (err) {
    console.error(err);
    alert('Failed to update');
  }
}

async function resubmitClaim() {
  const claimId = new URLSearchParams(window.location.search).get('id');
  const note = document.getElementById('remarks').value || '';
  try {
    const res = await fetch(`${BASE_URL}/approve.php`, {
      method:'POST', headers:{'Content-Type':'application/json'}, credentials:'include',
      body: JSON.stringify({ claim_id: claimId, action: 'resubmit', note })
    });
    const j = await res.json();
    alert(j.message || (j.status==='success'?'Resubmitted':'Failed'));
    if (j.status === 'success') window.location.href = 'dashboard.html';
  } catch (err) {
    console.error(err);
    alert('Resubmit failed');
  }
}

function editClaim() {
  const claimId = new URLSearchParams(window.location.search).get('id');
  window.location.href = `entry-form.html?edit=${encodeURIComponent(claimId)}`;
}

function escapeHtml(s) {
  return (''+s).replace(/[&<>"']/g, m=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":"&#039;"}[m]));
}
