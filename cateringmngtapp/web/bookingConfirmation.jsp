<%-- 
    Document   : bookingConfirmation
    Created on : Apr 1, 2024, 2:15:17 AM
    Author     : jiann
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, cateringdb.MenuDetails.PackageType" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Confirmation</title>
</head>
<body>
    <h1>Booking Confirmation</h1>
    <p>Your booking details:</p>
    <ul>
        <li>Venue: <%= request.getParameter("venue") %></li>
        <li>Number of Pax: <%= request.getParameter("noPax") %></li>
        <li>Date: <%= request.getParameter("date") %></li>
        <li>Time Slot: <%= request.getParameter("time") %></li>
        <li>Package Type: <%= getPackageDetails(request.getParameter("package")) %></li>
    </ul>

    <!-- Food selection section -->
    <h2>Select Food Items</h2>
    <form action="foodSelection.jsp" method="post">
        <% for (MenuDetails menuItem : menuItems) { %>
        <% if (menuItem.getPackageType().toString().equals(packageType)) { %>
            <% if (packageType.equals("P001")) { %>
                <!-- Render dropdown lists specific to package P001 -->
                <!-- Dropdown list for pasta -->
                <label for="pastaId">Pasta:</label>
                <select name="pastaId" id="pastaId">
                    <%-- Populate dropdown options for pasta based on menu items --%>
                    <% for (MenuDetails item : menuItems) { %>
                        <% if (item.getPackageType() == PackageType.P) { %>
                            <option value="<%= item.getMenuItemId() %>"><%= item.getItemName() %></option>
                        <% } %>
                    <% } %>
                </select><br><br>

                <!-- Dropdown lists for viands -->
                <!-- You can repeat the same pattern for other menu categories -->
                <!-- Example: -->
                <label for="viand1Id">Viand 1:</label>
                <select name="viand1Id" id="viand1Id">
                    <%-- Populate dropdown options for viand 1 based on menu items --%>
                    <% for (MenuDetails item : menuItems) { %>
                        <% if (item.getPackageType() == PackageType.V) { %>
                            <option value="<%= item.getMenuItemId() %>"><%= item.getItemName() %></option>
                        <% } %>
                    <% } %>
                </select><br><br>
                <label for="viand2Id">Viand 2:</label>
                <select name="viand2Id" id="viand2Id">
                    <%-- Populate dropdown options for viand 1 based on menu items --%>
                    <% for (MenuDetails item : menuItems) { %>
                        <% if (item.getPackageType() == PackageType.V) { %>
                            <option value="<%= item.getMenuItemId() %>"><%= item.getItemName() %></option>
                        <% } %>
                    <% } %>
                </select><br><br>
                <label for="viand3Id">Viand 3:</label>
                <select name="viand3Id" id="viand3Id">
                    <%-- Populate dropdown options for viand 1 based on menu items --%>
                    <% for (MenuDetails item : menuItems) { %>
                        <% if (item.getPackageType() == PackageType.V) { %>
                            <option value="<%= item.getMenuItemId() %>"><%= item.getItemName() %></option>
                        <% } %>
                    <% } %>
                </select><br><br>
                <label for="dessertId">Dessert:</label>
                <select name="dessertId" id="dessertId">
                    <%-- Populate dropdown options based on menu items with package type D --%>
                    <% for (MenuDetails item : menuItems) { %>
                        <% if (item.getPackageType() == PackageType.D) { %>
                            <option value="<%= item.getMenuItemId() %>"><%= item.getItemName() %></option>
                        <% } %>
                    <% } %>
                </select><br><br>
        <br>
        <input type="submit" value="Continue">
    </form>

    <!-- Add more booking details or actions as needed -->
</body>
</html>




