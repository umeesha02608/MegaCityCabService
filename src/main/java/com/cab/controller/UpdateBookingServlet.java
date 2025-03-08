package com.cab.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.cab.dao.BookingDAO;
import com.cab.model.Booking;

@WebServlet("/UpdateBookingServlet")
public class UpdateBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            // Retrieve form data
            String orderNumber = request.getParameter("orderNumber");
            String telephone = request.getParameter("telephone");
            String pickupLocation = request.getParameter("pickupLocation");
            String dropLocation = request.getParameter("dropLocation");
            String driverName = request.getParameter("driverName");
            String status = request.getParameter("status");
            double totalFare = Double.parseDouble(request.getParameter("fare"));
            double distance = Double.parseDouble(request.getParameter("distance"));

            // Create Booking object
            Booking booking = new Booking();
            booking.setOrderNumber(orderNumber);
            booking.setTelephone(telephone);
            booking.setPickupLocation(pickupLocation);
            booking.setDropLocation(dropLocation);
            booking.setDriverName(driverName);
            booking.setStatus(status);
            booking.setFare(totalFare);
            booking.setDistance(distance);

            // Update booking in the database
            BookingDAO bookingDAO = new BookingDAO();
            boolean isUpdated = bookingDAO.updateBooking(booking);

            if (isUpdated) {
                response.sendRedirect("admin_bookings.jsp?success=Booking updated successfully");
            } else {
                response.sendRedirect("admin_bookings.jsp?error=Failed to update booking");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin_bookings.jsp?error=Invalid request");
        }
    }
}
