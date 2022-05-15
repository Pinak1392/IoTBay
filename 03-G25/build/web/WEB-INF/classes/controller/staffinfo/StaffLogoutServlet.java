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

    import model.*;


// LogoutStaff
public class StaffLogoutServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
            HttpSession session = request.getSession();
            
            StaffInfoManager manager = (StaffInfoManager) session.getAttribute("staffInfoManager");

            Staff admin = (Staff) session.getAttribute("admin");
            
            try {
                manager.deactivateStaff(admin.getEmail());
            } catch (Exception e) {
                Logger.getLogger(StaffLogoutServlet.class.getName()).log(Level.SEVERE, null, e);
            }

            session.invalidate();

            request.getRequestDispatcher("StaffLogin.jsp").include(request, response);
    }
}
        