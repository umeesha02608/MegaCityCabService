package com.cab.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.cab.db.DBConnection;
import com.cab.model.User;

public class UserDAO {
    
    
    public User validateUser(String username, String password) {
        User user = null;
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "SELECT * FROM users WHERE username=? AND password=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setUsername(rs.getString("username"));
                user.setRole(rs.getString("role"));

                
                if (!isUserInUserTable(rs.getString("username"))) {
                    insertIntoUserTable(rs.getString("username"), password, rs.getString("role"));
                }
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    
    private boolean isUserInUserTable(String username) {
        boolean exists = false;
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "SELECT * FROM user WHERE username=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            exists = rs.next(); 
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return exists;
    }

    
    private void insertIntoUserTable(String username, String password, String role) {
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "INSERT INTO user (username, password, role) VALUES (?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);
            stmt.setString(3, role);
            stmt.executeUpdate();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
}