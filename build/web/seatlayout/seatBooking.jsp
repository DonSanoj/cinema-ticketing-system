<%-- 
    Document   : seatBooking
    Created on : Nov 22, 2024, 10:17:11 AM
    Author     : Shaun
--%>

<%@page import="com.abc.cinema.models.Movie"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%@page import="jakarta.servlet.http.HttpSession" %>

<%
    String pageType = "non-root";
    request.setAttribute("pageType", pageType);
%>

<%
    HttpSession customerSession = request.getSession(false);
    if (customerSession == null || customerSession.getAttribute("customer_id") == null) {
        String originalUrl = request.getRequestURI();
        if (request.getQueryString() != null) {
            originalUrl += "?" + request.getQueryString();
        }
        request.getSession(true).setAttribute("redirectAfterLogin", originalUrl);
        response.sendRedirect("/test-web/login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <link rel="icon" href="../assets/img/logo_white.png" type="image/x-icon">
        <title>ABC Cinema | Seat Booking Session</title>

        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="../css/seatBooking.css">
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css" />
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css" />

        <script type="text/javascript" src="https://www.payhere.lk/lib/payhere.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="../js/seatBooking.js" defer></script>

    </head>
    <body class="bg-black text-white flex flex-col items-center min-h-screen overflow-x-hidden">

        <%@include file="../components/header.jsp" %>

        <div id="movie-container" class="movie-container mb-8 text-center p-10"></div>

        <div class="mb-6 text-center flex flex-row space-x-4">
            <div class=" items-center justify-center flex text-center space-x-2">
                <p class=" font-semibold">Available : </p>
                <p class="text-gray-500 text-4xl font-semibold mx-auto p-1">●</p>
            </div>
            <div class=" items-center justify-center flex text-center space-x-2">
                <p class=" font-semibold">Selected : </p>
                <p class="text-red-500 text-4xl font-semibold mx-auto p-1">●</p>
            </div>
            <div class=" items-center justify-center flex text-center space-x-2">
                <p class=" font-semibold">Reserved : </p>
                <p class="text-blue-500 text-4xl font-semibold mx-auto p-1">●</p>
            </div>
        </div>

        <div class="w-full max-w-6xl px-4 mb-4">
            <div class="screen"><br />Screen</div>
        </div>

        <div class="w-full max-w-3xl px-4 mb-10 mt-8">

            <div id="loading" style="display: block;">Loading...</div>

            <div class="w-full max-w-3xl px-4">
                <div class="grid grid-cols-12 gap-4">
                    <!-- Left Seats -->
                    <div class="col-span-5 space-y-4">
                        <!-- Rows A to H -->
                        <div class="grid grid-cols-5 gap-4">
                            <!-- Row A -->
                            <button class="seat available bg-gray-500 text-white" data-price="1200" data-seat-id="A1">A1</button>
                            <button class="seat available bg-gray-500 text-white" data-price="1200" data-seat-id="A2">A2</button>
                            <button class="seat available bg-gray-500 text-white" data-price="1200" data-seat-id="A3">A3</button>
                            <button class="seat available bg-gray-500 text-white" data-price="1200" data-seat-id="A4">A4</button>
                            <button class="seat available bg-gray-500 text-white" data-price="1200" data-seat-id="A5">A5</button><div style="height: 5px; width: 100%;"></div>
                        </div>
                        <div class="grid grid-cols-5 gap-4">
                            <!-- Row B -->
                            <button class="seat available bg-gray-500 text-white" data-price="1200" data-seat-id="B1">B1</button>
                            <button class="seat available bg-gray-500 text-white" data-price="1200" data-seat-id="B2">B2</button>
                            <button class="seat available bg-gray-500 text-white" data-price="1200" data-seat-id="B3">B3</button>
                            <button class="seat available bg-gray-500 text-white" data-price="1200" data-seat-id="B4">B4</button>
                            <button class="seat available bg-gray-500 text-white" data-price="1200" data-seat-id="B5">B5</button><div style="height: 5px; width: 100%;"></div>
                        </div>
                        <div class="grid grid-cols-5 gap-4">
                            <!-- Row C -->
                            <button class="seat available bg-gray-500 text-white" data-price="1200" data-seat-id="C1">C1</button>
                            <button class="seat available bg-gray-500 text-white" data-price="1200" data-seat-id="C2">C2</button>
                            <button class="seat available bg-gray-500 text-white" data-price="1200" data-seat-id="C3">C3</button>
                            <button class="seat available bg-gray-500 text-white" data-price="1200" data-seat-id="C4">C4</button>
                            <button class="seat available bg-gray-500 text-white" data-price="1200" data-seat-id="C5">C5</button><div style="height: 5px; width: 100%;"></div>
                        </div>
                        <div class="grid grid-cols-5 gap-4">
                            <!-- Row D -->
                            <button class="seat available bg-gray-500 text-white" data-price="1200" data-seat-id="D1">D1</button>
                            <button class="seat available bg-gray-500 text-white" data-price="1200" data-seat-id="D2">D2</button>
                            <button class="seat available bg-gray-500 text-white" data-price="1200" data-seat-id="D3">D3</button>
                            <button class="seat available bg-gray-500 text-white" data-price="1200" data-seat-id="D4">D4</button>
                            <button class="seat available bg-gray-500 text-white" data-price="1200" data-seat-id="D5">D5</button><div style="height: 5px; width: 100%;"></div>
                        </div>
                        <div class="grid grid-cols-5 gap-4">
                            <!-- Row E -->
                            <button class="seat available bg-gray-500 text-white" data-price="1200" data-seat-id="E1">E1</button>
                            <button class="seat available bg-gray-500 text-white" data-price="1200" data-seat-id="E2">E2</button>
                            <button class="seat available bg-gray-500 text-white" data-price="1200" data-seat-id="E3">E3</button>
                            <button class="seat available bg-gray-500 text-white" data-price="1200" data-seat-id="E4">E4</button>
                            <button class="seat available bg-gray-500 text-white" data-price="1200" data-seat-id="E5">E5</button><div style="height: 5px; width: 100%;"></div>
                        </div>
                    </div>

                    <!-- Middle Aisle -->
                    <div class="col-span-2 flex flex-col justify-center items-center text-gray-400">
                        <p>Aisle</p>
                        <div class="h-full w-px bg-gray-500"></div>
                    </div>

                    <!-- Right Seats -->
                    <div class="col-span-5 space-y-4">
                        <!-- Rows A to H -->
                        <div class="grid grid-cols-5 gap-4">
                            <!-- Row A -->
                            <button class="seat available bg-gray-500 text-white" data-price="1200" data-seat-id="A6">A6</button>
                            <button class="seat available bg-gray-500 text-white" data-price="1200" data-seat-id="A7">A7</button>
                            <button class="seat available bg-gray-500 text-white" data-price="1200" data-seat-id="A8">A8</button>
                            <button class="seat available bg-gray-500 text-white" data-price="1200" data-seat-id="A9">A9</button>
                            <button class="seat available bg-gray-500 text-white" data-price="1200" data-seat-id="A10">A10</button><div style="height: 5px; width: 100%;"></div>
                        </div>
                        <div class="grid grid-cols-5 gap-4">
                            <!-- Row B -->
                            <button class="seat available bg-gray-500 text-white" data-price="1200" data-seat-id="B6">B6</button>
                            <button class="seat available bg-gray-500 text-white" data-price="1200" data-seat-id="B7">B7</button>
                            <button class="seat available bg-gray-500 text-white" data-price="1200" data-seat-id="B8">B8</button>
                            <button class="seat available bg-gray-500 text-white" data-price="1200" data-seat-id="B9">B9</button>
                            <button class="seat available bg-gray-500 text-white" data-price="1200" data-seat-id="B10">B10</button><div style="height: 5px; width: 100%;"></div>
                        </div>
                        <div class="grid grid-cols-5 gap-4">
                            <!-- Row C -->
                            <button class="seat available bg-gray-500 text-white" data-price="1200" data-seat-id="C6">C6</button>
                            <button class="seat available bg-gray-500 text-white" data-price="1200" data-seat-id="C7">C7</button>
                            <button class="seat available bg-gray-500 text-white" data-price="1200" data-seat-id="C8">C8</button>
                            <button class="seat available bg-gray-500 text-white" data-price="1200" data-seat-id="C9">C9</button>
                            <button class="seat available bg-gray-500 text-white" data-price="1200" data-seat-id="C10">C10</button><div style="height: 5px; width: 100%;"></div>
                        </div>
                        <div class="grid grid-cols-5 gap-4">
                            <!-- Row D -->
                            <button class="seat available bg-gray-500 text-white" data-price="1200" data-seat-id="D6">D6</button>
                            <button class="seat available bg-gray-500 text-white" data-price="1200" data-seat-id="D7">D7</button>
                            <button class="seat available bg-gray-500 text-white" data-price="1200" data-seat-id="D8">D8</button>
                            <button class="seat available bg-gray-500 text-white" data-price="1200" data-seat-id="D9">D9</button>
                            <button class="seat available bg-gray-500 text-white" data-price="1200" data-seat-id="D10">D10</button><div style="height: 5px; width: 100%;"></div>
                        </div>
                        <div class="grid grid-cols-5 gap-4">
                            <!-- Row E -->
                            <button class="seat available bg-gray-500 text-white" data-price="1200" data-seat-id="E6">E6</button>
                            <button class="seat available bg-gray-500 text-white" data-price="1200" data-seat-id="E7">E7</button>
                            <button class="seat available bg-gray-500 text-white" data-price="1200" data-seat-id="E8">E8</button>
                            <button class="seat available bg-gray-500 text-white" data-price="1200" data-seat-id="E9">E9</button>
                            <button class="seat available bg-gray-500 text-white" data-price="1200" data-seat-id="E10">E10</button><div style="height: 5px; width: 100%;"></div>
                        </div>
                    </div>
                </div>
            </div>

            <input type="hidden" id="selectedSeats" name="selectedSeats" value="">
            <input type="hidden" id="customerId" value="<%= customerSession.getAttribute("customer_id")%>">
            <input type="hidden" id="customerEmail" value="<%= customerSession.getAttribute("email")%>">
            <input type="hidden" id="customerName" value="<%= customerSession.getAttribute("customer_name")%>">
            <input type="hidden" id="customerPhone" value="<%= customerSession.getAttribute("phone_number")%>">

            <div class="text-center mt-6">
                <button class="bg-white text-black py-2 px-6 rounded hover:bg-blue-500 hover:text-white font-semibold"
                        onclick="proceedToBooking()">Proceed to Booking</button>
            </div>

            <div id="bookingModal" class="hidden modal-overlay">
                <div class="modal-content">
                    <h2 class="text-2xl text-black font-bold mb-4">Confirm Your Booking</h2>
                    <p id="selectedSeatsSummary" class="mb-2 text-black text-xl font-semibold"></p>
                    <p id="totalPrice" class="mb-6 text-black text-xl font-semibold"></p>
                    <div class="flex justify-end gap-4">
                        <button class="bg-gray-500 text-white py-1 px-4 rounded hover:bg-gray-600" onclick="closeModal()">Cancel</button>
                        <button class="bg-blue-500 text-white py-1 px-4 rounded hover:bg-blue-600" onclick="paymentGateway()">Pay Now</button>
                    </div>
                </div>
            </div>

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

        <script type="text/javascript"
        src="https://cdn.jsdelivr.net/npm/@emailjs/browser@4/dist/email.min.js"></script>

        <script type="text/javascript">
            emailjs.init('c_Zr8FH7dq0143F56')
        </script>

    </body>
</html>
