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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="./js/get_all_movies.js"></script>
    
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css" />
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css" />
</head>
<body>
    
    <%@include file="./components/header.jsp" %>
    
    <!-- Sidebar -->
    <div class="flex">
        <!-- Main Content -->
        <div class="flex-1 p-8">
            <div class="flex justify-between items-center mb-8">
                <h2 class="text-3xl font-semibold">Welcome Mr.${sessionScope.admin_name}</h2>
                <a href="/abc-cinema/Admin/add_new_admins.jsp" class="flex items-center justify-center w-12 h-12 rounded-full border border-gray-300 shadow hover:shadow-lg transition">
                  <img src="./assets/img/Support.png" alt="alt" class="w-6 h-6" />
                </a>

            </div>


            <div class="grid grid-cols-1 justify-between md:grid-cols-2 lg:grid-cols-2 gap-6">
                <!-- Card 1 -->
                <div class="bg-white p-6 rounded-lg shadow-md">
                    <h3 class="text-xl font-semibold mb-4">Total Users</h3>
                    <p class="text-2xl font-bold text-blue-600">${sessionScope.TotalUsers}</p>
                </div>

                <!-- Card 2 -->
                <div class="bg-white p-6 rounded-lg shadow-md">
                    <h3 class="text-xl font-semibold mb-4">Active Movies</h3>
                    <p class="text-2xl font-bold text-green-600">${sessionScope.TotalMovies}</p>
                </div>

            </div>

            <div class="mt-8">
                <h3 class="text-3xl font-semibold mt-10 mb-5">Active Movies</h3>
                <div class="overflow-x-auto bg-white shadow-md rounded-lg mb-10">
                    <table class="min-w-full divide-y divide-gray-200">
                        <thead class="bg-gray-50">
                            <tr>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Movie ID</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Movie Name</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Genre</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Duration</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Language</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Director</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Status</th>
                            </tr>
                        </thead>
                        <tbody id="movies-list" class="divide-y divide-gray-200">
                            <!-- Movies data will be dynamically inserted here -->
                        </tbody>
                    </table>
                </div>

                <div class="error-message text-red-500 text-center mb-6"></div>
           </div>
                
        </div>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="./js/get_all_movies.js"></script>
    <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
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
