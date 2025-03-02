package com.cab.model;

public class User {
    private String username;
    private String password;
    private String role;
    private String name;  // ✅ Add this
    private String address;  // ✅ Add this

    // Constructor
    public User(String username, String password, String role, String name, String address) {
        this.username = username;
        this.password = password;
        this.role = role;
        this.name = name;
        this.address = address;
    }

    // Getters
    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getRole() {
        return role;
    }

    public String getName() {   // ✅ Add this method
        return name;
    }

    public String getAddress() {  // ✅ Add this method
        return address;
    }

    // Setters (if needed)
    public void setName(String name) {
        this.name = name;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}