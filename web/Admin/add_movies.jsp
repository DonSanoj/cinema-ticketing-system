<%-- 
    Document   : add_movies
    Created on : Dec 11, 2024, 1:18:42 PM
    Author     : Himantha
--%>

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
        <title>Add Movie</title>

        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css" />
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css" />
    </head>
    <body>
        <h1>Add a New Movie</h1>
        <form action="/abc-cinema/Admin/add_movies" method="POST" enctype="multipart/form-data">
            <label for="movie_name">Movie Name:</label><br>
            <input type="text" id="movie_name" name="movie_name" required><br><br>

            <label for="movie_image">Movie Image:</label><br>
            <input type="file" id="movie_image" name="movie_image" accept="image/*" required><br><br>

            <label for="genre">Genre:</label><br>
            <input type="text" id="genre" name="genre"><br><br>
            
            <label for="language">Language:</label><br>
            <input type="text" id="language" name="language"><br><br>

            <label for="duration">Duration (minutes):</label><br>
            <input type="number" id="duration" name="duration" min="0" required><br><br>
            
            <label for="description">Description:</label><br>
            <textarea type="text" id="description" name="description" required></textarea><br><br>

            <label for="director">Director:</label><br>
            <input type="text" id="director" name="director"><br><br>

            <label for="main_actor">Main Actor:</label><br>
            <input type="text" id="main_actor" name="main_actor"><br><br>

            <label for="other_actors">Other Actors:</label><br>
            <textarea id="other_actors" name="other_actors" rows="4" cols="50"></textarea><br><br>
            
            <label for="trailer_link">Trailer Link:</label><br>
            <textarea id="trailer_link" name="trailer_link" rows="4" cols="50"></textarea><br><br>
            
            <label for="movie_status">Movie Status:</label><br>
            <select id="movie_status" name="movie_status" required>
                <option value="">Select status</option>
                <option value="1">Now Showing</option>
                <option value="0">Coming Soon</option>
            </select><br>

            <button type="submit">Add Movie</button>
        </form>

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

