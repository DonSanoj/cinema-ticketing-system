<%-- 
    Document   : footer
    Created on : Nov 10, 2024, 4:22:18 PM
    Author     : DON
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<footer class="bg-black text-white py-8 px-4 md:px-8">
    <div class=" mx-auto px-4 md:px-8 grid grid-cols-1 md:grid-cols-4 gap-16">
        <div>
            <img src="<%= (request.getAttribute("pageType") != null && request.getAttribute("pageType").equals("non-root")) ? "../assets/img/logo_white.png" : "./assets/img/logo_white.png"%>" class="h-32 w-48" />
            <p class="mt-2">Get 10% off your Booking in this festival season.</p>
            <input type="email" placeholder="Enter your email" class="mt-2 w-full px-4 py-2 rounded text-black">
        </div>
        <div>
            <h4 class="font-bold text-lg">Contact Info</h4>
            <p class="mt-2">Colombo, Sri Lanka</p>
            <p>abccinema@gmail.com</p>
            <p>+9432-2232012</p>
        </div>
        <div>
            <h4 class="font-bold text-lg">Quick Link</h4>
            <ul class="mt-2 space-y-2">
                <li><a href="#" class="hover:underline hover:text-blue-500">Privacy Policy</a></li>
                <li><a href="#" class="hover:underline hover:text-blue-500">Terms Of Use</a></li>
                <li><a href="#" class="hover:underline hover:text-blue-500">FAQ</a></li>
                <li><a href="#" class="hover:underline hover:text-blue-500">Contact</a></li>
            </ul>
        </div>
        <div>
            <h4 class="font-bold text-lg">Social Links</h4>
            <ul class="mt-2 space-y-2">
                <li><a href="#" class="hover:underline hover:text-blue-500">Facebook</a></li>
                <li><a href="#" class="hover:underline hover:text-blue-500">Instagram</a></li>
            </ul>
        </div>
    </div>
    <div class="container mx-auto px-4 text-center text-gray-500 mt-8">
        ©<span id="year"></span> ABC Cinema. All rights reserved.
    </div>
</footer>