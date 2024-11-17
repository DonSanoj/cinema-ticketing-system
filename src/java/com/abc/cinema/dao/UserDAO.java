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

/**
 *
 * @author DON
 */
public class UserDAO {

    public static boolean registerUser(User user) throws SQLException {

        String sql = "INSERT INTO users (email, username, phoneNumber, password) VALUES (?, ?, ?, ?)";

        try (Connection connection = DbConnection.getConnection(); PreparedStatement stmt = connection.prepareStatement(sql)) {

            stmt.setString(1, user.getEmail());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPhoneNumber());
            stmt.setString(4, user.getPassword());

            return stmt.executeUpdate() > 0;
        }
    }
}
