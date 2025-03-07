package com.cab.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cab.db.DBConnection;
import com.cab.model.Booking;

public class BookingDAO {

    // Method to fetch booking by order number
    public Booking getBookingByOrderNumber(String orderNumber) {
        Booking booking = null;
        String sql = "SELECT * FROM booking WHERE order_number = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, orderNumber);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                booking = new Booking(
                    rs.getString("order_number"),
                    rs.getString("customer_name"),
                    rs.getString("address"),
                    rs.getString("telephone"),
                    rs.getString("model"),
                    rs.getString("driver_name"),
                    rs.getString("pickup_location"),
                    rs.getString("drop_location"),
                    rs.getDouble("distance"),
                    rs.getDouble("fare"),
                    rs.getString("booking_date"),
                    rs.getString("booking_time"),
                    rs.getString("status")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return booking;
    }
    

    // Existing method to add a booking
    public boolean addBooking(Booking booking) {
        boolean success = false;
        String sql = "INSERT INTO booking(order_number, customer_name, address, telephone, model, driver_name, pickup_location, drop_location, distance, fare, booking_date, booking_time, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, booking.getOrderNumber());
            ps.setString(2, booking.getCustomerName());
            ps.setString(3, booking.getAddress());
            ps.setString(4, booking.getTelephone());
            ps.setString(5, booking.getModel());
            ps.setString(6, booking.getDriverName());
            ps.setString(7, booking.getPickupLocation());
            ps.setString(8, booking.getDropLocation());
            ps.setDouble(9, booking.getDistance());
            ps.setDouble(10, booking.getFare());
            ps.setString(11, booking.getBookingDate());
            ps.setString(12, booking.getBookingTime());
            ps.setString(13, booking.getStatus());

            success = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return success;
    }

    // New method to get bookings for a specific customer
    public List<Booking> getBookingsByCustomer(String customerName) {
        List<Booking> bookings = new ArrayList<>();
        String sql = "SELECT * FROM booking WHERE customer_name = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, customerName);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Booking booking = new Booking(
                    rs.getString("order_number"),
                    rs.getString("customer_name"),
                    rs.getString("address"),
                    rs.getString("telephone"),
                    rs.getString("model"),
                    rs.getString("driver_name"),
                    rs.getString("pickup_location"),
                    rs.getString("drop_location"),
                    rs.getDouble("distance"),
                    rs.getDouble("fare"),
                    rs.getString("booking_date"),
                    rs.getString("booking_time"),
                    rs.getString("status")
                );
                bookings.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }
    
 // Fetch bookings assigned to a specific driver
    public List<Booking> getBookingsByDriver(String driverName) {
        List<Booking> bookings = new ArrayList<>();
        String sql = "SELECT * FROM booking WHERE driver_name = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, driverName);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Booking booking = new Booking(
                    rs.getString("order_number"),
                    rs.getString("customer_name"),
                    rs.getString("address"),
                    rs.getString("telephone"),
                    rs.getString("model"),
                    rs.getString("driver_name"),
                    rs.getString("pickup_location"),
                    rs.getString("drop_location"),
                    rs.getDouble("distance"),
                    rs.getDouble("fare"),
                    rs.getString("booking_date"),
                    rs.getString("booking_time"),
                    rs.getString("status")
                );
                bookings.add(booking);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bookings;
    }

    // Update booking status (for Accept functionality)
    public boolean updateBookingStatus(String orderNumber, String status) {
        boolean success = false;
        String sql = "UPDATE booking SET status = ? WHERE order_number = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, status);
            ps.setString(2, orderNumber);

            success = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }
    
    
 // Fetch all bookings
    public List<Booking> getAllBookings() {
        List<Booking> bookings = new ArrayList<>();
        String sql = "SELECT * FROM booking";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                bookings.add(new Booking(
                		 rs.getString("order_number"),
                         rs.getString("customer_name"),
                         rs.getString("address"),
                         rs.getString("telephone"),
                         rs.getString("model"),
                         rs.getString("driver_name"),
                         rs.getString("pickup_location"),
                         rs.getString("drop_location"),
                         rs.getDouble("distance"),
                         rs.getDouble("fare"),
                         rs.getString("booking_date"),
                         rs.getString("booking_time"),
                         rs.getString("status")

                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bookings;
    }

 // Delete a booking
    public boolean deleteBooking(String orderNumber) {
        String sql = "DELETE FROM booking WHERE order_number = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, orderNumber);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean cancelBooking(String orderNumber) {
        boolean success = false;
        String sql = "UPDATE booking SET status = 'Cancelled' WHERE order_number = ? AND status = 'Pending'";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, orderNumber);
            int rowsUpdated = pstmt.executeUpdate();
            success = rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return success;
    }
    
    public String getBookingStatus(String orderNumber) {
        String status = null;
        String sql = "SELECT status FROM booking WHERE order_number = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, orderNumber);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                status = rs.getString("status");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }

    public boolean acceptBooking(String orderNumber) {
        boolean success = false;
        String sql = "UPDATE booking SET status = 'Accepted' WHERE order_number = ? AND status = 'Pending'";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, orderNumber);
            int rowsUpdated = pstmt.executeUpdate();
            success = rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return success;
    }

}