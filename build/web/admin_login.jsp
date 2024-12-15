<%-- 
    Document   : admin_login
    Created on : Dec 2, 2024, 12:33:21 PM
    Author     : Shaun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="icon" href="./assets/img/logo_white.png" type="image/x-icon">
        <title>ABC Cinema | Admin Login</title>

        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css" />
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css" />
    </head>
    <body>

        <div class="flex items-center justify-center min-h-screen px-4 sm:px-6 lg:px-8">
            <div class="flex flex-col md:flex-row bg-white shadow-lg rounded-xl w-full max-w-4xl overflow-hidden">
                <!-- Left Panel -->
                <div class="bg-white text-black p-4 md:w-1/2 flex flex-col items-center justify-center">
                    <h1 class="text-2xl md:text-3xl mb-4 text-center">Management Awaits, <br>For Your Service</h1>
                    <p class="text-base md:text-lg mb-6 text-center">Login securely and quickly.</p>
                    <img src= "./assets/img/login.png" alt="ABC Cinema Logo" class="w-48 md:w-64 mb-4">
                </div>

                <!-- Right Panel (Login Form) -->
                <div class="p-8 md:w-1/2 bg-black text-white flex flex-col rounded-br-lg rounded-bl-lg md:rounded-tr-lg md:rounded-br-lg">
                    <div class="text-right text-sm mb-4">
                        
                    </div>
                    <h2 class="text-2xl font-semibold mb-6 text-center md:text-left">Welcome Back!</h2>

                    <button class="bg-white flex items-center justify-center text-gray-800 py-3 px-4 text-base gap-2 rounded-3xl mb-5 w-full">
                        <img src="./assets/img/Support.png" alt="Google Logo" class="w-5 h-5 mr-3">
                        Contact Admin 
                    </button>

                    <div class="divider flex items-center justify-center my-6">
                        <span class="line bg-gray-300 h-px flex-1"></span>
                        <span class="text-gray-400 text-sm px-3">OR</span>
                        <span class="line bg-gray-300 h-px flex-1"></span>
                    </div>


                    <form class="space-y-4" action="admin_login" method="post">
                        <div>
                            <label for="email" class="block text-sm text-gray-400 mb-1.5">
                                 Email Address <strong class="text-red-500">*</strong>
                            </label>
                            <input 
                                type="email" 
                                id="admin_email" 
                                name="admin_email" 
                                required 
                                class="w-full h-9 p-2.5 bg-zinc-800 text-white rounded-lg border border-zinc-500 focus:outline-none focus:ring-1 focus:ring-white"
                                >
                        </div>

                        <div>
                            <label for="password" class="block text-sm text-gray-400 mb-1.5">
                                password<strong class="text-red-500">*</strong>
                            </label>
                            <input 
                                type="password" 
                                id="password"
                                name="password"
                                required 
                                class="w-full h-9 p-2.5 bg-zinc-800 text-white rounded-lg border border-zinc-500 focus:outline-none focus:ring-1 focus:ring-white"
                                >
                            <span id="toggle-password" onclick="togglePassword()" class="absolute top-2 right-3 text-gray-400 cursor-pointer">
                            <i class="fas fa-eye-slash"></i>
                        </span>
                        </div>

                        <a href="#" class="text-sm text-gray-400 hover:text-gray-300 block text-right mb-4">Forgot your password?</a>

                        <button 
                            type="submit" 
                            class="w-full p-3 bg-white text-sm text-black h-11 rounded-3xl items-center focus:outline-none font-semibold"
                            >
                            Login Now
                        </button>
                    </form>

                    <p class="text-sm text-center text-gray-400 mt-4">Don't have an account? <a href="register.jsp" class="text-gray-400 hover:text-blue-500 hover:underline">Contact Admin</a></p>
            </div>
        </div>

        <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>

        <script>
                            alertify.set('notifier', 'position', 'top-center');
            <% if (request.getAttribute("errorMessage") != null) {%>
                            alertify.error("<%= request.getAttribute("errorMessage")%>");
            <% }%>
        </script>

        <!-- Toggle Password Visibility Script -->
        <script>
            function togglePassword() {
                const passwordInput = document.getElementById('password');
                const icon = document.getElementById('toggle-password').querySelector('i');
                if (passwordInput.type === 'password') {
                    passwordInput.type = 'text';
                    icon.classList.remove('fa-eye-slash');
                    icon.classList.add('fa-eye');
                } else {
                    passwordInput.type = 'password';
                    icon.classList.remove('fa-eye');
                    icon.classList.add('fa-eye-slash');
                }
            }
        </script>
    </body>
</html>

