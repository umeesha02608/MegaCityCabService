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
        
        // Generate a unique registration ID
        String registrationId = UsersDAO.generateRegistrationId();

        // Create a new user object with the generated registration ID
        Users user = new Users(
            registrationId,  // Use the generated ID
            request.getParameter("name"),
            request.getParameter("address"),
            request.getParameter("nic"),
            request.getParameter("username"),
            request.getParameter("password"),
            request.getParameter("role")
        );

        // Register the user
        if (UsersDAO.registerUser(user)) {
            response.sendRedirect("login.jsp?message=Registration Successful! Please login.");
        } else {
            response.sendRedirect("register.jsp?error=Registration Failed");
        }
    }
}
