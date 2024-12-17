package cateringdb;

import java.util.Date;

public class CustomerProfile {
    private int customerId;
    private String name;
    private long number;
    private String email;
    private CustomerDetails.Venue venue;
    private CustomerDetails.NoPax noPax;
    private Date date;
    private CustomerDetails.TimeSlot timeSlot;
    private CustomerDetails.PackageType packageType;

    // Constructor
    public CustomerProfile(int customerId, String name, long number, String email, 
                           CustomerDetails.Venue venue, CustomerDetails.NoPax noPax, 
                           Date date, CustomerDetails.TimeSlot timeSlot, 
                           CustomerDetails.PackageType packageType) {
        this.customerId = customerId;
        this.name = name;
        this.number = number;
        this.email = email;
        this.venue = venue;
        this.noPax = noPax;
        this.date = date;
        this.timeSlot = timeSlot;
        this.packageType = packageType;
    }

    // Getters and Setters
    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public long getNumber() {
        return number;
    }

    public void setNumber(long number) {
        this.number = number;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public CustomerDetails.Venue getVenue() {
        return venue;
    }

    public void setVenue(CustomerDetails.Venue venue) {
        this.venue = venue;
    }

    public CustomerDetails.NoPax getNoPax() {
        return noPax;
    }

    public void setNoPax(CustomerDetails.NoPax noPax) {
        this.noPax = noPax;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public CustomerDetails.TimeSlot getTimeSlot() {
        return timeSlot;
    }

    public void setTimeSlot(CustomerDetails.TimeSlot timeSlot) {
        this.timeSlot = timeSlot;
    }

    public CustomerDetails.PackageType getPackageType() {
        return packageType;
    }

    public void setPackageType(CustomerDetails.PackageType packageType) {
        this.packageType = packageType;
    }
}
