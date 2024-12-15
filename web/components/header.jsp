<%-- 
    Document   : header
    Created on : Nov 7, 2024, 7:23:04 PM
    Author     : DON
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">

<!-- header.jsp -->
<header
    class="bg-white flex justify-between items-center p-2 px-4 md:px-8 shadow-lg w-full fixed z-10 relative mb-4">

    <div class="flex items-center">
        <a href="/abc-cinema">
            <img
                src="<%= (request.getAttribute("pageType") != null && request.getAttribute("pageType").equals("non-root")) ? "../assets/img/logo_black.png" : "./assets/img/logo_black.png"%>" 
                alt="ABCLogo" 
                class="w-18 h-16 p-1" 
                />
        </a>
    </div>

    <!-- Navigation Links and Search (Hidden on mobile by default) -->
    <nav class="hidden md:flex space-x-8 items-center justify-between">
        <a href="/abc-cinema" class="text-gray-700 hover:text-blue-600 font-medium" data-page="home">Home</a>
        <a href="/abc-cinema/movies.jsp" class="text-gray-700 hover:text-blue-600 font-medium" data-page="movies">Movies</a>
        <a href="/abc-cinema/aboutUs.jsp" class="text-gray-700 hover:text-blue-600 font-medium" data-page="about">About</a>
        <a href="/abc-cinema/contactUs.jsp" class="text-gray-700 hover:text-blue-600 font-medium"
           data-page="contact">Contact</a>
        <a href="/abc-cinema/reviews.jsp" class="text-gray-700 hover:text-blue-600 font-medium">Reviews</a>
    </nav>

    <!-- User Icon and Mobile Menu Icon (Hamburger) -->
    <div class="flex items-center space-x-4">

        <!-- Search Bar -->
        <div class="items-center space-x-2">
            <form class="relative">
                <input type="text" placeholder="Search..." id="searchInput"
                       class="pl-4 pr-10 py-2 border border-gray-300 rounded-full text-sm focus:outline-none focus:ring-2 focus:ring-blue-400 w-28 sm:w-48 md:w-80" />
                <i
                    class="bx bx-search-alt-2 absolute right-3 top-1/2 transform -translate-y-1/2 text-gray-500 cursor-pointer"></i>
            </form>

            <div id="searchResults"
                 class="absolute mt-2 w-full bg-white border rounded-lg shadow-md max-h-60 overflow-y-auto hidden">

            </div>
        </div>

        <!-- Mobile Menu Icon (Hamburger) -->
        <i class="bx bx-menu text-2xl text-gray-600 md:hidden cursor-pointer" id="mobile-menu-icon"></i>

        <% String customerEmail = (String) session.getAttribute("email"); %>
        <% if (customerEmail != null) {%>

        <div>
            <button 
                id="avatarDropdownButton"
                class="flex items-center justify-center bg-blue-500 text-white text-lg font-semibold w-10 h-10 rounded-full"
                onclick="toggleDropdown()"
                >
                <%= customerEmail.substring(0, 1).toUpperCase()%>
            </button>

            <div
                id="avatarDropdownMenu"
                class="absolute right-0 mt-2 w-48 bg-white rounded-md shadow-lg ring-1 ring-black ring-opacity-5 focus:outline-none hidden"
                >
                <div class="py-1" role="menu" aria-orientation="vertical" aria-labelledby="avatarDropdownButton">
                    <a 
                        href="/profile" 
                        class="block px-4 py-2 text-sm text-black hover:bg-blue-500 hover:text-white font-semibold" role="menuitem"
                        >
                        Profile
                    </a>
                    <a 
                        href="logout" 
                        class="block px-4 py-2 text-sm text-black hover:bg-blue-500 hover:text-white font-semibold" role="menuitem"
                        >
                        Logout
                    </a>
                </div>
            </div>
        </div>

        <% } else { %>

        <a href="/abc-cinema/login.jsp">
            <div class="flex items-center justify-center text-white hover:text-[#eee] cursor-pointer bg-black hover:bg-blue-500 text-lg font-semibold w-10 h-10 rounded-full">
                <i class="bx bx-user"></i>
            </div>
        </a>
        <% }%>
    </div>
</header>

<script>
    function toggleDropdown() {
        const dropdown = document.getElementById('avatarDropdownMenu');
        dropdown.classList.toggle('hidden');
    }
</script>
