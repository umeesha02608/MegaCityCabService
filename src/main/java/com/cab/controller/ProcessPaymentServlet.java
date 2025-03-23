package com.cab.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.cab.db.DBConnection;

@WebServlet("/ProcessPaymentServlet")
public class ProcessPaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String orderNumber = request.getParameter("orderNumber");
        String amount = request.getParameter("amount");
        String paymentMethod = request.getParameter("paymentMethod");

        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBConnection.getConnection();
            String sql = "INSERT INTO payments (order_number, amount, payment_method, payment_date) VALUES (?, ?, ?, NOW())";
            ps = conn.prepareStatement(sql);
            ps.setString(1, orderNumber);
            ps.setString(2, amount);
            ps.setString(3, paymentMethod);
            int rows = ps.executeUpdate();

            if (rows > 0) {
                if ("Cash".equals(paymentMethod)) {
                    // Directly redirect to bill download if payment is Cash
                    response.sendRedirect("print_bill.jsp?orderNumber=" + orderNumber);
                } else {
                    // Redirect to card processing page for card payments
                    request.setAttribute("orderNumber", orderNumber);
                    request.setAttribute("amount", amount);
                    request.setAttribute("paymentMethod", paymentMethod);
                    request.getRequestDispatcher("cardPayment.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("errorMessage", "Payment failed. Please try again.");
                request.getRequestDispatcher("payment.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error. Please try again.");
            request.getRequestDispatcher("payment.jsp").forward(request, response);
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
