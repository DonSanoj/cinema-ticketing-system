<%-- 
    Document   : header
    Created on : Dec 11, 2024, 12:58:39 PM
    Author     : Himantha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Dashboard</title>
        <style>
            /* Basic styling for the header */
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
            }
            nav {
                background-color: #333;
                overflow: hidden;
            }
            nav a {
                float: left;
                display: block;
                color: white;
                text-align: center;
                padding: 14px 20px;
                text-decoration: none;
                font-size: 16px;
            }
            nav a:hover {
                background-color: #ddd;
                color: black;
            }
            .logo {
                float: left;
                font-size: 20px;
                color: white;
                padding: 14px 20px;
            }
            .logout {
                float: right;
                padding: 14px 20px;
            }
        </style>
    </head>
    <body>
        <!-- Navigation bar -->
        <nav>
            <!-- Logo or Site Name -->
            <div class="logo">
                <strong>Welcome admin ${sessionScope.admin_name}!</strong>
            </div>

            <!-- Navigation links -->
            <a href="/abc-cinema/Admin/admin_dashboard.jsp">Dashboard</a>
            <a href="/abc-cinema/Admin/add_movies.jsp">Add Movies</a>
            <a href="/abc-cinema/Admin/manage_all_users.jsp">Manage All Users</a>
            <a href="/abc-cinema/Admin/add_show_time.jsp">Add Show Time</a>

            <!-- Logout Button -->
            <div class="logout">
                <form action="/abc-cinema/logout" method="get">
                    <button type="submit">Logout</button>
                </form>
            </div>
        </nav>

        <!-- Add additional content below -->
    </body>
</html>