/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.abc.cinema.models;

import java.sql.Timestamp;

/**
 *
 * @author DON
 */
public class Review {

    private int reviewId;
    private String customerName;
    private String customerEmail;
    private String reviewFor;
    private String review;
    private Timestamp reviewTime;

    // Constructors
    public Review() {
    }

    public Review(int reviewId, String customerName, String customerEmail, String reviewFor, String review, Timestamp reviewTime) {
        this.reviewId = reviewId;
        this.customerName = customerName;
        this.customerEmail = customerEmail;
        this.reviewFor = reviewFor;
        this.review = review;
        this.reviewTime = reviewTime;
    }

    // Getters and Setters
    public int getReviewId() {
        return reviewId;
    }

    public void setReviewId(int reviewId) {
        this.reviewId = reviewId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerEmail() {
        return customerEmail;
    }

    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail;
    }

    public String getReviewFor() {
        return reviewFor;
    }

    public void setReviewFor(String reviewFor) {
        this.reviewFor = reviewFor;
    }

    public String getReview() {
        return review;
    }

    public void setReview(String review) {
        this.review = review;
    }

    public Timestamp getReviewTime() {
        return reviewTime;
    }

    public void setReviewTime(Timestamp reviewTime) {
        this.reviewTime = reviewTime;
    }
}
