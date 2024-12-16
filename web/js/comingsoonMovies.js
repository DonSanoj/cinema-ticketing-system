/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

$(document).ready(function () {

    $.ajax({
        url: '/test-web/comingsoonmovies',
        type: 'GET',
        headers: {"X-Requested-With": "XMLHttpRequest"},
        dataType: 'json',
        success: function (data) {
            console.log(data);
            $('#coming-soon-movie').empty(); // Clear any previous movie data

            if (Array.isArray(data) && data.length > 0) {
                data.forEach(function (moviescomingsoon) {
                    // Transform Dropbox URL to direct file access
                    let movieImageUrl = moviescomingsoon.movieImage
                            ? moviescomingsoon.movieImage.replace("https://www.dropbox.com/", "https://dl.dropboxusercontent.com/")
                            .replace(/([?&])dl=\d/, '')
                            : 'default-placeholder-image-url.jpg'; // Fallback image if movieImage is missing

                    let trailerLink = moviescomingsoon.trailer_link ? decodeURIComponent(moviescomingsoon.trailer_link) : '#';

                    // Append movie card to the list
                    $('#coming-soon-movie').append(`
                        <div class="movie-card col-span-1 bg-gray-800 rounded-lg relative shadow-lg hover:scale-105 transition-transform duration-300">
                            <img src="${movieImageUrl}" alt="${moviescomingsoon.movieName}" class="w-full h-56 object-cover rounded-lg opacity-80 hover:opacity-90 transition-opacity duration-300">
                            <div class="absolute bottom-4 left-4 text-white">
                                <h4 class="text-xl font-bold">${moviescomingsoon.movieName}</h4>
                                <h2 class="text-md font-bold mb-2">${moviescomingsoon.language} ● ${moviescomingsoon.genre}</h2>
                                
                                <div class="flex space-x-2">
                                    <!-- Book Tickets Button -->
                                    <a href="/test-web/movieDetails?movie_id=${moviescomingsoon.movieId}&movie_image=${encodeURIComponent(movieImageUrl)}"
                                        class="bg-white text-black font-bold px-4 py-2 rounded hover:bg-blue-500 hover:text-white transition duration-300">
                                        Show Info
                                    </a>
                                    
                                    <!-- Watch Trailer Button -->
                                    <a href="${trailerLink}" target="_blank" class="inline-block bg-transparent text-white border border-white px-4 py-2 rounded hover:bg-blue-500 hover:text-white transition duration-300">
                                        Watch Trailer
                                    </a>
                                </div>
                            </div>
                        </div>
                    `);
                });
            } else {
                $('#coming-soon-movie').append('<div class="col-span-3 text-center text-white">No movies found.</div>');
            }

        },
        error: function (xhr, status, error) {
            console.error('Error fetching data:', error);
            $('.error-message').text('Failed to fetch data. Error: ' + error);
        }
    });
});


