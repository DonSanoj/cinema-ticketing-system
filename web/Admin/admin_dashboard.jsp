<%--
    Document   : admin_dashboard
    Created on : Dec 10, 2024, 9:07:02 PM
    Author     : Himantha
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    // No need to redeclare the 'session' object as it is implicitly available in JSP
    HttpSession adminSession = request.getSession(false);

    if (adminSession == null || adminSession.getAttribute("admin_email") == null) {
        response.sendRedirect("/abc-cinema/admin_login.jsp");
        return;  // Ensures the page doesn't continue rendering
    }
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Dashboard</title>
    </head>
    <body>
        
        <%@include file="./components/header.jsp" %>
        
        <p>Email: ${sessionScope.admin_email}</p>
        <p>Admin Type: ${sessionScope.admin_type}</p>
    </body>
</html>
