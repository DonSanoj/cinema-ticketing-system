<%-- 
    Document   : add_new_admins
    Created on : Dec 11, 2024, 1:22:48 PM
    Author     : Himantha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css" />
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css" />
    </head>
    <body class="bg-[#eee]">

        <%--<%@include file="./components/header.jsp" %>--%>

        <div class=" flex items-center justify-center min-h-screen px-4 sm:px-6 lg:px-8 bg-[#eee] mb-6">

            <form class="space-y-4" action="/abc-cinema/Admin/add_new_admins" method="post">
                <div>
                    <label for="email" class="block text-sm text-black mb-1.5"> 
                        <strong class="text-red-500">*</strong> Email Address
                    </label>
                    <input 
                        type="text" 
                        id="admin_email" 
                        name="admin_email" 
                        required 
                        class="w-full h-9 p-2.5 bg-zinc-800 text-black rounded-lg border border-zinc-500 focus:outline-none focus:ring-1 focus:ring-white"
                        >
                </div>

                <div>
                    <label for="customername" class="block text-sm text-black mb-1.5">
                        <strong class="text-red-500">*</strong> User Name
                    </label>
                    <input 
                        type="text" 
                        id="admin_name" 
                        name="admin_name" 
                        required 
                        class="w-full h-9 p-2.5 bg-zinc-800 text-blacak rounded-lg border border-zinc-500 focus:outline-none focus:ring-1 focus:ring-white"
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

                <button 
                    type="submit" 
                    class="w-56 p-3 bg-black text-sm text-white hover:bg-blue-500 h-11 rounded-3xl items-center focus:outline-none font-semibold"
                    >
                    Register Now
                </button>
            </form>

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
