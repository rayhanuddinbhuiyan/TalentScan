package com.resumescreening.service;

import com.resumescreening.dto.AuthResponse;
import com.resumescreening.dto.LoginRequest;
import com.resumescreening.dto.RegisterRequest;
import com.resumescreening.dto.UserResponse;
import com.resumescreening.entity.User;
import com.resumescreening.exception.EmailAlreadyExistsException;
import com.resumescreening.exception.InvalidCredentialsException;
import com.resumescreening.exception.ResourceNotFoundException;
import com.resumescreening.repository.UserRepository;
import com.resumescreening.security.JwtService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Service layer for user authentication:
 *  - Register
 *  - Login
 *  - Get currently authenticated user profile
 */
@Service
@RequiredArgsConstructor
@Slf4j
public class AuthService {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final JwtService jwtService;

    // -------------------------------------------------------
    // Register
    // -------------------------------------------------------

    /**
     * Registers a new user after validating email uniqueness.
     * Password is BCrypt-hashed before persisting.
     *
     * @param request the registration payload
     * @return AuthResponse containing JWT token and user info
     */
    @Transactional
    public AuthResponse register(RegisterRequest request) {
        log.debug("Registering new user with email: {}", request.getEmail());

        // Check email uniqueness
        if (userRepository.existsByEmail(request.getEmail())) {
            throw new EmailAlreadyExistsException(request.getEmail());
        }

        // Build and persist user
        User user = User.builder()
                .name(request.getName())
                .email(request.getEmail())
                .password(passwordEncoder.encode(request.getPassword()))
                .role(request.getRole())
                .build();

        User savedUser = userRepository.save(user);
        log.info("New user registered: id={}, email={}, role={}", savedUser.getId(), savedUser.getEmail(), savedUser.getRole());

        // Generate token
        String token = jwtService.generateToken(savedUser);

        return AuthResponse.builder()
                .token(token)
                .name(savedUser.getName())
                .email(savedUser.getEmail())
                .role(savedUser.getRole())
                .build();
    }

    // -------------------------------------------------------
    // Login
    // -------------------------------------------------------

    /**
     * Authenticates a user by email and password.
     * Returns a JWT token on success, throws on failure.
     *
     * @param request the login payload
     * @return AuthResponse containing JWT token and user info
     */
    public AuthResponse login(LoginRequest request) {
        log.debug("Login attempt for email: {}", request.getEmail());

        User user = userRepository.findByEmail(request.getEmail())
                .orElseThrow(InvalidCredentialsException::new);

        if (!passwordEncoder.matches(request.getPassword(), user.getPassword())) {
            log.warn("Failed login attempt for email: {}", request.getEmail());
            throw new InvalidCredentialsException();
        }

        log.info("Successful login for email: {}", request.getEmail());
        String token = jwtService.generateToken(user);

        return AuthResponse.builder()
                .token(token)
                .name(user.getName())
                .email(user.getEmail())
                .role(user.getRole())
                .build();
    }

    // -------------------------------------------------------
    // Get Current User Profile
    // -------------------------------------------------------

    /**
     * Fetches the authenticated user's full profile by email.
     *
     * @param email email extracted from the JWT token (set by JwtAuthenticationFilter)
     * @return UserResponse with full user details
     */
    public UserResponse getCurrentUser(String email) {
        User user = userRepository.findByEmail(email)
                .orElseThrow(() -> new ResourceNotFoundException("User not found with email: " + email));

        return UserResponse.builder()
                .id(user.getId())
                .name(user.getName())
                .email(user.getEmail())
                .role(user.getRole())
                .createdAt(user.getCreatedAt())
                .build();
    }
}
