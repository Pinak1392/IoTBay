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
public class LogoutServlet extends HttpServlet {
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)

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
        
        User u = (User)session.getAttribute("user");

        try{
            manager.deactivateUser(u.getEmail());
            session.setAttribute("user", null);
            
        } catch (Exception ex) {

            Logger.getLogger(ConnServlet.class.getName()).log(Level.SEVERE, null, ex);

        }
        
        request.getRequestDispatcher("index.jsp").include(request, response);
    }   



    @Override //Destroy the servlet and release the resources of the application (terminate also the db connection)
     public void destroy() {
         
        try {
            db.closeConnection();

        } catch (SQLException ex) {

            Logger.getLogger(ConnServlet.class.getName()).log(Level.SEVERE, null, ex);

        }

    }
    
    

}
