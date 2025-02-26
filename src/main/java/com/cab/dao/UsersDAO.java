package com.cab.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.cab.db.DBConnection;
import com.cab.model.User;
import com.cab.model.Users;

public class UsersDAO {
    // Register a new user
    public static boolean registerUser(Users user) {
        boolean status = false;
        try (Connection conn = DBConnection.getConnection()) {
            String query = "INSERT INTO users (registration_id, name, address, nic, username, password, role) VALUES ( ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, user.getRegistrationId());
            ps.setString(2, user.getName());
            ps.setString(3, user.getAddress());
            ps.setString(4, user.getNic());
            ps.setString(5, user.getUsername());
            ps.setString(6, user.getPassword());
            ps.setString(7, user.getRole());

            status = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
    
    // Get all users
    public List<Users> getAllUsers() {
        List<Users> usersList = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection()) {
            String query = "SELECT * FROM users";
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Users user = new Users(
                    rs.getString("registration_id"),
                    rs.getString("name"),
                    rs.getString("address"),
                    rs.getString("nic"),
                    rs.getString("username"),
                    rs.getString("password"),
                    rs.getString("role")
                );
                user.setId(rs.getInt("id"));
                usersList.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return usersList;
    }
    
    // Update user details
    public boolean updateUser(Users user) {
        boolean status = false;
        try (Connection conn = DBConnection.getConnection()) {
            String query = "UPDATE users SET registration_id=?, name=?, address=?, nic=?, username=?, password=?, role=? WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, user.getRegistrationId());
            ps.setString(2, user.getName());
            ps.setString(3, user.getAddress());
            ps.setString(4, user.getNic());
            ps.setString(5, user.getUsername());
            ps.setString(6, user.getPassword());
            ps.setString(7, user.getRole());
            ps.setInt(8, user.getId());

            status = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
    
    // Delete user
    public boolean deleteUser(int userId) {
        boolean status = false;
        try (Connection conn = DBConnection.getConnection()) {
            String query = "DELETE FROM users WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, userId);

            status = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
    
    // Admin adds a new user
    public boolean addUserByAdmin(Users user) {
        return registerUser(user); 
    }
    
    public List<Users> getAllDrivers() {
        List<Users> drivers = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT id, name FROM users WHERE role = 'driver'"; // Fetch name and ID
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Users driver = new Users();
                driver.setId(rs.getInt("id"));
                driver.setName(rs.getString("name"));  // Fetch the driver's name
                drivers.add(driver);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return drivers;
    }
    
    public String getDriverNameById(int driverId) {
        String driverName = null;
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT name FROM users WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, driverId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                driverName = rs.getString("name"); // Fetching driver name
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return driverName;
    }

    
    public Users getUserById(int id) {
        Users user = null;
        try (Connection conn = DBConnection.getConnection()) {
            String query = "SELECT * FROM users WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new Users(
                    rs.getString("registration_id"),
                    rs.getString("name"),
                    rs.getString("address"),
                    rs.getString("nic"),
                    rs.getString("username"),
                    rs.getString("password"),
                    rs.getString("role")
                );
                user.setId(rs.getInt("id"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
}
