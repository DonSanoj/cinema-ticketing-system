<%-- 
    Document   : moviesession
    Created on : Dec 2, 2024, 8:03:00 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="icon" href="../assets/img/logo.png" type="image/x-icon">
        <title>ABC Cinema | Movie Session</title>

        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">

        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    </head>
    <body>

        <%@include file="../components/header.jsp" %>

        <section class="relative">
            <img src="../assets/img/img_1.jpg" alt="Vikings Banner" class="w-full h-64 object-cover">
            <div class="absolute inset-0 bg-black opacity-50 flex items-center justify-center">
                <h2 class="text-white text-4xl font-bold">VIKINGS</h2>
            </div>
        </section>

        <!-- Show Times -->
        <section class="container mx-auto px-4 py-10">
            <h3 class="text-2xl font-semibold mb-6">Show Times</h3>
            <div class="bg-black text-white flex justify-between items-center rounded-lg px-6 py-4">
                <button class="text-xl">&lt;</button>
                <div class="text-center">
                    <p class="text-lg font-bold">MON</p>
                    <p class="text-3xl font-bold">04</p>
                </div>
                <div class="text-center">
                    <p class="font-bold">Location</p>
                    <p>ABC One Galle Face Mall</p>
                </div>
                <div class="text-center">
                    <p class="font-bold">Show time</p>
                    <p>06:00 - 24:00</p>
                </div>
                <button class="text-xl">&gt;</button>
            </div>

            <!-- Cinema Hall List -->
            <div class="mt-6 space-y-6">
                <div class="bg-black text-white rounded-lg px-6 py-4">
                    <h4 class="font-bold">ABC One Galle Face Mall</h4>
                    <p class="mb-4">ABC CINEMA Hall</p>
                    <p class="text-sm">English - 3D</p>
                    <div class="mt-2 flex space-x-4">
                        <button class="bg-gray-800 hover:bg-gray-700 px-4 py-2 rounded">10:00 AM</button>
                        <button class="bg-gray-800 hover:bg-gray-700 px-4 py-2 rounded">7:00 AM</button>
                    </div>
                </div>
                <div class="bg-black text-white rounded-lg px-6 py-4">
                    <h4 class="font-bold">ABC One Galle Face Mall</h4>
                    <p class="mb-4">ABC CINEMA Hall</p>
                    <p class="text-sm">English - 3D</p>
                    <div class="mt-2 flex space-x-4">
                        <button class="bg-gray-800 hover:bg-gray-700 px-4 py-2 rounded">10:00 AM</button>
                        <button class="bg-gray-800 hover:bg-gray-700 px-4 py-2 rounded">7:00 AM</button>
                    </div>
                </div>
            </div>
        </section>

        <%@include file="../components/footer.jsp" %>

    </body>
</html>
