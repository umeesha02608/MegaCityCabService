package com.cab.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.cab.dao.BookingDAO;

@WebServlet("/UpdateRideStatusServlet")
public class UpdateRideStatusServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String orderNumber = request.getParameter("orderNumber");
        String status = request.getParameter("status");

        if (orderNumber != null && !orderNumber.isEmpty() && status != null && !status.isEmpty()) {
            BookingDAO bookingDAO = new BookingDAO();
            boolean isUpdated = bookingDAO.updateBookingStatus(orderNumber, status);

            if (isUpdated) {
                response.sendRedirect("update_ride_status.jsp?success=1");
            } else {
                response.sendRedirect("update_ride_status.jsp?error=1");
            }
        } else {
            response.sendRedirect("update_ride_status.jsp?error=1");
        }
    }
}
