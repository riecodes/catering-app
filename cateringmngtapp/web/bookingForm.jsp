<%-- 
    Document   : bookingForm
    Created on : Apr 1, 2024, 1:09:04 AM
    Author     : jiann
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, cateringdb.CustomerDetails.Venue, cateringdb.CustomerDetails.NoPax, cateringdb.CustomerDetails.TimeSlot" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Form</title>
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
    <h1>Event Booking Form</h1>
    <form action="bookingConfirmation.jsp" method="post">
        <label for="venue">Venue:</label>
        <select name="venue" id="venue">
            <% for (Venue venue : Venue.values()) { %>
                <option value="<%= venue.name() %>"><%= venue.name() %></option>
            <% } %>
        </select><br><br>

        <label for="noPax">Number of Pax:</label>
        <select name="noPax" id="noPax">
            <% for (NoPax pax : NoPax.values()) { %>
                <option value="<%= pax.value %>"><%= pax.name().replace("_", " ") %></option>
            <% } %>
        </select><br><br>

        <label for="date">Date:</label>
        <input type="date" name="date" id="date"><br><br>

        <label for="time">Time Slot:</label>
        <select name="time" id="time">
            <% for (TimeSlot slot : TimeSlot.values()) { %>
                <option value="<%= slot.name() %>"><%= slot.name().replace("_", " ") %></option>
            <% } %>
        </select><br><br>
        
        <!-- SAMPLE ONLy -->
         <!-- Populate package options dynamically -->
        <label for="package">Package Type:</label>
        <select name="package" id="package">
            <% 
                cateringdb.PackagePrice packagePrice = new cateringdb.PackagePrice();
                ArrayList<cateringdb.PackagePrice.Package> packages = packagePrice.getPackages();
                for (cateringdb.PackagePrice.Package pkg : packages) { 
            %>
            <option value="<%= pkg.getPackageId() %>">
                <%= pkg.getPackageDesc() %> (P<%= pkg.getPricePerHead() %> per head)
            </option>
            <% } %>
        </select><br><br>

        <!-- Add more fields as needed -->
        
        <input type="submit" name="action" value="Continue Booking">
        <input type="submit" name="action" value="Cancel Booking">
    </form>
</body>
</html>

