<%-- 
    Document   : seatBooking
    Created on : Nov 22, 2024, 10:17:11 AM
    Author     : Shaun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>ABC Cinema - Seat Booking</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js" crossorigin="anonymous"></script>
        <style>
            .seat {
                width: 3rem;
                height: 1.8rem;
                position: relative;
                border-radius: 0.25rem;
                display: flex;
                align-items: center;
                justify-content: center;
                font-weight: bold;
                color: black;
                cursor: pointer;
                transition: transform 0.2s, box-shadow 0.2s;
            }
            .seat::before {
                content: '';
                position: absolute;
                top: -0.9rem;
                width: 2rem;
                height: 1rem;
                background-color: inherit;
                border-radius: 0.25rem 0.25rem 0 0;
            }
            .seat:hover {
                transform: scale(1.1);
                box-shadow: 0px 4px 10px rgba(255, 255, 255, 0.3);
            }
            .available {
                background-color: #27b9e9;
            }
            .reserved {
                background-color: #eb1111df;
                cursor: not-allowed;
            }
            .selected {
                background-color: #A9A9A9;
            }
            .screen {
                position: relative;
                width: 80%;
                height: 2rem;
                margin: 0 auto 2rem;
                text-align: center;
                color: white;
                font-weight: bold;
            }
            .screen::before {
                content: '';
                position: absolute;
                top: 50%;
                left: 0;
                right: 0;
                height: 1rem;
                border-top: 4px solid #ffffff;
                border-radius: 50% / 100px;
                transform: translateY(-50%);
            }
        </style>
    </head>
    <body class="bg-[#000025] text-white flex flex-col items-center min-h-screen">
        <!-- Movie Section -->
        <div class="mb-8 text-center">
            <img src="./assets/img/img 1.jpg.jpg" alt="Movie Poster" class="rounded-lg shadow-lg mx-auto w-85"><br>
            <h1 class="text-4xl font-bold mb-4">The Red One</h1>
        </div>

        <!-- Seat Key -->
        <div class="mb-4 text-center">
            <p>
                Available: <span class="text-blue-500">●</span>,
                Reserved: <span class="text-red-500">●</span>,
                Selected: <span class="text-gray-500">●</span>
            </p>
        </div>
        <div class="w-full max-w-6xl px-4">
            <!-- Screen Indicator -->
            <div class="screen"></BR></BR>Screen</div><BR><BR>
        </div>

        <!-- seating layout full -->
        <div class="w-full max-w-3xl px-4">
            <div class="grid grid-cols-12 gap-4">
                <!-- Left Seats -->
                <div class="col-span-5 space-y-4">
                    <!-- Rows A to H -->
                    <div class="grid grid-cols-5 gap-4">
                        <!-- Row A -->
                        <button class="seat available" data-seat-id="A1">A1</button>
                        <button class="seat available" data-seat-id="A2">A2</button>
                        <button class="seat available" data-seat-id="A3">A3</button>
                        <button class="seat available" data-seat-id="A4">A4</button>
                        <button class="seat available" data-seat-id="A5">A5</button><div style="height: 5px; width: 100%;"></div>
                    </div>
                    <div class="grid grid-cols-5 gap-4">
                        <!-- Row B -->
                        <button class="seat available" data-seat-id="B1">B1</button>
                        <button class="seat available" data-seat-id="B2">B2</button>
                        <button class="seat available" data-seat-id="B3">B3</button>
                        <button class="seat available" data-seat-id="B4">B4</button>
                        <button class="seat available" data-seat-id="B5">B5</button><div style="height: 5px; width: 100%;"></div>
                    </div>
                    <div class="grid grid-cols-5 gap-4">
                        <!-- Row C -->
                        <button class="seat available" data-seat-id="C1">C1</button>
                        <button class="seat available" data-seat-id="C2">C2</button>
                        <button class="seat available" data-seat-id="C3">C3</button>
                        <button class="seat available" data-seat-id="C4">C4</button>
                        <button class="seat available" data-seat-id="C5">C5</button><div style="height: 5px; width: 100%;"></div>
                    </div>
                    <div class="grid grid-cols-5 gap-4">
                        <!-- Row D -->
                        <button class="seat available" data-seat-id="D1">D1</button>
                        <button class="seat available" data-seat-id="D2">D2</button>
                        <button class="seat available" data-seat-id="D3">D3</button>
                        <button class="seat available" data-seat-id="D4">D4</button>
                        <button class="seat available" data-seat-id="D5">D5</button><div style="height: 5px; width: 100%;"></div>
                    </div>
                    <div class="grid grid-cols-5 gap-4">
                        <!-- Row E -->
                        <button class="seat available" data-seat-id="E1">E1</button>
                        <button class="seat available" data-seat-id="E2">E2</button>
                        <button class="seat available" data-seat-id="E3">E3</button>
                        <button class="seat available" data-seat-id="E4">E4</button>
                        <button class="seat available" data-seat-id="E5">E5</button><div style="height: 5px; width: 100%;"></div>
                    </div>
                    <div class="grid grid-cols-5 gap-4">
                        <!-- Row F -->
                        <button class="seat available" data-seat-id="F1">F1</button>
                        <button class="seat available" data-seat-id="F2">F2</button>
                        <button class="seat available" data-seat-id="F3">F3</button>
                        <button class="seat available" data-seat-id="F4">F4</button>
                        <button class="seat available" data-seat-id="F5">F5</button><div style="height: 5px; width: 100%;"></div>
                    </div>
                    <div class="grid grid-cols-5 gap-4">
                        <!-- Row G -->
                        <button class="seat available" data-seat-id="G1">G1</button>
                        <button class="seat available" data-seat-id="G2">G2</button>
                        <button class="seat available" data-seat-id="G3">G3</button>
                        <button class="seat available" data-seat-id="G4">G4</button>
                        <button class="seat available" data-seat-id="G5">G5</button><div style="height: 5px; width: 100%;"></div>
                    </div>
                    <div class="grid grid-cols-5 gap-4">
                        <!-- Row H -->
                        <button class="seat available" data-seat-id="H1">H1</button>
                        <button class="seat available" data-seat-id="H2">H2</button>
                        <button class="seat available" data-seat-id="H3">H3</button>
                        <button class="seat available" data-seat-id="H4">H4</button>
                        <button class="seat available" data-seat-id="H5">H5</button><div style="height: 5px; width: 100%;"></div>
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
                        <button class="seat available" data-seat-id="A6">A6</button>
                        <button class="seat available" data-seat-id="A7">A7</button>
                        <button class="seat available" data-seat-id="A8">A8</button>
                        <button class="seat available" data-seat-id="A9">A9</button>
                        <button class="seat available" data-seat-id="A10">A10</button><div style="height: 5px; width: 100%;"></div>
                    </div>
                    <div class="grid grid-cols-5 gap-4">
                        <!-- Row B -->
                        <button class="seat available" data-seat-id="B6">B6</button>
                        <button class="seat available" data-seat-id="B7">B7</button>
                        <button class="seat available" data-seat-id="B8">B8</button>
                        <button class="seat available" data-seat-id="B9">B9</button>
                        <button class="seat available" data-seat-id="B10">B10</button><div style="height: 5px; width: 100%;"></div>
                    </div>
                    <div class="grid grid-cols-5 gap-4">
                        <!-- Row C -->
                        <button class="seat available" data-seat-id="C6">C6</button>
                        <button class="seat available" data-seat-id="C7">C7</button>
                        <button class="seat available" data-seat-id="C8">C8</button>
                        <button class="seat available" data-seat-id="C9">C9</button>
                        <button class="seat available" data-seat-id="C10">C10</button><div style="height: 5px; width: 100%;"></div>
                    </div>
                    <div class="grid grid-cols-5 gap-4">
                        <!-- Row D -->
                        <button class="seat available" data-seat-id="D6">D6</button>
                        <button class="seat available" data-seat-id="D7">D7</button>
                        <button class="seat available" data-seat-id="D8">D8</button>
                        <button class="seat available" data-seat-id="D9">D9</button>
                        <button class="seat available" data-seat-id="D10">D10</button><div style="height: 5px; width: 100%;"></div>
                    </div>
                    <div class="grid grid-cols-5 gap-4">
                        <!-- Row E -->
                        <button class="seat available" data-seat-id="E6">E6</button>
                        <button class="seat available" data-seat-id="E7">E7</button>
                        <button class="seat available" data-seat-id="E8">E8</button>
                        <button class="seat available" data-seat-id="E9">E9</button>
                        <button class="seat available" data-seat-id="E10">E10</button><div style="height: 5px; width: 100%;"></div>
                    </div>
                    <div class="grid grid-cols-5 gap-4">
                        <!-- Row F -->
                        <button class="seat available" data-seat-id="F6">F6</button>
                        <button class="seat available" data-seat-id="F7">F7</button>
                        <button class="seat available" data-seat-id="F8">F8</button>
                        <button class="seat available" data-seat-id="F9">F9</button>
                        <button class="seat available" data-seat-id="F10">F10</button><div style="height: 5px; width: 100%;"></div>
                    </div>
                    <div class="grid grid-cols-5 gap-4">
                        <!-- Row G -->
                        <button class="seat available" data-seat-id="G6">G6</button>
                        <button class="seat available" data-seat-id="G7">G7</button>
                        <button class="seat available" data-seat-id="G8">G8</button>
                        <button class="seat available" data-seat-id="G9">G9</button>
                        <button class="seat available" data-seat-id="G10">G10</button><div style="height: 5px; width: 100%;"></div>
                    </div>
                    <div class="grid grid-cols-5 gap-4">
                        <!-- Row H -->
                        <button class="seat available" data-seat-id="H6">H6</button>
                        <button class="seat available" data-seat-id="H7">H7</button>
                        <button class="seat available" data-seat-id="H8">H8</button>
                        <button class="seat available" data-seat-id="H9">H9</button>
                        <button class="seat available" data-seat-id="H10">H10</button><div style="height: 5px; width: 100%;"></div>
                    </div>
                </div>
            </div>



            <!-- Proceed Button -->
            <div class="text-center mt-6">
                <button class="bg-blue-500 text-white py-2 px-6 rounded hover:bg-blue-600" onclick="proceedToBooking()">Proceed to Booking</button>
            </div>
        </div>

        <!-- Booking Summary -->
        <div id="bookingSummary" class="hidden fixed inset-0 bg-black bg-opacity-80 flex items-center justify-center">
            <div class="bg-white text-black p-6 rounded shadow-lg w-96">
                <h2 class="text-xl font-bold mb-4">Booking Summary</h2>
                <p id="selectedSeatsText" class="mb-4">Seats: </p>
                <p class="font-medium">Total Price: Rs. <span id="totalPrice">0</span></p>
                <button class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 mt-4" onclick="closeSummary()">Close</button>
            </div>
        </div>

        <script>
            let selectedSeats = [];

            function toggleSeatSelection(seatId) {
                const seat = document.querySelector(`[data-seat-id="${seatId}"]`);
                if (seat.classList.contains("available")) {
                    seat.classList.remove("available");
                    seat.classList.add("selected");
                    selectedSeats.push(seatId);
                } else if (seat.classList.contains("selected")) {
                    seat.classList.remove("selected");
                    seat.classList.add("available");
                    selectedSeats = selectedSeats.filter((s) => s !== seatId);
                }
            }

            function proceedToBooking() {
                if (selectedSeats.length === 0) {
                    alert("Please select at least one seat to proceed!");
                    return;
                }
                document.getElementById("selectedSeatsText").innerText = `Seats: ${selectedSeats.join(", ")}`;
                document.getElementById("totalPrice").innerText = selectedSeats.length * 1200;
                document.getElementById("bookingSummary").classList.remove("hidden");
            }

            function closeSummary() {
                document.getElementById("bookingSummary").classList.add("hidden");
            }

            document.addEventListener("DOMContentLoaded", () => {
                document.querySelectorAll(".seat.available").forEach((seat) => {
                    seat.addEventListener("click", () => toggleSeatSelection(seat.dataset.seatId));
                });
            });
        </script>
    </body>
</html>

