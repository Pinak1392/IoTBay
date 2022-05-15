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


    import javax.servlet.ServletException;

    import javax.servlet.http.HttpServlet;

    import javax.servlet.http.HttpServletRequest;

    import javax.servlet.http.HttpServletResponse;

    import javax.servlet.http.HttpSession;

    import dao.*;

    import java.util.ArrayList;

    import java.util.logging.Level;

    import java.util.logging.Logger;

    import model.*;


//StaffListServlet designed to go to StaffList 
public class StaffListServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        StaffInfoManager manager = (StaffInfoManager) session.getAttribute("staffInfoManager");
        ArrayList<Staff> staffs;
        clear(session);
        
        try {
            staffs = manager.getStaffs();
            session.setAttribute("staffs", staffs);
            // reset staffs attribute so that it comes with the most recent staffs list
            request.getRequestDispatcher("StaffList.jsp").include(request, response);
        } catch (Exception e) {
            Logger.getLogger(StaffListServlet.class.getName()).log(Level.SEVERE, null, e);
            if (e.getMessage().equals("Error: No Staff Accounts!")) {
                session.setAttribute("A_existErr", "Error: No Staff Accounts!");
            } else {
                session.setAttribute("A_existErr", e.getMessage());
            }
            request.getRequestDispatcher("AdminMenu.jsp").include(request, response);
        }
    }
        
    // set ErrorMsg below table in a label
    private void clear(HttpSession session) {
        session.setAttribute("A_existErr", "");
    }    
        
    
    
}
