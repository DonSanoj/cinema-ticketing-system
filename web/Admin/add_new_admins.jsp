<%-- 
    Document   : add_new_admins
    Created on : Dec 11, 2024, 1:22:48 PM
    Author     : Himantha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // No need to redeclare the 'session' object as it is implicitly available in JSP
    HttpSession adminSession = request.getSession(false);

    if (adminSession == null || adminSession.getAttribute("admin_email") == null) {
        response.sendRedirect("/abc-cinema/admin_login.jsp");
        return;  // Ensures the page doesn't continue rendering
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="./assets/img/logo_white.png" type="image/x-icon">
        <title>Registation Admin</title>
        
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
        
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css" />
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css" />

    </head>

    
    <body>
            
    <%@include file="./components/header.jsp" %>

        <div class="flex items-center justify-center min-h-screen px-4 sm:px-6 lg:px-8 bg-[#eee]">

            <div class="flex flex-col md:flex-row bg-white shadow-lg rounded-xl w-full max-w-4xl overflow-hidden">
                <!-- Left Panel -->
                <div class="bg-black text-white p-4 md:w-1/2 flex flex-col items-center justify-center">
                    <h1 class="text-2xl md:text-3xl mb-4 text-center">Manage, Control, Succeed!</h1>
                    <p class="text-base md:text-lg mb-6 text-center">Empower your admin team with seamless controls.</p>
                    <img src="./assets/img/adminImg.png" alt="Admin Illustration" class="w-48 md:w-64 mb-4">
                </div>

                <!-- Right Panel (Registration Form) -->
                <div class="p-8 md:w-1/2 bg-white text-black flex flex-col rounded-br-lg rounded-bl-lg md:rounded-tr-lg md:rounded-br-lg">
                    <h2 class="text-2xl font-semibold mb-6 text-center">Register as Admin</h2>

                    <form class="space-y-4" action="/abc-cinema/Admin/add_new_admins" method="POST">

                        <div>
                            <label for="admin_email" class="block text-sm text-black mb-1.5">
                                 Email Address <strong class="text-red-500">*</strong>
                            </label>
                            <input 
                                type="email" 
                                id="admin_email" 
                                name="admin_email" 
                                required 
                                class="w-full h-9 p-2.5 bg-zinc-800 text-black rounded-lg border border-zinc-500 focus:outline-none focus:ring-1 focus:ring-white">
                        </div>

                        <div>
                            <label for="admin_name" class="block text-sm text-black mb-1.5">
                                 User Name <strong class="text-red-500">*</strong>
                            </label>
                            <input 
                                type="text" 
                                id="admin_name" 
                                name="admin_name" 
                                required 
                                class="w-full h-9 p-2.5 bg-zinc-800 text-black rounded-lg border border-zinc-500 focus:outline-none focus:ring-1 focus:ring-white">
                        </div>

                        <div>
                            <label for="phoneNumber" class="block text-sm text-black mb-1.5">
                                 Phone Number <strong class="text-red-500">*</strong>
                            </label>
                            <input 
                                type="text" 
                                id="phoneNumber" 
                                name="phoneNumber" 
                                required 
                                class="w-full h-9 p-2.5 bg-zinc-800 text-black rounded-lg border border-zinc-500 focus:outline-none focus:ring-1 focus:ring-white">
                        </div>

                        <div>
                            <label for="password" class="block text-sm text-black mb-1.5">
                                 Password <strong class="text-red-500">*</strong>
                            </label>
                            <input
                                type="password" 
                                id="password"
                                name="password"
                                required 
                                class="w-full h-9 p-2.5 bg-zinc-800 text-black rounded-lg border border-zinc-500 focus:outline-none focus:ring-1 focus:ring-white">
                        </div>
                        
                        <div>
                            <label for="Confirm_Password" class="block text-sm text-black mb-1.5">
                                 Confirm Password <strong class="text-red-500">*</strong>
                            </label>
                            <input
                                type="password" 
                                id="Confirm_Password"
                                name="Confirm_Password"
                                required 
                                class="w-full h-9 p-2.5 bg-zinc-800 text-black rounded-lg border border-zinc-500 focus:outline-none focus:ring-1 focus:ring-white">
                        </div>

                        <div class="text-center">
                            <button 
                                type="submit" 
                                class="w-56 p-3 bg-black text-sm text-white hover:bg-blue-500 h-11 rounded-3xl focus:outline-none font-semibold">
                                Register Now
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

    <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
    <script>
        alertify.set('notifier', 'position', 'top-center');
        <% if (request.getAttribute("errorMessage") != null) {%>
        alertify.error("<%= request.getAttribute("errorMessage")%>");
        <% }%>
    </script>
</body>

</html>
