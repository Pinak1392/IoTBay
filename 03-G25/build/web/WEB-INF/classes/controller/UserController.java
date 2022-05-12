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
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import model.User;

/**
 *
 * @author limay
 */
<<<<<<< HEAD:03-G25/src/java/controller/UserManagementController.java
public class UserManagementController {
 
=======
public class UserController {
    public static User activeUser;
    
>>>>>>> 26b8ce77c7761b7e5d936b1f723dc1bbd1ad01ff:03-G25/build/web/WEB-INF/classes/controller/UserController.java
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
            
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    public User setUser(String email, String password) throws Exception{
        try{
            return db.setUser(email, password);
        } catch(Exception e){
            if(e instanceof SQLException){
<<<<<<< HEAD:03-G25/src/java/controller/UserManagementController.java
                Logger.getLogger(UserManagementController.class.getName()).log(Level.SEVERE, null, e);
                return null;
=======
                Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, e);
                return;
>>>>>>> 26b8ce77c7761b7e5d936b1f723dc1bbd1ad01ff:03-G25/build/web/WEB-INF/classes/controller/UserController.java
            }
            
            ErrorLogger.addErr(e.getMessage());
        }
        
        return null;
    }
    
    public boolean validate(String pattern, String input) {
        Pattern regEx = Pattern.compile(pattern);
        Matcher match = regEx.matcher(input);
        return match.matches();
    }
    
    public void addUser(String fName, String lName, String password, String email, int phoneNo, String dob, boolean isCustomer){
        Boolean invalid = false;
        
        if(!validate("^[A-Z][a-zA-Z ]+[A-Z][a-zA-Z]+$",fName + ' ' + lName)){
            invalid = true;
            ErrorLogger.addErr("Please use a real name");
        }
        
        if(!validate("^[0-9]{10}$",Integer.toString(phoneNo))){
            invalid = true;
            ErrorLogger.addErr("Phone number does not fit required length");
        }
<<<<<<< HEAD:03-G25/src/java/controller/UserManagementController.java
        
        if(!validate("([a-zA-Z0-9]+)(([._-])([a-zA-Z0-9]+))(@)([a-z]+)(.)([a-z]{3})((([.])[a-z]{0,2}))",email)){
            invalid = true;
            ErrorLogger.addErr("Please use a real name");
        }
        
        if(!validate("((.[A-Z].[^\\w\\s].[0-9].)|(.[A-Z].[0-9].[^\\w\\s].)|(.[0-9].[A-Z].[^\\w\\s].)|(.[0-9].[^\\w\\s].[A-Z].)|(.[^\\w\\s].[A-Z].[0-9].)|(.[^\\w\\s].[0-9].[A-Z].))",password)){
            invalid = true;
            ErrorLogger.addErr("Password requires an uppercase letter, special character and a number");
        }
        
        if(password.length() < 8){
            ErrorLogger.addErr("Password must be 8 or more characters long");
        }
        
        if(!invalid){
            try{
                db.addUser(fName, lName, password, email, phoneNo, dob, isCustomer);
            }
            catch(SQLException e){
                Logger.getLogger(CustomerInformationManagementController.class.getName()).log(Level.SEVERE, null, e);
                ErrorLogger.addErr("The email is already in use");
            }
=======
        catch(SQLException e){
            Logger.getLogger(CIMController.class.getName()).log(Level.SEVERE, null, e);
>>>>>>> 26b8ce77c7761b7e5d936b1f723dc1bbd1ad01ff:03-G25/build/web/WEB-INF/classes/controller/UserController.java
        }
    }
}
