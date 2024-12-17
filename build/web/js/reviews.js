/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


$(document).ready(function () {

    $.ajax({
        url: '/abc-cinema/fetchReviews',
        type: 'GET',
        headers: {"X-Requested-With": "XMLHttpRequest"},
        dataType: 'json',
        success: function (data) {
            console.log(data); 

            if (Array.isArray(data) && data.length > 0) {
                // Loop through each review and append it to the #reviewsContainer
                data.forEach(function (review) {
                    $('#reviewsContainer').append(
                            `<div class=" review-card flex items-start bg-white shadow-md rounded-lg p-6 transition-transform duration-300 ease-in-out hover:translate-y-2 hover:scale-105">
                
                                <div class="w-10 h-10 rounded-full mr-6 flex items-center justify-center text-white bg-blue-500 font-semibold text-2xl">
                                    <span>${review.customerEmail.substring(0, 1).toUpperCase()}</span>
                                </div>
                                <div>
                                    <h3>
                                        <strong class="text-xl font-semibold">${review.customerName}</strong>
                                        <strong class="text-lg text-gray-600 font-medium italic">(${review.customerEmail})</strong>
                                    </h3>
                                    <p class="text-sm text-gray-500">
                                        ${new Date(review.reviewTime).toLocaleString()}
                                    </p>
                    
                                    <div>
                                        <p class="text-gray-700 mt-4">
                                            Review About: ${review.reviewFor}
                                        </p>
                                        <p class="text-black mt-4">
                                            ${review.review}
                                        </p>
                                    </div>
                                </div>
                            </div>`
                            );
                });
            } else {
                $('#reviewsContainer').append('<p>No reviews found.</p>');
            }
        },
        error: function (xhr, status, error) {
            console.error('Error fetching data:', error);
            $('.error-message').text('Failed to fetch data. Error: ' + error);
        }
    });

});
