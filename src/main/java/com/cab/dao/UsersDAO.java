package com.cab.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.cab.db.DBConnection;
import com.cab.model.Users;

public class UsersDAO {
    public static boolean registerUser(Users user) {
        boolean status = false;
        try (Connection conn = DBConnection.getConnection()) {
            String query = "INSERT INTO users (registration_id, name, address, nic, username, password, role) VALUES (?, ?, ?, ?, ?, ?, ?)";
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

    public boolean updateUser(Users user) {
        boolean updated = false;
        try (Connection conn = DBConnection.getConnection()) {
            String query = "UPDATE users SET name=?, address=?, nic=?, username=?, role=? WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, user.getName());
            ps.setString(2, user.getAddress());
            ps.setString(3, user.getNic());
            ps.setString(4, user.getUsername());
            ps.setString(5, user.getRole());
            ps.setInt(6, user.getId());

            updated = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return updated;
    }

    
    public boolean deleteUser(int id) {
        boolean deleted = false;
        try (Connection conn = DBConnection.getConnection()) {
            String query = "DELETE FROM users WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            deleted = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return deleted;
    }

    
}
