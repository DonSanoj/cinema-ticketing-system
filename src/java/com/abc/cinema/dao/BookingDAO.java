/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.abc.cinema.dao;

import com.abc.cinema.models.Booking;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DON
 */
public class BookingDAO {

    private final Connection connection;

    public BookingDAO(Connection connection) {
        this.connection = connection;
    }

    public void addBookings(String customerId, String showtimeId, JsonArray seats) throws SQLException {
        String insertBookingQuery = "INSERT INTO bookings (customer_id, showtime_id, seat_id, booking_time) VALUES (?, ?, ?, ?)";
        Timestamp bookingTime = new Timestamp(System.currentTimeMillis());

        try (PreparedStatement stmt = connection.prepareStatement(insertBookingQuery)) {
            for (JsonElement seatElement : seats) {
                String seatId = seatElement.getAsString();
                stmt.setString(1, customerId);
                stmt.setString(2, showtimeId);
                stmt.setString(3, seatId);
                stmt.setTimestamp(4, bookingTime);
                stmt.addBatch();
            }
            stmt.executeBatch(); // Execute the batch insert for efficiency
        }
    }

}
