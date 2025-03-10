package com.cab.controller;

import java.io.IOException;
import java.sql.Timestamp;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.cab.dao.PaymentDAO;
import com.cab.model.Payment;

@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String orderNumber = request.getParameter("orderNumber");
        double amount = Double.parseDouble(request.getParameter("amount"));
        String paymentMethod = request.getParameter("paymentMethod");

        // Create a Payment object
        Payment payment = new Payment();
        payment.setOrderNumber(orderNumber);
        payment.setAmount(amount);
        payment.setPaymentMethod(paymentMethod);
        payment.setTimestamp(new Timestamp(System.currentTimeMillis()));

        // Save payment to the database
        PaymentDAO paymentDAO = new PaymentDAO();
        boolean isSuccess = paymentDAO.processPayment(payment);

        if (isSuccess) {
            response.sendRedirect("payment_success.jsp");
        } else {
            response.sendRedirect("payment_error.jsp");
        }
    }
}
