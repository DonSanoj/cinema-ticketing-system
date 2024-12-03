<%-- 
    Document   : contactUs
    Created on : Nov 13, 2024, 6:47:31 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ABC Cinema | Contact Us</title>

        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    </head>

    <body class="bg-gray-100">

        <%@include file="./components/header.jsp" %>

        <section class="bg-[#eee] p-4">
            <div>
                <img src="./assets/img/contactUsImg.jpg" alt="Contact Image" class="w-full h-64 object-cover rounded-lg">
            </div>
        </section>

        <section class=" mx-auto p-6 bg-[#eee] shadow-md rounded-md flex flex-col lg:flex-row items-center">

            <div class="lg:w-1/2 px-6 mb-6 lg:mb-0">
                <h2 class="text-3xl font-bold text-gray-900 mb-4">Let's talk with us</h2>
                <p class="text-gray-600 mb-6">Questions, comments, or suggestions? Simply fill in the form and we’ll be in
                    touch shortly.</p>
                <div class="flex items-start mb-4">
                    <span class="text-purple-500 mr-2">📍</span>
                    <p class="text-gray-800">Colombo, Sri Lanka</p>
                </div>
                <div class="flex items-start mb-4">
                    <span class="text-purple-500 mr-2">📞</span>
                    <p class="text-gray-800">+9432-2232012</p>
                </div>
                <div class="flex items-start">
                    <span class="text-purple-500 mr-2">📧</span>
                    <p class="text-gray-800">
                        <a href="mailto:abccinema@gmail.com"
                           class="hover:underline hover:text-blue-500 transition duration-300">
                            abccinema@gmail.com
                        </a>
                    </p>
                </div>

            </div>

            <!-- Contact Form -->
            <div class="lg:w-1/2 px-6">
                <form action="" method="post" class="bg-white p-6 rounded-lg shadow-md">
                    <div class="flex flex-wrap -mx-2 mb-4">
                        <div class="w-full md:w-1/2 px-2">
                            <label for="firstName" class="block text-sm font-medium text-gray-700"><strong class="text-red-500">*</strong> First Name</label>
                            <input type="text" id="firstName" name="firstName" required
                                   class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-black-500 focus:border-black-500 sm:text-sm">
                        </div>
                        <div class="w-full md:w-1/2 px-2">
                            <label for="lastName" class="block text-sm font-medium text-gray-700"><strong class="text-red-500">*</strong> Last Name</label>
                            <input type="text" id="lastName" name="lastName" required
                                   class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-black-500 focus:border-black-500 sm:text-sm">
                        </div>
                    </div>
                    <div class="mb-4">
                        <label for="email" class="block text-sm font-medium text-gray-700"><strong class="text-red-500">*</strong> Email</label>
                        <input type="email" id="email" name="email" required
                               class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-black-500 focus:border-black-500 sm:text-sm">
                    </div>
                    <div class="mb-4">
                        <label for="phoneNumber" class="block text-sm font-medium text-gray-700"><strong class="text-red-500">*</strong> Phone Number</label>
                        <input type="tel" id="phoneNumber" name="phoneNumber" required
                               class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-black-500 focus:border-black-500 sm:text-sm">
                    </div>
                    <div class="mb-6">
                        <label for="message" class="block text-sm font-medium text-gray-700"><strong class="text-red-500">*</strong> Your message...</label>
                        <textarea id="message" name="message" rows="4" required
                                  class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-black-500 focus:border-black-500 sm:text-sm"></textarea>
                    </div>
                    <div class="text-center">
                        <button type="submit"
                                class="w-full bg-black text-white font-semibold py-2 rounded-md hover:bg-blue-500">Send
                            Message</button>
                    </div>
                </form>
            </div>
        </section>

        <%@include file="./components/footer.jsp" %>

    </body>

    <script src="./js/searchResult.js"></script>
    <script src="./js/footer.js"></script>
</html>

