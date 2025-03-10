package com.cab.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.cab.db.DBConnection;
import com.cab.model.Query;

public class QueryDAO {

    public boolean insertQuery(Query query) {
        String sql = "INSERT INTO queries (name, email, subject, message) VALUES (?, ?, ?, ?)";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, query.getName());
            stmt.setString(2, query.getEmail());
            stmt.setString(3, query.getSubject());
            stmt.setString(4, query.getMessage());

            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}