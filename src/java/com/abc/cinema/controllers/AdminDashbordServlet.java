/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.abc.cinema.controllers;

import com.abc.cinema.dao.AllUsersManageDAO;
import com.abc.cinema.dao.MovieDAO;
import com.abc.cinema.models.Customer;
import com.abc.cinema.models.Movie;
import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Himantha
 */
@WebServlet("/Admin/admin_dashboard")
public class AdminDashbordServlet extends HttpServlet {

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

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        System.out.println("doGet method called.");
        res.setContentType("application/json");
        res.setCharacterEncoding("UTF-8");

        try (PrintWriter out = res.getWriter()) {
            // Fetch movies and customer list
            ArrayList<Movie> movieList = movieDAO.getAllMovies();
            ArrayList<Customer> customers = allUsersManageDAO.getAllCustomers();

            int totalUsers = customers.size();
            int totalMovies = movieList.size();

            Map<String, Object> jsonResponse = new HashMap<>();
            jsonResponse.put("totalUsers", totalUsers);
            jsonResponse.put("totalMovies", totalMovies);
            jsonResponse.put("movies", movieList);

            String responseJson = new Gson().toJson(jsonResponse);
            System.out.println("Response JSON: " + responseJson);

            res.setStatus(HttpServletResponse.SC_OK);
            out.print(responseJson);
            out.flush();
        } catch (SQLException e) {
            System.err.println("SQL Error: " + e.getMessage());
            res.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            res.getWriter().print("{\"error\": \"Failed to fetch data.\"}");
        }
    }

}
