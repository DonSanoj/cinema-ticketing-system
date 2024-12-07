/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.abc.cinema.models;

import java.sql.Timestamp;

/**
 *
 * @author Shayan
 */
public class Customer {

    private final int customer_id;
    private final String email;
    private final String customer_name;
    private final String phoneNumber;
    private final String password;
    private final Timestamp createdAt;

    public Customer(int customer_id, String email, String customer_name, String phoneNumber, String password, Timestamp createdAt) {

        this.customer_id = customer_id;
        this.email = email;
        this.customer_name = customer_name;
        this.phoneNumber = phoneNumber;
        this.password = password;
        this.createdAt = createdAt;
    }

    public int getCustomerId() {
        return customer_id;
    }

    public String getEmail() {
        return email;
    }

    public String getCustomername() {
        return customer_name;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public String getPassword() {
        return password;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }
}
