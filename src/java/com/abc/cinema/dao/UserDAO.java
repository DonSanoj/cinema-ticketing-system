/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.abc.cinema.dao;

import com.abc.cinema.model.User;
import com.abc.cinema.utils.DbConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.sql.ResultSet;

/**
 *
 * @author DON
 */
public class UserDAO {

    //Register User
    public static boolean registerUser(User user) throws SQLException {

        String sql = "INSERT INTO users (email, username, phoneNumber, password, user_type, created_at) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection connection = DbConnection.getConnection(); PreparedStatement stmt = connection.prepareStatement(sql)) {

            stmt.setString(1, user.getEmail());
            stmt.setString(2, user.getUsername());
            stmt.setString(3, user.getPhoneNumber());
            stmt.setString(4, user.getPassword());
            stmt.setString(5, user.getUserType());
            stmt.setTimestamp(6, user.getCreatedAt());

            return stmt.executeUpdate() > 0;
        }
    }

    //Check if email already exist
    public static boolean emailExists(String email) throws SQLException {

        String sql = "SELECT COUNT(*) FROM users WHERE email = ?";

        try (Connection connection = DbConnection.getConnection(); PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        }
        
        return false;
    }

    //Get a user by email
    public static User getUserByEmail(String email) throws SQLException {

        String sql = "SELECT email, username, phoneNumber, password, user_type, created_at FROM users WHERE email = ?";

        try (Connection connection = DbConnection.getConnection(); PreparedStatement stmt = connection.prepareStatement(sql)) {

            stmt.setString(1, email);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new User(
                        rs.getString("email"),
                        rs.getString("username"),
                        rs.getString("phoneNumber"),
                        rs.getString("password"), // Password is retrieved as stored in DB
                        rs.getString("user_type"),
                        rs.getTimestamp("created_at")
                );
            }
        }

        return null;
    }
}
