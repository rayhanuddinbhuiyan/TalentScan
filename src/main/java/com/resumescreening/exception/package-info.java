/**
 * Exception package — custom exceptions and global error handling.
 *
 * Current exceptions:
 * - EmailAlreadyExistsException  — 409 Conflict on duplicate registration
 * - InvalidCredentialsException  — 401 Unauthorized on bad login
 * - ResourceNotFoundException    — 404 Not Found for missing resources
 * - GlobalExceptionHandler       — @RestControllerAdvice for all errors
 *
 * Future additions:
 * - FileStorageException    — Resume upload/storage failures
 * - AiServiceException      — AI model invocation failures
 * - QuotaExceededException  — Rate limiting for AI screening
 */
package com.resumescreening.exception;
