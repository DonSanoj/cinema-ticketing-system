/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.abc.cinema.controller;

import com.abc.cinema.dao.UserDAO;
import com.abc.cinema.model.User;
import java.io.IOException;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author DON
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        try {
            // Fetch the user from the database using email
            User user = UserDAO.getUserByEmail(email);

            if (user != null && BCrypt.checkpw(password, user.getPassword())) {
                // Create a session and store the user object
                HttpSession session = req.getSession();
                session.setAttribute("user", user);
                session.setAttribute("userId", user.getEmail());

                // Redirect to the homepage or dashboard after successful login
                res.sendRedirect("/abc-cinema");
            } else {
                // Send error message if the login failed
                req.setAttribute("loginError", "Invalid email or password");
                req.getRequestDispatcher("login.jsp").forward(req, res);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            req.setAttribute("loginError", "An error occurred while logging in. Please try again later.");
            req.getRequestDispatcher("login.jsp").forward(req, res);
        }
    }
}
