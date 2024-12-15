/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.abc.cinema.dao;

/**
 *
 * @author Pamith
 */
import com.abc.cinema.models.Admin;
import com.abc.cinema.models.Customer;
import com.abc.cinema.utils.DbConnection;

import java.sql.*;

import java.util.ArrayList;

public class AllUsersManageDAO {

    public ArrayList<Admin> getModerators() {
        ArrayList<Admin> moderatorsList = new ArrayList<>();
        try (Connection connection = DbConnection.getConnection(); PreparedStatement stmt = connection.prepareStatement("SELECT * FROM admins WHERE admin_type = 'moderator'")) {

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Admin admin = new Admin(
                        rs.getInt("admin_id"),
                        rs.getString("admin_email"),
                        rs.getString("admin_name"),
                        rs.getString("password"),
                        rs.getString("phone_number"),
                        rs.getString("admin_type"),
                        rs.getTimestamp("created_at")
                );
                moderatorsList.add(admin);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return moderatorsList;
    }

    public ArrayList<Customer> getAllCustomers() throws SQLException {
        ArrayList<Customer> customersList = new ArrayList<>();
        String query = "SELECT * FROM customers";

        try (Connection connection = DbConnection.getConnection(); PreparedStatement stmt = connection.prepareStatement(query); ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Customer customer = new Customer(
                        rs.getInt("customer_id"),
                        rs.getString("email"),
                        rs.getString("customer_name"),
                        rs.getString("phone_number"),
                        rs.getString("password"),
                        rs.getTimestamp("created_at")
                );
                customersList.add(customer);
            }
        }
        return customersList;
    }
}
