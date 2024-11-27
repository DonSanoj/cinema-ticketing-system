<%-- 
    Document   : aboutUs
    Created on : Nov 25, 2024, 4:30:26 PM
    Author     : Pamith
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <!--<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">-->
    </head>
    <body>

        <%@include file="./components/header.jsp" %>

        <section class="bg-white py-16">
            <div class="container mx-auto flex flex-col md:flex-row items-center">
                <div class="md:w-1/2 space-y-4 pr-6">
                    <h2 class="text-4xl font-bold text-gray-900 mb-4">Our Story</h2>
                    <p class="leading-relaxed">
                        Launched in 2015, ABC Cinema is South Asia’s premier online film ticket booking platform, with a strong presence across the region. Supported by a comprehensive range of tailored marketing, data insights, and customer-focused solutions, ABC Cinema partners with over 500 theaters and serves millions of moviegoers nationwide.
                    </p>
                    <p class="leading-relaxed">
                        With more than 1,000 movies screened every month and new releases added regularly, ABC Cinema is dedicated to offering a seamless and diverse booking experience. We cater to a wide range of cinema preferences, providing everything from blockbuster films to independent movies, ensuring an exceptional cinematic experience for all.
                    </p>
                </div>
                <div class="md:w-1/2 mt-8 md:mt-0">
                    <img src="./assets/img/Side Image.png" alt="Cinema Image" class="rounded-lg shadow-lg">
                </div>
            </div>
        </section>

        <!-- Key Metrics Section -->
        <section class="grid grid-cols-4 gap-4 p-8 bg-gray-100">
            <div class="p-6 text-center bg-white shadow-md border transition duration-300 ease-in-out hover:bg-black hover:text-white">
                <div class="flex justify-center mb-4">
                    <span class="text-3xl bg-gray-200 p-3 rounded-full hover:bg-white hover:text-black transition duration-300 ease-in-out">
                        <img src="./assets/img/Services.png" alt=""> <!-- Icon for Sellers -->
                    </span>
                </div>
                <p class="text-2xl font-bold">10.5k</p>
                <p>Sellers active on our site</p>
            </div>
            <div class="p-6 text-center bg-white shadow-md border transition duration-300 ease-in-out hover:bg-black hover:text-white">
                <div class="flex justify-center mb-4">
                    <span class="text-3xl bg-gray-200 p-3 rounded-full hover:bg-white hover:text-black transition duration-300 ease-in-out">
                        <img src="./assets/img/Services (1).png" alt=""> <!-- Icon for Product Sales -->
                    </span>
                </div>
                <p class="text-2xl font-bold">33k</p>
                <p>Monthly Product Sales</p>
            </div>
            <div class="p-6 text-center bg-white shadow-md border transition duration-300 ease-in-out hover:bg-black hover:text-white">
                <div class="flex justify-center mb-4">
                    <span class="text-3xl bg-gray-200 p-3 rounded-full hover:bg-white hover:text-black transition duration-300 ease-in-out">
                        <img src="./assets/img/Services (2).png" alt=""> <!-- Icon for Customers -->
                    </span>
                </div>
                <p class="text-2xl font-bold">45.5k</p>
                <p>Customers active on our site</p>
            </div>
            <div class="p-6 text-center bg-white shadow-md border transition duration-300 ease-in-out hover:bg-black hover:text-white">
                <div class="flex justify-center mb-4">
                    <span class="text-3xl bg-gray-200 p-3 rounded-full hover:bg-white hover:text-black transition duration-300 ease-in-out">
                        <img src="./assets/img/Services (3).png" alt=""> <!-- Icon for Annual Gross Sales -->
                    </span>
                </div>
                <p class="text-2xl font-bold">25k</p>
                <p>Annual Gross Sales</p>
            </div>
        </section>
        <!-- Team Section -->
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
</html>
