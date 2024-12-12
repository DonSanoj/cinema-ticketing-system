<%-- 
    Document   : manage_all_users
    Created on : Dec 11, 2024, 1:27:45 PM
    Author     : Himantha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="jakarta.servlet.http.HttpSession"%>

<%
    // Check if the admin is logged in
    HttpSession adminSession = request.getSession(false);
    if (adminSession == null || adminSession.getAttribute("admin_email") == null) {
        response.sendRedirect("/abc-cinema/admin_login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin and Customer Management</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
            }
            h1 {
                text-align: center;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 30px;
            }
            table, th, td {
                border: 1px solid black;
            }
            th, td {
                padding: 10px;
                text-align: left;
            }
            .no-data {
                text-align: center;
                font-style: italic;
                color: #888;
            }
            .error-message {
                color: red;
                text-align: center;
                margin-top: 20px;
            }
        </style>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>
    <body>
        <h1>Admin and Customer Management</h1>

        <div class="error-message"></div> <!-- Display error messages if any -->

        <!-- Moderators Section -->
        <h2>Moderators</h2>
        <table>
            <thead>
                <tr>
                    <th>Moderator ID</th>
                    <th>Email</th>
                    <th>Name</th>
                    <th>Phone</th>
                    <th>Type</th>
                    <th>Created At</th>
                </tr>
            </thead>
            <tbody id="moderators-list">
                <!-- Moderator data will be dynamically inserted here -->
            </tbody>
        </table>

        <!-- Customers Section -->
        <h2>Customers</h2>
        <table>
            <thead>
                <tr>
                    <th>Customer ID</th>
                    <th>Email</th>
                    <th>Name</th>
                    <th>Phone</th>
                    <th>Created At</th>
                </tr>
            </thead>
            <tbody id="customers-list">
                <!-- Customer data will be dynamically inserted here -->
            </tbody>
        </table>

        <!-- Include the external JavaScript file -->
        <script src="./js/manage_all_users.js"></script>
    </body>
</html>
