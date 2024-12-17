<%-- 
    Document   : viewProfiles
    Created on : Apr 1, 2024, 12:56:15 AM
    Author     : jiann
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Profiles</title>
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
    <h1>View Profiles</h1>
    
    <% 
        String url = "jdbc:mysql://localhost:3306/cateringdb?zeroDateTimeBehavior=CONVERT_TO_NULL";
        String username = "root";
        String password = "12345678";
        
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, username, password);
            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT * FROM customer_details");
            
            out.println("<table border='1'>");
            out.println("<tr><th>Name</th><th>Email</th><th>Number</th></tr>");
            while (rs.next()) {
                out.println("<tr>");
                out.println("<td>" + rs.getString("name") + "</td>");
                out.println("<td>" + rs.getString("email") + "</td>");
                out.println("<td>" + rs.getString("number") + "</td>");
                out.println("</tr>");
            }
            out.println("</table>");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (stmt != null) stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    %>
</body>
</html>
