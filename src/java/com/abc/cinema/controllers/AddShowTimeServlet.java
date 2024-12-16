/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.abc.cinema.controllers;

import com.abc.cinema.dao.MovieDAO;
import com.abc.cinema.models.Movie;
import com.abc.cinema.dao.ShowTimeDAO;
import com.abc.cinema.models.ShowTimes;
import com.abc.cinema.utils.DbConnection;
import com.google.gson.Gson;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author DON
 */
@WebServlet("/Admin/addShowTime")
public class AddShowTimeServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            // Debug message: Entry to doPost
            System.out.println("AddShowTimeServlet: Received POST request.");

            int movie_id = Integer.parseInt(req.getParameter("movie_id"));
            int complex_id = Integer.parseInt(req.getParameter("complex_id"));
            int hall_id = Integer.parseInt(req.getParameter("hall_id"));
            String start_time = req.getParameter("start_time");
            String date = req.getParameter("date");

            System.out.println("AddShowTimeServlet: Parameters - Movie ID: " + movie_id
                    + ", Complex ID: " + complex_id
                    + ", Hall ID: " + hall_id
                    + ", Start Time: " + start_time
                    + ", Date: " + date);

            ShowTimes showTimes = new ShowTimes(0, movie_id, complex_id, hall_id, start_time, date);

            try (Connection connection = DbConnection.getConnection()) {
                System.out.println("AddShowTimeServlet: Database connection established.");

                ShowTimeDAO showTimeDAO = new ShowTimeDAO(connection);
                showTimeDAO.addShowTime(showTimes);
                req.setAttribute("successMessage", "Show Time added successfully!");
                System.out.println("AddShowTimeServlet: Showtime added successfully.");
            } catch (SQLException e) {
                System.err.println("AddShowTimeServlet: Database error while adding showtime - " + e.getMessage());
                throw new ServletException("Database error: Unable to add showtime", e);
            }

        } catch (NumberFormatException e) {
            System.err.println("AddShowTimeServlet: Invalid input - " + e.getMessage());
            res.getWriter().println("Invalid input. Please ensure all fields are filled correctly.");
        }

        // Fetch movie for the showtime add dropdown
        try (Connection connection = DbConnection.getConnection()) {
            System.out.println("AddShowTimeServlet: Fetching movies for dropdown.");

            MovieDAO movieDAO = new MovieDAO();
            ArrayList<Movie> movies = movieDAO.getAllMovies();

            req.setAttribute("movies", movies);
            System.out.println("AddShowTimeServlet: Movies fetched successfully.");
        } catch (SQLException e) {
            System.err.println("AddShowTimeServlet: Database error while fetching movies - " + e.getMessage());
            throw new ServletException("Database error: Unable to retrieve movies", e);
        }

        req.getRequestDispatcher("/Admin/add_show_time.jsp").forward(req, res);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        // Implement data fetching for AJAX requests
        try (Connection connection = DbConnection.getConnection()) {
            System.out.println("AddShowTimeServlet: Received GET request for fetching movies.");

            MovieDAO movieDAO = new MovieDAO();
            ArrayList<Movie> movies = movieDAO.getAllMovies();

            res.setContentType("application/json");
            res.setCharacterEncoding("UTF-8");
            PrintWriter out = res.getWriter();
            out.println(new Gson().toJson(movies));
            System.out.println("AddShowTimeServlet: Movies JSON sent successfully.");
        } catch (SQLException e) {
            System.err.println("AddShowTimeServlet: Database error while fetching movies - " + e.getMessage());
            res.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Unable to retrieve movies");
        }
    }
}
