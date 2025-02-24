package com.cab.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.cab.dao.UsersDAO;
import com.cab.model.Users;

@WebServlet("/update_user")
public class UpdateUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String nic = request.getParameter("nic");
        String username = request.getParameter("username");
        String role = request.getParameter("role");

        Users user = new Users();
        user.setId(id);
        user.setName(name);
        user.setAddress(address);
        user.setNic(nic);
        user.setUsername(username);
        user.setRole(role);

        UsersDAO usersDAO = new UsersDAO();
        if (usersDAO.updateUser(user)) {
            response.sendRedirect("manage_users.jsp");
        } else {
            response.getWriter().write("Error updating user.");
        }
    }
}