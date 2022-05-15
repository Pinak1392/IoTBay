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
    import controller.Validator;

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

    import model.*;


// StaffLoginServlet made for Staff & Admin Login
// Redirects Admin to AdminMenu, Staff to StaffMenu
public class StaffLoginServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Validator validator = new Validator();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        StaffInfoManager manager = (StaffInfoManager) session.getAttribute("staffInfoManager");
        Staff staff = null;
        clear(session);
        
        if (!validator.validateEmail(email)) {
            session.setAttribute("L_emailErr", "Error: Incorrect Email Format!");
        } 
        
        if (!validator.validatePassword(password)) {
            session.setAttribute("L_passwordErr", "Error: Incorrect Password Format!");
        }
        
        if ((!validator.validateEmail(email)) || (!validator.validatePassword(password))) {
            request.getRequestDispatcher("StaffLogin.jsp").include(request, response);
        }
        
        if (validator.validateEmail(email) && validator.validatePassword(password)) {
            try {
                staff = manager.findStaff(email, password);
                
                if (staff != null) {
                
                    if (staff.getPermissions().equals("4")) {
                        session.setAttribute("admin", staff);
                        request.getRequestDispatcher("AdminMenu.jsp").include(request, response);
                    } else {
                        session.setAttribute("staff", staff);
                        request.getRequestDispatcher("StaffMenu.jsp").include(request, response);
                    }
                    
                }
                else {
                    session.setAttribute("L_existErr", "Error: Staff Account Not Found!");
                    request.getRequestDispatcher("StaffLogin.jsp").include(request, response);
                }
                
            }  catch (Exception e) {
                session.setAttribute("L_existErr", e.getMessage());
                Logger.getLogger(StaffLoginServlet.class.getName()).log(Level.SEVERE, null, e);
                request.getRequestDispatcher("StaffLogin.jsp").include(request, response);
            }
        }
        
    }
    
    // set ErrorMsgs in-built in text-field
    private void clear(HttpSession session) {
        session.setAttribute("L_emailErr", "Enter Email");
        session.setAttribute("L_passwordErr", "Enter Password");
        session.setAttribute("L_existErr", "");
    }
    
}
