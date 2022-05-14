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


// UpdateStaffServlet used for updating a staff
public class UpdateStaffServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Validator validator = new Validator();
        StaffInfoManager manager = (StaffInfoManager) session.getAttribute("staffInfoManager");
        clear(session);
        
        String oldEmail = request.getParameter("email");
        String newEmail = request.getParameter("newEmail");
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String password = request.getParameter("password");
        String phoneNo = request.getParameter("phoneNo");
        String DOB = request.getParameter("dob");
        String pos = request.getParameter("pos");
        String salary = request.getParameter("salary");
        String empdate = request.getParameter("empdate");
        String perms = request.getParameter("perms");
        
        if (!validator.validateEmail(oldEmail)) {
            session.setAttribute("U_oldEmailErr", "Error: Incorrect Email Format!");
            request.getRequestDispatcher("UpdateStaff.jsp").include(request, response);
        } 
        else if (!validator.validateEmail(newEmail)) {
            session.setAttribute("U_newEmailErr", "Error: Incorrect Email Format!");
            request.getRequestDispatcher("UpdateStaff.jsp").include(request, response);
        } 
        else if (!validator.validateName(fname, lname)) {
            session.setAttribute("U_nameErr", "Error: Incorrect Name Format! First letter must be capital letter!");
            request.getRequestDispatcher("UpdateStaff.jsp").include(request, response);
        } 
        else if (!validator.validatePassword(password)) {
            session.setAttribute("U_passErr", "Error: Incorrect Password Format! At least one uppercase, one symbol and one number!");
            request.getRequestDispatcher("UpdateStaff.jsp").include(request, response);
        }
        else if (!validator.validatePhone(phoneNo)) {
            session.setAttribute("U_phoneErr", "Error: Incorrect Phone Number!");
            request.getRequestDispatcher("UpdateStaff.jsp").include(request, response);
        }
        else if (!validator.validateDate(DOB)) {
            session.setAttribute("U_DOBErr", "Error: Incorrect Date Of Birth Format! YYYY-MM-DD!");
            request.getRequestDispatcher("UpdateStaff.jsp").include(request, response);
        }
        else if (!validator.validateSalary(salary)) {
            session.setAttribute("U_salaryErr", "Error: Incorrect Salary Amount!");
            request.getRequestDispatcher("UpdateStaff.jsp").include(request, response);
        }
        else if (!validator.validateDate(empdate)) {
            session.setAttribute("U_empdateErr", "Error: Incorrect Employee Date Format! YYYY-MM-DD!");
            request.getRequestDispatcher("UpdateStaff.jsp").include(request, response);
        }
        else if (!validator.validatePermissions(perms)) {
            session.setAttribute("U_permissionErr", "Error: Incorrect Permission Number!");
            request.getRequestDispatcher("UpdateStaff.jsp").include(request, response);
        }
        else {
            try {
                manager.updateStaff(oldEmail, newEmail, fname, lname, password, Integer.parseInt(phoneNo), DOB, pos, Integer.parseInt(salary), empdate, perms);
                request.getRequestDispatcher("UpdateStaff.jsp").include(request, response);
            } catch (Exception e) {
                Logger.getLogger(UpdateStaffServlet.class.getName()).log(Level.SEVERE, null, e);
                if (e.getMessage().equals("Error: Account not found!")) {
                    session.setAttribute("U_email404", "Account not found!");
                }
            }    
        }
    }
        
    // set ErrorMsgs in-built in text-field
    private void clear(HttpSession session) {
        session.setAttribute("U_emailErr", "");
        session.setAttribute("U_nameErr", "");
        session.setAttribute("U_passErr", "");
        session.setAttribute("U_phoneErr", "");
        session.setAttribute("U_DOBErr", "");
        session.setAttribute("U_salaryErr", "");
        session.setAttribute("U_empdateErr", "");
        session.setAttribute("U_permissionErr", "");
    }
    
}

