package com.cab.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.cab.dao.CarDAO;
import com.cab.dao.UsersDAO;
import com.cab.model.Car;

@WebServlet("/CarServlet")
public class CarServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CarDAO carDAO;

    public void init() {
        carDAO = new CarDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            response.sendRedirect("manage_cars.jsp?error=Invalid action");
            return;
        }

        try {
            if ("add".equals(action)) {
                String model = request.getParameter("model");
                String brand = request.getParameter("brand");
                String plateNumber = request.getParameter("plateNumber");
                int driverId = Integer.parseInt(request.getParameter("driverId"));

                // Fetch driver name from UsersDAO
                UsersDAO usersDAO = new UsersDAO();
                String driverName = usersDAO.getDriverNameById(driverId);

                Car car = new Car(model, brand, plateNumber, "Available", driverId, driverName);
                carDAO.addCar(car);

                response.sendRedirect("manage_cars.jsp?success=Car added successfully");

            } else if ("edit".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                String model = request.getParameter("model");
                String brand = request.getParameter("brand");
                String plateNumber = request.getParameter("plateNumber");
                String status = request.getParameter("status");
                int driverId = Integer.parseInt(request.getParameter("driverId"));

                // Fetch driver name
                UsersDAO usersDAO = new UsersDAO();
                String driverName = usersDAO.getDriverNameById(driverId);

                Car car = new Car(model, brand, plateNumber, status, driverId, driverName);
                car.setId(id);

                if (carDAO.updateCar(car)) {
                    response.sendRedirect("manage_cars.jsp?success=Car updated successfully");
                } else {
                    response.sendRedirect("manage_cars.jsp?error=Error updating car");
                }
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("manage_cars.jsp?error=Invalid input format");
        } catch (Exception e) {
            response.sendRedirect("manage_cars.jsp?error=An unexpected error occurred");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");

        if (id != null) {
            try {
                int carId = Integer.parseInt(id);
                carDAO.deleteCar(carId);
                response.sendRedirect("manage_cars.jsp"); // Redirect after deletion
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
    }
}
