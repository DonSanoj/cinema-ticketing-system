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
    <body class="bg-gray-100 flex items-center justify-center h-screen">

        <section class="w-full max-w-md p-8 bg-white shadow-lg rounded-xl">
            <h3 class="text-2xl font-bold text-gray-800 text-center mb-6">Welcome Back Admin!</h3>

            <form action="admin_login" method="post" class="space-y-6">

                <!-- Email Field -->
                <div>
                    <label for="email" class="block text-sm font-medium text-gray-700 mb-1">Email</label>
                    <div class="relative">
                        <input type="email" name="admin_email" id="admin_email" placeholder="Enter your email"
                               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:outline-none">
                        <span class="absolute top-2 right-3 text-gray-400">
                            <!--<i class="fa-solid fa-envelope"></i>-->
                        </span>
                    </div>
                </div>

                <!-- Password Field -->
                <div>
                    <label for="password" class="block text-sm font-medium text-gray-700 mb-1">Password</label>
                    <div class="relative">
                        <input type="password" name="password" id="password-input" placeholder="Enter your password"
                               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:outline-none">
                        <span id="toggle-password" onclick="togglePassword()" class="absolute top-2 right-3 text-gray-400 cursor-pointer">
                            <i class="fas fa-eye-slash"></i>
                        </span>
                    </div>
                </div>

                <!-- Submit Button -->
                <button type="submit" class="w-full bg-black hover:bg-blue-500 text-white py-2 rounded-lg font-semibold focus:outline-none focus:ring-2 focus:ring-blue-500">
                    Login
                </button>
            </form>
        </section>

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
                const passwordInput = document.getElementById('password-input');
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
