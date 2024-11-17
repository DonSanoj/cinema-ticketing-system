/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.abc.cinema.model;

/**
 *
 * @author DON
 */
public class User {
    
    private String email;
    private String username;
    private String phoneNumber;
    private String password;
    
    public User(String email, String username, String phoneNumber, String password) {
        this.email = email;
        this.username = username;
        this.phoneNumber = phoneNumber;
        this.password = password;
    }
    
    public String getEmail() {
        return email;
    }
    
    public String getUsername() {
        return username;
    }
    
    public String getPhoneNumber() {
        return phoneNumber;
    }
    
    public String getPassword() {
        return password;
    }
    
}
