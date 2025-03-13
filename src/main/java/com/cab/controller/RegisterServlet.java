package com.cab.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.cab.dao.UsersDAO;
import com.cab.model.Users;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // Get form parameters
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String nic = request.getParameter("nic");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String role = request.getParameter("role");

        // Validate password match
        if (!password.equals(confirmPassword)) {
            response.sendRedirect("register.jsp?error=Passwords do not match!");
            return;
        }

        // Validate NIC format (Sri Lankan NIC Format: Old - 9 digits + 'V' or 'X', New - 12 digits)
        if (!nic.matches("^(?:\\d{9}[VXvx]|\\d{12})$")) {
            response.sendRedirect("register.jsp?error=Invalid NIC format! Use 9 digits + 'V'/'X' or 12 digits.");
            return;
        }

        // Generate a unique registration ID
        String registrationId = UsersDAO.generateRegistrationId();

        // Create a new user object with the generated registration ID
        Users user = new Users(registrationId, name, address, nic, username, password, role);

        // Register the user
        if (UsersDAO.registerUser(user)) {
            response.sendRedirect("login.jsp?message=Registration Successful! Please login.");
        } else {
            response.sendRedirect("register.jsp?error=Registration Failed! Try again.");
        }
    }
}
