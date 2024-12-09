<%-- 
    Document   : movies
    Created on : 9 Dec 2024, 19:20:12
    Author     : annem
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="icon" href="./assets/img/logo_white.png" type="image/x-icon">
        <title>ABC Cinema | Movies</title>

        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">

        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
        <link rel="stylesheet" href="./css/index.css" />

    </head>
    <body class="bg-gray-100">

        <section class="bg-black text-white mt-6 mb-6">

            <div class="p-4 flex items-center justify-between rounded-lg shadow-md">
                <div class=" py-4 px-6 rounded-lg shadow-lg">
                    <h2 class="text-3xl text-white font-bold text-center">Now Showing</h2>
                </div>
            </div>

            <div class="bg-black container mx-auto grid grid-cols-3 md:grid-cols-3 gap-4 p-4">

                <div
                    class="movie-card col-span-2 row-span-2 bg-gray-800 rounded-lg relative h-64 md:h-full shadow-lg hover:scale-105 transition-transform duration-300">
                    <img src="./assets/img/img_1.jpg" alt="Movie"
                         class="w-full h-full object-cover rounded-lg opacity-80 hover:opacity-90 transition-opacity duration-300">
                    <div class="absolute bottom-4 left-4 text-white">
                        <h4 class="text-3xl font-bold">Movie Name</h4>
                        <h2 class="text-md font-bold mb-2">English ● Action</h2>

                        <button
                            class="bg-white text-black font-bold px-4 py-2 rounded hover:bg-blue-500 hover:text-white transition duration-300">
                            <a href="./seatBooking.html">Book Tickets</a>
                        </button>
                        <button
                            class="bg-transparent text-white border border-white px-4 py-2 rounded hover:bg-blue-500 hover:text-white transition duration-300">
                            Watch Trailer
                        </button>
                    </div>
                </div>

                <div
                    class="movie-card bg-gray-800 rounded-lg relative h-32 md:h-48 shadow-lg hover:scale-105 transition-transform duration-300">
                    <img src="./assets/img/img_1.jpg" alt="Movie"
                         class="w-full h-full object-cover rounded-lg opacity-80 hover:opacity-90 transition-opacity duration-300">
                    <div class="absolute bottom-4 left-4 text-white">
                        <h4 class="text-2xl font-bold">Movie Name</h4>
                        <h2 class="text-md font-bold mb-2">English ● Action</h2>

                        <button
                            class="bg-white text-black font-bold px-4 py-2 rounded hover:bg-blue-500 hover:text-white transition duration-300">
                            Book Tickets
                        </button>
                        <button
                            class="bg-transparent text-white border border-white px-4 py-2 rounded hover:bg-blue-500 hover:text-white transition duration-300">
                            Watch Trailer
                        </button>
                    </div>
                </div>

                <div
                    class="movie-card bg-gray-800 rounded-lg relative h-32 md:h-48 shadow-lg hover:scale-105 transition-transform duration-300">
                    <img src="./assets/img/img_1.jpg" alt="Movie"
                         class="w-full h-full object-cover rounded-lg opacity-80 hover:opacity-90 transition-opacity duration-300">
                    <div class="absolute bottom-4 left-4 text-white">
                        <h4 class="text-2xl font-bold">Movie Name</h4>
                        <h2 class="text-md font-bold mb-2">English ● Action</h2>

                        <button
                            class="bg-white text-black font-bold px-4 py-2 rounded hover:bg-blue-500 hover:text-white transition duration-300">
                            Book Tickets
                        </button>
                        <button
                            class="bg-transparent text-white border border-white px-4 py-2 rounded hover:bg-blue-500 hover:text-white transition duration-300">
                            Watch Trailer
                        </button>
                    </div>
                </div>

                <div
                    class="movie-card bg-gray-800 rounded-lg relative h-32 md:h-48 shadow-lg hover:scale-105 transition-transform duration-300">
                    <img src="./assets/img/img_1.jpg" alt="Movie"
                         class="w-full h-full object-cover rounded-lg opacity-80 hover:opacity-90 transition-opacity duration-300">
                    <div class="absolute bottom-4 left-4 text-white">
                        <h4 class="text-2xl font-bold">Movie Name</h4>
                        <h2 class="text-md font-bold mb-2">English ● Action</h2>

                        <button
                            class="bg-white text-black font-bold px-4 py-2 rounded hover:bg-blue-500 hover:text-white transition duration-300">
                            Book Tickets
                        </button>
                        <button
                            class="bg-transparent text-white border border-white px-4 py-2 rounded hover:bg-blue-500 hover:text-white transition duration-300">
                            Watch Trailer
                        </button>
                    </div>
                </div>

                <div
                    class="movie-card bg-gray-800 rounded-lg relative h-32 md:h-48 shadow-lg hover:scale-105 transition-transform duration-300">
                    <img src="./assets/img/img_1.jpg" alt="Movie"
                         class="w-full h-full object-cover rounded-lg opacity-80 hover:opacity-90 transition-opacity duration-300">
                    <div class="absolute bottom-4 left-4 text-white">
                        <h4 class="text-2xl font-bold">Movie Name</h4>
                        <h2 class="text-md font-bold mb-2">English ● Action</h2>

                        <button
                            class="bg-white text-black font-bold px-4 py-2 rounded hover:bg-blue-500 hover:text-white transition duration-300">
                            Book Tickets
                        </button>
                        <button
                            class="bg-transparent text-white border border-white px-4 py-2 rounded hover:bg-blue-500 hover:text-white transition duration-300">
                            Watch Trailer
                        </button>
                    </div>
                </div>

                <div
                    class="movie-card bg-gray-800 rounded-lg relative h-32 md:h-48 shadow-lg hover:scale-105 transition-transform duration-300">
                    <img src="./assets/img/img_1.jpg" alt="Movie"
                         class="w-full h-full object-cover rounded-lg opacity-80 hover:opacity-90 transition-opacity duration-300">
                    <div class="absolute bottom-4 left-4 text-white">
                        <h4 class="text-2xl font-bold">Movie Name</h4>
                        <h2 class="text-md font-bold mb-2">English ● Action</h2>

                        <button
                            class="bg-white text-black font-bold px-4 py-2 rounded hover:bg-blue-500 hover:text-white transition duration-300">
                            Book Tickets
                        </button>
                        <button
                            class="bg-transparent text-white border border-white px-4 py-2 rounded hover:bg-blue-500 hover:text-white transition duration-300">
                            Watch Trailer
                        </button>
                    </div>
                </div>
            </div>
        </section>

    </body>
</html>
