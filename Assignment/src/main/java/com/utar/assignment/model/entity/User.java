package com.utar.assignment.model.entity;

import javax.persistence.*;

@Entity
@Table(name = "users", schema = "classicmodels")
@NamedQuery(name = "User.findbyAll", query = "SELECT u FROM User u")

public class User {
    @Id
    @Column(name = "username", nullable = false, length = 7)
    private String id;

    @Column(name = "password", nullable = false, length = 7)
    private String password;

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}