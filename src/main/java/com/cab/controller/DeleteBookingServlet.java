package com.cab.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.cab.dao.BookingDAO;

@WebServlet("/DeleteBookingServlet")
public class DeleteBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderNumber = request.getParameter("orderNumber");

        BookingDAO bookingDAO = new BookingDAO();
        boolean isDeleted = bookingDAO.deleteBooking(orderNumber);

        if (isDeleted) {
            response.sendRedirect("admin_bookings.jsp?msg=Booking Deleted!");
        } else {
            response.sendRedirect("admin_bookings.jsp?error=Failed to delete booking.");
        }
    }
}