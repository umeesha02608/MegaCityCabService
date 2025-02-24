package com.cab.model;

public class Booking {
    private String orderNumber;
    private String customerName;
    private String address;
    private String telephone;
    private String destination;
    private String bookingDate;
    private String bookingTime;

    public Booking(String orderNumber, String customerName, String address, String telephone, String destination, String bookingDate, String bookingTime) {
        this.orderNumber = orderNumber;
        this.customerName = customerName;
        this.address = address;
        this.telephone = telephone;
        this.destination = destination;
        this.bookingDate = bookingDate;
        this.bookingTime = bookingTime;
    }   

    public String getOrderNumber() { return orderNumber; }
    public String getCustomerName() { return customerName; }
    public String getAddress() { return address; }
    public String getTelephone() { return telephone; }
    public String getDestination() { return destination; }
    public String getBookingDate() { return bookingDate; }
    public String getBookingTime() { return bookingTime; }
}
