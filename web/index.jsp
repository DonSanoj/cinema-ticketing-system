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

            <div class="bg-black py-12 container mx-auto grid grid-cols-3 md:grid-cols-3 gap-4 p-4">
                <!--Large Card--> 
                <div class="col-span-2 row-span-2 bg-gray-800 rounded-lg relative h-64 md:h-full shadow-lg hover:scale-105 transition-transform duration-300">
                    <img src="./assets/img/img 1.jpg" alt="Movie" class="w-full h-full object-cover rounded-lg opacity-80 hover:opacity-90 transition-opacity duration-300">
                    <div class="absolute bottom-4 left-4 text-white">
                        <h4 class="text-3xl font-bold">Movie Name</h4>
                        <h2 class="text-md front-bold mb-2">English . Action</h2>

                        <button class="bg-white text-black font-bold px-4 py-2 rounded hover:bg-gray-600 hover:text-white transition duration-300">
                            Book Tickets
                        </button>
                        <button class="bg-transparent text-white border border-white px-4 py-2 rounded hover:bg-gray-600 hover:text-white transition duration-300">
                            Watch Trailer
                        </button>
                    </div>
                </div>

                <!--Smaller Cards--> 
                <div class="bg-gray-800 rounded-lg relative h-32 md:h-48 shadow-lg hover:scale-105 transition-transform duration-300">
                    <img src="./assets/img/img-4.jpg" alt="Movie" class="w-full h-full object-cover rounded-lg opacity-80 hover:opacity-90 transition-opacity duration-300">
                    <div class="absolute bottom-4 left-4 text-white">
                        <h4 class="text-2xl font-bold">Movie Name</h4>
                        <h2 class="text-md front-bold mb-2">English . Action</h2>

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
                        <h2 class="text-md front-bold mb-2">English . Action</h2>

                        <button class="bg-white text-black font-bold px-4 py-2 rounded hover:bg-gray-600 hover:text-white transition duration-300">
                            Book Tickets
                        </button>
                        <button class="bg-transparent text-white border border-white px-4 py-2 rounded hover:bg-gray-600 hover:text-white transition duration-300">
                            Watch Trailer
                        </button>
                    </div>
                </div>          
            </div>

            <div class="bg-black py-12 container mx-auto grid grid-cols-3 md:grid-cols-3 gap-4 p-4 bg-red-500">
                <!--Smaller Cards--> 
                <div class="bg-gray-800 rounded-lg relative h-32 md:h-48 shadow-lg hover:scale-105 transition-transform duration-300">
                    <img src="./assets/img/img-4.jpg" alt="Movie" class="w-full h-full object-cover rounded-lg opacity-80 hover:opacity-90 transition-opacity duration-300">
                    <div class="absolute bottom-4 left-4 text-white">
                        <h4 class="text-2xl font-bold">Movie Name</h4>
                        <h2 class="text-md front-bold mb-2">English . Action</h2>

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
                        <h2 class="text-md front-bold mb-2">English . Action</h2>

                        <button class="bg-white text-black font-bold px-4 py-2 rounded hover:bg-gray-600 hover:text-white transition duration-300">
                            Book Tickets
                        </button>
                        <button class="bg-transparent text-white border border-white px-4 py-2 rounded hover:bg-gray-600 hover:text-white transition duration-300">
                            Watch Trailer
                        </button>
                    </div>
                </div>
                
                <!--Large Card--> 
                <div class="col-span-2 row-span-2 bg-gray-800 rounded-lg relative h-64 md:h-full shadow-lg hover:scale-105 transition-transform duration-300">
                    <img src="./assets/img/img 1.jpg" alt="Movie" class="w-full h-full object-cover rounded-lg opacity-80 hover:opacity-90 transition-opacity duration-300">
                    <div class="absolute bottom-4 left-4 text-white">
                        <h4 class="text-3xl font-bold">Movie Name</h4>
                        <h2 class="text-md front-bold mb-2">English . Action</h2>

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
        <section class=" bg-white container mx-auto py-12 text-center text-black">
            <h2 class="text-3xl font-bold text-black mb-6">COMING SOON</h2>

            <!--Coming Soon Slider--> 
            <div class="relative overflow-hidden">
                <div id="comingSoonSlider" class="flex transition-transform duration-500 ease-in-out">
                    <!--Movie Cards--> 
                    <!--Slide 1--> 
                    <div class="min-w-full md:min-w-1/5   items-center bg-white p-4 rounded-lg mx-2">
                        <img src="./assets/img/img6.jpg" alt="Moana 2" class="w-full h-64 object-cover rounded-lg mb-4">
                        <h3 class="text-xl font-bold">MOANA 2</h3>
                        <p class="text-sm text-gray-400">IN CINEMAS 29TH NOVEMBER</p>
                        <div class="flex mt-2 space-x-4">
                            <button class="flex items-center space-x-1 text-sm">
                                <span class="material-icons">play_circle</span>
                                <span>WATCH TRAILER</span>
                            </button>
                            <button class="flex items-center space-x-1 text-sm">
                                <span class="material-icons">info</span>
                                <span>MORE INFO</span>
                            </button>
                        </div>
                    </div>


                    <div class="min-w-full md:min-w-1/5   items-center bg-white p-4 rounded-lg mx-2">
                        <img src="./assets/img/img7.jpg" alt="Moana 2" class="w-full h-64 object-cover rounded-lg mb-4">
                        <h3 class=" bg-white text-xl font-bold">MOANA 2</h3>
                        <p class=" bg-white text-sm text-gray-400">IN CINEMAS 29TH NOVEMBER</p>
                        <div class=" bg-white flex mt-2 space-x-4">
                            <button class="flex items-center space-x-1 text-sm">
                                <span class="material-icons">play_circle</span>
                                <span>WATCH TRAILER</span>
                            </button>
                            <button class="flex items-center space-x-1 text-sm">
                                <span class="bg-black material-icons">info</span>
                                <span>MORE INFO</span>
                            </button>
                        </div>
                    </div>


                    <div class="min-w-full md:min-w-1/5   items-center bg-white p-4 rounded-lg mx-2">
                        <img src="./assets/img/img8.jpg" alt="Moana 2" class="w-full h-64 object-cover rounded-lg mb-4">
                        <h3 class="text-xl font-bold">MOANA 2</h3>
                        <p class="text-sm text-gray-400">IN CINEMAS 29TH NOVEMBER</p>
                        <div class="flex mt-2 space-x-4">
                            <button class="flex items-center space-x-1 text-sm">
                                <span class="bg-black material-icons">play_circle</span>
                                <span>WATCH TRAILER</span>
                            </button>
                            <button class="flex items-center space-x-1 text-sm">
                                <span class=" bg-black material-icons">info</span>
                                <span>MORE INFO</span>
                            </button>
                        </div>
                    </div>


                    <div class="min-w-full md:min-w-1/5   items-center bg-white p-4 rounded-lg mx-2">
                        <img src="./assets/img/img9.jpg" alt="Moana 2" class="w-full h-64 object-cover rounded-lg mb-4">
                        <h3 class="text-xl font-bold">MOANA 2</h3>
                        <p class="text-sm text-gray-400">IN CINEMAS 29TH NOVEMBER</p>
                        <div class="flex mt-2 space-x-4">
                            <button class="flex items-center space-x-1 text-sm">
                                <span class="bg-black material-icons">play_circle</span>
                                <span>WATCH TRAILER</span>
                            </button>
                            <button class="flex items-center space-x-1 text-sm">
                                <span class="bg-black material-icons">info</span>
                                <span>MORE INFO</span>
                            </button>
                        </div>
                    </div>

                    <!--Additional Slides--> 
                    <!--Add additional slides similarly for the remaining movies--> 
                </div>

                <!--Coming Soon Slider Controls--> 
                <button id="comingSoonPrev" class="absolute left-0 top-1/2 transform -translate-y-1/2 bg-gray-700 bg-opacity-60 hover:bg-opacity-80 text-white rounded-full p-3 shadow-lg transition-transform duration-200 hover:scale-110">
                    <span class="material-icons">chevron_left</span>
                </button>
                <button id="comingSoonNext" class="absolute right-0 top-1/2 transform -translate-y-1/2 bg-gray-700 bg-opacity-60 hover:bg-opacity-80 text-white rounded-full p-3 shadow-lg transition-transform duration-200 hover:scale-110">
                    <span class=" material-icons">chevron_right</span>
                </button>
            </div>
        </section>
    </section>

    <!-- JavaScript for Carousels -->
    <script src="./js/carousel.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-element-bundle.min.js"></script>

</body>
</html>

