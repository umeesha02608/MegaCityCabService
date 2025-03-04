package com.cab.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.cab.dao.BookingDAO;

@WebServlet("/CancelBookingServlet")
public class CancelBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String orderNumber = request.getParameter("orderNumber");
        BookingDAO bookingDAO = new BookingDAO();

        boolean canceled = bookingDAO.cancelBooking(orderNumber);

        if (canceled) {
            request.setAttribute("message", "Booking canceled successfully.");
        } else {
            request.setAttribute("error", "Failed to cancel booking. Please try again.");
        }

        request.getRequestDispatcher("viewBookings.jsp").forward(request, response);
    }
}
