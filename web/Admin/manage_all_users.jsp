<%-- 
    Document   : manage_all_users
    Created on : Dec 11, 2024, 1:27:45 PM
    Author     : Himantha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="jakarta.servlet.http.HttpSession"%>

<%
    // Check if the admin is logged in
    HttpSession adminSession = request.getSession(false);
    if (adminSession == null || adminSession.getAttribute("admin_email") == null) {
        response.sendRedirect("/abc-cinema/admin_login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="./assets/img/logo_white.png" type="image/x-icon">
        <title>Admin and Customer Management</title>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.tailwindcss.com"></script>

        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css" />
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css" />

    </head>
    <body>
        
        <%@include file="./components/header.jsp" %>


        <h2 class="text-2xl font-semibold text-center text-gray-700 mb-10">Moderators</h2>
            
            <div class="overflow-x-auto bg-white shadow-md rounded-lg mb-10">

                <table class="min-w-full divide-y divide-gray-200">

                  <thead class="bg-gray-50">
                    <tr>
                      <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Moderator ID</th>
                      <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Email</th>
                      <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Name</th>
                      <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Phone</th>
                      <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Type</th>
                      <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Created At</th>
                    </tr>
                  </thead>
                  
                   <tbody id="moderators-list" class="divide-y divide-gray-200">
                       
                   </tbody>

                </table>

            </div>


        <h2 class="text-2xl font-semibold text-center text-gray-700 mt-10 mb-10">Customers</h2>
        
            <div class="overflow-x-auto bg-white shadow-md rounded-lg">

                <table class="min-w-full divide-y divide-gray-200">

                  <thead class="bg-gray-50">
                    <tr>
                      <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Customer ID</th>
                      <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Email</th>
                      <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Name</th>
                      <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Phone</th>
                      <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Created At</th>
                    </tr>
                  </thead>
                  
                  <tbody id="customers-list"  class="bg-white divide-y divide-gray-200">
                     
                  </tbody>

                </table>

            </div>
        
        <div class="error-message text-red-500 text-center mb-6"></div>

        <script src="./js/manage_all_users.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>        
            alertify.set('notifier', 'position', 'top-center')
            <% if (request.getAttribute("successMessage") != null) {%>
            alertify.success("<%= request.getAttribute("successMessage")%>");
            <% }%>

            <% if (request.getAttribute("errorMessage") != null) {%>
            alertify.error("<%= request.getAttribute("errorMessage")%>");
            <% }%>
        </script>
    </body>
</html>
