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
        
        String orderNumber = "ORD" + System.currentTimeMillis();
        String customerName = (String) session.getAttribute("customerName");
        String address = (String) session.getAttribute("address");
        String telephone = request.getParameter("telephone");
        String carModel = request.getParameter("Model");
        String driverName = request.getParameter("driverName");
        String pickupLocation = request.getParameter("pickupLocation");
        String dropLocation = request.getParameter("dropLocation");
        double distance = Double.parseDouble(request.getParameter("distance"));
        String bookingDate = LocalDate.now().toString();
        String bookingTime = LocalTime.now().toString();
        
        
        
     // **Calculate Fare**
        double baseFare = 100; // LKR 100
        double perKmRate = 50; // LKR 50 per km
        double fare = baseFare + (perKmRate * distance);
        
     // **Set Default Status**
        String status = "Pending";  

        Booking booking = new Booking(orderNumber, customerName, address, telephone, carModel, driverName, pickupLocation, dropLocation, distance,fare, bookingDate, bookingTime, status);
        BookingDAO bookingDAO = new BookingDAO();

        if (bookingDAO.addBooking(booking)) {
            request.setAttribute("message", "Booking successful! Your order number is " + orderNumber);
            request.getRequestDispatcher("book_cab.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Booking failed! Please try again.");
            request.getRequestDispatcher("book_cab.jsp").forward(request, response);
        }
    }
}