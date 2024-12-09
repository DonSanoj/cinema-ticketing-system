<%-- 
    Document   : aboutUs
    Created on : Nov 25, 2024, 4:30:26 PM
    Author     : Pamith
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="icon" href="./assets/img/logo_white.png" type="image/x-icon">
        <title>ABC Cinema | About Us</title>

        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">

        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />

    </head>

    <body class="bg-gray-100">

        <%@include file="./components/header.jsp" %>

        <section class="bg-white py-16 px-8">
            <div class="container mx-auto flex flex-col md:flex-row items-center">
                <div class="md:w-1/2 space-y-4 pr-6">
                    <h2 class="text-4xl font-bold text-gray-900 mb-4">Our Story</h2>
                    <p class="leading-relaxed">
                        Launched in 2015, ABC Cinema is South Asia’s premier online film ticket booking
                        platform, with a strong presence across the region. Supported by a comprehensive range
                        of tailored marketing, data insights, and customer-focused solutions, ABC Cinema
                        partners with over 500 theaters and serves millions of moviegoers nationwide.
                    </p>
                    <p class="leading-relaxed">
                        With more than 1,000 movies screened every month and new releases added regularly, ABC
                        Cinema is dedicated to offering a seamless and diverse booking experience. We cater to a
                        wide range of cinema preferences, providing everything from blockbuster films to
                        independent movies, ensuring an exceptional cinematic experience for all.
                    </p>
                </div>
                <div class="md:w-1/2 mt-8 md:mt-0">
                    <img src="./assets/img/aboutMainImg.png" alt="Cinema Image" class="rounded-lg shadow-lg">
                </div>
            </div>
        </section>

        <section class="grid grid-cols-4 gap-4 p-8 bg-gray-100">
            <div
                class="p-6 text-center bg-white shadow-md border transition duration-300 ease-in-out hover:bg-black hover:text-white">
                <div class="flex justify-center mb-4">
                    <span
                        class="text-3xl bg-gray-200 p-3 rounded-full hover:bg-white hover:text-black transition duration-300 ease-in-out">
                        <img src="./assets/img/aboutIcon1.png" alt=""> 
                    </span>
                </div>
                <p class="text-2xl font-bold">5.3k</p>
                <p>Movies listed on our platform</p>
            </div>
            <div
                class="p-6 text-center bg-white shadow-md border transition duration-300 ease-in-out hover:bg-black hover:text-white">
                <div class="flex justify-center mb-4">
                    <span
                        class="text-3xl bg-gray-200 p-3 rounded-full hover:bg-white hover:text-black transition duration-300 ease-in-out">
                        <img src="./assets/img/aboutIcon2.png" alt=""> 
                    </span>
                </div>
                <p class="text-2xl font-bold">50k</p>
                <p>Tickets booked monthly</p>
            </div>
            <div
                class="p-6 text-center bg-white shadow-md border transition duration-300 ease-in-out hover:bg-black hover:text-white">
                <div class="flex justify-center mb-4">
                    <span
                        class="text-3xl bg-gray-200 p-3 rounded-full hover:bg-white hover:text-black transition duration-300 ease-in-out">
                        <img src="./assets/img/aboutIcon3.png" alt="">
                    </span>
                </div>
                <p class="text-2xl font-bold">70.5k</p>
                <p>Users active on our platform</p>
            </div>
            <div
                class="p-6 text-center bg-white shadow-md border transition duration-300 ease-in-out hover:bg-black hover:text-white">
                <div class="flex justify-center mb-4">
                    <span
                        class="text-3xl bg-gray-200 p-3 rounded-full hover:bg-white hover:text-black transition duration-300 ease-in-out">
                        <img src="./assets/img/aboutIcon4.png" alt="">
                    </span>
                </div>
                <p class="text-2xl font-bold">300k</p>
                <p>Annual gross ticket sales</p>
            </div>
        </section>

       <section class="bg-white py-16">
            <div class="container mx-auto text-center">
                <h2 class="text-3xl font-bold mb-8">Meet Our Team</h2>
                <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                    <div>
                        <img src="./assets/img/Frame 874.png" alt="Tom Cruise" class="rounded-full mx-auto shadow-lg">
                        <h3 class="text-xl font-bold mt-4">Tom Cruise</h3>
                        <p>Founder & Chairman</p>
                        <div class="flex justify-center space-x-4 mt-2">
                            <a href="https://www.instagram.com/pamith__?igsh=bTUwbmoyeHhob3gz&utm_source=qr " class="text-gray-600"><img src="./assets/img/icon-instagram.png" alt=""><i class="fab fa-twitter"></i></a>
                            <a href="#" class="text-gray-600"><i class="fab fa-instagram"></i><img src="./assets/img/Icon-Linkedin.png" alt=""></a>
                            <a href="#" class="text-gray-600"><i class="fab fa-linkedin"></i><img src="./assets/img/Icon-Twitter.png" alt=""></a>
                        </div>
                    </div>
                    <div>
                        <img src="./assets/img/Frame 875.png" alt="Emma Watson" class="rounded-full mx-auto shadow-lg">
                        <h3 class="text-xl font-bold mt-4">Emma Watson</h3>
                        <p>Managing Director</p>
                        <div class="flex justify-center space-x-4 mt-2">
                            <a href="https://www.instagram.com/pamith__?igsh=bTUwbmoyeHhob3gz&utm_source=qr " class="text-gray-600"><img src="./assets/img/icon-instagram.png" alt=""><i class="fab fa-twitter"></i></a>
                            <a href="#" class="text-gray-600"><i class="fab fa-instagram"></i><img src="./assets/img/Icon-Linkedin.png" alt=""></a>
                            <a href="#" class="text-gray-600"><i class="fab fa-linkedin"></i><img src="./assets/img/Icon-Twitter.png" alt=""></a>
                        </div>
                    </div>
                    <div>
                        <img src="./assets/img/Frame 876.png" alt="Will Smith" class="rounded-full mx-auto shadow-lg">
                        <h3 class="text-xl font-bold mt-4">Will Smith</h3>
                        <p>Product Designer</p>
                        <div class="flex justify-center space-x-4 mt-2">
                            <a href="https://www.instagram.com/pamith__?igsh=bTUwbmoyeHhob3gz&utm_source=qr " class="text-gray-600"><img src="./assets/img/icon-instagram.png" alt=""><i class="fab fa-twitter"></i></a>
                            <a href="#" class="text-gray-600"><i class="fab fa-instagram"></i><img src="./assets/img/Icon-Linkedin.png" alt=""></a>
                            <a href="#" class="text-gray-600"><i class="fab fa-linkedin"></i><img src="./assets/img/Icon-Twitter.png" alt=""></a>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <%@include file="./components/footer.jsp" %>

    </body>

    <script src="./js/searchResult.js"></script>
    <script src="./js/footer.js"></script>

</html>

