<%-- 
    Document   : movieDetails
    Created on : Nov 26, 2024, 5:14:30 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="icon" href="./assets/img/logo.png" type="image/x-icon">
        <title>ABC Cinema | Movie Detail</title>

        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    </head>
    <body>

        <section class="relative bg-black text-white">
            <img src="C:\Users\user\Desktop\New folder\Venome cinama 12.png" alt="Movie Banner"
                 class="w-full h-80 object-cover opacity-75">
            <div class="absolute inset-0 flex flex-col items-center justify-center space-y-2">
                <h2 class="text-4xl font-bold">VENOM: THE LAST DANCE</h2>
                <p class="text-sm">Now Showing at ABC Cinemas</p>
                <div class="space-x-4">
                    <button class="bg-purple-600 px-4 py-2 rounded">Trailer</button>
                    <button class="bg-purple-600 px-4 py-2 rounded">Get Ticket</button>
                </div>
            </div>
        </section>

        <main class="container mx-auto py-8 px-4">
            <!-- Now Showing Section -->
            <section class="py-6">
                <h3 class="text-xl font-semibold mb-2">Now Showing At</h3>
                <div class="flex space-x-4">
                    <div class="bg-gray-200 p-4 rounded-lg shadow text-center">ABC Cinemas Multiplex, Colombo City Centre
                    </div>
                    <div class="bg-gray-200 p-4 rounded-lg shadow text-center">ABC Cinemas Multiplex, Colombo City Centre
                    </div>
                    <div class="bg-gray-200 p-4 rounded-lg shadow text-center">ABC Cinemas Multiplex, Colombo City Centre
                    </div>
                    <div class="bg-gray-200 p-4 rounded-lg shadow text-center">ABC Cinemas Multiplex, Colombo City Centre
                    </div>
                    <div class="bg-gray-200 p-4 rounded-lg shadow text-center">ABC Cinemas Multiplex, Colombo City Centre
                    </div>
                </div>
            </section>
        </main>

    </body>
</html>
