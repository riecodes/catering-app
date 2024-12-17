<%-- 
    Document   : index
    Created on : Apr 1, 2024, 12:02:01 AM
    Author     : jiann
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="cateringdb.CustomerDetails" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
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
    <h1>Welcome to Catering Service</h1>
    
    <h2>Register Your Profile</h2>
    <form action="register.jsp" method="post">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required><br>
        
        <label for="number">Contact Number:</label>
        <input type="text" id="number" name="number" required><br>
        
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br>
        
        <!-- Additional fields for registration -->
        <label for="venue">Venue:</label>
        <select id="venue" name="venue">
            <% for (CustomerDetails.Venue venue : CustomerDetails.Venue.values()) { %>
                <option value="<%= venue.name() %>"><%= venue.name() %></option>
            <% } %>
        </select><br>
        
        <label for="noPax">Number of Pax:</label>
        <select id="noPax" name="noPax">
            <% for (CustomerDetails.NoPax noPax : CustomerDetails.NoPax.values()) { %>
                <option value="<%= noPax.name() %>"><%= noPax.name() %></option>
            <% } %>
        </select><br>
        
        <label for="date">Date:</label>
        <input type="date" id="date" name="date" required><br>
        
        <label for="time">Time Slot:</label>
        <select id="time" name="time">
            <% for (CustomerDetails.TimeSlot timeSlot : CustomerDetails.TimeSlot.values()) { %>
                <option value="<%= timeSlot.name() %>"><%= timeSlot.name() %></option>
            <% } %>
        </select><br>
        
        <label for="ptype">Package Type:</label>
        <select id="ptype" name="ptype">
            <% for (CustomerDetails.PackageType ptype : CustomerDetails.PackageType.values()) { %>
                <option value="<%= ptype.name() %>"><%= ptype.name() %></option>
            <% } %>
        </select><br>
        
        <input type="submit" value="Register">
    </form>
    
    <h2>About Us</h2>
    <p>This is a brief description of our catering service.</p>
    
    <h2>Services</h2>
    <p>Here you can describe the services offered by your catering service.</p>
</body>
</html>


