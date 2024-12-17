/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cateringdb;

/**
 *
 * @author jiann
 */




import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MenuDetails {
    private static final String url = "jdbc:mysql://localhost:3306/cateringdb?zeroDateTimeBehavior=CONVERT_TO_NULL";
    private static final String username = "root";
    private static final String password = "12345678";

    public enum PackageType {
        A, // Appetizer
        S, // Soup
        P, // Pasta
        V, // Viand
        D // Dessert
    }
    
    private int menuItemId;
    private String itemName;
    private PackageType packageType;
    private String description;

    public MenuDetails(int menuItemId, String itemName, PackageType packageType, String description) {
        this.menuItemId = menuItemId;
        this.itemName = itemName;
        this.packageType = packageType;
        this.description = description;
    }

    public ArrayList<MenuDetails> getMenuItems() {
        ArrayList<MenuDetails> menuItems = new ArrayList<>();

        try (Connection conn = DriverManager.getConnection(url, username, password)) {
            String query = "SELECT * FROM menu_details";
            try (PreparedStatement stmt = conn.prepareStatement(query);
                 ResultSet rs = stmt.executeQuery()) {

                while (rs.next()) {
                    int menuItemId = rs.getInt("menuitem_id");
                    String itemName = rs.getString("item_name");
                    String dbPackageType = rs.getString("package_type"); // Renamed variable
                    String description = rs.getString("description");

                    // Assuming PackageType is an enum
                    PackageType packageTypeEnum = PackageType.valueOf(dbPackageType);

                    MenuDetails menuItem = new MenuDetails(menuItemId, itemName, packageTypeEnum, description);
                    menuItems.add(menuItem);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return menuItems;
    }

    // Getters
    public int getMenuItemId() {
        return menuItemId;
    }

    public String getItemName() {
        return itemName;
    }

    public PackageType getPackageType() {
        return packageType;
    }

    public String getDescription() {
        return description;
    }
}

