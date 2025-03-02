package com.cab.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.cab.dao.BookingDAO;

@WebServlet("/AcceptBookingServlet")
public class AcceptBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderNumber = request.getParameter("orderNumber");

        if (orderNumber != null && !orderNumber.isEmpty()) {
            BookingDAO bookingDAO = new BookingDAO();
            boolean isUpdated = bookingDAO.updateBookingStatus(orderNumber, "Accepted");

            if (isUpdated) {
                response.sendRedirect("driver_bookings.jsp?msg=Booking Accepted!");
            } else {
                response.sendRedirect("driver_bookings.jsp?error=Failed to accept booking.");
            }
        } else {
            response.sendRedirect("driver_bookings.jsp?error=Invalid Booking.");
        }
    }
}
