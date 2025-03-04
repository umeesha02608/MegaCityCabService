package com.cab.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;

import com.cab.dao.BookingDAO;
import com.cab.model.Booking;

@WebServlet("/BookCabServlet")
public class BookCabServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        
        // Fetch session data & check if user is logged in
        String customerName = (String) session.getAttribute("customerName");
        String address = (String) session.getAttribute("address");

        if (customerName == null || address == null) {
            response.sendRedirect("login.jsp"); // Redirect to login page
            return;
        }

        String orderNumber = "ORD" + System.currentTimeMillis();
        String telephone = request.getParameter("telephone");
        String carModel = request.getParameter("Model");
        String driverName = request.getParameter("driverName");
        String pickupLocation = request.getParameter("pickupLocation");
        String dropLocation = request.getParameter("dropLocation");

        double distance = 0.0;
        try {
            distance = Double.parseDouble(request.getParameter("distance"));
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid distance value!");
            request.getRequestDispatcher("book_cab.jsp").forward(request, response);
            return;
        }

        // Get booking date & time from user input
        String bookingDate = request.getParameter("bookingDate");
        String bookingTime = request.getParameter("bookingTime");

        // Ensure date & time are provided
        if (bookingDate == null || bookingTime == null || bookingDate.isEmpty() || bookingTime.isEmpty()) {
            request.setAttribute("error", "Please select a booking date and time.");
            request.getRequestDispatcher("book_cab.jsp").forward(request, response);
            return;
        }

        // Calculate Fare
        double baseFare = 100;
        double perKmRate = 50;
        double fare = baseFare + (perKmRate * distance);

        // Set default status
        String status = "Pending";

        // Create Booking Object
        Booking booking = new Booking(orderNumber, customerName, address, telephone, carModel, driverName, 
                                      pickupLocation, dropLocation, distance, fare, bookingDate, bookingTime, status);
        BookingDAO bookingDAO = new BookingDAO();

        // Save booking to DB
        if (bookingDAO.addBooking(booking)) {
            request.setAttribute("message", "Booking successful! Your order number is " + orderNumber);
        } else {
            request.setAttribute("error", "Booking failed! Please try again.");
        }

        request.getRequestDispatcher("book_cab.jsp").forward(request, response);
    }
}
