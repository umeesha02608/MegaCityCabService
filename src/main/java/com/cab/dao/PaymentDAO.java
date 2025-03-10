package com.cab.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.cab.model.Payment;
import com.cab.db.DBConnection;

public class PaymentDAO {
    public boolean processPayment(Payment payment) {
        String sql = "INSERT INTO payments (order_number, amount, payment_method, timestamp) VALUES (?, ?, ?, ?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, payment.getOrderNumber());
            ps.setDouble(2, payment.getAmount());
            ps.setString(3, payment.getPaymentMethod());
            ps.setTimestamp(4, payment.getTimestamp());

            int rowsInserted = ps.executeUpdate();
            return rowsInserted > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
