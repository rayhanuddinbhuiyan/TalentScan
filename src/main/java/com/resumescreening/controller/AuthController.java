package com.resumescreening.controller;

import com.resumescreening.dto.AuthResponse;
import com.resumescreening.dto.LoginRequest;
import com.resumescreening.dto.RegisterRequest;
import com.resumescreening.dto.UserResponse;
import com.resumescreening.entity.User;
import com.resumescreening.service.AuthService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * REST controller for user authentication endpoints.
 *
 * POST /api/auth/register  — Register a new user
 * POST /api/auth/login     — Login and receive JWT
 * GET  /api/auth/me        — Get current authenticated user (requires Bearer token)
 */
@RestController
@RequestMapping("/api/auth")
@RequiredArgsConstructor
public class AuthController {

    private final AuthService authService;

    // -------------------------------------------------------
    // POST /api/auth/register
    // -------------------------------------------------------

    /**
     * Register a new user account.
     *
     * Request Body:
     * {
     *   "name": "John Doe",
     *   "email": "john@example.com",
     *   "password": "secret123",
     *   "role": "APPLICANT"
     * }
     *
     * Response (201 Created):
     * {
     *   "token": "<jwt>",
     *   "name": "John Doe",
     *   "email": "john@example.com",
     *   "role": "APPLICANT"
     * }
     */
    @PostMapping("/register")
    public ResponseEntity<AuthResponse> register(@Valid @RequestBody RegisterRequest request) {
        AuthResponse response = authService.register(request);
        return ResponseEntity.status(HttpStatus.CREATED).body(response);
    }

    // -------------------------------------------------------
    // POST /api/auth/login
    // -------------------------------------------------------

    /**
     * Authenticate and receive a JWT token.
     *
     * Request Body:
     * {
     *   "email": "john@example.com",
     *   "password": "secret123"
     * }
     *
     * Response (200 OK):
     * {
     *   "token": "<jwt>",
     *   "name": "John Doe",
     *   "email": "john@example.com",
     *   "role": "APPLICANT"
     * }
     *
     * Response (401 Unauthorized) on bad credentials.
     */
    @PostMapping("/login")
    public ResponseEntity<AuthResponse> login(@Valid @RequestBody LoginRequest request) {
        AuthResponse response = authService.login(request);
        return ResponseEntity.ok(response);
    }

    // -------------------------------------------------------
    // GET /api/auth/me  (Protected)
    // -------------------------------------------------------

    /**
     * Returns the currently authenticated user's profile.
     * Requires a valid Bearer JWT token in the Authorization header.
     *
     * Response (200 OK):
     * {
     *   "id": 1,
     *   "name": "John Doe",
     *   "email": "john@example.com",
     *   "role": "APPLICANT",
     *   "createdAt": "2024-01-15T10:30:00"
     * }
     */
    @GetMapping("/me")
    public ResponseEntity<UserResponse> getCurrentUser(@AuthenticationPrincipal User user) {
        UserResponse response = authService.getCurrentUser(user.getEmail());
        return ResponseEntity.ok(response);
    }

    // -------------------------------------------------------
    // GET /api/auth/ping  (Health check — public)
    // -------------------------------------------------------

    @GetMapping("/ping")
    public ResponseEntity<Map<String, String>> ping() {
        return ResponseEntity.ok(Map.of(
                "status", "UP",
                "service", "AI Resume Screening System",
                "message", "Authentication service is running"
        ));
    }
}
