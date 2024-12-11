<%-- 
    Document   : add_show_time
    Created on : Dec 11, 2024, 1:23:56 PM
    Author     : Himantha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.abc.cinema.models.Movie" %>

<%
    // No need to redeclare the 'session' object as it is implicitly available in JSP
    HttpSession adminSession = request.getSession(false);

    if (adminSession == null || adminSession.getAttribute("admin_email") == null) {
        response.sendRedirect("/abc-cinema/admin_login.jsp");
        return;  // Ensures the page doesn't continue rendering
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css" />
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css" />

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>
    <body>

        <form action="/abc-cinema/Admin/addShowTime" method="post">
            <label for="movieId">Movie ID:</label>
            <select id="movie_id" name="movie_id" required>

            </select><br>

            <label for="complexId">Complex:</label>
            <select id="complex_id" name="complex_id" required>
                <option value="">Select a Cinema Complex</option>
                <option value="1">ABC Cinema Multiplex Colombo City Centre</option>
                <option value="2">ABC Cinema Multiplex One Galle Face Mall</option>
                <option value="3">ABC Cinema Multiplex Havelock City Mall</option>
                <option value="4">ABC Cinema Multiplex Kandy City Centre</option>
            </select><br>

            <label for="hallId">Hall:</label>
            <select id="hall_id" name="hall_id" required>
                <option value="">Select a Hall</option>
            </select><br>

            <label for="startTime">Start Time:</label>
            <input type="text" id="start_time" name="start_time" required><br>

            <label for="date">Date:</label>
            <input type="date" id="date" name="date" required><br>

            <button type="submit">Add ShowTime</button>
        </form>

        <!--Dropdow for hall selection-->
        <script>
            // Data for halls corresponding to each cinema complex
            const halls = {
                1: [
                    {value: "1", text: "CCC Hall 1"},
                    {value: "2", text: "CCC Hall 2"}
                ],
                2: [
                    {value: "3", text: "OGF Hall 1"},
                    {value: "4", text: "OGF Hall 2"}
                ],
                3: [
                    {value: "5", text: "HCM Hall 1"},
                    {value: "6", text: "HCM Hall 2"}
                ],
                4: [
                    {value: "7", text: "KCC Hall 1"},
                    {value: "8", text: "KCC Hall 2"}
                ]
            };

            // References to the dropdown elements
            const complexDropdown = document.getElementById("complex_id");
            const hallDropdown = document.getElementById("hall_id");

            // Event listener for cinema complex selection
            complexDropdown.addEventListener("change", () => {
                const selectedComplex = complexDropdown.value;

                // Clear existing options in the hall dropdown
                hallDropdown.innerHTML = '<option value="">Select a Hall</option>';

                // Add new options based on the selected complex
                if (halls[selectedComplex]) {
                    halls[selectedComplex].forEach(hall => {
                        const option = document.createElement("option");
                        option.value = hall.value;
                        option.textContent = hall.text;
                        hallDropdown.appendChild(option);
                    });
                }
            });
        </script>

        <!--Alert-->
        <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
        <script>
            alertify.set('notifier', 'position', 'top-center');
            <% if (request.getAttribute("successMessage") != null) {%>
            alertify.success("<%= request.getAttribute("successMessage")%>");
            <% }%>
        </script>
        <script>
            alertify.set('notifier', 'position', 'top-center');
            <% if (request.getAttribute("errorMessage") != null) {%>
            alertify.error("<%= request.getAttribute("errorMessage")%>");
            <% }%>
        </script>

        <script src="./js/add_show_time.js"></script>

    </body>
</html>
