package com.resumescreening;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.TestPropertySource;

/**
 * Smoke test — verifies the application context loads successfully.
 * Requires a running MySQL instance; use TestPropertySource to override
 * with an in-memory H2 database if needed.
 */
@SpringBootTest
@TestPropertySource(properties = {
    "spring.datasource.url=jdbc:h2:mem:testdb;DB_CLOSE_DELAY=-1",
    "spring.datasource.driver-class-name=org.h2.Driver",
    "spring.datasource.username=sa",
    "spring.datasource.password=",
    "spring.jpa.database-platform=org.hibernate.dialect.H2Dialect",
    "jwt.secret=test_secret_key_for_unit_tests_must_be_at_least_256bits_long",
    "jwt.expiration=86400000"
})
class ResumeScreeningApplicationTests {

    @Test
    void contextLoads() {
        // Verifies that the Spring application context starts without errors
    }
}
