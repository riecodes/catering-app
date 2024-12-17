/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cateringdb;

/**
 *
 * @author jiann
 */
import java.sql.*;
import java.util.ArrayList;

public class EventDetails {
    private static final String url = "jdbc:mysql://localhost:3306/cateringdb?zeroDateTimeBehavior=CONVERT_TO_NULL";
    private static final String username = "root";
    private static final String password = "12345678";

    public void insertEventDetails(String eventId, String packageId, String appetizerId, String soupId, String pastaId,
                                   String viand1Id, String viand2Id, String viand3Id, String viand4Id, String dessertId) {
        try (Connection conn = DriverManager.getConnection(url, username, password)) {
            String query = "INSERT INTO event_details (event_id, package_id, appetizer_id, soup_id, pasta_id, viand1_id, viand2_id, viand3_id, viand4_id, dessert_id) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement pstmt = conn.prepareStatement(query)) {
                pstmt.setString(1, eventId);
                pstmt.setString(2, packageId);
                pstmt.setString(3, appetizerId);
                pstmt.setString(4, soupId);
                pstmt.setString(5, pastaId);
                pstmt.setString(6, viand1Id);
                pstmt.setString(7, viand2Id);
                pstmt.setString(8, viand3Id);
                pstmt.setString(9, viand4Id);
                pstmt.setString(10, dessertId);

                pstmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<String> getEventDetails(String eventId) {
        ArrayList<String> eventDetails = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(url, username, password)) {
            String query = "SELECT * FROM event_details WHERE event_id = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(query)) {
                pstmt.setString(1, eventId);
                try (ResultSet rs = pstmt.executeQuery()) {
                    while (rs.next()) {
                        eventDetails.add(rs.getString("package_id"));
                        eventDetails.add(rs.getString("appetizer_id"));
                        eventDetails.add(rs.getString("soup_id"));
                        eventDetails.add(rs.getString("pasta_id"));
                        eventDetails.add(rs.getString("viand1_id"));
                        eventDetails.add(rs.getString("viand2_id"));
                        eventDetails.add(rs.getString("viand3_id"));
                        eventDetails.add(rs.getString("viand4_id"));
                        eventDetails.add(rs.getString("dessert_id"));
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return eventDetails;
    }

    public void updateEventDetails(String eventId, String packageId, String appetizerId, String soupId, String pastaId,
                                   String viand1Id, String viand2Id, String viand3Id, String viand4Id, String dessertId) {
        try (Connection conn = DriverManager.getConnection(url, username, password)) {
            String query = "UPDATE event_details SET package_id = ?, appetizer_id = ?, soup_id = ?, pasta_id = ?, " +
                    "viand1_id = ?, viand2_id = ?, viand3_id = ?, viand4_id = ?, dessert_id = ? WHERE event_id = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(query)) {
                pstmt.setString(1, packageId);
                pstmt.setString(2, appetizerId);
                pstmt.setString(3, soupId);
                pstmt.setString(4, pastaId);
                pstmt.setString(5, viand1Id);
                pstmt.setString(6, viand2Id);
                pstmt.setString(7, viand3Id);
                pstmt.setString(8, viand4Id);
                pstmt.setString(9, dessertId);
                pstmt.setString(10, eventId);

                pstmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteEventDetails(String eventId) {
        try (Connection conn = DriverManager.getConnection(url, username, password)) {
            String query = "DELETE FROM event_details WHERE event_id = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(query)) {
                pstmt.setString(1, eventId);
                pstmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
