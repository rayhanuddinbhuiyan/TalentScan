package com.resumescreening.repository;

import com.resumescreening.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

/**
 * Repository for User entity — provides CRUD operations and custom finders.
 */
@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    /**
     * Find a user by their email address.
     */
    Optional<User> findByEmail(String email);

    /**
     * Check if an email address is already registered.
     */
    boolean existsByEmail(String email);
}
