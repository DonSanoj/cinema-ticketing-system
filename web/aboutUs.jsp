<%-- 
    Document   : aboutUs
    Created on : Nov 25, 2024, 4:30:26 PM
    Author     : Pamith
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%@include file="./components/header.jsp" %>

        <section class="bg-white py-16">
            <div class="container mx-auto flex flex-col md:flex-row items-center">
                <div class="md:w-1/2 space-y-4 pr-6">
                    <h2 class="text-4xl font-bold text-gray-900 mb-4">Our Story</h2>
                    <p class="leading-relaxed">
                        Launched in 2015, ABC Cinema is South Asia’s premier online film ticket booking platform, with a strong presence across the region. Supported by a comprehensive range of tailored marketing, data insights, and customer-focused solutions, ABC Cinema partners with over 500 theaters and serves millions of moviegoers nationwide.
                    </p>
                    <p class="leading-relaxed">
                        With more than 1,000 movies screened every month and new releases added regularly, ABC Cinema is dedicated to offering a seamless and diverse booking experience. We cater to a wide range of cinema preferences, providing everything from blockbuster films to independent movies, ensuring an exceptional cinematic experience for all.
                    </p>
                </div>
                <div class="md:w-1/2 mt-8 md:mt-0">
                    <img src="./assets/img/Side Image.png" alt="Cinema Image" class="rounded-lg shadow-lg">
                </div>
            </div>
        </section>

        <%@include file="./components/footer.jsp" %>

    </body>
</html>
