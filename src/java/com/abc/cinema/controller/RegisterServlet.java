/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.abc.cinema.controller;

import com.abc.cinema.dao.UserDAO;
import com.abc.cinema.model.User;

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
 * @author DON
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String username = req.getParameter("username");
        String phoneNumber = req.getParameter("phoneNumber");
        String password = req.getParameter("password");
        String cpassword = req.getParameter("cpassword");

        String userType = "user";
        Timestamp createdAt = new Timestamp(System.currentTimeMillis());

        try {
            // Check if the email already exists
            if (UserDAO.emailExists(email)) {
                // Redirect to registration page with an error message
                req.setAttribute("errorMessage", "Email is already registered. Please use a different email.");
                req.getRequestDispatcher("register.jsp").forward(req, res);
                return;
            }

            if (!password.equals(cpassword)) {
                req.setAttribute("errorMessage", "Passwords do not match.");
                req.getRequestDispatcher("register.jsp").forward(req, res);
                return;
            }

            // Hash the password using BCrypt
            String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

            User user = new User(email, username, phoneNumber, hashedPassword, userType, createdAt);

            boolean isRegistered = UserDAO.registerUser(user);
            if (isRegistered) {
                res.sendRedirect("login.jsp");
            } else {
                req.setAttribute("errorMessage", "Registration failed. Please try again.");
                req.getRequestDispatcher("register.jsp").forward(req, res);
            }
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errorMessage", "An error occurred during registration. Please try again later.");
            req.getRequestDispatcher("register.jsp").forward(req, res);
        }
    }
}
