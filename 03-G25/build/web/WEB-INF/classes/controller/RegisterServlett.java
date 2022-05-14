/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;

import java.sql.Connection;

import java.sql.SQLException;

import java.util.logging.Level;

import java.util.logging.Logger;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;

import dao.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import model.User;

/**
 *
 * @author limay
 */
public class RegisterServlett extends HttpServlet {
    private DBConnector db;

    private UserManager manager;

    private Connection conn;
    
    private HttpSession session;



    @Override //Create and instance of DBConnector for the deployment session
    public void init() {

        try {

            db = new DBConnector();

        } catch (ClassNotFoundException | SQLException ex) {

            Logger.getLogger(ConnServlet.class.getName()).log(Level.SEVERE, null, ex);

        }      

    }



    @Override //Add the DBConnector, DBManager, Connection instances to the session
    protected void doPost(HttpServletRequest request, HttpServletResponse response)

            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");       

        session = request.getSession();

        conn = db.openConnection();       
        
        try {

            manager = new UserManager(conn);

        } catch (SQLException ex) {

            Logger.getLogger(ConnServlet.class.getName()).log(Level.SEVERE, null, ex);

        }

        //export the DB manager to the view-session (JSPs)
        session.setAttribute("Umanager", manager);
        
        response.sendRedirect("Register.jsp");

    }   



    @Override //Destroy the servlet and release the resources of the application (terminate also the db connection)
     public void destroy() {

        try {
            session = null;
            db.closeConnection();

        } catch (SQLException ex) {

            Logger.getLogger(ConnServlet.class.getName()).log(Level.SEVERE, null, ex);

        }

    }
    
     public boolean validate(String pattern, String input) {
        Pattern regEx = Pattern.compile(pattern);
        Matcher match = regEx.matcher(input);
        return match.matches();
    }
    
    public User addUser(String fName, String lName, String password, String email, int phoneNo, String dob, boolean isCustomer){
        Boolean invalid = false;
        
        if(!validate("^[A-Z][a-zA-Z ]+[A-Z][a-zA-Z]+$",fName + ' ' + lName)){
            invalid = true;
            ErrorLogger.addErr("Please use a real name");
        }
        
        if(!validate("^[0-9]{10}$",Integer.toString(phoneNo))){
            invalid = true;
            ErrorLogger.addErr("Phone number does not fit required length");
        }
        
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
                return manager.addUser(fName, lName, password, email, phoneNo, dob, isCustomer);
            }
            catch(SQLException e){
                Logger.getLogger(UserManagementController.class.getName()).log(Level.SEVERE, null, e);
                ErrorLogger.addErr("The email is already in use");
            }
        }
        
        return null;
    }

}
