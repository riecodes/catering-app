<%-- 
    Document   : deleteProfile
    Created on : Apr 1, 2024, 12:56:53 AM
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
    <title>Delete Profile</title>
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
    <h1>Delete Profile</h1>
    
    <table>
        <thead>
            <tr>
                <th>Customer ID</th>
                <th>Name</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% 
                // Retrieve profiles from the database and display as rows in the table
                CustomerDetails cd = new CustomerDetails();
                ArrayList<CustomerProfile> profiles = cd.getAllProfiles(); 
                for (CustomerProfile profile : profiles) { 
            %>
            <tr>
                <td><%= profile.getCustomerId() %></td>
                <td><%= profile.getName() %></td>
                <td>
                    <form action="deleteProfileAction.jsp" method="post">
                        <input type="hidden" name="customerId" value="<%= profile.getCustomerId() %>">
                        <input type="submit" value="Delete">
                    </form>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>
