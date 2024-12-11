/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.abc.cinema.controllers;

import com.abc.cinema.dao.MovieDAO;
import com.abc.cinema.models.Movie;
import com.abc.cinema.utils.DbConnection;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author Himantha
 */

@WebServlet("/movieDetails")
public class MovieDetailsServlet extends HttpServlet {

    private MovieDAO movieDAO;

    @Override
    public void init() throws ServletException {
        try {
            // Initialize the DAO with a database connection (make sure the connection is available)
            Connection connection = DbConnection.getConnection();  // Assuming DbConnection is a utility to get the connection
            movieDAO = new MovieDAO();
        } catch (SQLException e) {
            // Log the error
            System.err.println("Error during database connection initialization: " + e.getMessage());
            // Rethrow as ServletException, as it's a critical issue that prevents the servlet from initializing
            throw new ServletException("Database connection initialization failed.", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String movie_id = req.getParameter("movie_id");
        String movie_image = req.getParameter("movie_image");

        // Decode image URL if provided
        if (movie_image != null) {
            movie_image = URLDecoder.decode(movie_image, StandardCharsets.UTF_8.name());
        }

        try {
            int movieId = Integer.parseInt(movie_id);
            Movie movieDetails = movieDAO.getMovieDetailsById(movieId); // Fetch movie details by ID
            req.setAttribute("movieDetails", movieDetails);
            req.setAttribute("movie_image", movie_image);

            // Forward request to JSP
            req.getRequestDispatcher("/movieDetails.jsp").forward(req, res);
        } catch (NumberFormatException e) {
            res.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid movie ID.");
        } catch (SQLException e) {
            Logger.getLogger(MovieDetailsServlet.class.getName()).log(Level.SEVERE, null, e);
            res.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to fetch movie details.");
        }
    }

}
