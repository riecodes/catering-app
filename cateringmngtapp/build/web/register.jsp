<%-- 
    Document   : register
    Created on : Apr 1, 2024, 12:02:44 AM
    Author     : jiann
--%>

<%@ page import="java.util.Date" %>
<%@ page import="cateringdb.CustomerDetails" %>
<%@ page import="cateringdb.CustomerDetails.Venue" %>
<%@ page import="cateringdb.CustomerDetails.NoPax" %>
<%@ page import="cateringdb.CustomerDetails.TimeSlot" %>
<%@ page import="cateringdb.CustomerDetails.PackageType" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.ParseException" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Confirmation</title>
    <style>
        /* Add CSS styles for the navigation bar */
        nav {
            background-color: #333;
            overflow: hidden;
        }
        nav a {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 14px 20px;
            text-decoration: none;
        }
        nav a:hover {
            background-color: #ddd;
            color: black;
        }
    </style>
</head>
<body>
    <!-- Navigation bar -->
    <nav>
        <a href="index.jsp">Home</a>
        <a href="login.jsp">Login</a>
        <!-- Add links to other pages as needed -->
    </nav>
    
    <h2>Registration Confirmation</h2>
    
    <%
        // Retrieve form data
        String name = request.getParameter("name");
        long number = Long.parseLong(request.getParameter("number"));
        String email = request.getParameter("email");
        Venue venue = Venue.valueOf(request.getParameter("venue"));
        NoPax noPax = NoPax.valueOf(request.getParameter("noPax"));
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = sdf.parse(request.getParameter("date"));
        TimeSlot time = TimeSlot.valueOf(request.getParameter("time"));
        PackageType ptype = PackageType.valueOf(request.getParameter("ptype"));

        // Create a CustomerDetails object and call the registerCustomer method
        CustomerDetails customer = new CustomerDetails();
        int registrationResult = customer.registerCustomer(name, number, email, venue, noPax, date, time, ptype);

        // Check registration result and handle accordingly
        if (registrationResult == 1) {
            // Registration successful, redirect to login page
            response.sendRedirect("login.jsp");
        } else {
            // Registration failed
            out.println("<h2>Registration Failed!</h2>");
            out.println("<p>Failed to register your profile. Please try again.</p>");
        }
    %>

</body>
</html>


