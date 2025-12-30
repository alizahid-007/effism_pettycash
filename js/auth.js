// js/auth.js
document.addEventListener("DOMContentLoaded", () => {
  const loginBtn = document.getElementById("loginBtn");
  const msg = document.getElementById("message");

  loginBtn.addEventListener("click", async () => {
    const username = document.getElementById("username").value.trim();
    const password = document.getElementById("password").value.trim();

    if (!username || !password) {
      msg.textContent = "Please enter both username and password.";
      return;
    }

    try {
      const res = await fetch(`${BASE_URL}/login.php`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        credentials: "include",
        body: JSON.stringify({ username, password })
      });
      const data = await res.json();

      if (data.status === "success") {
        // Save user session in localStorage
        saveUser({
          user_id: data.user.user_id,
          username: data.user.username,
          role: data.user.role_name,
          role_level: data.user.role_level
        });

        // Redirect to dashboard
        window.location.href = "dashboard.html";
      } else {
        msg.textContent = data.message || "Invalid login credentials.";
      }
    } catch (error) {
      msg.textContent = "Unable to connect to server.";
    }
  });
});
