package com.cab.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.cab.dao.BookingDAO;
import com.cab.model.Booking;

@WebServlet("/ViewBookingsServlet")
public class ViewBookingsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String loggedInCustomerName = (String) session.getAttribute("customerName");

        if (loggedInCustomerName == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        BookingDAO bookingDAO = new BookingDAO();
        List<Booking> customerBookings = bookingDAO.getBookingsByCustomer(loggedInCustomerName);

        // Ensure status is not null to prevent NullPointerException
        for (Booking booking : customerBookings) {
            if (booking.getStatus() == null) {
                booking.setStatus("Pending"); // Set a default value if status is null
            }
        }

        request.setAttribute("bookings", customerBookings);
        request.getRequestDispatcher("viewBookings.jsp").forward(request, response);
    }
}
