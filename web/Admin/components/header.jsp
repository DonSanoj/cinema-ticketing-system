<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Dashboard</title>
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/boxicons@2.1.4/dist/boxicons.js"></script>
    </head>
    <body>
        <header class="bg-white flex justify-between items-center p-2 px-4 md:px-8 shadow-lg w-full fixed z-10 relative mb-4">

            <div class="flex items-center">
                <a href="/abc-cinema/Admin/admin_dashboard.jsp">
                    <img src="/abc-cinema/assets/img/logo_black.png" alt="ABCLogo" class="w-18 h-16 p-1" />
                </a>
            </div>

            <nav class="hidden md:flex space-x-8 items-center justify-between">
                <a href="/abc-cinema/Admin/admin_dashboard.jsp" class="text-gray-700 hover:text-blue-600 font-medium">Dashboard</a>
                <a href="/abc-cinema/Admin/add_movies.jsp" class="text-gray-700 hover:text-blue-600 font-medium">Add Movies</a>
                <a href="/abc-cinema/Admin/manage_all_users.jsp" class="text-gray-700 hover:text-blue-600 font-medium">Manage All Users</a>
                <a href="/abc-cinema/Admin/add_show_time.jsp" class="text-gray-700 hover:text-blue-600 font-medium">Add Show Time</a>
            </nav>

            <div class="flex items-center space-x-4">
                <form action="/abc-cinema/logout" method="get">
                    <button type="submit" class="bg-red-500 text-white text-sm px-4 py-2 rounded hover:bg-red-600">Logout</button>
                </form>
            </div>
        </header>

    </body>
</html>
