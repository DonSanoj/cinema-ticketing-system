/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.abc.cinema.controllers;

import com.abc.cinema.dao.AdminDAO;
import com.abc.cinema.models.Admin;

import java.io.IOException;
import java.sql.SQLException;

import java.io.PrintWriter;
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
@WebServlet("/admin_login")
public class AdminLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String admin_email = req.getParameter("admin_email");
        String password = req.getParameter("password");

        try {
            // Check if the admin email exists in the database
            Admin admin = AdminDAO.getAdminByEmail(admin_email);

            if (admin != null) {
                
                if (BCrypt.checkpw(password, admin.getPassword())) {
                    
                    req.getSession().setAttribute("admin_id", admin.getAdminId());
                    req.getSession().setAttribute("admin_email", admin.getAdminEmail());
                    req.getSession().setAttribute("admin_name", admin.getAdminname());
                    req.getSession().setAttribute("admin_type", admin.getAdminType());

                    res.sendRedirect("/test-web/Admin/admin_dashboard.jsp");
                } else {
                    
                    req.setAttribute("errorMessage", "Invalid password. Please try again.");
                    req.getRequestDispatcher("/admin_login.jsp").forward(req, res);
                }
            } else {
                
                req.setAttribute("errorMessage", "Email not found. Please check your email.");
                req.getRequestDispatcher("/admin_login.jsp").forward(req, res);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            req.setAttribute("errorMessage", "An error occurred during login: " + e.getMessage());
            req.getRequestDispatcher("/admin_login.jsp").forward(req, res);
        }
    }
}
