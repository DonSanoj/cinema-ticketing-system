<%-- 
    Document   : add_reviews
    Created on : Dec 16, 2024, 10:17:17 PM
    Author     : Pamith
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    HttpSession customerSession = request.getSession(false);
    if (customerSession == null || customerSession.getAttribute("customer_id") == null) {
        String originalUrl = request.getRequestURI();
        if (request.getQueryString() != null) {
            originalUrl += "?" + request.getQueryString();
        }
        request.getSession(true).setAttribute("redirectAfterLogin", originalUrl);
        response.sendRedirect("/abc-cinema/login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link rel="icon" href="./assets/img/logo_white.png" type="image/x-icon">
        <title>ABC Cinema | Add Review</title>
        
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-black text-white">

        <%@include file="./components/header.jsp" %>

        <div class=" py-10">

            <div class="flex justify-center items-center mb-10 space-x-8"> <!-- space-x-8 for horizontal spacing -->
                <!-- Image Section (Left Side) -->
                <div class="w-full max-w-2xl p-8  rounded-lg shadow-lg flex justify-center items-center">
                    <img src="./assets/img/reviewImage.jpg" alt="Cinema Image" class="w-full h-auto object-cover rounded-lg ">
                </div>
                <!-- Form Section (Right Side) -->
                <div class="w-full max-w-lg p-8 bg-[#eee] rounded-lg shadow-lg">
                    <h2 class="text-2xl font-bold mb-4 text-center text-black">Share Your Movie Experience</h2>

                    <%
                        String customer_name = (String) customerSession.getAttribute("customer_name");
                        String customer_email = (String) customerSession.getAttribute("email");
                    %>

                    <form id="reviewForm" action="addReview" method="post">

                        <input type="hidden" name="customer_name" value="<%= customer_name != null ? customer_name : ""%>">
                        <input type="hidden" name="customer_email" value="<%= customer_email != null ? customer_email : ""%>">

                        <select
                            name="reviewFor"
                            id="category"
                            class="w-full p-3 mb-4 rounded-md bg-black text-white focus:outline-none focus:ring-2 focus:ring-blue-500"
                            required
                            >
                            <option value="" disabled selected>What are you reviewing?</option>
                            <option value="movie">Movie</option> 
                            <option value="service">Service</option>
                            <option value="facilities">Facilities</option>
                        </select>
                        <textarea
                            name="reviewMessage"
                            id="topic"
                            placeholder="Enter your review"
                            class="w-full p-3 mb-4 rounded-md bg-black text-white placeholder-gray-300 focus:outline-none focus:ring-2 focus:ring-blue-500"
                            rows="4"
                            required
                            ></textarea>
                        <div class="flex items-center mb-4">
                            <input type="checkbox" id="terms" class="mr-2" required>
                            <label for="terms" class="text-sm text-gray-700">
                                By clicking "Submit Review," you agree with our
                                <a href="#" class="underline text-black">Terms and Conditions</a>.
                            </label>
                        </div>
                        <button
                            type="submit"
                            class="w-full py-3 bg-black text-white rounded-md font-bold hover:bg-blue-500 hover:text-white"
                            >
                            Submit Review
                        </button>
                    </form>

                </div>
            </div>
        </div>

        <%@include file="./components/footer.jsp" %>

    </body>
</html>

