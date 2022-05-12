/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.DBConnector;
import dao.UserManager;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import controller.ErrorLogger;
import model.User;

/**
 *
 * @author limay
 */
public class UserManagementController {
    public static User activeUser;
    
    private static DBConnector connector;
    private static Connection conn;
    private static UserManager db;
    
    static{
        try{
            connector =new DBConnector();
            conn = connector.openConnection();
            db = new UserManager(conn);
        }
        catch(ClassNotFoundException | SQLException ex){
            connector = null;
            conn = null;
            db = null;
            
            Logger.getLogger(UserManagementController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    public void setUser(String email, String password) throws Exception{
        try{
            db.setUser(email, password);
        } catch(Exception e){
            if(e instanceof SQLException){
                Logger.getLogger(UserManagementController.class.getName()).log(Level.SEVERE, null, e);
                return;
            }
            
            ErrorLogger.addErr(e.getMessage());
        }
    }
    
    public void addUser(String fName, String lName, String password, String email, int phoneNo, String dob, boolean isCustomer){
        try{
            db.addUser(fName, lName, password, email, phoneNo, dob, isCustomer);
        }
        catch(SQLException e){
            Logger.getLogger(CustomerInformationManagementController.class.getName()).log(Level.SEVERE, null, e);
        }
    }
}
