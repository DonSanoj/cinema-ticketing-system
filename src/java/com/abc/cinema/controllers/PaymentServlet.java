/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.abc.cinema.controllers;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonSyntaxException;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.math.RoundingMode;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;

/**
 *
 * @author DON
 */
@WebServlet("/seatlayout/payment")
public class PaymentServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private JsonObject requestData;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        StringBuilder jsonStringBuilder = new StringBuilder();
        try (BufferedReader reader = request.getReader()) {
            String line;
            while ((line = reader.readLine()) != null) {
                jsonStringBuilder.append(line);
            }
        }

        String jsonData = jsonStringBuilder.toString();

        try {
            // Parse the JSON string to JsonObject
            requestData = new Gson().fromJson(jsonData, JsonObject.class);

            if (requestData == null || requestData.size() == 0) {
                throw new JsonSyntaxException("Invalid or empty JSON data.");
            }
        } catch (JsonSyntaxException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            JsonObject errorResponse = new JsonObject();
            errorResponse.addProperty("error", "Invalid JSON syntax: " + e.getMessage());
            out.print(errorResponse.toString());
            out.flush();
            return;
        }

        // Respond with success to acknowledge the request
        JsonObject successResponse = new JsonObject();
        successResponse.addProperty("success", true);
        out.print(successResponse.toString());
        out.flush();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        if (requestData == null) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            JsonObject errorResponse = new JsonObject();
            errorResponse.addProperty("error", "No data available. Please send data using POST first.");
            out.print(errorResponse.toString());
            out.flush();
            return;
        }

        try {
            // Extract data from the stored JSON object or use default values
            String firstName = requestData.has("customerName") ? requestData.get("customerName").getAsString() : "John";
//            String lastName = requestData.has("lastName") ? requestData.get("lastName").getAsString() : "Doe";
            String customerEmail = requestData.has("customerEmail") ? requestData.get("customerEmail").getAsString() : "john.doe@example.com";
            String customerPhone = requestData.has("customerPhone") ? requestData.get("customerPhone").getAsString() : "1234567890";
            String address = requestData.has("address") ? requestData.get("address").getAsString() : "123 Main St";
            String city = requestData.has("city") ? requestData.get("city").getAsString() : "Colombo";
            String country = requestData.has("country") ? requestData.get("country").getAsString() : "Sri Lanka";
            String deliveryAddress = requestData.has("delivery_address") ? requestData.get("delivery_address").getAsString() : "123 Main St";
            String deliveryCity = requestData.has("delivery_city") ? requestData.get("delivery_city").getAsString() : "Colombo";
            String deliveryCountry = requestData.has("delivery_country") ? requestData.get("delivery_country").getAsString() : "Sri Lanka";
            double amount = requestData.has("amount") ? requestData.get("amount").getAsDouble() : 100.0;

            // Payment details
            String merchant_id = "1228978";
            String order_id = UUID.randomUUID().toString();
            String merchant_secret = "MzMzMDcxMzczODI5MTE1ODk5MzU0MDczNjAwMjk1MzY4NzExMDAx";
            String currency = "LKR";

            // Generate hash using MD5
            String hash = generateHash(merchant_id, order_id, amount, currency, merchant_secret);

            // Create JSON response
            JsonObject jsonResponse = new JsonObject();
            jsonResponse.addProperty("success", true);
            jsonResponse.addProperty("items", "Booing Tickets");
            jsonResponse.addProperty("first_name", firstName);
            jsonResponse.addProperty("last_name", "customer");
            jsonResponse.addProperty("email", customerEmail);
            jsonResponse.addProperty("phone", customerPhone);
            jsonResponse.addProperty("address", address);
            jsonResponse.addProperty("city", city);
            jsonResponse.addProperty("country", country);
            jsonResponse.addProperty("delivery_address", deliveryAddress);
            jsonResponse.addProperty("delivery_city", deliveryCity);
            jsonResponse.addProperty("delivery_country", deliveryCountry);
            jsonResponse.addProperty("merchant_id", merchant_id);
            jsonResponse.addProperty("order_id", order_id);
            jsonResponse.addProperty("amount", String.format("%.2f", amount));
            jsonResponse.addProperty("currency", currency);
            jsonResponse.addProperty("hash", hash);

            out.print(jsonResponse.toString());
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            JsonObject errorResponse = new JsonObject();
            errorResponse.addProperty("error", "Internal Server Error");
            out.print(errorResponse.toString());
        } finally {
            out.flush();
        }
    }

    private String generateHash(String merchant_id, String order_id, double amount, String currency, String merchant_secret) {
        try {
            BigDecimal formattedAmount = BigDecimal.valueOf(amount).setScale(2, RoundingMode.HALF_UP);
            String dataToHash = merchant_id + order_id + formattedAmount.toPlainString() + currency + getMd5(merchant_secret);
            return getMd5(dataToHash);
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }

    public static String getMd5(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] messageDigest = md.digest(input.getBytes());
            BigInteger no = new BigInteger(1, messageDigest);
            String hashtext = no.toString(16);
            while (hashtext.length() < 32) {
                hashtext = "0" + hashtext;
            }
            return hashtext.toUpperCase();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }
}
