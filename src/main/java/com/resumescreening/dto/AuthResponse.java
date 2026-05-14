package com.resumescreening.dto;

import com.resumescreening.entity.User.Role;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * DTO returned after successful authentication (register or login).
 * Contains the JWT token and basic user info.
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AuthResponse {

    private String token;
    private String name;
    private String email;
    private Role role;
}
