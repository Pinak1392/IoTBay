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

import model.User;

/**
 *
 * @author limay
 */
public class LoginServelet extends HttpServlet {
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");       

        session = request.getSession();
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        conn = db.openConnection();       

        try {

            manager = new UserManager(conn);

        } catch (SQLException ex) {

            Logger.getLogger(ConnServlet.class.getName()).log(Level.SEVERE, null, ex);

        }

        //export the DB manager to the view-session (JSPs)

        session.setAttribute("Umanager", manager);
        
        try{
            
            response.sendRedirect("index.jsp");
        } catch (Exception e){
            response.sendRedirect("Login.jsp");
        }

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
    
    public User setUser(String email, String password){
        try{
            
            return manager.setUser(email, password);
            
        } catch(Exception e){
            if(e instanceof SQLException){
                Logger.getLogger(UserManagementController.class.getName()).log(Level.SEVERE, null, e);
            }
            
            ErrorLogger.addErr(e.getMessage());
        }
        return null;
    }

}
