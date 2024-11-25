<%-- 
    Document   : footer
    Created on : Nov 10, 2024, 4:22:18 PM
    Author     : DON
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">

<footer class="bg-black text-white py-10">
    <div class="container mx-auto px-4 grid grid-cols-1 md:grid-cols-3 gap-8">
        <div>
            <h4 class="font-bold text-lg">ABC Cinema</h4>
            <p class="mt-2">Get 10% off your Booking</p>
            <input type="email" placeholder="Enter your email" class="mt-2 w-full px-4 py-2 rounded">
        </div>
        <div>
            <h4 class="font-bold text-lg">Support</h4>
            <p class="mt-2">111 Bijoy sarani, Dhaka, DH 1515, Bangladesh.</p>
            <p>exclusive@gmail.com</p>
            <p>+88015-88888-9999</p>
        </div>
        <div>
            <h4 class="font-bold text-lg">Account</h4>
            <ul class="mt-2 space-y-2">
                <li><a href="#" class="hover:underline">My Account</a></li>
                <li><a href="#" class="hover:underline">Login / Register</a></li>
            </ul>
        </div>
        <div>
            <h4 class="font-bold text-lg">Quick Link</h4>
            <ul class="mt-2 space-y-2">
                <li><a href="#" class="hover:underline">Privacy Policy</a></li>
                <li><a href="#" class="hover:underline">Terms Of Use</a></li>
                <li><a href="#" class="hover:underline">FAQ</a></li>
                <li><a href="#" class="hover:underline">Contact</a></li>
            </ul>
        </div>
        <div>
            <h4 class="font-bold text-lg">Download App</h4>
            <p class="mt-2">Save 5% with App New User Only</p>
            <div class="mt-4 flex space-x-4">
                <img src="https://example.com/google-play.png" alt="Google Play" class="w-24">
                <img src="https://example.com/app-store.png" alt="App Store" class="w-24">
            </div>
        </div>
    </div>
    <div class="container mx-auto px-4 text-center text-gray-500 mt-8">
        © Copyright Rimel 2022. All rights reserved.
    </div>
</footer>
