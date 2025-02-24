package com.cab.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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
        
        String orderNumber = "ORD" + System.currentTimeMillis();  
        String customerName = request.getParameter("customerName");
        String address = request.getParameter("address");
        String telephone = request.getParameter("telephone");
        String destination = request.getParameter("destination");

        // Get current date and time
        String bookingDate = LocalDate.now().toString();
        String bookingTime = LocalTime.now().toString();

        Booking booking = new Booking(orderNumber, customerName, address, telephone, destination, bookingDate, bookingTime);
        BookingDAO bookingDAO = new BookingDAO();

        if (bookingDAO.addBooking(booking)) {
            request.setAttribute("message", "Booking successful! Your order number is " + orderNumber);
            request.setAttribute("orderNumber", orderNumber);
            request.setAttribute("customerName", customerName);
            request.setAttribute("address", address);
            request.setAttribute("telephone", telephone);
            request.setAttribute("destination", destination);
            request.setAttribute("bookingDate", bookingDate);
            request.setAttribute("bookingTime", bookingTime);
            request.getRequestDispatcher("book_cab.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Booking failed! Please try again.");
            request.getRequestDispatcher("book_cab.jsp").forward(request, response);
        }
    }
}