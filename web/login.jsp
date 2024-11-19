<%-- 
    Document   : Login
    Created on : 15 Nov 2024, 14:14:30
    Author     : Local
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="./assets/img/logo.png" type="image/x-icon">
        <title> ABC Cinema | Login </title>

        <script src="https://cdn.tailwindcss.com"></script>  
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css" />
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css" />
    </head>
    <body>

        <%@include file="./components/header.jsp" %>

        <div class="flex items-center justify-center min-h-screen px-4 sm:px-6 lg:px-8">
            <div class="flex flex-col md:flex-row bg-white shadow-lg rounded-xl w-full max-w-4xl overflow-hidden">
                <!-- Left Panel -->
                <div class="bg-white text-black p-4 md:w-1/2 flex flex-col items-center justify-center">
                    <h1 class="text-2xl md:text-3xl mb-4 text-center">Cinema Awaits, <br>Reserve Your Seat</h1>
                    <p class="text-base md:text-lg mb-6 text-center">Pay online securely and quickly.</p>
                    <img src= "./assets/img/login.png" alt="ABC Cinema Logo" class="w-48 md:w-64 mb-4">
                </div>

                <!-- Right Panel (Login Form) -->
                <div class="p-8 md:w-1/2 bg-black text-white flex flex-col rounded-br-lg rounded-bl-lg md:rounded-tr-lg md:rounded-br-lg">
                    <div class="text-right text-sm mb-4">
                        <p>Don't have an account? <a href="register.jsp" class="text-gray-400 hover:text-blue-500 hover:underline">Sign up</a></p>
                    </div>
                    <h2 class="text-2xl font-semibold mb-6 text-center md:text-left">Welcome Back!</h2>

                    <button class="bg-white hover:bg-blue-500 hover:text-white flex items-center justify-center text-gray-800 py-3 px-4 text-base gap-2 rounded-3xl mb-5 w-full">
                        <img src="./assets/img/Social media logo.png" alt="Google Logo" class="w-5 h-5 mr-3">
                        Continue with Google
                    </button>

                    <div class="divider flex items-center justify-center my-6">
                        <span class="line bg-gray-300 h-px flex-1"></span>
                        <span class="text-gray-400 text-sm px-3">OR</span>
                        <span class="line bg-gray-300 h-px flex-1"></span>
                    </div>


                    <form class="space-y-4" action="login" method="post">
                        <div>
                            <label for="email" class="block text-sm text-gray-400 mb-1.5">
                                <strong class="text-red-500">*</strong> Email Address
                            </label>
                            <input 
                                type="text" 
                                id="email" 
                                name="email" 
                                required 
                                class="w-full h-9 p-2.5 bg-zinc-800 text-white rounded-lg border border-zinc-500 focus:outline-none focus:ring-1 focus:ring-white"
                                >
                        </div>

                        <div>
                            <label for="password" class="block text-sm text-gray-400 mb-1.5">
                                <strong class="text-red-500">*</strong> Your password
                            </label>
                            <input 
                                type="password" 
                                id="password"name="password"
                                required 
                                class="w-full h-9 p-2.5 bg-zinc-800 text-white rounded-lg border border-zinc-500 focus:outline-none focus:ring-1 focus:ring-white"
                                >
                        </div>

                        <a href="#" class="text-sm text-gray-400 hover:text-gray-300 block text-right mb-4">Forgot your password?</a>

                        <button 
                            type="submit" 
                            class="w-56 p-3 bg-white text-sm text-black hover:bg-blue-500 hover:text-white h-11 rounded-3xl items-center focus:outline-none font-semibold"
                            >
                            Login Now
                        </button>
                    </form>

                    <p class="text-sm text-center text-gray-400 mt-4">Don't have an account? <a href="register.jsp" class="text-gray-400 hover:underline hover:text-blue-500">Sign up</a></p>
                </div>
            </div>
        </div>

        <%@include file="./components/footer.jsp" %>

        <script src="./js/login.js"></script>
        <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>

        <script>
            alertify.set('notifier', 'position', 'top-center');
            <% if (request.getAttribute("loginError") != null) {%>
            alertify.error("<%= request.getAttribute("loginError")%>");
            <% }%>
        </script>
    </body>
</html>
