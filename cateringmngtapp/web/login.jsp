<%-- 
    Document   : login
    Created on : Apr 1, 2024, 12:55:45 AM
    Author     : jiann
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, cateringdb.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="cateringdb.CustomerDetails" %>
<%@ page import="cateringdb.CustomerProfile" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
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

    <a href="viewProfiles.jsp">View Profiles</a><br>
    <a href="editProfile.jsp">Edit Profile</a><br>
    <a href="deleteProfile.jsp">Delete Profile</a><br>

    <h2>Select Profile:</h2>
    <form action="bookingForm.jsp" method="get">
        <select name="customerId" id="customerId">
            <option value="">Select Profile</option>
            <%
                // Retrieve profiles from the database and display as options in the dropdown menu
                CustomerDetails cd = new CustomerDetails();
                ArrayList<CustomerProfile> profiles = cd.getAllProfiles(); 
                for (CustomerProfile profile : profiles) { 
            %>
                <option value="<%= profile.getCustomerId() %>"><%= profile.getName() %></option>
            <% } %>
        </select>
        <br><br>
        <input type="submit" value="Proceed to Booking">
    </form>
</body>
</html>


