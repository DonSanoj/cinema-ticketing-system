<%-- 
    Document   : index
    Created on : Nov 7, 2024, 7:26:16 PM
    Author     : DON
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="icon" href="./assets/img/logo.png" type="image/x-icon">
        <title>ABC Cinema</title>

        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
    </head>
    <body class="bg-gray-100">

        <%@ include file="./components/header.jsp" %>

        <section class=" p-2 px-4 w-full h-96 rounded-xl mb-6">
            <!-- Main Carousel -->
            <swiper-container
                class="mySwiper w-full h-full rounded-xl"
                pagination="true"
                pagination-clickable="true"
                navigation="true"
                space-between="30"
                centered-slides="true"
                autoplay-delay="3500"
                autoplay-disable-on-interaction="false"
                >
                <swiper-slide class="flex items-center justify-center text-center text-lg bg-black relative rounded-xl">
                    <div class="px-12 w-full h-full">
                        <img src="./assets/img/img 1.jpg" alt="carousel-img1" class="w-full h-full object-cover rounded-lg"/>

                        <!-- Text and buttons positioned in the top-left corner -->
                        <div class="absolute bottom-2 left-4 p-4 space-y-2">
                            <!-- Title -->
                            <h1 class="text-white text-3xl font-bold mb-2 text-left">Venome</h1>

                            <!-- Buttons container -->
                            <div class="flex flex-row space-x-2">
                                <!-- Book Tickets Button -->
                                <button class="bg-white text-black font-bold px-4 py-2 rounded hover:bg-gray-600 hover:text-white transition duration-300">
                                    Book Tickets
                                </button>

                                <!-- Watch Trailer Button -->
                                <button class="bg-transparent text-white border border-white px-4 py-2 rounded hover:bg-gray-600 hover:text-white transition duration-300">
                                    Watch Trailer
                                </button>
                            </div>
                        </div>
                    </div>
                </swiper-slide>

                <swiper-slide class="flex items-center justify-center text-center text-lg bg-black relative rounded-xl">
                    <div class="px-12 w-full h-full">
                        <img src="./assets/img/img-2.jpg" alt="carousel-img2" class="w-full h-full object-cover rounded-lg"/>

                        <!-- Text and buttons positioned in the top-left corner -->
                        <div class="absolute bottom-2 left-4 p-4 space-y-2">
                            <!-- Title -->
                            <h1 class="text-white text-3xl font-bold mb-2 text-left">Venome</h1>

                            <!-- Buttons container -->
                            <div class="flex flex-row space-x-2">
                                <!-- Book Tickets Button -->
                                <button class="bg-white text-black font-bold px-4 py-2 rounded hover:bg-blue-600 hover:text-white transition duration-300">
                                    Book Tickets
                                </button>

                                <!-- Watch Trailer Button -->
                                <button class="bg-transparent text-white border border-white px-4 py-2 rounded hover:bg-blue-600 hover:text-white transition duration-300">
                                    Watch Trailer
                                </button>
                            </div>
                        </div>
                    </div>
                </swiper-slide>

                <swiper-slide class="flex items-center justify-center text-center text-lg bg-black relative rounded-xl">
                    <div class="px-12 w-full h-full">
                        <img src="./assets/img/img-3.jpg" alt="carousel-img1" class="w-full h-full object-cover rounded-lg"/>

                        <!-- Text and buttons positioned in the top-left corner -->
                        <div class="absolute bottom-2 left-4 p-4 space-y-2">
                            <!-- Title -->
                            <h1 class="text-white text-3xl font-bold mb-2 text-left">Venome</h1>

                            <!-- Buttons container -->
                            <div class="flex flex-row space-x-2">
                                <!-- Book Tickets Button -->
                                <button class="bg-white text-black font-bold px-4 py-2 rounded hover:bg-blue-600 hover:text-white transition duration-300">
                                    Book Tickets
                                </button>

                                <!-- Watch Trailer Button -->
                                <button class="bg-transparent text-white border border-white px-4 py-2 rounded hover:bg-blue-600 hover:text-white transition duration-300">
                                    Watch Trailer
                                </button>
                            </div>
                        </div>
                    </div>
                </swiper-slide>

                <!-- AutoPlay progress container -->
                <div class="autoplay-progress absolute bottom-4 right-4 z-10 w-12 h-12 flex items-center justify-center font-bold text-current" slot="container-end">
                    <svg class="absolute inset-0 w-full h-full" viewBox="0 0 48 48">
                    <circle cx="24" cy="24" r="20" class="stroke-current" style="--progress: 0; stroke-width: 4px; fill: none; stroke-dasharray: 125.6; stroke-dashoffset: calc(125.6 * (1 - var(--progress))); transform: rotate(-90deg);" />
                    </svg>
                    <span></span>
                </div>
            </swiper-container>
        </section>

        <hr class="w-11/12 h-0.5 bg-gray-700 mx-auto">

        <!--Now Showing Section-->
        <section class="bg-black text-white mt-6">

            <div class="p-4 flex items-center justify-between rounded-lg shadow-md">
                <!-- Title Section -->
                <div class=" py-4 px-6 rounded-lg shadow-lg">
                    <h2 class="text-3xl text-white font-bold text-center">Now Showing</h2>
                </div>
                <!-- Button Group -->
                <div class="flex space-x-4">
                    <button class="px-4 py-2 bg-white text-black font-semibold rounded-lg shadow-md hover:bg-gray-600 hover:text-white transition duration-300">
                        GENRE
                        <i class='bx bx-chevron-down'></i>
                    </button>
                    <button class="px-4 py-2 bg-white text-black font-semibold rounded-lg shadow-md hover:bg-gray-600 hover:text-white transition duration-300">
                        FORMAT
                        <i class='bx bx-chevron-down'></i>
                    </button>
                    <button class="px-4 py-2 bg-white text-black font-semibold rounded-lg shadow-md hover:bg-gray-600 hover:text-white transition duration-300">
                        LANGUAGE
                        <i class='bx bx-chevron-down'></i>
                    </button>
                </div>
            </div>

            <div class="bg-black container mx-auto grid grid-cols-3 md:grid-cols-3 gap-4 p-4">
                <!-- Large Card -->
                <div class="col-span-2 row-span-2 bg-gray-800 rounded-lg relative h-64 md:h-full shadow-lg hover:scale-105 transition-transform duration-300">
                    <img src="./assets/img/img 1.jpg" alt="Movie" class="w-full h-full object-cover rounded-lg opacity-80 hover:opacity-90 transition-opacity duration-300">
                    <div class="absolute bottom-4 left-4 text-white">
                        <h4 class="text-3xl font-bold">Movie Name</h4>
                        <h2 class="text-md font-bold mb-2">English . Action</h2>

                        <button class="bg-white text-black font-bold px-4 py-2 rounded hover:bg-gray-600 hover:text-white transition duration-300">
                            Book Tickets
                        </button>
                        <button class="bg-transparent text-white border border-white px-4 py-2 rounded hover:bg-gray-600 hover:text-white transition duration-300">
                            Watch Trailer
                        </button>
                    </div>
                </div>

                <!-- Smaller Cards -->
                <div class="bg-gray-800 rounded-lg relative h-32 md:h-48 shadow-lg hover:scale-105 transition-transform duration-300">
                    <img src="./assets/img/img-4.jpg" alt="Movie" class="w-full h-full object-cover rounded-lg opacity-80 hover:opacity-90 transition-opacity duration-300">
                    <div class="absolute bottom-4 left-4 text-white">
                        <h4 class="text-2xl font-bold">Movie Name</h4>
                        <h2 class="text-md font-bold mb-2">English . Action</h2>

                        <button class="bg-white text-black font-bold px-4 py-2 rounded hover:bg-gray-600 hover:text-white transition duration-300">
                            Book Tickets
                        </button>
                        <button class="bg-transparent text-white border border-white px-4 py-2 rounded hover:bg-gray-600 hover:text-white transition duration-300">
                            Watch Trailer
                        </button>
                    </div>
                </div>

                <div class="bg-gray-800 rounded-lg relative h-32 md:h-48 shadow-lg hover:scale-105 transition-transform duration-300">
                    <img src="./assets/img/img-2.jpg" alt="Movie" class="w-full h-full object-cover rounded-lg opacity-80 hover:opacity-90 transition-opacity duration-300">
                    <div class="absolute bottom-4 left-4 text-white">
                        <h4 class="text-2xl font-bold">Movie Name</h4>
                        <h2 class="text-md font-bold mb-2">English . Action</h2>

                        <button class="bg-white text-black font-bold px-4 py-2 rounded hover:bg-gray-600 hover:text-white transition duration-300">
                            Book Tickets
                        </button>
                        <button class="bg-transparent text-white border border-white px-4 py-2 rounded hover:bg-gray-600 hover:text-white transition duration-300">
                            Watch Trailer
                        </button>
                    </div>
                </div>

                <!-- New Smaller Boxes -->
                <div class="bg-gray-800 rounded-lg relative h-32 md:h-48 shadow-lg hover:scale-105 transition-transform duration-300">
                    <img src="./assets/img/img-5.jpg" alt="Movie" class="w-full h-full object-cover rounded-lg opacity-80 hover:opacity-90 transition-opacity duration-300">
                    <div class="absolute bottom-4 left-4 text-white">
                        <h4 class="text-2xl font-bold">Movie Name</h4>
                        <h2 class="text-md font-bold mb-2">English . Action</h2>

                        <button class="bg-white text-black font-bold px-4 py-2 rounded hover:bg-gray-600 hover:text-white transition duration-300">
                            Book Tickets
                        </button>
                        <button class="bg-transparent text-white border border-white px-4 py-2 rounded hover:bg-gray-600 hover:text-white transition duration-300">
                            Watch Trailer
                        </button>
                    </div>
                </div>

                <div class="bg-gray-800 rounded-lg relative h-32 md:h-48 shadow-lg hover:scale-105 transition-transform duration-300">
                    <img src="./assets/img/img-6.jpg" alt="Movie" class="w-full h-full object-cover rounded-lg opacity-80 hover:opacity-90 transition-opacity duration-300">
                    <div class="absolute bottom-4 left-4 text-white">
                        <h4 class="text-2xl font-bold">Movie Name</h4>
                        <h2 class="text-md font-bold mb-2">English . Action</h2>

                        <button class="bg-white text-black font-bold px-4 py-2 rounded hover:bg-gray-600 hover:text-white transition duration-300">
                            Book Tickets
                        </button>
                        <button class="bg-transparent text-white border border-white px-4 py-2 rounded hover:bg-gray-600 hover:text-white transition duration-300">
                            Watch Trailer
                        </button>
                    </div>
                </div>

                <div class="bg-gray-800 rounded-lg relative h-32 md:h-48 shadow-lg hover:scale-105 transition-transform duration-300">
                    <img src="./assets/img/img-7.jpg" alt="Movie" class="w-full h-full object-cover rounded-lg opacity-80 hover:opacity-90 transition-opacity duration-300">
                    <div class="absolute bottom-4 left-4 text-white">
                        <h4 class="text-2xl font-bold">Movie Name</h4>
                        <h2 class="text-md font-bold mb-2">English . Action</h2>

                        <button class="bg-white text-black font-bold px-4 py-2 rounded hover:bg-gray-600 hover:text-white transition duration-300">
                            Book Tickets
                        </button>
                        <button class="bg-transparent text-white border border-white px-4 py-2 rounded hover:bg-gray-600 hover:text-white transition duration-300">
                            Watch Trailer
                        </button>
                    </div>
                </div>
            </div>

        </section>

        <!--Coming Soon Section--> 
        <section class="bg-black text-white mt-6 mb-10">

            <div class="p-4 flex items-center justify-between rounded-lg shadow-md">
                <!-- Title Section -->
                <div class=" py-4 px-6 rounded-lg shadow-lg">
                    <h2 class="text-3xl text-white font-bold text-center">Coming Soon...</h2>
                </div>
            </div>

            <div class="bg-black container mx-auto grid grid-cols-3 md:grid-cols-3 gap-4 p-4">
                <!-- Large Card -->
                <div class="col-span-2 row-span-2 bg-gray-800 rounded-lg relative h-64 md:h-full shadow-lg hover:scale-105 transition-transform duration-300">
                    <img src="./assets/img/img 1.jpg" alt="Movie" class="w-full h-full object-cover rounded-lg opacity-80 hover:opacity-90 transition-opacity duration-300">
                    <div class="absolute bottom-4 left-4 text-white">
                        <h4 class="text-3xl font-bold">Movie Name</h4>
                        <h2 class="text-md font-bold mb-2">English . Action</h2>

                        <button class="bg-white text-black font-bold px-4 py-2 rounded hover:bg-gray-600 hover:text-white transition duration-300">
                            Show Info
                        </button>
                        <button class="bg-transparent text-white border border-white px-4 py-2 rounded hover:bg-gray-600 hover:text-white transition duration-300">
                            Watch Trailer
                        </button>
                    </div>
                </div>

                <!-- Smaller Cards -->
                <div class="bg-gray-800 rounded-lg relative h-32 md:h-48 shadow-lg hover:scale-105 transition-transform duration-300">
                    <img src="./assets/img/img-4.jpg" alt="Movie" class="w-full h-full object-cover rounded-lg opacity-80 hover:opacity-90 transition-opacity duration-300">
                    <div class="absolute bottom-4 left-4 text-white">
                        <h4 class="text-2xl font-bold">Movie Name</h4>
                        <h2 class="text-md font-bold mb-2">English . Action</h2>

                        <button class="bg-white text-black font-bold px-4 py-2 rounded hover:bg-gray-600 hover:text-white transition duration-300">
                            Book Tickets
                        </button>
                        <button class="bg-transparent text-white border border-white px-4 py-2 rounded hover:bg-gray-600 hover:text-white transition duration-300">
                            Watch Trailer
                        </button>
                    </div>
                </div>

                <div class="bg-gray-800 rounded-lg relative h-32 md:h-48 shadow-lg hover:scale-105 transition-transform duration-300">
                    <img src="./assets/img/img-2.jpg" alt="Movie" class="w-full h-full object-cover rounded-lg opacity-80 hover:opacity-90 transition-opacity duration-300">
                    <div class="absolute bottom-4 left-4 text-white">
                        <h4 class="text-2xl font-bold">Movie Name</h4>
                        <h2 class="text-md font-bold mb-2">English . Action</h2>

                        <button class="bg-white text-black font-bold px-4 py-2 rounded hover:bg-gray-600 hover:text-white transition duration-300">
                            Book Tickets
                        </button>
                        <button class="bg-transparent text-white border border-white px-4 py-2 rounded hover:bg-gray-600 hover:text-white transition duration-300">
                            Watch Trailer
                        </button>
                    </div>
                </div>

                <!-- New Smaller Boxes -->
                <div class="bg-gray-800 rounded-lg relative h-32 md:h-48 shadow-lg hover:scale-105 transition-transform duration-300">
                    <img src="./assets/img/img-5.jpg" alt="Movie" class="w-full h-full object-cover rounded-lg opacity-80 hover:opacity-90 transition-opacity duration-300">
                    <div class="absolute bottom-4 left-4 text-white">
                        <h4 class="text-2xl font-bold">Movie Name</h4>
                        <h2 class="text-md font-bold mb-2">English . Action</h2>

                        <button class="bg-white text-black font-bold px-4 py-2 rounded hover:bg-gray-600 hover:text-white transition duration-300">
                            Book Tickets
                        </button>
                        <button class="bg-transparent text-white border border-white px-4 py-2 rounded hover:bg-gray-600 hover:text-white transition duration-300">
                            Watch Trailer
                        </button>
                    </div>
                </div>

                <div class="bg-gray-800 rounded-lg relative h-32 md:h-48 shadow-lg hover:scale-105 transition-transform duration-300">
                    <img src="./assets/img/img-6.jpg" alt="Movie" class="w-full h-full object-cover rounded-lg opacity-80 hover:opacity-90 transition-opacity duration-300">
                    <div class="absolute bottom-4 left-4 text-white">
                        <h4 class="text-2xl font-bold">Movie Name</h4>
                        <h2 class="text-md font-bold mb-2">English . Action</h2>

                        <button class="bg-white text-black font-bold px-4 py-2 rounded hover:bg-gray-600 hover:text-white transition duration-300">
                            Book Tickets
                        </button>
                        <button class="bg-transparent text-white border border-white px-4 py-2 rounded hover:bg-gray-600 hover:text-white transition duration-300">
                            Watch Trailer
                        </button>
                    </div>
                </div>

                <div class="bg-gray-800 rounded-lg relative h-32 md:h-48 shadow-lg hover:scale-105 transition-transform duration-300">
                    <img src="./assets/img/img-7.jpg" alt="Movie" class="w-full h-full object-cover rounded-lg opacity-80 hover:opacity-90 transition-opacity duration-300">
                    <div class="absolute bottom-4 left-4 text-white">
                        <h4 class="text-2xl font-bold">Movie Name</h4>
                        <h2 class="text-md font-bold mb-2">English . Action</h2>

                        <button class="bg-white text-black font-bold px-4 py-2 rounded hover:bg-gray-600 hover:text-white transition duration-300">
                            Book Tickets
                        </button>
                        <button class="bg-transparent text-white border border-white px-4 py-2 rounded hover:bg-gray-600 hover:text-white transition duration-300">
                            Watch Trailer
                        </button>
                    </div>
                </div>
            </div>

        </section>

        <%@include file="./components/footer.jsp" %>

        <!-- JavaScript for Carousels -->
        <script src="./js/carousel.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-element-bundle.min.js"></script>

    </body>
</html>

