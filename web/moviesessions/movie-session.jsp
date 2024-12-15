<%-- 
    Document   : moviesession
    Created on : Dec 2, 2024, 8:03:00 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String pageType = "non-root";
    request.setAttribute("pageType", pageType);
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="icon" href="./assets/img/logo_white.png" type="image/x-icon">
        <title>ABC Cinema | Movie Session</title>

        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>
    <body class="overflow-x-hidden">

        <%@include file="../components/header.jsp" %>

        <section class="relative">
            <div class=" p-4">
                <img src="${movie_image}" alt="${movie_name}" class="w-full h-64 object-cover rounded-lg">
            </div>
            <div class="absolute inset-0 opacity-50 flex items-center justify-center z-10">
                <h2 class="text-black text-4xl font-bold">${movie_name}</h2>
                <h2>${genre} ● ${language}</h2>
            </div>
        </section>

        <!-- Show Times -->
        <section class="container mx-auto px-4 py-10">
            <h3 class="text-2xl font-semibold mb-6">Show Times</h3>

            <!-- Cinema Hall List -->
            <div class="mt-6 space-y-6" id="showtimes-container">

            </div>
        </section>

        <%@include file="../components/footer.jsp" %>

        <script src="../js/moviesession.js"></script>
    </body>
</html>
