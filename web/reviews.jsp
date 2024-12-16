<%-- 
    Document   : reviews
    Created on : Dec 16, 2024, 10:15:04 PM
    Author     : Pamith
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link rel="icon" href="./assets/img/logo_white.png" type="image/x-icon">
        <title>ABC Cinema | Reviews</title>

        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>

    <body class="bg-black text-gray-800">

        <%@include file="./components/header.jsp" %>

        <div></div>
        <div class="error-message"></div> 

        <div class="py-10 px-6">
            <!-- Header Section -->
            <header class="text-center mb-12">
                <h1 class="text-4xl font-bold text-white">Reasons We Will Win You Over</h1>
                <p class="text-white mt-2">Read why our customers love our cinema experience!</p>
            </header>

            <div class="max-w-6xl mx-auto grid gap-8 sm:grid-cols-1 md:grid-cols-2 lg:grid-cols-2" id="reviewsContainer">
                <!--Dynamic Review content-->
            </div>
        </div>

        <%@include file="./components/footer.jsp" %>

        <script src="./js/searchResult.js"></script>
        <script src="./js/footer.js"></script>

        <script src="./js/reviews.js"></script>

    </body>
</html>