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


@WebServlet("/DriverBookingsServlet")
public class DriverBookingsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String driverName = (String) session.getAttribute("username"); // Assuming driver logs in with their username

        if (driverName != null) {
            BookingDAO bookingDAO = new BookingDAO();
            List<Booking> driverBookings = bookingDAO.getBookingsByDriver(driverName);
            request.setAttribute("driverBookings", driverBookings);
            request.getRequestDispatcher("/driver_bookings.jsp").forward(request, response);
        } else {
            response.sendRedirect("login.jsp"); // Redirect if not logged in
        }
    }
}