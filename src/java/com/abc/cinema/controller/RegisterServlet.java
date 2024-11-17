/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.abc.cinema.controller;

import com.abc.cinema.dao.UserDAO;
import com.abc.cinema.model.User;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

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
        
        User user = new User(email, username, phoneNumber, password);
        
        try {
            boolean isRegistered = UserDAO.registerUser(user);
            if (isRegistered) {
                res.sendRedirect("login.jsp");
            } else {
                res.sendRedirect("register.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            res.sendRedirect("/register.jsp");
        }
    }
}
