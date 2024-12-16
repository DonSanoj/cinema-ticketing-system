/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

$(document).ready(function () {

    $.ajax({
        url: '/abc-cinema/movies',
        type: 'GET',
        headers: {"X-Requested-With": "XMLHttpRequest"},
        dataType: 'json',
        success: function (data) {
            console.log(data);
            $('#now-showing-movie').empty(); // Clear any previous movie data

            if (Array.isArray(data) && data.length > 0) {
                data.forEach(function (movie) {
                    // Transform Dropbox URL to direct file access
                    let movieImageUrl = movie.movieImage
                            ? movie.movieImage.replace("https://www.dropbox.com/", "https://dl.dropboxusercontent.com/")
                            .replace(/([?&])dl=\d/, '')
                            : 'default-placeholder-image-url.jpg'; // Fallback image if movieImage is missing

                    let trailerLink = movie.trailer_link ? decodeURIComponent(movie.trailer_link) : '#';

                    // Append movie card to the list
                    $('#now-showing-movie').append(`
                        <div class="movie-card col-span-1 bg-gray-800 rounded-lg relative shadow-lg hover:scale-105 transition-transform duration-300">
                            <img src="${movieImageUrl}" alt="${movie.movieName}" class="w-full h-56 object-cover rounded-lg opacity-80 hover:opacity-90 transition-opacity duration-300">
                            <div class="absolute bottom-4 left-4 text-white">
                                <h4 class="text-xl font-bold">${movie.movieName}</h4>
                                <h2 class="text-md font-bold mb-2">${movie.language} ● ${movie.genre}</h2>
                                
                                <div class="flex space-x-2">
                                    <!-- Book Tickets Button -->
                                    <a href="/test-web/moviesessions/movie-session?movie_id=${movie.movieId}&movie_name=${encodeURIComponent(movie.movieName)}&genre=${encodeURIComponent(movie.genre)}&language=${encodeURIComponent(movie.language)}&movie_image=${encodeURIComponent(movieImageUrl)}"
                                            class="bg-white text-black font-bold px-4 py-2 rounded hover:bg-blue-500 hover:text-white transition duration-300">
                                        Book Tickets
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
                $('#now-showing-movie').append('<div class="col-span-3 text-center text-white">No movies found.</div>');
            }

        },
        error: function (xhr, status, error) {
            console.error('Error fetching data:', error);
            $('.error-message').text('Failed to fetch data. Error: ' + error);
        }
    });
});
