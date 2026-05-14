<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>TalentScan — Sign In</title>
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

      <div class="tabs" role="tablist">
        <button class="tab active" role="tab">Sign In</button>
        <button class="tab" onclick="window.location.href='/register'" role="tab">Create Account</button>
        <div class="tab-indicator"></div>
      </div>

      <!-- LOGIN FORM -->
      <form class="auth-form active" action="/login" method="post">
        
        <c:if test="${not empty param.error}">
          <div class="alert error">
            Invalid email or password.
          </div>
        </c:if>
        
        <c:if test="${not empty param.logout}">
          <div class="alert success">
            You have been logged out successfully.
          </div>
        </c:if>

        <c:if test="${not empty param.success}">
          <div class="alert success">
            Registration successful! Please sign in.
          </div>
        </c:if>

        <div class="field">
          <label for="username">Email Address</label>
          <div class="input-wrap">
            <span class="input-icon">✉</span>
            <input id="username" name="username" type="email" placeholder="you@example.com" required />
          </div>
        </div>

        <div class="field">
          <label for="password">Password</label>
          <div class="input-wrap">
            <span class="input-icon">🔒</span>
            <input id="password" name="password" type="password" placeholder="••••••••" required />
          </div>
        </div>

        <button class="btn-primary" type="submit">
          <span class="btn-text">Sign In</span>
        </button>

        <p class="form-footer">Don't have an account? <a href="/register">Create one</a></p>
      </form>

    </div>
  </div>

</body>
</html>
