package com.cab.model;


public class Booking {
    private String orderNumber;
    private String customerName;
    private String address;
    private String telephone;
    private String model;  // ✅ Added Car Model
    private String driverName; // ✅ Added Driver Name
    private String pickupLocation;
    private String dropLocation;
    private double distance;
    private double fare;
    private String bookingDate;
    private String bookingTime;  
    private String status;
    
    
    public Booking() {
    }

    // ✅ Constructor including carModel & driverName
    public Booking(String orderNumber, String customerName, String address, String telephone, 
                   String model, String driverName, String pickupLocation, String dropLocation, double distance, 
                   double fare, String bookingDate, String bookingTime, String status) {
        this.orderNumber = orderNumber;
        this.customerName = customerName;
        this.address = address;
        this.telephone = telephone;
        this.model = model;
        this.driverName = driverName;
        this.pickupLocation = pickupLocation;
        this.dropLocation = dropLocation;
        this.distance = distance;
        this.setFare(fare);
        this.bookingDate = bookingDate;
        this.bookingTime = bookingTime;
        this.status = status;
        
    }

    // ✅ Getters and Setters for all fields
    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }


    public String getDriverName() {  // ✅ Getter for Driver Name
        return driverName;
    }

    public void setDriverName(String driverName) {  // ✅ Setter for Driver Name
        this.driverName = driverName;
    }

    public String getPickupLocation() { return pickupLocation; }
    public void setPickupLocation(String pickupLocation) { this.pickupLocation = pickupLocation; }

    public String getDropLocation() { return dropLocation; }
    public void setDropLocation(String dropLocation) { this.dropLocation = dropLocation; }

    public double getDistance() { return distance; }
    public void setDistance(double distance) { this.distance = distance; }
    
    public double getFare() {
		return fare;
	}

	public void setFare(double fare) {
		this.fare = fare;
	}

    public String getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(String bookingDate) {
        this.bookingDate = bookingDate;
    }

    public String getBookingTime() {
        return bookingTime;
    }

    public void setBookingTime(String bookingTime) {
        this.bookingTime = bookingTime;
    }

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	
}
