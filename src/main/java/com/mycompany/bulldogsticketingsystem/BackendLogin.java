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
        
        
    public static void dbconnectmethod(){
         String url = "jdbc:mysql://localhost:3306/ticket?zeroDateTimeBehavior=CONVERT_TO_NULL";
         String username = "root";
         String pass = "";
        
        
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(url, username, pass);
            JOptionPane.showMessageDialog(null, "Online");
            String passwordString = new String(password);
            
            if(email.contains("@students")){
                String query = "SELECT * FROM studentlogin WHERE NU_Email = ? AND NU_Password = ?";
                PreparedStatement statement = connection.prepareStatement(query);
                statement.setString(1, email);
                statement.setString(2, new String(password));
                ResultSet resultSet = statement.executeQuery();
                
                if(resultSet.next()){
                    JOptionPane.showMessageDialog(null, "Welcome Student");
                    
                    // open STUDENT DASHBOARD FRAME
                } else {
                    JOptionPane.showMessageDialog(null, "Invalid Email or Password/ No Account Found");
                }
            } else if(passwordString.contains("admin")){
                String query = "SELECT * FROM adminlogin WHERE admin_email = ? AND admin_password = ?";
                PreparedStatement statement = connection.prepareStatement(query);
                statement.setString(1, email);
                statement.setString(2, new String(password));
                ResultSet resultSet = statement.executeQuery();
                
                if(resultSet.next()){
                    JOptionPane.showMessageDialog(null, "Welcome Admin");
                    
                    // open ADMIN DASHBOARD FRAME 
                } else {
                    JOptionPane.showMessageDialog(null, "Invalid Email or Password");
                }
            } else{
                JOptionPane.showMessageDialog(null, "No Account Found");
            }
            
            connection.close();
            
            
        } catch (ClassNotFoundException | SQLException e){
              JOptionPane.showMessageDialog(null, "Failed to connect to database");
        }
 }
    
    
}
