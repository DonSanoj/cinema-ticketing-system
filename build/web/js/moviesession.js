/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


$(document).ready(function () {
    
    const movieId = new URLSearchParams(window.location.search).get('movie_id');

    if (movieId) {
        
        $.ajax({
            url: '/abc-cinema/moviesessions/movie-session',
            type: 'GET',
            headers: {"X-Requested-With": "XMLHttpRequest"},
            data: {movie_id: movieId},
            dataType: 'json',
            success: function (data) {

                const showtimesContainer = $('#showtimes-container');
                showtimesContainer.empty(); // Clear previous content

                // Check if data is available and iterate over showtimes
                if (data && data.length > 0) {
                    data.forEach(function (showtime) {
                        showtimesContainer.append(`
                            <div class="showtime-item">
                        
                                <p><strong>Complex Name:</strong> ${showtime.complex_name}</p>
                                <p><strong>Hall Name:</strong> ${showtime.hall_name}</p>
                                
                                <a href="/test-web/seatlayout/seatBooking.jsp?showtime_id=${showtime.showtime_id}">
                                    <p><strong>Start Time:</strong> ${showtime.start_time}</p>
                                    <p><strong>Date:</strong> ${showtime.date}</p>
                                </a>
                                <hr>
                            </div>
                        `);
                    });
                } else {
                    showtimesContainer.html('<p>No showtimes available for this movie.</p>');
                }
            },
            error: function (xhr, status, error) {
                console.error('Error fetching showtimes:', error); 
                console.error('Response Text:', xhr.responseText); 
                $('#showtimes-container').html('<p>Failed to fetch showtimes. Please try again later.</p>');
            }
        });
    } else {
        console.warn('No movie ID found in the URL parameters.');
        $('#showtimes-container').html('<p>Movie ID is missing from the URL.</p>');
    }
});
