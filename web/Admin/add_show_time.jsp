<%-- 
    Document   : add_show_time
    Created on : Dec 11, 2024, 1:23:56 PM
    Author     : Himantha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.abc.cinema.models.Movie" %>

<%
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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="./assets/img/logo_white.png" type="image/x-icon">
    <title>Add ShowTime</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
</head>
   
    <body>
    
        <%@include file="./components/header.jsp" %>
    
        <div class="flex items-center justify-center min-h-screen px-4 sm:px-6 lg:px-8">
            <form action="/abc-cinema/Admin/addShowTime" method="post" class="bg-white p-8 shadow-md rounded-lg w-full max-w-md">
                <h2 class="text-2xl font-bold mb-6 text-center text-gray-700">Add ShowTime</h2>

                <div class="mb-4">
                    <label for="movieId" class="block text-sm font-medium text-gray-600 mb-1">Movie ID:</label>
                    <select id="movie_id" name="movie_id" required class="w-full border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500">
                        <option value="">Select a Movie</option>
                    </select>
                </div>

                <div class="mb-4">
                    <label for="complexId" class="block text-sm font-medium text-gray-600 mb-1">Complex:</label>
                    <select id="complex_id" name="complex_id" required class="w-full border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500">
                        <option value="">Select a Cinema Complex</option>
                        <option value="1">ABC Cinema Multiplex Colombo City Centre</option>
                        <option value="2">ABC Cinema Multiplex One Galle Face Mall</option>
                        <option value="3">ABC Cinema Multiplex Havelock City Mall</option>
                        <option value="4">ABC Cinema Multiplex Kandy City Centre</option>
                    </select>
                </div>

                <div class="mb-4">
                    <label for="hallId" class="block text-sm font-medium text-gray-600 mb-1">Hall:</label>
                    <select id="hall_id" name="hall_id" required class="w-full border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500">
                        <option value="">Select a Hall</option>
                    </select>
                </div>

                <div class="mb-4">
                    <label for="startTime" class="block text-sm font-medium text-gray-600 mb-1">Start Time:</label>
                    <input type="time" id="start_time" name="start_time" required class="w-full border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500" placeholder="HH:MM AM/PM">
                </div>

                <div class="mb-4">
                    <label for="date" class="block text-sm font-medium text-gray-600 mb-1">Date:</label>
                    <input type="date" id="date" name="date" required class="w-full border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500">
                </div>

                <button type="submit" class="w-full bg-indigo-600 text-white py-2 px-4 rounded-md hover:bg-indigo-700 transition">Add ShowTime</button>
            </form>
        </div>

    <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
    <script>
        const halls = {
            1: [
                {value: "1", text: "CCC Hall 1"},
                {value: "2", text: "CCC Hall 2"}
            ],
            2: [
                {value: "3", text: "OGF Hall 1"},
                {value: "4", text: "OGF Hall 2"}
            ],
            3: [
                {value: "5", text: "HCM Hall 1"},
                {value: "6", text: "HCM Hall 2"}
            ],
            4: [
                {value: "7", text: "KCC Hall 1"},
                {value: "8", text: "KCC Hall 2"}
            ]
        };

        const complexDropdown = document.getElementById("complex_id");
        const hallDropdown = document.getElementById("hall_id");

        complexDropdown.addEventListener("change", () => {
            const selectedComplex = complexDropdown.value;
            hallDropdown.innerHTML = '<option value="">Select a Hall</option>';

            if (halls[selectedComplex]) {
                halls[selectedComplex].forEach(hall => {
                    const option = document.createElement("option");
                    option.value = hall.value;
                    option.textContent = hall.text;
                    hallDropdown.appendChild(option);
                });
            }
        });



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
