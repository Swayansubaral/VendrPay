package com.vendrpay.model;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "users")

public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Long businessId;

    private String name;

    @Column(unique = true)
    private String email;

    private String password;

    private String role; // ADMIN, STAFF, VIEWER, SUPERADMIN
}
