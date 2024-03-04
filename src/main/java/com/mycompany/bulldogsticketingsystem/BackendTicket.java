/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.bulldogsticketingsystem;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.swing.JOptionPane;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

class BackendTicket {
    
    String fName;
    String mName;
    String lName;
    String sNum;
    String email;
    String document;
    String purpose;
    String copies;
    String instruction;
    String paymentType;
    String paymentDate;
    double paidTotal;
    String DateTime = getDateandTime();
    byte[] imageDataLOR;
    byte[] imageDataPOP;
    
    
    BackendTicket(String fName, String mName, String lName, String sNum, String email, String document, String purpose, String copies, String Instruction, String paymentType, String paymentDate, Double paidTotal, byte [] imageDataLOR, byte [] imageDataPOP){
        this.fName = fName;
        this.mName = mName;
        this.lName = lName;
        this.sNum = sNum;
        this.email = email;
        this.document = document;
        this.purpose = purpose;
        this.copies = copies;
        this.instruction = Instruction;
        this.paymentType = paymentType;
        this.paymentDate = paymentDate;
        this.paidTotal = paidTotal;
        this.imageDataLOR = imageDataLOR;
        this.imageDataPOP = imageDataPOP;
        
        pushtoDB();
       
    }
    
      void pushtoDB (){
          
          String URL = "jdbc:mysql://localhost:3306/ticket?zeroDateTimeBehavior=CONVERT_TO_NULL";
          String username = "root";
          String password = "";
          
          try{
              Class.forName("com.mysql.cj.jdbc.Driver");
              Connection connect = DriverManager.getConnection(URL, username, password);    
              String sql = "INSERT IGNORE INTO ticketable (ticket_ID, student_Number, first_Name, middle_Name, last_Name, email_Address, document_Type, number_of_Copies, purpose, special_Instruction, type_of_Payment, list_of_Requirements, date_of_Payment, total_amount_Paid, proof_of_Payment, ticket_Status, comments, date_Time) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
              
            PreparedStatement statement = connect.prepareStatement(sql);
            statement.setInt(1, 0);
            statement.setString(2, sNum);
            statement.setString(3, fName);
            statement.setString(4, mName);
            statement.setString(5, lName);
            statement.setString(6, email);
            statement.setString(7, document);
            statement.setString(8, copies);
            statement.setString(9, purpose);
            statement.setString(10, instruction);
            statement.setString(11, paymentType);
           // statement.setBlob(11, new SerialBlob(listOfRequirementData)); // Assuming listOfRequirementData is a byte[]
           statement.setBlob(12, new ByteArrayInputStream(imageDataLOR));
//            statement.setDate(12, java.sql.Date.valueOf(paymentDate));
               statement.setString(13, paymentDate);
            statement.setDouble(14, paidTotal);
           // statement.setBlob(14, new SerialBlob(proofOfPaymentData)); // Assuming proofOfPaymentData is a byte[]
           statement.setBlob(15, new ByteArrayInputStream(imageDataPOP));
            statement.setInt(16, 0); // Assuming ticket_Status default value is 0
            statement.setString(17, null); // Assuming comments default value is null
            statement.setString(18, DateTime);


              int RowsInserted = statement.executeUpdate();
              
              //checker
              if (RowsInserted > 0) {
                JOptionPane.showMessageDialog(null, "Data inserted successfully");
            } else {
                JOptionPane.showMessageDialog(null, "Failed to insert data");
            }

              
          } catch (ClassNotFoundException | SQLException e){
               JOptionPane.showMessageDialog(null, "Failed to insert data: " + e.getMessage());
      }
          
  
    } 
      
      String getDateandTime(){
            LocalDateTime LDT = LocalDateTime.now();
            DateTimeFormatter formattedLDT = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            String LDTquery = formattedLDT.format(LDT);
            System.out.println(LDTquery);
            return LDTquery;
      }
}
