package com.cab.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cab.db.DBConnection;
import com.cab.model.Booking;
import com.cab.model.Users;

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
                String status = rs.getString("status");
                if (status == null) {
                    status = "Pending"; // Default to "Pending" if null
                }

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
                    status  // Use the non-null status
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
    
 // Get Booking Status
    public String getBookingStatus(String orderNumber) {
        String status = null;
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement("SELECT status FROM booking WHERE order_number = ?")) {
            ps.setString(1, orderNumber);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                status = rs.getString("status");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }

    // Accept Booking
    public boolean acceptBooking(String orderNumber) {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement("UPDATE booking SET status = 'Accepted' WHERE order_number = ? AND status = 'Pending'")) {
            ps.setString(1, orderNumber);
            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

 // Update booking details
    public boolean updateBooking(Booking booking) {
        boolean updated = false;
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = DBConnection.getConnection();
            String query = "UPDATE booking SET telephone = ?, pickup_location = ?, drop_location = ?, " +
                           "status = ?, fare = ?, distance = ? WHERE order_number = ?";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, booking.getTelephone());
            pstmt.setString(2, booking.getPickupLocation());
            pstmt.setString(3, booking.getDropLocation());
           // pstmt.setString(3, booking.getDriverName());
            pstmt.setString(4, booking.getStatus());
            pstmt.setDouble(5, booking.getFare());
            pstmt.setDouble(6, booking.getDistance());
            pstmt.setString(7, booking.getOrderNumber());

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                updated = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return updated;
    }

    
    public List<Booking> getCustomerDetailsForDriver(String driverName) {
        List<Booking> customers = new ArrayList<>();
        String sql = "SELECT b.customer_name, b.address, b.telephone, " +
                     "b.pickup_location, b.drop_location, b.booking_date, b.booking_time " +
                     "FROM booking b " +
                     "WHERE b.driver_name = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, driverName);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Booking customer = new Booking();
                customer.setCustomerName(rs.getString("customer_name"));  
                customer.setAddress(rs.getString("address"));      
                customer.setTelephone(rs.getString("telephone"));  
                customer.setPickupLocation(rs.getString("pickup_location"));  
                customer.setDropLocation(rs.getString("drop_location"));  
                customer.setBookingDate(rs.getString("booking_date"));  
                customer.setBookingTime(rs.getString("booking_time"));  

                customers.add(customer);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return customers;
    }




}