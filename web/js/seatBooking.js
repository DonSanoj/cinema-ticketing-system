/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

const urlParams = new URLSearchParams(window.location.search);
const showtimeId = urlParams.get('showtime_id');

function fetchReservedSeats() {
    const loadingElement = document.getElementById('loading');

    if (loadingElement) {
        loadingElement.style.display = 'none';
    }

    $.ajax({
        url: `/abc-cinema/seatlayout/seatBooking?showtime_id=${showtimeId}`,
        type: 'GET',
        success: function (response) {
            console.log('Response from server:', response);

            // Check if the response is an array (ensure valid response structure)
            if (Array.isArray(response)) {
                response.forEach(seat => {
                    const seatButton = document.querySelector(`button[data-seat-id="${seat.seat_id}"]`);
                    if (seatButton) {
                        seatButton.classList.remove('available');
                        seatButton.classList.add('bg-blue-500');  
                        seatButton.classList.add('cursor-not-allowed');
                    }
                });
            } else if (response && Array.isArray(response.reservedSeats)) {
                
                response.reservedSeats.forEach(seat => {
                    const seatButton = document.querySelector(`button[data-seat-id="${seat.seat_id}"]`);
                    if (seatButton) {
                        seatButton.classList.remove('available');
                        seatButton.classList.add('bg-blue-500');
                    }
                });
            } else {
                console.error('Invalid response format. Expected an array of reserved seat IDs.');
            }
        },
        error: function (xhr, status, error) {
           
            if (loadingElement) {
                loadingElement.style.display = 'none';
            }

            console.error('Error fetching reserved seats:', error);
            console.error('Response Text:', xhr.responseText);
            console.error('Status Code:', xhr.status);
            console.error('Status:', status);
        }
    });
}

// Call the function to fetch reserved seats when the page loads
document.addEventListener('DOMContentLoaded', function () {
    fetchReservedSeats();
});


const selectedSeats = new Set();

// Handle seat selection
document.querySelectorAll('.seat').forEach(seat => {
    seat.addEventListener('click', () => {
        const seatId = seat.dataset.seatId;
        const seatPrice = parseInt(seat.dataset.price, 10);

        if (seat.classList.contains('available') && !seat.classList.contains('bg-blue-500')) {
            if (selectedSeats.has(seatId)) {
                selectedSeats.delete(seatId);
                seat.classList.remove('bg-red-500');
            } else {
                selectedSeats.add(seatId);
                seat.classList.add('bg-red-500');
            }
        }

        document.getElementById('selectedSeats').value = Array.from(selectedSeats).join(',');
    });
});

// Show popup for booking confirmation
function proceedToBooking() {
    if (selectedSeats.size === 0) {
        alertify.set('notifier', 'position', 'top-center');
        alertify.error('Please select at least one seat!');
        return;
    }

    const selectedSeatsArray = Array.from(selectedSeats);
    const totalPrice = selectedSeatsArray.reduce((sum, seatId) => {
        const seatElement = document.querySelector(`[data-seat-id="${seatId}"]`);
        return sum + parseInt(seatElement.dataset.price, 10);
    }, 0);

    const payload = {
        seats: selectedSeatsArray,
        customerId: document.getElementById('customerId').value,
        customerEmail: document.getElementById('customerEmail').value,
        customerName: document.getElementById('customerName').value,
        customerPhone: document.getElementById('customerPhone').value,
        showtimeId: showtimeId,
        amount: totalPrice
    };

    // Send the booking data to the payment servlet
    $.ajax({
        url: '/abc-cinema/seatlayout/payment',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(payload),
        success: function (response) {
            console.log("Response from server:", response);

            if (response.success) {
                document.getElementById('selectedSeatsSummary').textContent =
                        `Selected Seats: ${Array.from(selectedSeats).join(', ')}`;
                document.getElementById('totalPrice').textContent = `Total Price: Rs.${totalPrice}`;

                const modal = document.getElementById('bookingModal');
                modal.classList.remove('hidden');
                modal.classList.add('visible');
            } else {
                alert("Failed to prepare payment. Please try again.");
                console.error("Payment preparation failed:", response.error || "Unknown error");
            }
        },
        error: function (xhr, status, error) {
            console.error('Error preparing payment:', error);
            console.error('Response Text:', xhr.responseText);
            console.error('Status Code:', xhr.status);
        }
    });
}

// Close the modal
function closeModal() {
    const modal = document.getElementById('bookingModal');
    modal.classList.remove('visible');
    modal.classList.add('hidden');
}

//Payment Integration
function paymentGateway() {
    $.ajax({
        url: '/abc-cinema/seatlayout/payment',
        type: 'GET',
        dataType: 'json',
        headers: {
            'Content-Type': 'application/json',
        },
        success: function (response) {
            console.log("Response from server:", response);

            if (!response || !response.merchant_id || !response.order_id || !response.amount || !response.currency || !response.hash) {
                alert("Missing required payment data from the server.");
                return;
            }

            const {
                merchant_id, order_id, amount, currency, hash, items,
                first_name, last_name, email, phone, address, city, country,
                delivery_address, delivery_city, delivery_country
            } = response;

            // PayHere callback functions
            payhere.onCompleted = function (orderId) {
                console.log("Payment completed. OrderID:", orderId);

                const payload = {
                    seats: Array.from(selectedSeats),
                    customerId: document.getElementById('customerId').value,
                    customerEmail: document.getElementById('customerEmail').value,
                    showtimeId: showtimeId,
                    amount: amount,
                    orderId: orderId
                };

                // Send data to the seat booking servlet
                $.ajax({
                    url: '/abc-cinema/seatlayout/seatBooking',
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify(payload),
                    success: function (response) {
                        console.log('Seat booking success:', response);

                        const serviceID = 'service_sxv3dc4';
                        const templateID = 'template_uzecnlv';

                        const emailParams = {
                            customer_email: payload.customerEmail,
                            order_id: payload.orderId,
                            amount: payload.amount,
                            seats: payload.seats.join(', '),
                        };

                        emailjs.send(serviceID, templateID, emailParams)
                                .then(() => {
                                    console.log('Email sent successfully!');
                                    alert('Payment completed, and confirmation email has been sent!');
                                })
                                .catch((err) => {
                                    console.error('Failed to send email:', err);
                                    alert('Payment completed, but failed to send email.');
                                });

                        window.location.href = "/abc-cinema/add_reviews.jsp";
                    },
                    error: function (xhr, status, error) {
                        console.error('Error sending booking data:', error);
                        alert("Failed to complete booking. Please try again.");
                    }
                });

            };
            payhere.onDismissed = function () {
                console.log("Payment dismissed");
//                alert("Payment process was dismissed.");
            };
            payhere.onError = function (error) {
                console.error("Payment error:", error);
                alert("An error occurred during the payment process.");
            };

            // Payment object
            var payment = {
                "sandbox": true,
                "merchant_id": merchant_id,
                "return_url": "http://localhost:8080/abc-cinema/add_reviews.jsp",
                "cancel_url": "http://localhost:8080/abc-cinema/seatlayout/cancel.jsp",
                "notify_url": "http://localhost:8080/abc-cinema/notify",
                "order_id": order_id,
                "items": items,
                "amount": amount,
                "currency": currency,
                "hash": hash,
                "first_name": first_name,
                "last_name": last_name,
                "email": email,
                "phone": phone,
                "address": address,
                "city": city,
                "country": country,
                "delivery_address": delivery_address,
                "delivery_city": delivery_city,
                "delivery_country": delivery_country
            };

            if (typeof payhere !== 'undefined') {
                payhere.startPayment(payment);
                console.log("Payment object:", payment);
            } else {
                console.error("PayHere SDK is not loaded.");
                alert("Error: PayHere SDK is not loaded.");
            }
        },
        error: function (xhr, status, error) {
            console.error('Error:', error, 'Status:', status, 'Response:', xhr.responseText);
            alert(`Error occurred: ${error}. Status: ${status}`);
        }
    });
}


