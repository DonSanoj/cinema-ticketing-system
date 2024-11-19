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
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css" />
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css" />
    </head>
    <body>

        <%@include file="./components/header.jsp" %>

        <div class=" flex items-center justify-center min-h-screen px-4 sm:px-6 lg:px-8 bg-[#eee]">

            <div class="flex flex-col md:flex-row bg-white shadow-lg rounded-xl w-full max-w-4xl overflow-hidden">
                <!-- Left Panel -->
                <div class="bg-black text-white p-4 md:w-1/2 flex flex-col items-center justify-center">
                    <h1 class="text-2xl md:text-3xl mb-4 text-center">Book. Watch. Enjoy!</h1>
                    <p class="text-base md:text-lg mb-6 text-center">Reserve your seats in <br> just a few clicks.</p>
                    <img src= "./assets/img/registerImg.png" alt="ABC Cinema Logo" class="w-48 md:w-64 mb-4">
                </div>

                <!-- Right Panel (Login Form) -->
                <div class="p-8 md:w-1/2 bg-white text-black flex flex-col rounded-br-lg rounded-bl-lg md:rounded-tr-lg md:rounded-br-lg">
                    <div class="text-right text-sm mb-4">
                        <p>Don't have an account? <a href="login.jsp" class="text-gray-400 hover:underline hover:text-blue-500">Login now.</a></p>
                    </div>
                    <h2 class="text-2xl font-semibold mb-6 text-center md:text-left">Create an Account</h2>

                    <form class="space-y-4" action="register" method="post">
                        <div>
                            <label for="email" class="block text-sm text-black mb-1.5"> 
                                <strong class="text-red-500">*</strong> Email Address
                            </label>
                            <input 
                                type="text" 
                                id="email" 
                                name="email" 
                                required 
                                class="w-full h-9 p-2.5 bg-zinc-800 text-black rounded-lg border border-zinc-500 focus:outline-none focus:ring-1 focus:ring-white"
                                >
                        </div>

                        <div>
                            <label for="username" class="block text-sm text-black mb-1.5">
                                <strong class="text-red-500">*</strong> User Name
                            </label>
                            <input 
                                type="text" 
                                id="username" 
                                name="username" 
                                required 
                                class="w-full h-9 p-2.5 bg-zinc-800 text-blacak rounded-lg border border-zinc-500 focus:outline-none focus:ring-1 focus:ring-white"
                                >
                        </div>

                        <div>
                            <label for="phoneNumber" class="block text-sm text-black mb-1.5">
                                <strong class="text-red-500">*</strong> Phone Number
                            </label>
                            <input 
                                type="text" 
                                id="phoneNumber" 
                                name="phoneNumber" 
                                required 
                                class="w-full h-9 p-2.5 bg-zinc-800 text-black rounded-lg border border-zinc-500 focus:outline-none focus:ring-1 focus:ring-white"
                                >
                        </div>

                        <div>
                            <label for="password" class="block text-sm text-black mb-1.5">
                                <strong class="text-red-500">*</strong> Password
                            </label>
                            <input
                                type="password" 
                                id="password"
                                name="password"
                                required 
                                class="w-full h-9 p-2.5 bg-zinc-800 text-black rounded-lg border border-zinc-500 focus:outline-none focus:ring-1 focus:ring-white"
                                >
                        </div>

                        <div>
                            <label for="cpassword" class="block text-sm text-black mb-1.5">
                                <strong class="text-red-500">*</strong> Confirm Password
                            </label>
                            <input 
                                type="password" 
                                id="cpassword" 
                                name="cpassword"
                                required 
                                class="w-full h-9 p-2.5 bg-zinc-800 text-black rounded-lg border border-zinc-500 focus:outline-none focus:ring-1 focus:ring-white"
                                >
                        </div>

                        <button 
                            type="submit" 
                            class="w-56 p-3 bg-black text-sm text-white hover:bg-blue-500 h-11 rounded-3xl items-center focus:outline-none font-semibold"
                            >
                            Register Now
                        </button>
                    </form>

                    <p class="text-sm text-center text-black mt-4">Already have an account? <a href="login.jsp" class="text-gray-400 hover:underline hover:text-blue-500">Login now.</a></p>
                </div>
            </div>
        </div>

        <%@include file="./components/footer.jsp" %>

        <script src="./js/register.js"></script>
        <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>

        <script>
            alertify.set('notifier', 'position', 'top-center');
            <% if (request.getAttribute("errorMessage") != null) {%>
            alertify.error("<%= request.getAttribute("errorMessage")%>");
            <% }%>
        </script>
    </body>
</html>
