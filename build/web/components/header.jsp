<%-- 
    Document   : header
    Created on : Nov 7, 2024, 7:23:04 PM
    Author     : DON
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">

<!-- header.jsp -->
<header class="bg-white flex justify-between items-center p-2 px-4 md:px-8 shadow-lg w-full fixed z-10 relative mb-4">

    <div class="flex items-center">
        <a href="/abc-cinema">
            <img src="./assets/img/logo.png" alt="ABCLogo" class="w-18 h-16 p-1" />
        </a>
    </div>

    <!-- Navigation Links and Search (Hidden on mobile by default) -->
    <nav class="hidden md:flex space-x-8 items-center justify-between">
        <a href="/abc-cinema" class="text-gray-700 hover:text-blue-600 font-medium" data-page="home">Home</a>
        <a href="/abc-cinema/movies" class="text-gray-700 hover:text-blue-600 font-medium" data-page="movies">Movies</a>
        <a href="/abc-cinema/aboutUs.jsp" class="text-gray-700 hover:text-blue-600 font-medium" data-page="about">About</a>
        <a href="/abc-cinema/contactUs.jsp" class="text-gray-700 hover:text-blue-600 font-medium" data-page="contact">Contact</a>
    </nav>

    <!-- User Icon and Mobile Menu Icon (Hamburger) -->
    <div class="flex items-center space-x-4">

        <!-- Search Bar -->
        <div class="items-center space-x-2">
            <form class="relative">
                <input
                    type="text"
                    placeholder="Search..."
                    class="pl-4 pr-10 py-2 border border-gray-300 rounded-full text-sm focus:outline-none focus:ring-2 focus:ring-blue-400 w-28 sm:w-48 md:w-80"
                    />
                <i class="bx bx-search-alt-2 absolute right-3 top-1/2 transform -translate-y-1/2 text-gray-500 cursor-pointer"></i>
            </form>
        </div>

        <!-- Mobile Menu Icon (Hamburger) -->
        <i class="bx bx-menu text-2xl text-gray-600 md:hidden cursor-pointer" id="mobile-menu-icon"></i>
        <a href="login.jsp">
            <i class="bx bx-user text-2xl text-white hover:text-[#eee] cursor-pointer bg-black hover:bg-blue-500 p-2 rounded-full"></i>
        </a>
    </div>
</header>

<!-- Mobile Navigation (Initially hidden) -->
<div id="mobile-menu" class="md:hidden hidden items-center space-y-4 bg-white w-full p-4 shadow-lg">
    <a href="/" class="text-gray-700 hover:text-blue-600 font-medium">Home</a>
    <a href="/" class="text-gray-700 hover:text-blue-600 font-medium">Movies</a>
    <a href="/" class="text-gray-700 hover:text-blue-600 font-medium">About</a>
    <a href="/" class="text-gray-700 hover:text-blue-600 font-medium">Contact</a>
</div>

<script>

    const menuIcon = document.getElementById('mobile-menu-icon');
    const mobileMenu = document.getElementById('mobile-menu');

    menuIcon.addEventListener('click', () => {
        mobileMenu.classList.toggle('hidden');
    });

    // Set the underline based on the current page
    window.addEventListener('load', () => {
        const currentPage = window.location.pathname;
        const links = document.querySelectorAll('nav a');

        links.forEach(link => {
            const page = link.getAttribute('data-page');

            if (currentPage.includes(page)) {
                link.classList.add('underline');
                link.classList.add('text-blue-600');
            } else {
                link.classList.remove('underline');
            }
        });
    });
</script>
