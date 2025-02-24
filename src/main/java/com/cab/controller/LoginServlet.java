package com.cab.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.cab.dao.UserDAO;
import com.cab.model.User;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        HttpSession session = request.getSession(); 
        
        if (username.equals("admin") && password.equals("admin123")) {
            
            session.setAttribute("user", "admin");
            session.setAttribute("role", "admin");
            response.sendRedirect("admin_dashboard.jsp");
        } else {
            
            UserDAO userDAO = new UserDAO();
            User user = userDAO.validateUser(username, password);

            if (user != null) {
                session.setAttribute("user", user.getUsername());
                session.setAttribute("role", user.getRole());

                
                if (user.getRole().equals("customer")) {
                    response.sendRedirect("customer_dashboard.jsp");
                } else if (user.getRole().equals("driver")) {
                    response.sendRedirect("driver_dashboard.jsp");
                }
            } else {
                
                response.sendRedirect("login.jsp?error=Invalid Credentials!");
            }
        }
    }
}
