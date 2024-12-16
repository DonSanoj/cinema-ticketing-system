/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.abc.cinema.dao;

import com.abc.cinema.models.SeatStatus;
import com.abc.cinema.utils.DbConnection;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

/**
 *
 * @author DON
 */
public class SeatStatusDAO {

    private Connection connection;

    public SeatStatusDAO() throws SQLException {
        this.connection = DbConnection.getConnection();
    }

    // Fetch reserved seats for a specific showtime
    public ArrayList<SeatStatus> getSeatStatuses(int showtimeId) throws SQLException {
        ArrayList<SeatStatus> seatStatuses = new ArrayList<>();
        String query = "SELECT seat_id, status FROM seatstatus WHERE showtime_id = ? AND status = 'reserved'";
        System.out.println("Executing query to fetch reserved seats: " + query);
        System.out.println("Showtime ID: " + showtimeId); // Debugging line

        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, showtimeId);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    SeatStatus seatStatus = new SeatStatus();
                    seatStatus.setSeatID(rs.getString("seat_id")); // Ensure seat_id is fetched
                    seatStatus.setStatus(rs.getString("status"));
                    seatStatuses.add(seatStatus);
                    System.out.println("Fetched seat: " + seatStatus.getSeatID() + ", Status: " + seatStatus.getStatus());
                }
            }
        } catch (SQLException e) {
            System.err.println("Error fetching seat statuses: " + e.getMessage());
            throw e;
        }
        System.out.println("Total reserved seats fetched: " + seatStatuses.size());
        return seatStatuses;
    }

    public void bookSeats(String customerId, String showtimeId, JsonArray seats) throws SQLException {
        // Insert query for the seatstatus table
        String insertSeatStatusQuery
                = "INSERT INTO seatstatus (showtime_id, seat_id, status) "
                + "VALUES (?, ?, 'reserved') "
                + "ON DUPLICATE KEY UPDATE status = 'reserved'";

        try (PreparedStatement stmt = connection.prepareStatement(insertSeatStatusQuery)) {
            for (JsonElement seatElement : seats) {
                String seatId = seatElement.getAsString();
                stmt.setString(1, showtimeId);  // showtime_id
                stmt.setString(2, seatId);      // seat_id
                stmt.addBatch();               // Add to batch for efficiency
            }
            stmt.executeBatch(); // Execute the batch insertion
        }
    }

}
