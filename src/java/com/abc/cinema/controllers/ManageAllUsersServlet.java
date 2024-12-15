/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */


package com.abc.cinema.controllers;

import com.abc.cinema.dao.AllUsersManageDAO;
import com.abc.cinema.models.Admin;
import com.abc.cinema.models.Customer;
import com.google.gson.ExclusionStrategy;
import com.google.gson.FieldAttributes;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.FieldNamingPolicy;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Himantha
 */


@WebServlet("/Admin/manage_all_users")
public class ManageAllUsersServlet extends HttpServlet {

    private AllUsersManageDAO allUsersManageDAO;

    @Override
    public void init() throws ServletException {
        try {
            allUsersManageDAO = new AllUsersManageDAO();
            System.out.println("ManageAllUsersServlet initialized successfully.");
        } catch (Exception e) {
            System.err.println("Error initializing DAO: " + e.getMessage());
            throw new ServletException("DAO initialization failed.", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        System.out.println("doGet method called.");

        if (allUsersManageDAO == null) {
            System.err.println("DAO is not initialized. Cannot proceed.");
            throw new ServletException("DAO initialization failed.");
        }

        try {
            // Fetch moderators and customers
            ArrayList<Admin> moderators = allUsersManageDAO.getModerators();
            ArrayList<Customer> customers = allUsersManageDAO.getAllCustomers();

            System.out.println("Moderators fetched: " + moderators.size());
            System.out.println("Customers fetched: " + customers.size());

            String ajaxRequest = req.getHeader("X-Requested-With");
            System.out.println("X-Requested-With header: " + ajaxRequest);

            if (ajaxRequest != null && ajaxRequest.equals("XMLHttpRequest")) {
                res.setContentType("application/json");
                res.setCharacterEncoding("UTF-8");

                try {
                    Gson gson = new GsonBuilder()
                            .setExclusionStrategies(new ExclusionStrategy() {
                                @Override
                                public boolean shouldSkipField(FieldAttributes field) {
                                    return field.getName().equals("password");
                                }

                                @Override
                                public boolean shouldSkipClass(Class<?> clazz) {
                                    return false;
                                }
                            })
                            .setFieldNamingPolicy(FieldNamingPolicy.LOWER_CASE_WITH_UNDERSCORES)
                            .create(); 

                    String jsonResponse = "{\"moderators\": " + gson.toJson(moderators)
                            + ", \"customers\": " + gson.toJson(customers) + "}";
                    res.getWriter().write(jsonResponse);
                    System.out.println("JSON response sent: " + jsonResponse);
                } catch (Exception e) {
                    System.err.println("Error serializing JSON response: " + e.getMessage());
                    e.printStackTrace();
                    res.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error creating JSON response.");
                }
            } else {
                try {
                    req.setAttribute("moderators", moderators);
                    req.setAttribute("customers", customers);

                    String jspPath = "/abc-cinema/Admin/manage_all_users.jsp";
                    RequestDispatcher dispatcher = req.getRequestDispatcher(jspPath);
                    dispatcher.forward(req, res);
                    System.out.println("Request forwarded to JSP: " + jspPath);
                } catch (Exception e) {
                    System.err.println("Error forwarding request to JSP: " + e.getMessage());
                    e.printStackTrace();
                    res.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error forwarding request.");
                }
            }
        } catch (SQLException e) {
            System.err.println("Database error: " + e.getMessage());
            e.printStackTrace();
            res.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error occurred.");
        } catch (Exception e) {
            System.err.println("Unexpected error: " + e.getMessage());
            e.printStackTrace();
            res.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An unexpected error occurred.");
        }
    }
}
