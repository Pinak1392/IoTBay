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


// Delete StaffServlet used for deleting a staff
public class DeleteStaffServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Validator validator = new Validator();
        StaffInfoManager manager = (StaffInfoManager) session.getAttribute("staffInfoManager");
        clear(session);
        
        String email = request.getParameter("email");
        
        
        if (!validator.validateEmail(email)) {
            session.setAttribute("D_emailErr", "Error: Incorrect Email Format!");
            request.getRequestDispatcher("DeleteStaff.jsp").include(request, response);
        } 
        else {
            try {
                manager.deleteStaff(email);
                request.getRequestDispatcher("DeleteStaff.jsp").include(request, response);
            } catch (Exception e) {
                Logger.getLogger(DeleteStaffServlet.class.getName()).log(Level.SEVERE, null, e);
                if (e.getMessage().equals("Error: Account not found!")) {
                    session.setAttribute("D_email404", "Account not found!");
                }
            }    
        }
    }
        
    // set ErrorMsgs in-built in text-field
    private void clear(HttpSession session) {
        session.setAttribute("D_email404", "");
        session.setAttribute("D_emailErr", "");
    }
    
}

