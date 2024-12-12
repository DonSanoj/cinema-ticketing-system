/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.abc.cinema.controllers;

import com.abc.cinema.dao.AdminDAO;
import com.abc.cinema.models.Admin;

import java.io.IOException;
import java.sql.Timestamp;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author Himantha
 */

@WebServlet("/Admin/add_new_admins")
public class AdminRegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String admin_email = req.getParameter("admin_email");
        String admin_name = req.getParameter("admin_name");
        String password = req.getParameter("password");
        String phoneNumber = req.getParameter("phoneNumber");

        String admin_type = "moderate";
        Timestamp createdAt = new Timestamp(System.currentTimeMillis());

        try {

            //Check if the email already exists
            if (AdminDAO.adminEmailExists(admin_email)) {
                req.setAttribute("errorMessage", "Email is already registered. Please use a different email.");
                req.getRequestDispatcher("/Admin/add_new_admins.jsp").forward(req, res);
                return;
            }

            // Hash the password using BCrypt
            String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

            Admin admin = new Admin(0, admin_email, admin_name, hashedPassword, phoneNumber, admin_type, createdAt);

            boolean isAdminRegistered = AdminDAO.registerAdmin(admin);
            if (isAdminRegistered) {
                res.sendRedirect("/abc-cinema");
            } else {
                req.setAttribute("errorMessage", "Registration failed. Please try again.");
                req.getRequestDispatcher("/Admin/add_new_admins.jsp").forward(req, res);
            }

        } catch (Exception e) {

            e.printStackTrace(); // Ensure this is logged
            req.setAttribute("errorMessage", "An error occurred during registration: " + e.getMessage());
            req.getRequestDispatcher("/Admin/add_new_admins.jsp").forward(req, res);
        }
    }

}
