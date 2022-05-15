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
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import model.User;

/**
 *
 * @author limay
 */
public class UpdateServlet extends HttpServlet {
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
        
        session.setAttribute("errors", new ArrayList<String>());
        
        String email = request.getParameter("email");
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String password = request.getParameter("password");
        String phoneNo = request.getParameter("phoneNo");
        String DOB = request.getParameter("DOB");

        
        conn = db.openConnection();       
        
        try {

            manager = new UserManager(conn);

        } catch (SQLException ex) {

            Logger.getLogger(ConnServlet.class.getName()).log(Level.SEVERE, null, ex);

        }

        //export the DB manager to the view-session (JSPs)
        session.setAttribute("Umanager", manager);
        
        try{
            session.setAttribute("user", addUser(fname,lname,password,email,phoneNo,DOB,true));
            request.getRequestDispatcher("UpdateUser.jsp").include(request, response);
        } catch(Exception e){
            request.getRequestDispatcher("UpdateUser.jsp").include(request, response);
        }
    }   



    @Override //Destroy the servlet and release the resources of the application (terminate also the db connection)
     public void destroy() {

        try {
            db.closeConnection();

        } catch (SQLException ex) {

            Logger.getLogger(ConnServlet.class.getName()).log(Level.SEVERE, null, ex);

        }

    }
    
    
    public User addUser(String fName, String lName, String password, String email, String phoneNo, String dob, boolean isCustomer) throws Exception{
        
        Validator v = new Validator();
        Boolean invalid = false;
        ArrayList<String> addErr = (ArrayList<String>)session.getAttribute("errors");
        
        if(!v.validateName(fName,lName)){
            invalid = true;
            addErr.add("Please use a real name");
        }
        
        if(!v.validatePhone(phoneNo)){
            invalid = true;
            addErr.add("Phone number does not fit required length");
        }
        
        if(!v.validateEmail(email)){
            invalid = true;
            addErr.add("Please use a real name");
        }
        
        if(!v.validatePassword(password)){
            invalid = true;
            addErr.add("Password requires an uppercase letter, special character, a number and must be atleast 8 characters long");
        }
        
        if(!invalid){
            try{
                return manager.updateUser(fName, lName, password, email, phoneNo, dob, isCustomer);
            }
            catch(SQLException e){
                Logger.getLogger(UpdateServlet.class.getName()).log(Level.SEVERE, null, e);
                addErr.add("Error updating database");
                session.setAttribute("errors",addErr);
                throw new Exception("Error updating database");
            }
        }
        
        session.setAttribute("errors",addErr);
        throw new Exception("Fields have incorrect information");
    }

}
