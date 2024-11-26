<%-- 
    Document   : movieDetails
    Created on : Nov 26, 2024, 5:14:30 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="icon" href="./assets/img/logo.png" type="image/x-icon">
        <title>ABC Cinema | Movie Detail</title>

        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    </head>
    <body>

        <section class="relative bg-black text-white">
            <img src="./assets/img/img 1.jpg" alt="Movie Banner"
                 class="w-full h-80 object-cover opacity-75">
            <div class="absolute inset-0 flex flex-col items-center justify-center space-y-2">
                <h2 class="text-4xl font-bold">VENOM: THE LAST DANCE</h2>
                <p class="text-sm">Now Showing at ABC Cinemas</p>
                <div class="space-x-4">
                    <button class="bg-purple-600 px-4 py-2 rounded">Trailer</button>
                    <button class="bg-purple-600 px-4 py-2 rounded">Get Ticket</button>
                </div>
            </div>
        </section>

        <main class="container mx-auto py-8 px-4">
            <!-- Now Showing Section -->
            <section class="py-6">
                <h3 class="text-xl font-semibold mb-2">Now Showing At</h3>
                <div class="flex space-x-4">
                    <div class="bg-gray-200 p-4 rounded-lg shadow text-center">ABC Cinemas Multiplex, Colombo City Centre
                    </div>
                    <div class="bg-gray-200 p-4 rounded-lg shadow text-center">ABC Cinemas Multiplex, Colombo City Centre
                    </div>
                    <div class="bg-gray-200 p-4 rounded-lg shadow text-center">ABC Cinemas Multiplex, Colombo City Centre
                    </div>
                    <div class="bg-gray-200 p-4 rounded-lg shadow text-center">ABC Cinemas Multiplex, Colombo City Centre
                    </div>
                    <div class="bg-gray-200 p-4 rounded-lg shadow text-center">ABC Cinemas Multiplex, Colombo City Centre
                    </div>
                </div>
            </section>

            <section class="py-6">
                <h3 class="text-xl font-semibold mb-2">Story Line</h3>
                <p class="text-gray-700">
                    Eddie and Venom are on the run. Hunted by both of their worlds and with the net closing in, the duo are
                    forced into a devastating decision that will bring the curtains down on Venom and Eddie’s last dance.
                </p>
            </section>

            <!-- Storyline and Cast -->
            <div class="mt-10 grid grid-cols-1 md:grid-cols-3 gap-10">
                <div class="md:col-span-2">
                    <h4 class="text-xl font-bold mb-4">STORY LINE</h4>
                    <p class="text-gray-700">Eddie and Venom are on the run. Hunted by both of their worlds and with the net
                        closing in, the duo are forced into a devastating decision that will bring the curtains down on
                        Venom and Eddie’s last dance.</p>
                    <button class="bg-purple-700 text-white px-4 py-2 rounded mt-4">Get Ticket</button>
                </div>
                <div>
                    <h4 class="text-xl font-bold mb-4">CAST</h4>
                    <ul class="text-gray-700">
                        <li><strong>Actor:</strong> Tom Hardy as Eddie Brock / Venom</li>
                        <li>Juno Temple</li>
                        <li>Alanna Ubach</li>
                    </ul>
                    <h4 class="text-xl font-bold mt-6 mb-4">TEAM</h4>
                    <ul class="text-gray-700">
                        <li><strong>Directed by:</strong> Kelly Marcel</li>
                        <li><strong>Produced by:</strong> Avi Arad</li>
                        <li><strong>Written by:</strong> Kelly Marcel</li>
                        <li><strong>Music by:</strong> Dan Deacon</li>
                    </ul>
                </div>
            </div>
        </section>
        <!-- Partner Logos Section -->
        <section class="container mx-auto px-10 py-10 flex justify-center space-x-10">
            <img src="C:\Users\user\Desktop\New folder\logoipsum-264.png" alt="Partner 1" class="w-12">
            <img src="C:\Users\user\Desktop\New folder\Logo box.png" alt="Partner 2" class="w-12">
            <img src="C:\Users\user\Desktop\New folder\Logo box1.png" alt="Partner 3" class="w-12">
            <img src="C:\Users\user\Desktop\New folder\Logo box2.png" alt="Partner 4" class="w-12">
            <img src="C:\Users\user\Desktop\New folder\Logo box3.png" alt="Partner 5" class="w-12">
        </section>
    </main>

</body>
</html>
