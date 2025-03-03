package com.cab.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.cab.dao.BookingDAO;

@WebServlet("/UpdateBookingStatusServlet")
public class UpdateBookingStatusServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderNumber = request.getParameter("orderNumber");
        String status = request.getParameter("status");

        BookingDAO bookingDAO = new BookingDAO();
        boolean isUpdated = bookingDAO.updateBookingStatus(orderNumber, status);

        if (isUpdated) {
            response.sendRedirect("admin_bookings.jsp?msg=Booking Status Updated!");
        } else {
            response.sendRedirect("admin_bookings.jsp?error=Failed to update status.");
        }
    }
}
