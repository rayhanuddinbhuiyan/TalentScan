/**
 * Service package — business logic layer.
 *
 * Current services:
 * - AuthService    — Register, login, get current user
 *
 * Future additions:
 * - ResumeService         — Upload, parse, and store resumes (PDF/DOCX)
 * - JobPostingService     — CRUD for recruiter job postings
 * - ScreeningService      — Orchestrate AI-based resume screening pipeline
 * - AiIntegrationService  — Calls to external AI/ML model APIs (OpenAI, Gemini, etc.)
 * - EmailService          — Notify applicants on screening results
 * - FileStorageService    — S3 / local file handling for resume uploads
 */
package com.resumescreening.service;
