/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package com.abc.cinema.controllers;

import com.abc.cinema.dao.MovieDAO;
import com.abc.cinema.models.Movie;
import com.google.gson.Gson;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author DON
 */
@WebServlet("/indexnowshowing")
public class IndexNowShowingServlet extends HttpServlet {

    private MovieDAO movieDAO;

    @Override
    public void init() throws ServletException {
        try {
            movieDAO = new MovieDAO();
            System.out.println("MovieDAO initialized successfully.");
        } catch (Exception e) {
            System.err.println("Error initializing DAO: " + e.getMessage());
            throw new ServletException("DAO initialization failed.", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        System.out.println("doGet method called.");

        if (movieDAO == null) {
            System.err.println("DAO is not initialized. Cannot proceed.");
            throw new ServletException("DAO not initialized.");
        }

        try {

            ArrayList<Movie> movies = movieDAO.getAllMovies();
            System.out.println("Movies fetched: " + movies.size());

            if (movies.isEmpty()) {
                System.out.println("No movies found in the database.");
            } else {
                movies.forEach(movie -> System.out.println("Movie: " + movie.getMovieName()));
            }

            String ajaxRequest = req.getHeader("X-Requested-With");

            if (ajaxRequest != null && ajaxRequest.equals("XMLHttpRequest")) {
                try {
                    res.setContentType("application/json");
                    res.setCharacterEncoding("UTF-8");

                    Gson gson = new Gson();
                    String jsonResponse = gson.toJson(movies);
                    res.getWriter().write(jsonResponse);
                    System.out.println("JSON response sent: " + jsonResponse);

                } catch (IOException e) {
                    System.err.println("Error writing JSON response: " + e.getMessage());
                    res.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to send JSON response.");
                }
            } else {

                try {
                    req.setAttribute("movies", movies);

                    String jspPath = "/abc-cinema/";
                    RequestDispatcher dispatcher = req.getRequestDispatcher(jspPath);
                    dispatcher.forward(req, res);
                    System.out.println("Request forwarded to JSP: " + jspPath);

                } catch (ServletException e) {
                    System.err.println("Error forwarding to JSP: " + e.getMessage());
                    res.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error forwarding request to JSP.");
                } catch (IOException e) {
                    System.err.println("Error forwarding to JSP: " + e.getMessage());
                    res.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error forwarding request to JSP.");
                }
            }
        } catch (SQLException e) {
            System.err.println("Database error: " + e.getMessage());
            res.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error occurred.");
        } catch (Exception e) {
            System.err.println("Unexpected error: " + e.getMessage());
            res.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An unexpected error occurred.");
        }
    }
}
