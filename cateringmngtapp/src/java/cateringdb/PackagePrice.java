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

public class PackagePrice {
    private static final String url = "jdbc:mysql://localhost:3306/cateringdb?zeroDateTimeBehavior=CONVERT_TO_NULL";
    private static final String username = "root";
    private static final String password = "12345678";

    public class Package {
        private String packageId;
        private int pricePerHead;
        private String packageDesc;

        // Constructor
        public Package(String packageId, int pricePerHead, String packageDesc) {
            this.packageId = packageId;
            this.pricePerHead = pricePerHead;
            this.packageDesc = packageDesc;
        }

        // Getters
        public String getPackageId() {
            return packageId;
        }

        public int getPricePerHead() {
            return pricePerHead;
        }

        public String getPackageDesc() {
            return packageDesc;
        }
    }

    public ArrayList<Package> getPackages() {
        ArrayList<Package> packages = new ArrayList<>();

        try (Connection conn = DriverManager.getConnection(url, username, password)) {
            String query = "SELECT * FROM package_price";
            try (PreparedStatement stmt = conn.prepareStatement(query);
                 ResultSet rs = stmt.executeQuery()) {

                while (rs.next()) {
                    String packageId = rs.getString("package_id");
                    int pricePerHead = rs.getInt("price_per_head");
                    String packageDesc = rs.getString("package_desc");

                    Package packageObj = new Package(packageId, pricePerHead, packageDesc);
                    packages.add(packageObj);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return packages;
    }
}

