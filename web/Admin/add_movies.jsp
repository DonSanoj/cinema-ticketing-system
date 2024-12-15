<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <body class="bg-gray-100 min-h-screen flex flex-col items-center">
        <%@include file="./components/header.jsp" %>
        <div class="w-full max-w-2xl mt-10 bg-white rounded shadow p-8">
            <h1 class="text-2xl font-bold text-gray-800 mb-6 text-center">Add a New Movie</h1>
            <form action="/abc-cinema/Admin/add_movies" method="POST" enctype="multipart/form-data" class="space-y-6">
                <div>
                    <label for="movie_name" class="block text-gray-700 font-medium">Movie Name:</label>
                    <input type="text" id="movie_name" name="movie_name" required class="w-full border border-gray-300 rounded px-3 py-2 focus:ring-2 focus:ring-blue-500">
                </div>

                <div>
                    <label for="movie_image" class="block text-gray-700 font-medium">Movie Image:</label>
                    <input type="file" id="movie_image" name="movie_image" accept="image/*" required class="w-full border border-gray-300 rounded px-3 py-2">
                </div>

                <div>
                    <label for="genre" class="block text-gray-700 font-medium">Genre:</label>
                    <input type="text" id="genre" name="genre" class="w-full border border-gray-300 rounded px-3 py-2">
                </div>

                <div>
                    <label for="language" class="block text-gray-700 font-medium">Language:</label>
                    <input type="text" id="language" name="language" class="w-full border border-gray-300 rounded px-3 py-2">
                </div>

                <div>
                    <label for="duration" class="block text-gray-700 font-medium">Duration (minutes):</label>
                    <input type="number" id="duration" name="duration" min="0" required class="w-full border border-gray-300 rounded px-3 py-2">
                </div>

                <div>
                    <label for="description" class="block text-gray-700 font-medium">Description:</label>
                    <textarea id="description" name="description" required class="w-full border border-gray-300 rounded px-3 py-2"></textarea>
                </div>

                <div>
                    <label for="director" class="block text-gray-700 font-medium">Director:</label>
                    <input type="text" id="director" name="director" class="w-full border border-gray-300 rounded px-3 py-2">
                </div>

                <div>
                    <label for="main_actor" class="block text-gray-700 font-medium">Main Actor:</label>
                    <input type="text" id="main_actor" name="main_actor" class="w-full border border-gray-300 rounded px-3 py-2">
                </div>

                <div>
                    <label for="other_actors" class="block text-gray-700 font-medium">Other Actors:</label>
                    <textarea id="other_actors" name="other_actors" rows="4" class="w-full border border-gray-300 rounded px-3 py-2"></textarea>
                </div>

                <div>
                    <label for="trailer_link" class="block text-gray-700 font-medium">Trailer Link:</label>
                    <textarea id="trailer_link" name="trailer_link" rows="4" class="w-full border border-gray-300 rounded px-3 py-2"></textarea>
                </div>

                <div>
                    <label for="movie_status" class="block text-gray-700 font-medium">Movie Status:</label>
                    <select id="movie_status" name="movie_status" required class="w-full border border-gray-300 rounded px-3 py-2">
                        <option value="">Select status</option>
                        <option value="1">Now Showing</option>
                        <option value="0">Coming Soon</option>
                    </select>
                </div>

                <div class="text-center">
                    <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">Add Movie</button>
                </div>
            </form>
        </div>


        <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>

        <script>
            alertify.set('notifier', 'position', 'top-center');
            <% if (request.getAttribute("successMessage") != null) {%>
            alertify.success("<%= request.getAttribute("successMessage")%>");
            <% }%>
        </script>
        <script>
            alertify.set('notifier', 'position', 'top-center');
            <% if (request.getAttribute("errorMessage") != null) {%>
            alertify.error("<%= request.getAttribute("errorMessage")%>");
            <% }%>
        </script>
    </body>
</html>
