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


// CreateStaffServlet used for creating a staff
public class CreateStaffServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Validator validator = new Validator();
        StaffInfoManager manager = (StaffInfoManager) session.getAttribute("staffInfoManager");
        Staff staff = null;
        clear(session);
        
        String email = request.getParameter("email");
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String password = request.getParameter("password");
        String phoneNo = request.getParameter("phoneNo");
        String DOB = request.getParameter("dob");
        String pos = request.getParameter("pos");
        String salary = request.getParameter("salary");
        String empdate = request.getParameter("empdate");
        String perms = request.getParameter("perms");
        
        if (!validator.validateEmail(email)) {
            session.setAttribute("C_emailErr", "Error: Incorrect Email Format!");
            request.getRequestDispatcher("CreateStaff.jsp").include(request, response);
        } 
        else if (!validator.validateName(fname, lname)) {
            session.setAttribute("C_nameErr", "Error: Incorrect Name Format! First letter must be capital letter!");
            request.getRequestDispatcher("CreateStaff.jsp").include(request, response);
        } 
        else if (!validator.validatePassword(password)) {
            session.setAttribute("C_passErr", "Error: Incorrect Password Format! At least one uppercase, one symbol and one number!");
            request.getRequestDispatcher("CreateStaff.jsp").include(request, response);
        }
        else if (!validator.validatePhone(phoneNo)) {
            session.setAttribute("C_phoneErr", "Error: Incorrect Phone Number!");
            request.getRequestDispatcher("CreateStaff.jsp").include(request, response);
        }
        else if (!validator.validateDate(DOB)) {
            session.setAttribute("C_DOBErr", "Error: Incorrect Date Of Birth Format! YYYY-MM-DD!");
            request.getRequestDispatcher("CreateStaff.jsp").include(request, response);
        }
        else if (!validator.validateSalary(salary)) {
            session.setAttribute("C_salaryErr", "Error: Incorrect Salary Amount!");
            request.getRequestDispatcher("CreateStaff.jsp").include(request, response);
        }
        else if (!validator.validateDate(empdate)) {
            session.setAttribute("C_empdateErr", "Error: Incorrect Employee Date Format! YYYY-MM-DD!");
            request.getRequestDispatcher("CreateStaff.jsp").include(request, response);
        }
        else if (!validator.validatePermissions(perms)) {
            session.setAttribute("C_permissionErr", "Error: Incorrect Permission Number!");
            request.getRequestDispatcher("CreateStaff.jsp").include(request, response);
        }
        else {
            try {
                staff = manager.addStaff(email, fname, lname, password, phoneNo, DOB, pos, Integer.parseInt(salary), empdate, perms);
                request.getRequestDispatcher("CreateStaff.jsp").include(request, response);
            } catch (Exception e) {
                Logger.getLogger(CreateStaffServlet.class.getName()).log(Level.SEVERE, null, e);
            }    
        }
    }
        
    // set ErrorMsgs in-built in text-field
    private void clear(HttpSession session) {
        session.setAttribute("C_emailErr", "");
        session.setAttribute("C_nameErr", "");
        session.setAttribute("C_passErr", "");
        session.setAttribute("C_phoneErr", "");
        session.setAttribute("C_DOBErr", "");
        session.setAttribute("C_salaryErr", "");
        session.setAttribute("C_empdateErr", "");
        session.setAttribute("C_permissionErr", "");
    }
    
}
