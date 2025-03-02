package com.cab.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.cab.dao.UsersDAO;
import com.cab.model.Users;

@WebServlet("/AddUserServlet")
public class AddUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetching user details from the form
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String nic = request.getParameter("nic");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        // Auto-generate registration ID
        String registrationId = UsersDAO.generateRegistrationId();

        // Create a new user with the generated registration ID
        Users user = new Users(registrationId, name, address, nic, username, password, role);

        // Register user in the database
        boolean isAdded = UsersDAO.registerUser(user);

        // Redirect based on whether the user was added successfully
        if (isAdded) {
            response.sendRedirect("manage_users.jsp?success=User added successfully");
        } else {
            response.sendRedirect("add_user.jsp?error=Failed to add user");
        }
    }
}
