/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.abc.cinema.controllers;

import com.abc.cinema.models.Review;
import com.abc.cinema.dao.ReviewDAO;
import com.abc.cinema.utils.DbConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Timestamp;

/**
 *
 * @author Pamith
 */
@WebServlet("/addReview")
public class AddReviewServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        String reviewFor = request.getParameter("reviewFor");
        String reviewMessage = request.getParameter("reviewMessage");
        String customerName = (String) session.getAttribute("customer_name");
        String customerEmail = (String) session.getAttribute("email");

        Review review = new Review();
        review.setCustomerName(customerName);
        review.setCustomerEmail(customerEmail);
        review.setReviewFor(reviewFor);
        review.setReview(reviewMessage);
        review.setReviewTime(new Timestamp(System.currentTimeMillis()));

        try (Connection connection = DbConnection.getConnection()) {
            ReviewDAO reviewDAO = new ReviewDAO(connection);
            boolean isInserted = reviewDAO.insertReview(review);

            if (isInserted) {
                response.sendRedirect("/abc-cinema/reviews.jsp");
            } else {
                response.sendRedirect("/abc-cinema/reviewError.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("/abc-cinema/reviewError.jsp");
        }
    }
}
