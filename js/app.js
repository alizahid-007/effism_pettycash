// js/app.js
const BASE_URL = "http://localhost/effism-pettycash/api";

function getUser() {
  return JSON.parse(localStorage.getItem("user"));
}

function saveUser(user) {
  localStorage.setItem("user", JSON.stringify(user));
}

function logout() {
  fetch(`${BASE_URL}/logout.php`, { credentials: "include" });
  localStorage.removeItem("user");
  window.location.href = "index.html";
}
