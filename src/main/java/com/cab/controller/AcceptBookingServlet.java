package com.cab.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.cab.dao.BookingDAO;

@WebServlet("/AcceptBookingServlet")
public class AcceptBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String orderNumber = request.getParameter("orderNumber");
        
        if (orderNumber == null || orderNumber.isEmpty()) {
            request.setAttribute("error", "Invalid order number.");
            request.getRequestDispatcher("driver_bookings.jsp").forward(request, response);
            return;
        }

        BookingDAO bookingDAO = new BookingDAO();

        // Debugging
        System.out.println("Order Number Received: " + orderNumber);

        // Check if booking exists and its current status
        String currentStatus = bookingDAO.getBookingStatus(orderNumber);
        System.out.println("Current Booking Status: " + currentStatus);

        if (currentStatus != null && currentStatus.equals("Pending")) {
            boolean accepted = bookingDAO.acceptBooking(orderNumber);
            if (accepted) {
                response.sendRedirect("DriverBookingsServlet"); // Refresh page after acceptance
            } else {
                request.setAttribute("error", "Failed to accept booking. Please try again.");
                request.getRequestDispatcher("driver_bookings.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("error", "Booking is no longer available.");
            request.getRequestDispatcher("driver_bookings.jsp").forward(request, response);
        }
    }
}
