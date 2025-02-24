package com.cab.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.cab.db.DBConnection;
import com.cab.model.Booking;

public class BookingDAO {

    public boolean addBooking(Booking booking) {
        String sql = "INSERT INTO booking (order_number, customer_name, address, telephone, destination, booking_date, booking_time) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setString(1, booking.getOrderNumber());
            ps.setString(2, booking.getCustomerName());
            ps.setString(3, booking.getAddress());
            ps.setString(4, booking.getTelephone());
            ps.setString(5, booking.getDestination());
            ps.setString(6, booking.getBookingDate());
            ps.setString(7, booking.getBookingTime());

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Booking> getAllBookings() {
        List<Booking> bookings = new ArrayList<>();
        String sql = "SELECT * FROM booking";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                Booking booking = new Booking(
                    rs.getString("order_number"),
                    rs.getString("customer_name"),
                    rs.getString("address"),
                    rs.getString("telephone"),
                    rs.getString("destination"),
                    rs.getString("booking_date"),
                    rs.getString("booking_time")
                );
                bookings.add(booking);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bookings;
    }
}
