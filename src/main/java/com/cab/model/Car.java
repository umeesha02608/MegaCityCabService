package com.cab.model;

public class Car {
    private int id;
    private String model;
    private String brand;
    private String plateNumber;
    private String status;
    private int driverId;
    private String driverName;
    
    public Car() {}

    public Car(String model, String brand, String plateNumber, String status, int driverId, String driverName) {
        this.model = model;
        this.brand = brand;
        this.plateNumber = plateNumber;
        this.status = status;
        this.driverId = driverId;
        this.driverName = driverName;
        
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getModel() { return model; }
    public void setModel(String model) { this.model = model; }

    public String getBrand() { return brand; }
    public void setBrand(String brand) { this.brand = brand; }

    public String getPlateNumber() { return plateNumber; }
    public void setPlateNumber(String plateNumber) { this.plateNumber = plateNumber; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    
    public int getDriverId() { return driverId; }
    public void setDriverId(int driverId) { this.driverId = driverId; }
    
    public String getDriverName() { return driverName; }
    public void setDriverName(String driverName) { this.driverName = driverName; }
}