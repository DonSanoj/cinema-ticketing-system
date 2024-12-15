<%--
    Document   : admin_dashboard
    Created on : Dec 10, 2024, 9:07:02 PM
    Author     : Himantha
--%>

<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    // No need to redeclare the 'session' object as it is implicitly available in JSP
    HttpSession adminSession = request.getSession(false);

    if (adminSession == null || adminSession.getAttribute("admin_email") == null) {
        response.sendRedirect("/abc-cinema/admin_login.jsp");
        return;  // Ensures the page doesn't continue rendering
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="./assets/img/logo_white.png" type="image/x-icon">
    <title>Admin Dashboard</title>
    
    <script src="https://cdn.tailwindcss.com"></script>
    
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css" />
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css" />
</head>
<body>
    
    <%@include file="./components/header.jsp" %>
    
    <!-- Sidebar -->
    <div class="flex">
        <!-- Main Content -->
        <div class="flex-1 p-8">
            <h2 class="text-3xl font-semibold mb-8">Dashboard Overview</h2>

            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                <!-- Card 1 -->
                <div class="bg-white p-6 rounded-lg shadow-md">
                    <h3 class="text-xl font-semibold mb-4">Total Users</h3>
                    <p class="text-2xl font-bold text-blue-600">1,250</p>
                </div>

                <!-- Card 2 -->
                <div class="bg-white p-6 rounded-lg shadow-md">
                    <h3 class="text-xl font-semibold mb-4">Active Users</h3>
                    <p class="text-2xl font-bold text-green-600">900</p>
                </div>

                <!-- Card 3 -->
                <div class="bg-white p-6 rounded-lg shadow-md">
                    <h3 class="text-xl font-semibold mb-4">New Registrations</h3>
                    <p class="text-2xl font-bold text-red-600">30</p>
                </div>
            </div>

            <div class="mt-8">
                <h3 class="text-2xl font-semibold mb-4">Recent Activity</h3>
                <ul>
                    <li class="bg-white p-4 rounded-lg shadow-md mb-4">
                        <p><span class="font-semibold">John Doe</span> registered a new account.</p>
                        <p class="text-sm text-gray-600">2 hours ago</p>
                    </li>
                    <li class="bg-white p-4 rounded-lg shadow-md mb-4">
                        <p><span class="font-semibold">Jane Smith</span> updated her profile.</p>
                        <p class="text-sm text-gray-600">1 day ago</p>
                    </li>
                    <li class="bg-white p-4 rounded-lg shadow-md">
                        <p><span class="font-semibold">Alex Johnson</span> made a purchase.</p>
                        <p class="text-sm text-gray-600">3 days ago</p>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    
    <script>
                alertify.set('notifier', 'position', 'top-center');
        <% if (request.getAttribute("successMessage") != null) {%>
        alertify.success("<%= request.getAttribute("successMessage")%>");
        <% }%>

        <% if (request.getAttribute("errorMessage") != null) {%>
        alertify.error("<%= request.getAttribute("errorMessage")%>");
        <% }%>
    </script>
</body>
</html>
