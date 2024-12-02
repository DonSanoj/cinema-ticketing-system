/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.abc.cinema.dao;

import com.abc.cinema.models.Customer;
import com.abc.cinema.utils.DbConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.sql.ResultSet;

/**
 *
 * @author Shaun
 */
public class CustomerDAO {

    //Register Customer
    public static boolean registerCustomer(Customer customer) throws SQLException {

        String sql = "INSERT INTO customers (email, customer_name, phone_number, password, created_at) VALUES (?, ?, ?, ?, ?)";
        try (Connection connection = DbConnection.getConnection(); PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, customer.getEmail());
            statement.setString(2, customer.getCustomername());
            statement.setString(3, customer.getPhoneNumber());
            statement.setString(4, customer.getPassword());
            statement.setTimestamp(5, customer.getCreatedAt());

            return statement.executeUpdate() > 0;
        }
    }

    //Check if email already exist
    public static boolean emailExists(String email) throws SQLException {

        String sql = "SELECT COUNT(*) FROM customers WHERE email = ?";
        try (Connection connection = DbConnection.getConnection(); PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, email);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        }
        return false;
    }

    //get customer by email
    public static Customer getCustomerByEmail(String email) throws SQLException {

        String sql = "SELECT * FROM customers WHERE email = ?";

        try (Connection connection = DbConnection.getConnection(); PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, email);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {

                int customerId = rs.getInt("customer_id");
                String customer_name = rs.getString("customer_name");
                String phoneNumber = rs.getString("phone_number");
                String password = rs.getString("password");
                Timestamp createdAt = rs.getTimestamp("created_at");

                return new Customer(customerId, email, customer_name, phoneNumber, password, createdAt);
            }
        }

        return null;
    }

}
