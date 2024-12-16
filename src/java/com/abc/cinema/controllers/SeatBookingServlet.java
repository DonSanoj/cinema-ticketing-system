/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.abc.cinema.controllers;

import com.abc.cinema.dao.BookingDAO;
import com.abc.cinema.dao.SeatStatusDAO;
import com.abc.cinema.models.SeatStatus;
import com.abc.cinema.utils.DbConnection;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Himantha
 */


@WebServlet("/seatlayout/seatBooking")
public class SeatBookingServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try (BufferedReader reader = request.getReader()) {
            JsonObject requestBody = JsonParser.parseReader(reader).getAsJsonObject();

            // Extract data from the request
            String customerId = requestBody.get("customerId").getAsString();
            String showtimeId = requestBody.get("showtimeId").getAsString();
            JsonArray seats = requestBody.getAsJsonArray("seats");

            // Database operations
            try (Connection connection = DbConnection.getConnection()) {
                SeatStatusDAO seatStatusDAO = new SeatStatusDAO();
                BookingDAO bookingDAO = new BookingDAO(connection);

                // Update seat statuses
                seatStatusDAO.bookSeats(customerId, showtimeId, seats);

                // Add bookings
                bookingDAO.addBookings(customerId, showtimeId, seats);

                // Send success response
                JsonObject successResponse = new JsonObject();
                successResponse.addProperty("status", "success");
                successResponse.addProperty("message", "Seats successfully booked!");
                response.getWriter().write(successResponse.toString());
            } catch (SQLException e) {
                e.printStackTrace();
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                JsonObject errorResponse = new JsonObject();
                errorResponse.addProperty("status", "error");
                errorResponse.addProperty("message", "Database operation failed!");
                response.getWriter().write(errorResponse.toString());
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            JsonObject errorResponse = new JsonObject();
            errorResponse.addProperty("status", "error");
            errorResponse.addProperty("message", "Invalid request payload!");
            response.getWriter().write(errorResponse.toString());
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String showtimeIdParam = request.getParameter("showtime_id");

        if (showtimeIdParam == null || showtimeIdParam.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Showtime ID is required.");
            return;
        }

        int showtimeId = Integer.parseInt(showtimeIdParam);

        try {
            SeatStatusDAO seatStatusDAO = new SeatStatusDAO();
            ArrayList<SeatStatus> seatStatuses = seatStatusDAO.getSeatStatuses(showtimeId);

            JsonArray seatArray = new JsonArray();
            for (SeatStatus seatStatus : seatStatuses) {
                JsonObject seatObject = new JsonObject();
                seatObject.addProperty("seat_id", seatStatus.getSeatID());
                seatObject.addProperty("status", seatStatus.getStatus());
                seatArray.add(seatObject);
            }

            // Set response headers for JSON content type
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(seatArray.toString()); // Send the seat status data as JSON

        } catch (SQLException e) {
            throw new ServletException("Database error while fetching seat statuses.", e);
        }
    }

}
