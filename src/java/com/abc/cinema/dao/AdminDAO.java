/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.abc.cinema.dao;

import com.abc.cinema.utils.DbConnection;
import com.abc.cinema.models.Admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.sql.ResultSet;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author Shaun
 */
public class AdminDAO {

    //Register admins
    public static boolean registerAdmin(Admin admin) throws SQLException {

        String sql = "INSERT INTO admins (admin_email, admin_name, password, phone_number, admin_type, created_at) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection connection = DbConnection.getConnection(); PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, admin.getAdminEmail());
            statement.setString(2, admin.getAdminname());
            statement.setString(3, admin.getPassword());
            statement.setString(4, admin.getPhoneNumber());
            statement.setString(5, admin.getAdminType());
            statement.setTimestamp(6, admin.getCreatedAt());

            return statement.executeUpdate() > 0;
        }
    }

    //Check if email already exist
    public static boolean adminEmailExists(String admin_email) throws SQLException {

        String sql = "SELECT COUNT(*) FROM admins WHERE admin_email = ?";
        try (Connection connection = DbConnection.getConnection(); PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, admin_email);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        }
        return false;
    }

}
