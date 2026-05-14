<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>TalentScan — Dashboard</title>
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet" />
  <link rel="stylesheet" href="/style.css" />
</head>
<body>

  <!-- BACKGROUND BLOBS -->
  <div class="bg-blob blob-1"></div>
  <div class="bg-blob blob-2"></div>
  <div class="bg-blob blob-3"></div>

  <div class="page active" style="display:flex; flex-direction:column; align-items:stretch; justify-content:flex-start;">
    
    <nav class="topbar">
      <div class="topbar-brand">
        <div class="brand-icon small">
          <svg viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
            <rect width="40" height="40" rx="12" fill="url(#lg2)"/>
            <path d="M12 14h16M12 20h10M12 26h13" stroke="#fff" stroke-width="2.5" stroke-linecap="round"/>
            <circle cx="30" cy="26" r="5" fill="#fff" fill-opacity=".2" stroke="#fff" stroke-width="1.5"/>
            <path d="M28.5 26l1 1 2-2" stroke="#fff" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
            <defs><linearGradient id="lg2" x1="0" y1="0" x2="40" y2="40" gradientUnits="userSpaceOnUse">
              <stop stop-color="#6C63FF"/><stop offset="1" stop-color="#3ECFCF"/>
            </linearGradient></defs>
          </svg>
        </div>
        <span>TalentScan</span>
      </div>
      <div class="topbar-actions">
        <div class="user-chip">
          <div class="user-avatar">${fn:toUpperCase(fn:substring(user.name, 0, 1))}</div>
          <span>${user.name}</span>
          <span class="role-badge">${user.role}</span>
        </div>
        <form action="/logout" method="post" style="margin:0;">
          <button class="btn-logout" type="submit">Sign Out</button>
        </form>
      </div>
    </nav>

    <main class="dashboard">
      <!-- Welcome hero -->
      <div class="hero-card">
        <div class="hero-text">
          <p class="hero-greeting">Welcome back,</p>
          <h2 class="hero-name">${user.name}</h2>
          <p class="hero-sub">You're signed in as ${fn:toLowerCase(user.role)}</p>
        </div>
        <div class="hero-graphic">
          <div class="hero-circle c1"></div>
          <div class="hero-circle c2"></div>
          <div class="hero-circle c3"></div>
        </div>
      </div>

      <!-- Stats row -->
      <div class="stats-grid">
        <div class="stat-card">
          <div class="stat-icon" style="background:linear-gradient(135deg,#6C63FF,#9C94FF)">👤</div>
          <div class="stat-info">
            <div class="stat-label">Account Status</div>
            <div class="stat-value" style="color:#6C63FF">Active</div>
          </div>
        </div>
        <div class="stat-card">
          <div class="stat-icon" style="background:linear-gradient(135deg,#3ECFCF,#00B4B4)">🎫</div>
          <div class="stat-info">
            <div class="stat-label">Session</div>
            <div class="stat-value" style="color:#3ECFCF">Server Authenticated</div>
          </div>
        </div>
        <div class="stat-card">
          <div class="stat-icon" style="background:linear-gradient(135deg,#FF6B9D,#FF4080)">🔐</div>
          <div class="stat-info">
            <div class="stat-label">Role</div>
            <div class="stat-value" style="color:#FF6B9D">${user.role}</div>
          </div>
        </div>
      </div>

      <!-- Profile card -->
      <div class="profile-card">
        <div class="profile-header">
          <h3>Profile Information</h3>
        </div>
        <div class="profile-grid">
          <div class="profile-field">
            <div class="pf-label">Full Name</div>
            <div class="pf-value">${user.name}</div>
          </div>
          <div class="profile-field">
            <div class="pf-label">Email Address</div>
            <div class="pf-value">${user.email}</div>
          </div>
          <div class="profile-field">
            <div class="pf-label">Account Role</div>
            <div class="pf-value">${user.role}</div>
          </div>
          <div class="profile-field">
            <div class="pf-label">Member Since</div>
            <div class="pf-value">${user.createdAt}</div>
          </div>
          <div class="profile-field">
            <div class="pf-label">User ID</div>
            <div class="pf-value">#${user.id}</div>
          </div>
          <div class="profile-field">
            <div class="pf-label">Server Tech</div>
            <div class="pf-value" style="color:#3ECFCF">Spring Boot + JSP</div>
          </div>
        </div>
      </div>
    </main>

  </div>

</body>
</html>
