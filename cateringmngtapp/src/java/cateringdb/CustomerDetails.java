/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author jiann
 */

package cateringdb;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;

public class CustomerDetails {
    private static final String url = "jdbc:mysql://localhost:3306/cateringdb?zeroDateTimeBehavior=CONVERT_TO_NULL"; 
    private static final String username = "root";
    private static final String password = "12345678";

    public enum Venue {
        Caloocan, Malabon, Navotas, Valenzuela, QuezonCity, Marikina, Pasig, Taguig, Makati, Manila, Mandaluyong, SanJuan, Pasay, Parañaque, LasPiñas, Muntinlupa
    }

    public enum NoPax {
    PAX_30("30"),
    PAX_60("60"),
    PAX_80("80"),
    PAX_100("100");

    public final String name;

    NoPax(String name) {
        this.name = name;
    }
}

    public enum TimeSlot {
        TIME_10_00_TO_14_00,
        TIME_17_00_TO_21_00
    }
    
    public enum PackageType {
            P001, P002, P003, P004
        }

    public int customerID;
    public String name;
    public long number;
    public String email;
    public Venue venue;
    public NoPax noPax;
    public Date date;
    public TimeSlot time;
    public PackageType ptype;

    public ArrayList<Integer> customerIDlist = new ArrayList<>();
    public ArrayList<String> namesList = new ArrayList<>();
    public ArrayList<Long>  numbersList = new ArrayList<>();
    public ArrayList<String>  emailsList = new ArrayList<>();
    public ArrayList<Venue> venueList = new ArrayList<>();
    public ArrayList<NoPax> noPaxList = new ArrayList<>();
    public ArrayList<Date> datesList = new ArrayList<>();
    public ArrayList<TimeSlot> timeList = new ArrayList<>();
    public ArrayList<PackageType> ptypeList = new ArrayList<>();

    
    public CustomerDetails() {}

        public int registerCustomer(String name, long number, String email, Venue venue, NoPax noPax, Date date, TimeSlot time, PackageType ptype) {
    try (Connection conn = DriverManager.getConnection(url, username, password)) {
        System.out.println("Connection Successful");

        String sql = "INSERT INTO customer_details (name, number, email, venue, no_pax, date, time, ptype) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, name);
            pstmt.setLong(2, number);
            pstmt.setString(3, email);
            pstmt.setString(4, venue.name());
            pstmt.setString(5, noPax.name());
            pstmt.setDate(6, new java.sql.Date(date.getTime()));
            pstmt.setString(7, time.name());
            pstmt.setString(8, ptype.name());

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Customer registration successful!");
                return 1;
            } else {
                System.out.println("No rows affected. Customer registration failed.");
                return 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error in SQL execution: " + e.getMessage());
            return 0;
        }
    } catch (SQLException e) {
        e.printStackTrace();
        System.out.println("Connection Not Successful: " + e.getMessage());
        return 0;
    }
}



    public int deleteCustomer(int customerID) {
        try (Connection conn = DriverManager.getConnection(url, username, password)) {
            System.out.println("Connection Successful");

            try (PreparedStatement pstmt = conn.prepareStatement("DELETE FROM customer_details WHERE CUSTOMER_ID = ?")) {
                pstmt.setInt(1, customerID);
                int rowsAffected = pstmt.executeUpdate();
                if (rowsAffected > 0) {
                    System.out.println("Customer deleted successfully!");
                    return 1;
                } else {
                    System.out.println("Customer with ID " + customerID + " not found.");
                    return 0;
                }
            }

        } catch (Exception e) {
            System.out.println("Connection Not Successful");
            return 0;
        }
    }

    public int updateCustomerInfo(int customerID, String name, long number, String email, Venue venue, NoPax noPax, Date date, TimeSlot time, PackageType ptype) {
        try (Connection conn = DriverManager.getConnection(url, username, password)) {
            System.out.println("Connection Successful");

            try (PreparedStatement pstmt = conn.prepareStatement("UPDATE customer_details SET NAME = ?, NUMBER = ?, EMAIL = ?, VENUE = ?, NOPAX = ?, DATE = ?, TIME = ?, ptype = ? WHERE CUSTOMER_ID = ?")) {
                pstmt.setString(1, name);
                pstmt.setLong(2, number);
                pstmt.setString(3, email);
                pstmt.setString(4, venue.name());
                pstmt.setString(5, noPax.name);
                pstmt.setDate(6, new java.sql.Date(date.getTime()));
                pstmt.setString(7, time.name()); 
                pstmt.setString(8, ptype.name()); 
                pstmt.setInt(9, customerID);

                int rowsAffected = pstmt.executeUpdate();
                if (rowsAffected > 0) {
                    System.out.println("Customer information updated successfully!");
                    return 1;
                } else {
                    System.out.println("Customer with ID " + customerID + " not found.");
                    return 0;
                }
            }

        } catch (Exception e) {
             e.printStackTrace();
            System.out.println("Connection Not Successful");
            return 0;
        }
    }

    public ArrayList<CustomerProfile> getAllProfiles() {
    ArrayList<CustomerProfile> profiles = new ArrayList<>();

    try (Connection conn = DriverManager.getConnection(url, username, password);
         Statement stmt = conn.createStatement();
         ResultSet rs = stmt.executeQuery("SELECT * FROM customer_details")) {

        while (rs.next()) {
            CustomerProfile profile = new CustomerProfile(
                rs.getInt("CUSTOMER_ID"),
                rs.getString("NAME"),
                rs.getLong("NUMBER"),
                rs.getString("EMAIL"),
                CustomerDetails.Venue.valueOf(rs.getString("VENUE")),
                CustomerDetails.NoPax.valueOf(rs.getString("NO_PAX")),
                rs.getDate("DATE"),
                CustomerDetails.TimeSlot.valueOf(rs.getString("TIME")),
                CustomerDetails.PackageType.valueOf(rs.getString("PTYPE"))
            );
            profiles.add(profile);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return profiles;
}

    // Getters and setters for private fields
    // You should implement these methods to access and modify the private attributes
}


