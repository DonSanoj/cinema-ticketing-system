/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.abc.cinema.controllers;

import com.abc.cinema.utils.DbConnection;
import com.abc.cinema.dao.ReviewDAO;
import com.abc.cinema.models.Review;
import com.google.gson.Gson;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author admin
 */
@WebServlet("/fetchReviews")
public class FetchReviewServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set the response content type to JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try (var connection = DbConnection.getConnection()) {
            System.out.println("Database connection established successfully.");
            System.out.println("Review fetch hit");

            ReviewDAO reviewDAO = new ReviewDAO(connection);
            List<Review> reviews = reviewDAO.fetchAllReviews();

            System.out.println("Fetched " + reviews.size() + " reviews.");

            // Use Gson to convert the reviews list to JSON
            Gson gson = new Gson();
            String jsonReviews = gson.toJson(reviews);

            PrintWriter out = response.getWriter();
            out.write(jsonReviews);
            
            System.out.println("Sending the following JSON data to client: " + jsonReviews);
        } catch (Exception e) {
            
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error fetching reviews");
        }
    }
}
