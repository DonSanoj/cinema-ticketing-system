/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.abc.cinema.controllers;

import com.abc.cinema.dao.ShowTimeDAO;
import com.abc.cinema.models.ShowTimeDetails;
import com.abc.cinema.models.ShowTimes;
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

/**
 *
 * @author Himantha
 */
@WebServlet("/moviesessions/movie-session")
public class MovieSessionServlet extends HttpServlet {

    private ShowTimeDAO showTimeDAO;

    @Override
    public void init() throws ServletException {
        try {
            // Initialize the DAO with a database connection (make sure the connection is available)
            Connection connection = DbConnection.getConnection();  // Assuming DbConnection is a utility to get the connection
            showTimeDAO = new ShowTimeDAO(connection);
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
        String movie_name = req.getParameter("movie_name");
        String genre = req.getParameter("genre");
        String language = req.getParameter("language");
        String movie_image = req.getParameter("movie_image");

        // Decode image URL if provided
        if (movie_image != null) {
            movie_image = URLDecoder.decode(movie_image, StandardCharsets.UTF_8.name());
        }

        // Set movie details in request attributes for JSP
        req.setAttribute("movie_id", movie_id);
        req.setAttribute("movie_name", movie_name);
        req.setAttribute("genre", genre);
        req.setAttribute("language", language);
        req.setAttribute("movie_image", movie_image);

        // AJAX request handling
        if (req.getHeader("X-Requested-With") != null && req.getHeader("X-Requested-With").equalsIgnoreCase("XMLHttpRequest")) {
            res.setContentType("application/json");
            res.setCharacterEncoding("UTF-8");

            try {
                int movieId = Integer.parseInt(movie_id);
                ArrayList<ShowTimeDetails> showTimesDetailList = showTimeDAO.getShowTimesByMovieId(movieId);

                Gson gson = new Gson();
                String json = gson.toJson(showTimesDetailList);

                PrintWriter out = res.getWriter();
                out.print(json);
                out.flush();

            } catch (SQLException | NumberFormatException e) {
                e.printStackTrace();
                res.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                res.getWriter().write("{\"error\": \"Failed to fetch showtimes.\"}");
            }
        } else {
            // Render the JSP if not an AJAX request
            req.getRequestDispatcher("/moviesessions/movie-session.jsp").forward(req, res);
        }
    }
}
