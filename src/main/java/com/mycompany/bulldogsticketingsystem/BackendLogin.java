/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.bulldogsticketingsystem;

import javax.swing.JOptionPane;
import java.sql.*;

public class BackendLogin {

    static private String email;
    static private char[] password;

    BackendLogin(String email, char[] password) {
        this.email = email;
        this.password = password;
    }

    public static boolean dbconnectmethod() {
        String url = "jdbc:mysql://localhost:3306/ticket?zeroDateTimeBehavior=CONVERT_TO_NULL";
        String username = "root";
        String pass = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(url, username, pass);
            String passwordString = new String(password);

            if (email.contains("@students")) {
                String query = "SELECT * FROM studentlogin WHERE NU_Email = ?";
                PreparedStatement statement = connection.prepareStatement(query);
                statement.setString(1, email);
                ResultSet resultSet = statement.executeQuery();

                if (resultSet.next()) {
                    if (resultSet.getString("NU_Password").equals(passwordString)) {
                        JOptionPane.showMessageDialog(null, "Welcome Student");
                        new StudentDashboard(email).setVisible(true);
                    } else {
                        JOptionPane.showMessageDialog(null, "Invalid Password");
                    }
                } else {
                    query = "INSERT INTO studentlogin (NU_Email, NU_Password) VALUES (?, ?)";
                    statement = connection.prepareStatement(query);
                    statement.setString(1, email);
                    statement.setString(2, passwordString);
                    statement.executeUpdate();
                    JOptionPane.showMessageDialog(null, "Welcome New Student");
                    new StudentDashboard(email).setVisible(true);
                    return true;
                }
            } else if (email.contains("@admin")) {
                String query = "SELECT * FROM adminlogin WHERE admin_email = ?";
                PreparedStatement statement = connection.prepareStatement(query);
                statement.setString(1, email);
                ResultSet resultSet = statement.executeQuery();

                if (resultSet.next()) {
                    if (resultSet.getString("admin_password").equals(passwordString)) {
                        JOptionPane.showMessageDialog(null, "Welcome Admin");
                        new AdminDashboard().setVisible(true);
                    } else {
                        JOptionPane.showMessageDialog(null, "Invalid Password");
                    }
                } else {
                    query = "INSERT INTO adminlogin (admin_email, admin_password) VALUES (?, ?)";
                    statement = connection.prepareStatement(query);
                    statement.setString(1, email);
                    statement.setString(2, passwordString);
                    statement.executeUpdate();
                    JOptionPane.showMessageDialog(null, "Welcome New Admin");
                    new AdminDashboard().setVisible(true);
                    return true;
                }
            } else {
                JOptionPane.showMessageDialog(null, "Invalid Email");
            }

            connection.close();

        } catch (ClassNotFoundException | SQLException e) {
            JOptionPane.showMessageDialog(null, "Failed to connect to database");
        }

        return false;
    }

}
