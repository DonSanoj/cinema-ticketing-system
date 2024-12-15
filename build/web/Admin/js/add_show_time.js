/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


document.addEventListener("DOMContentLoaded", () => {
    const movieDropdown = document.getElementById("movie_id");

    // Fetch movies using AJAX
    fetch("/abc-cinema/Admin/addShowTime")
            .then(response => {
                if (!response.ok) {
                    throw new Error("Failed to fetch movies");
                }
                return response.json();
            })
            .then(movies => {
                movieDropdown.innerHTML = ""; // Clear existing options
                movies.forEach(movie => {
                    const option = document.createElement("option");
                    option.value = movie.movieId;
                    option.textContent = movie.movieName;
                    movieDropdown.appendChild(option);
                });
            })
            .catch(error => {
                console.error("Error fetching movies:", error);
            });
});
