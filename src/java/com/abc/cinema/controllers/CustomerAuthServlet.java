/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.abc.cinema.controllers;

import com.abc.cinema.dao.CustomerDAO;
import com.abc.cinema.models.Customer;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author Shayan
 */
@WebServlet("/customerAuth")
public class CustomerAuthServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("register".equalsIgnoreCase(action)) {
            handleRegistration(req, res);
        } else if ("login".equalsIgnoreCase(action)) {
            handleLogin(req, res);
        } else {
            res.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action specified.");
        }
    }

    private void handleRegistration(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String email = req.getParameter("email");
        String customerName = req.getParameter("customername");
        String phoneNumber = req.getParameter("phoneNumber");
        String password = req.getParameter("password");
        String cpassword = req.getParameter("cpassword");

        Timestamp createdAt = new Timestamp(System.currentTimeMillis());

        try {
            if (CustomerDAO.emailExists(email)) {
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

            Customer customer = new Customer(0, email, customerName, phoneNumber, hashedPassword, createdAt);

            if (CustomerDAO.registerCustomer(customer)) {
                res.sendRedirect("login.jsp");
            } else {
                req.setAttribute("errorMessage", "Registration failed. Please try again.");
                req.getRequestDispatcher("register.jsp").forward(req, res);
            }
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errorMessage", "An error occurred during registration: " + e.getMessage());
            req.getRequestDispatcher("register.jsp").forward(req, res);
        }
    }

    private void handleLogin(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String customerEmail = req.getParameter("customer_email");
        String password = req.getParameter("password");

        try {
            Customer customer = CustomerDAO.getCustomerByEmail(customerEmail);

            if (customer != null && BCrypt.checkpw(password, customer.getPassword())) {
                // Set session attributes for logged-in customer
                HttpSession session = req.getSession();
                session.setAttribute("customer_id", customer.getCustomerId());
                session.setAttribute("email", customer.getEmail());
                session.setAttribute("customer_name", customer.getCustomername());
                session.setAttribute("phone_number", customer.getPhoneNumber());

                String redirectAfterLogin = (String) session.getAttribute("redirectAfterLogin");

                if (redirectAfterLogin != null) {
                    session.removeAttribute("redirectAfterLogin");
                    res.sendRedirect(redirectAfterLogin);
                } else {
                    res.sendRedirect("/abc-cinema/"); 
                }
            } else {
                req.setAttribute("loginErrorMessage", "Invalid email or password. Please try again.");
                req.getRequestDispatcher("/login.jsp").forward(req, res);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            req.setAttribute("loginErrorMessage", "An error occurred during login: " + e.getMessage());
            req.getRequestDispatcher("/login.jsp").forward(req, res);
        }
    }
}
