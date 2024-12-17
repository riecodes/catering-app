<%-- 
    Document   : deleteProfileAction
    Created on : Apr 1, 2024, 1:28:28 PM
    Author     : jiann
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="cateringdb.CustomerDetails" %>

<%
    // Get the customer ID from the request parameter
    String customerId = request.getParameter("customerId");
    
    if (customerId != null && !customerId.isEmpty()) {
        // Parse the customer ID to an integer
        int customerIdInt = Integer.parseInt(customerId);
        
        // Attempt to delete the customer profile
        CustomerDetails cd = new CustomerDetails();
        int result = cd.deleteCustomer(customerIdInt);
        
        if (result == 1) {
            // Customer deleted successfully
            out.println("Customer with ID " + customerId + " has been deleted successfully.");
        } else {
            // Customer deletion failed
            out.println("Failed to delete customer with ID " + customerId + ".");
        }
    } else {
        // Customer ID not provided
        out.println("No customer ID provided for deletion.");
    }
%>
