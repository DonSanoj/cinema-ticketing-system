<%-- 
    Document   : register
    Created on : 14 Nov 2024, 17:26:01
    Author     : Local
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="icon" href="./assets/img/logo.png" type="image/x-icon">
        <title>ABC Cinema | Register</title>

        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    </head>
    <body>
        <div class=" flex items-center justify-center min-h-screen px-4 sm:px-6 lg:px-8">
            <div class=" w-3/5 flex flex-col md:flex-row bg-white shadow-lg rounded-lg w-full max-w-4xl overflow-hidden">
                <!-- Left Panel -->
                <div class="bg-white text-black p-4 md:w-1/3 flex flex-col items-center justify-center">
                    <h1 class="text-2xl md:text-3xl mb-4 text-center">Book. Watch. Enjoy!</h1>
                    <p class="text-base md:text-lg mb-6 text-center">Reserve your seats in just a few clicks.</p>
                    <img src="1 56.png" alt="ABC Cinema Logo" class="w-48 md:w-64 mb-4">
                </div>

                <!-- Right Panel (Login Form) -->
                <div class="p-8 md:w-2/3 bg-black text-white flex flex-col rounded-br-lg rounded-bl-lg md:rounded-tr-lg md:rounded-br-lg">
                    <div class="text-right text-sm mb-4">
                        <p>Already have an account? <a href="index.html" class="text-gray-400 hover:text-gray-300">Login Now</a></p>
                    </div>
                    <h2 class="text-2xl font-semibold mb-6 text-center md:text-left">Welcome Back!</h2> 
                </div>
            </div>
        </div>
    </body>
</html>
