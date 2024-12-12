/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.abc.cinema.models;

import java.sql.Timestamp;

/**
 *
 * @author Himantha
 */
public class Booking {

    private int bookingId;
    private int customerId;
    private int showtimeId;
    private int seatId;
    private Timestamp bookingTime;

    public Booking(int bookingId, int customerId, int showtimeId, int seatId, Timestamp bookingTime) {

        this.bookingId = bookingId;
        this.customerId = customerId;
        this.showtimeId = showtimeId;
        this.seatId = seatId;
        this.bookingId = bookingId;
    }

    // Getters and setters
    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getShowtimeId() {
        return showtimeId;
    }

    public void setShowtimeId(int showtimeId) {
        this.showtimeId = showtimeId;
    }

    public int getSeatId() {
        return seatId;
    }

    public void setSeatId(int seatId) {
        this.seatId = seatId;
    }

    public Timestamp getBookingTime() {
        return bookingTime;
    }

    public void setBookingTime(Timestamp bookingTime) {
        this.bookingTime = bookingTime;
    }
}
