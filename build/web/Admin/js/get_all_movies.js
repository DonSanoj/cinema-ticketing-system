/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

        $(document).ready(function () {
            // Fetch movies data using AJAX
            $.ajax({
                url: '/abc-cinema/Admin/admin_dashboard', 
                type: 'GET',
                headers: {"X-Requested-With": "XMLHttpRequest"},
                dataType: 'json',
                success: function (data) {
                    if (data.movies && data.movies.length > 0) {
                        data.movies.forEach(function (movie) {
                            $('#movies-list').append(`
                                <tr>
                                    <td class="px-6 py-4 text-sm font-medium text-gray-900">${movie.movieId}</td>
                                    <td class="px-6 py-4 text-sm font-medium text-gray-900">${movie.movieName}</td>
                                    <td class="px-6 py-4 text-sm text-gray-900">${movie.genre}</td>
                                    <td class="px-6 py-4 text-sm text-gray-900">${movie.duration} min</td>
                                    <td class="px-6 py-4 text-sm text-gray-900">${movie.language}</td>
                                    <td class="px-6 py-4 text-sm text-gray-900">${movie.director}</td>
                                    <td class="px-6 py-4 text-sm text-gray-900">${movie.movie_status == 1 ? "Active" : "Coming Soon"}</td>
                                </tr>
                            `);
                        });
                    } else {
                        $('#movies-list').append('<tr><td colspan="7" class="no-data text-center">No movies found.</td></tr>');
                    }
                },
                error: function (xhr, status, error) {
                    console.error('Error fetching data:', error);
                    $('.error-message').text('Failed to fetch data. Error: ' + error);
                }
            });
        });

