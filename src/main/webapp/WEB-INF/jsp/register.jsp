<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>TalentScan — Create Account</title>
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet" />
  <link rel="stylesheet" href="/style.css" />
</head>
<body>

  <!-- BACKGROUND BLOBS -->
  <div class="bg-blob blob-1"></div>
  <div class="bg-blob blob-2"></div>
  <div class="bg-blob blob-3"></div>

  <div class="page active">
    <div class="auth-card">
      <div class="brand">
        <div class="brand-icon">
          <svg viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
            <rect width="40" height="40" rx="12" fill="url(#lg)"/>
            <path d="M12 14h16M12 20h10M12 26h13" stroke="#fff" stroke-width="2.5" stroke-linecap="round"/>
            <circle cx="30" cy="26" r="5" fill="#fff" fill-opacity=".2" stroke="#fff" stroke-width="1.5"/>
            <path d="M28.5 26l1 1 2-2" stroke="#fff" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
            <defs><linearGradient id="lg" x1="0" y1="0" x2="40" y2="40" gradientUnits="userSpaceOnUse">
              <stop stop-color="#6C63FF"/><stop offset="1" stop-color="#3ECFCF"/>
            </linearGradient></defs>
          </svg>
        </div>
        <div>
          <h1 class="brand-name">TalentScan</h1>
          <p class="brand-tagline">AI-Powered Resume Screening</p>
        </div>
      </div>

      <div class="tabs register-active" role="tablist">
        <button class="tab" onclick="window.location.href='/login'" role="tab">Sign In</button>
        <button class="tab active" role="tab">Create Account</button>
        <div class="tab-indicator"></div>
      </div>

      <!-- REGISTER FORM -->
      <form class="auth-form active" action="/register" method="post">
        
        <c:if test="${not empty error}">
            <div class="alert error">${error}</div>
        </c:if>

        <div class="field">
          <label for="name">Full Name</label>
          <div class="input-wrap">
            <span class="input-icon">👤</span>
            <input id="name" name="name" type="text" placeholder="John Doe" required />
          </div>
        </div>

        <div class="field">
          <label for="email">Email Address</label>
          <div class="input-wrap">
            <span class="input-icon">✉</span>
            <input id="email" name="email" type="email" placeholder="you@example.com" required />
          </div>
        </div>

        <div class="field">
          <label for="password">Password <span class="hint">(min 6 chars)</span></label>
          <div class="input-wrap">
            <span class="input-icon">🔒</span>
            <input id="password" name="password" type="password" placeholder="••••••••" required />
          </div>
        </div>

        <div class="field">
          <label>Account Role</label>
          <div class="role-grid">
            <label class="role-card" onclick="document.querySelectorAll('.role-card').forEach(c=>c.classList.remove('selected'));this.classList.add('selected')">
              <input type="radio" name="role" value="APPLICANT" required />
              <div class="role-icon">🎓</div>
              <div class="role-name">Applicant</div>
              <div class="role-desc">Looking for jobs</div>
            </label>
            <label class="role-card" onclick="document.querySelectorAll('.role-card').forEach(c=>c.classList.remove('selected'));this.classList.add('selected')">
              <input type="radio" name="role" value="RECRUITER" />
              <div class="role-icon">🏢</div>
              <div class="role-name">Recruiter</div>
              <div class="role-desc">Hiring talent</div>
            </label>
            <label class="role-card" onclick="document.querySelectorAll('.role-card').forEach(c=>c.classList.remove('selected'));this.classList.add('selected')">
              <input type="radio" name="role" value="ADMIN" />
              <div class="role-icon">⚙️</div>
              <div class="role-name">Admin</div>
              <div class="role-desc">System manager</div>
            </label>
          </div>
        </div>

        <button class="btn-primary" type="submit">
          <span class="btn-text">Create Account</span>
        </button>

        <p class="form-footer">Already have an account? <a href="/login">Sign in</a></p>
      </form>

    </div>
  </div>

  <script>
    // Make the first role card selected by default on page load
    document.querySelector('.role-card input[value="APPLICANT"]').closest('.role-card').classList.add('selected');
    document.querySelector('.role-card input[value="APPLICANT"]').checked = true;
  </script>
</body>
</html>
