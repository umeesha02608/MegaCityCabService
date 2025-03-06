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
        BookingDAO bookingDAO = new BookingDAO();

        // Check if the booking is still valid
        String currentStatus = bookingDAO.getBookingStatus(orderNumber);

        if (currentStatus.equals("Pending")) {
            boolean accepted = bookingDAO.acceptBooking(orderNumber);
            if (accepted) {
                request.setAttribute("message", "Booking accepted successfully.");
            } else {
                request.setAttribute("error", "Failed to accept booking. Please try again.");
            }
        } else {
            request.setAttribute("error", "Booking is no longer available.");
        }

        request.getRequestDispatcher("DriverBookingsServlet").forward(request, response);
    }
}
