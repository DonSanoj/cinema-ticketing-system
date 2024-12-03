/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


const mockMovies = [
    {name: "Inception"},
    {name: "The Dark Knight"},
    {name: "Interstellar"},
    {name: "Dunkirk"},
    {name: "Tenet"},
];

document.getElementById("searchInput").addEventListener("input", function () {

    const query = this.value.trim().toLowerCase();
    const resultsContainer = document.getElementById("searchResults");

    if (query.length === 0) {
        resultsContainer.innerHTML = "<p class='p-4 text-gray-500'>No search result</p>";
        resultsContainer.classList.remove("hidden");
        return;
    }

    const filteredMovies = mockMovies.filter((movie) =>
        movie.name.toLowerCase().includes(query)
    );

    resultsContainer.innerHTML = "";

    if (filteredMovies.length > 0) {
        filteredMovies.forEach((movie) => {
            const movieDiv = document.createElement("div");
            movieDiv.className = "p-4 hover:bg-gray-100 cursor-pointer";
            movieDiv.textContent = movie.name;
            resultsContainer.appendChild(movieDiv);
        });

        resultsContainer.classList.remove("hidden");
    } else {
        resultsContainer.innerHTML = "<p class='p-4 text-gray-500'>No search result</p>";
        resultsContainer.classList.remove("hidden");
    }
})