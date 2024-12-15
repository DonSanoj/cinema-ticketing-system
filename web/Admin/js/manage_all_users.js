$(document).ready(function () {
    // Fetch moderators and customers data using AJAX
    $.ajax({
        url: '/abc-cinema/Admin/manage_all_users',
        type: 'GET',
        headers: {"X-Requested-With": "XMLHttpRequest"},
        dataType: 'json',
        success: function (data) {
            // Display moderators data
            if (data.moderators && data.moderators.length > 0) {
                data.moderators.forEach(function (admin) {
                    $('#moderators-list').append(`
                    <tr>
                      <td class="px-6 py-4 text-sm font-medium text-gray-900">${admin.admin_id}</td>
                      <td class="px-6 py-4 text-sm font-medium text-gray-900">${admin.admin_email}</td>
                      <td class="px-6 py-4 text-sm text-gray-900">${admin.admin_name}</td>
                      <td class="px-6 py-4 text-sm text-gray-900">${admin.phone_number}</td>
                      <td class="px-6 py-4 text-sm text-gray-900">${admin.admin_type}</td>
                      <td class="px-6 py-4 text-sm text-gray-900">${admin.created_at}</td>
                    </tr>
                    `);
                });
            } else {
                $('#moderators-list').append('<tr><div class="bg-blue-500 text-white p-4">Tailwind Test</div></tr>');
            }

            // Display customers data
            if (data.customers && data.customers.length > 0) {
                data.customers.forEach(function (customer) {
                    $('#customers-list').append(`                    
                        <tr class="divide-y divide-gray-200">
                            <td class="px-6 py-4 text-sm font-medium text-gray-900">${customer.customer_id}</td>
                            <td class="px-6 py-4 text-sm font-medium text-gray-900">${customer.email}</td>
                            <td class="px-6 py-4 text-sm text-gray-900">${customer.customer_name}</td>
                            <td class="px-6 py-4 text-sm text-gray-900">${customer.phone_number}</td>
                            <td class="px-6 py-4 text-sm text-gray-900">${customer.created_at}</td>
                        </tr>
                    `);
                });
            } else {
                $('#customers-list').append('<tr><td colspan="5" class="no-data">No customers found.</td></tr>');
            }
        },
        error: function (xhr, status, error) {
            console.error('Error fetching data:', error);
            $('.error-message').text('Failed to fetch data. Error: ' + error);
        }
    });
});
