/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.abc.cinema.dao;

import com.abc.cinema.models.Review;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.sql.Timestamp;

/**
 *
 * @author Local
 */
public class ReviewDAO {

    private static final String INSERT_REVIEW_SQL = "INSERT INTO reviews (customer_name, customer_email, review_for, review, review_time) VALUES (?, ?, ?, ?, ?)";
    private static final String SELECT_ALL_REVIEWS_SQL = "SELECT * FROM reviews";

    private Connection connection;

    public ReviewDAO(Connection connection) {
        this.connection = connection;
    }

    public boolean insertReview(Review review) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(INSERT_REVIEW_SQL)) {
            preparedStatement.setString(1, review.getCustomerName());
            preparedStatement.setString(2, review.getCustomerEmail());
            preparedStatement.setString(3, review.getReviewFor());
            preparedStatement.setString(4, review.getReview());
            preparedStatement.setTimestamp(5, review.getReviewTime());

            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Review> fetchAllReviews() {
        List<Review> reviews = new ArrayList<>();
        try (Statement statement = connection.createStatement(); ResultSet resultSet = statement.executeQuery(SELECT_ALL_REVIEWS_SQL)) {
            while (resultSet.next()) {
                int reviewId = resultSet.getInt("review_id");
                String customerName = resultSet.getString("customer_name");
                String customerEmail = resultSet.getString("customer_email");
                String reviewFor = resultSet.getString("review_for");
                String reviewText = resultSet.getString("review");
                Timestamp reviewTime = resultSet.getTimestamp("review_time");

                reviews.add(new Review(reviewId, customerName, customerEmail, reviewFor, reviewText, reviewTime));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reviews;
    }
}
