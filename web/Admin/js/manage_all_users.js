$(document).ready(function () {
    // Fetch moderators and customers data using AJAX
    $.ajax({
        url: '/abc-cinema/Admin/manage_all_users',
        type: 'GET',
        headers: {"X-Requested-With": "XMLHttpRequest"},
        dataType: 'json',
        success: function (data) {
            console.log('Full Data Object:', data); // Log the entire data object to check the structure

            // Clear previous content in case of any prior data
            $('#moderators-list').empty();
            $('#customers-list').empty();

            // Display moderators data in table rows
            if (data.moderators && data.moderators.length > 0) {
                data.moderators.forEach(function (admin) {
                    // Dynamically create table row for each moderator and append it
                    $('#moderators-list').append(`
                        <tr>
                            <td>${admin.admin_id}</td>
                            <td>${admin.admin_email}</td>
                            <td>${admin.admin_name}</td>
                            <td>${admin.phone_number}</td>
                            <td>${admin.admin_type}</td>
                            <td>${admin.created_at}</td>
                        </tr>
                    `);
                });
            } else {
                // Append message if no moderators found
                $('#moderators-list').append('<tr><td colspan="6" class="no-data">No moderators found.</td></tr>');
            }

            // Display customers data in table rows
            if (data.customers && data.customers.length > 0) {
                data.customers.forEach(function (customer) {
                    // Dynamically create table row for each customer and append it
                    $('#customers-list').append(`
                        <tr>
                            <td>${customer.customer_id}</td>
                            <td>${customer.email}</td>
                            <td>${customer.customer_name}</td>
                            <td>${customer.phone_number}</td>
                            <td>${customer.created_at}</td>
                        </tr>
                    `);
                });
            } else {
                // Append message if no customers found
                $('#customers-list').append('<tr><td colspan="4" class="no-data">No customers found.</td></tr>');
            }
        },
        error: function (xhr, status, error) {
            console.error('Error fetching data:', error);
            $('.error-message').text('Failed to fetch data. Error: ' + error);
            console.error('XHR Response:', xhr.responseText);
        }
    });
});
