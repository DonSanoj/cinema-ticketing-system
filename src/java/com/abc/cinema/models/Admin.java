/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.abc.cinema.models;

import java.sql.Timestamp;

/**
 *
 * @author Shaun
 */
public class Admin {
    
    private final int admin_id;
    private final String admin_email;
    private final String admin_name;
    private final String password;
    private final String phone_number;
    private final String admin_type;
    private final Timestamp created_at;

    public Admin(int admin_id, String admin_email, String admin_name, String password, String phone_number, String admin_type, Timestamp created_at) {

        this.admin_id = admin_id;
        this.admin_email = admin_email;
        this.admin_name = admin_name;
        this.password = password;
        this.phone_number = phone_number;
        this.admin_type = admin_type;
        this.created_at = created_at;
    }

    public int getAdminId() {
        return admin_id;
    }

    public String getAdminEmail() {
        return admin_email;
    }

    public String getAdminname() {
        return admin_name;
    }

    public String getPassword() {
        return password;
    }

    public String getPhoneNumber() {
        return phone_number;
    }

    public String getAdminType() {
        return admin_type;
    }

    public Timestamp getCreatedAt() {
        return created_at;
    }
    
}
