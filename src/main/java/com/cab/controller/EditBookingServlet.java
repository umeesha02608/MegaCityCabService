package com.cab.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.cab.dao.BookingDAO;
import com.cab.model.Booking;

@WebServlet("/EditBookingServlet")
public class EditBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String orderNumber = request.getParameter("orderNumber");
            BookingDAO bookingDAO = new BookingDAO();
            Booking booking = bookingDAO.getBookingByOrderNumber(orderNumber);

            if (booking != null) {
                request.setAttribute("booking", booking);
                request.getRequestDispatcher("edit_booking.jsp").forward(request, response);
            } else {
                response.sendRedirect("admin_bookings.jsp?error=Booking not found");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin_bookings.jsp?error=An error occurred");
        }
    }
}
