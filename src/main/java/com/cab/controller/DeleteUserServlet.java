package com.cab.controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.cab.dao.UsersDAO;

@WebServlet("/delete_user")
public class DeleteUserServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        UsersDAO usersDAO = new UsersDAO();
        if (usersDAO.deleteUser(id)) {
            response.sendRedirect("manage_users.jsp");
        } else {
            response.getWriter().write("Error deleting user.");
        }
    }
}