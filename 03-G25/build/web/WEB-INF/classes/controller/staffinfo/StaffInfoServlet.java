/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.staffinfo;

/**
 *
 * @author Benz Chua Zi Chern 14303489
 */
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

 

   public class StaffInfoServlet extends HttpServlet{

 

       private DBConnector db;

       private StaffInfoManager manager;

       private Connection conn;

       // Create and instance of DBConnector for the deployment session
       @Override 
       public void init() {

           try {

               db = new DBConnector();

           } catch (ClassNotFoundException | SQLException ex) {

               Logger.getLogger(StaffInfoServlet.class.getName()).log(Level.SEVERE, null, ex);

           }      

       }

      

       @Override //Add the DBConnector, StaffInfoManager, Connection instances to the session

       protected void doGet(HttpServletRequest request, HttpServletResponse response)

               throws ServletException, IOException {

           response.setContentType("text/html;charset=UTF-8");       

           HttpSession session = request.getSession();

           conn = db.openConnection();       

           try {

               manager = new StaffInfoManager(conn);

           } catch (SQLException ex) {

               Logger.getLogger(StaffInfoServlet.class.getName()).log(Level.SEVERE, null, ex);

           }

           //export the Staff manager to the view-session (JSPs)

           session.setAttribute("staffInfoManager", manager);           

       }   

        

       @Override //Destroy the servlet and release the resources of the application (terminate also the db connection)

        public void destroy() {

           try {

               db.closeConnection();

           } catch (SQLException ex) {

               Logger.getLogger(StaffInfoServlet.class.getName()).log(Level.SEVERE, null, ex);

           }

       }

   }
        

    
