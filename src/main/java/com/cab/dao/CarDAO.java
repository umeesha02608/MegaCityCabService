package com.cab.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.cab.db.DBConnection;
import com.cab.model.Car;

public class CarDAO {
    
	public void addCar(Car car) {
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO cars (model, brand, plate_number, status, driver_id, driver_name) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, car.getModel());
            ps.setString(2, car.getBrand());
            ps.setString(3, car.getPlateNumber());
            ps.setString(4, car.getStatus());
            ps.setInt(5, car.getDriverId());
            ps.setString(6, car.getDriverName()); // Now inserting the driver name

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Car> getAllCars() {
        List<Car> cars = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM cars";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Car car = new Car();
                car.setId(rs.getInt("id"));
                car.setModel(rs.getString("model"));
                car.setBrand(rs.getString("brand"));
                car.setPlateNumber(rs.getString("plate_number"));
                car.setStatus(rs.getString("status"));
                car.setDriverId(rs.getInt("driver_id"));
                car.setDriverName(rs.getString("driver_name"));
                cars.add(car);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cars;
    }

    public boolean updateCar(Car car) {
        boolean status = false;
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "UPDATE cars SET model=?, brand=?, plate_number=?, status=? WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, car.getModel());
            ps.setString(2, car.getBrand());
            ps.setString(3, car.getPlateNumber());
            ps.setString(4, car.getStatus());
            ps.setInt(5, car.getId());

            status = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public boolean deleteCar(int id) {
        boolean status = false;
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "DELETE FROM cars WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            status = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
    
    public Car getCarById(int id) {
        Car car = null;
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM cars WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                car = new Car();
                car.setId(rs.getInt("id"));
                car.setModel(rs.getString("model"));
                car.setBrand(rs.getString("brand"));
                car.setPlateNumber(rs.getString("plate_number"));
                car.setStatus(rs.getString("status"));
                car.setDriverId(rs.getInt("driver_id"));
                car.setDriverName(rs.getString("driver_name"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return car;
    }

}