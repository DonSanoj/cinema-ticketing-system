/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.abc.cinema.controllers;

import com.abc.cinema.dao.AllUsersManageDAO;
import com.abc.cinema.dao.MovieDAO;
import com.abc.cinema.models.Customer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
/**
 *
 * @author Himantha
 */
@WebServlet("/Admin/admin_dashboard")
public class AdminDashbordServlet {
    private AllUsersManageDAO allUsersManageDAO;
    private MovieDAO movieDAO;
    public void init() throws ServletException {
        try {
            allUsersManageDAO = new AllUsersManageDAO();
            movieDAO = new MovieDAO(); // Initialize MovieDAO
            System.out.println("admin_dashbordServlet initialized successfully.");
        } catch (Exception e) {
            System.err.println("Error initializing DAO: " + e.getMessage());
            throw new ServletException("DAO initialization failed.", e);
        }
    }
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        System.out.println("doGet method called.");
        if (allUsersManageDAO == null || movieDAO == null) {
            System.err.println("DAOs are not initialized. Cannot proceed.");
            throw new ServletException("DAO initialization failed.");
        }
        try {
            // Fetch all customers
            ArrayList<Customer> customers = allUsersManageDAO.getAllCustomers();
            int totalUsers = customers.size();
            // Fetch all movies
            int totalMovies = movieDAO.getAllMoviesCount();
            // Add to session
            req.getSession().setAttribute("TotalUsers", totalUsers);
            req.getSession().setAttribute("TotalMovies", totalMovies);
            System.out.println("TotalUsers: " + totalUsers);
            System.out.println("TotalMovies: " + totalMovies);
        } catch (SQLException e) {
            System.err.println("Unexpected error: " + e.getMessage());
            res.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An unexpected error occurred.");
        }
    }
}