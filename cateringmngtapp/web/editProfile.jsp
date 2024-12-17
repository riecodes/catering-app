<%-- 
    Document   : editProfile
    Created on : Apr 1, 2024, 1:08:16 AM
    Author     : jiann
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="cateringdb.CustomerDetails" %>
<%@ page import="cateringdb.CustomerProfile" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile</title>
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
    <h2>Edit Profile</h2>
    <form action="updateProfile.jsp" method="post">
        <label for="profile">Select Profile:</label>
        <select name="profileId" id="profile">
            <% 
                // Instantiate CustomerDetails class
                CustomerDetails cd = new CustomerDetails();
                // Retrieve profiles from the database and display as options in the dropdown menu
                ArrayList<CustomerProfile> profiles = cd.getAllProfiles();
                for (CustomerProfile profile : profiles) { 
            %>
                <option value="<%= profile.getCustomerId() %>"><%= profile.getName() %></option>
            <% } %>
        </select>
        <br><br>
        <!-- Input fields to edit profile details -->
        <!-- You can populate these fields with the selected profile details using JavaScript -->
        <label for="name">Name:</label>
        <input type="text" id="name" name="name">
        <br><br>
        <label for="number">Number:</label>
        <input type="text" id="number" name="number">
        <br><br>
        <label for="email">Email:</label>
        <input type="email" id="email" name="email">
        <br><br>
        <input type="submit" value="Save Changes">
    </form>
</body>
</html>


