<%-- 
    Document   : movies
    Created on : 9 Dec 2024, 19:20:12
    Author     : annem
--%>

<%@ page import="java.util.List" %>
<%@ page import="com.abc.cinema.models.Movie" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="icon" href="./assets/img/logo_white.png" type="image/x-icon">
        <title>ABC Cinema | Movies</title>

        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

        <link rel="stylesheet" href="./css/index.css" />
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>
    <body class="overflow-x-hidden">

        <%@include file="./components/header.jsp" %>

        <section class="bg-black text-white mt-6 mb-6">
            <div class="p-4 flex items-center justify-between rounded-lg shadow-md">
                <div class="py-4 px-6 rounded-lg shadow-lg">
                    <h2 class="text-3xl text-white font-bold text-center">Now Showing</h2>
                </div>
            </div>

            <div class="bg-black container mx-auto grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-6 p-4" id="now-showing-movie">
                <!--Movie cards will be dynamically added here--> 
            </div>
        </section>

        <!-- Coming soon section -->
        <section class="bg-[#eee] text-black mb-6">

            <div class="p-4 flex items-center justify-between rounded-lg">

                <div class=" py-2 px-6">
                    <h2 class="text-3xl text-black font-bold text-center">Coming Soon...</h2>
                </div>
            </div>

            <div class="bg-white container mx-auto grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-6 p-4" id="coming-soon-movie">
                <!-- Movie cards will be dynamically added here -->
            </div>

        </section>

        <div class="error-message"></div>

        <%@include file="./components/footer.jsp" %>

        <script src="./js/searchResult.js"></script>
        <script src="./js/footer.js"></script>
        <script src="./js/nowshowingMovies.js"></script>
        <script src="./js/comingsoonMovies.js"></script>

    </body>
</html>