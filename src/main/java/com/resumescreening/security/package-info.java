/**
 * Security package — JWT infrastructure.
 *
 * Current components:
 * - JwtService                  — Token generation, parsing, validation
 * - JwtAuthenticationFilter     — Per-request Bearer token validation
 * - JwtAuthenticationEntryPoint — JSON 401 response for unauthenticated access
 *
 * Future additions:
 * - RoleBasedAccessEvaluator — Fine-grained method-level security
 * - TokenBlacklistService    — JWT revocation on logout
 * - RefreshTokenService      — Refresh token rotation
 */
package com.resumescreening.security;
