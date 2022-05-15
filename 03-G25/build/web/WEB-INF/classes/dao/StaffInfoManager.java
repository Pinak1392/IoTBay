/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import model.*;
import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author Benz Chua Zi Chern 14303489
 */
public class StaffInfoManager {
    
    private Statement st;
   
    public StaffInfoManager(Connection conn) throws SQLException {       
       st = conn.createStatement();   
    }  

    //Find staff by email and password in the database, for login
    //System Admin can login with staff info which activates their status
    public Staff findStaff(String email, String password) throws SQLException, Exception  {
        String fetch = "SELECT * FROM ISDUSER.USERS A INNER JOIN ISDUSER.STAFF B on A.USERID = B.STAFFID "
                + "WHERE EMAIL='" + email + "' AND PASSWORD='" + password + "' AND ISCUSTOMER=FALSE";
        ResultSet rs = st.executeQuery(fetch);
        
        while (rs.next()) {
            String staffEmail = rs.getString(5);
            String pass = rs.getString(4);
            
            if (staffEmail.equals(email) && pass.equals(password)) {
                String fName = rs.getString(2);
                String lName = rs.getString(3);
                String phoneNo = rs.getString(6);
                String DOB = rs.getString(7);
                String isCustomer = rs.getString(8);
                String isActive = rs.getString(9);
                String position = rs.getString(11);
                int salary = Integer.parseInt(rs.getString(12));
                String employmentDate = rs.getString(13);
                String permissions = rs.getString(14);
            
                if(Boolean.parseBoolean(isActive)){
                       throw new Exception("Error: This account is currently logged in on another device!");
                }
                else {
                    st.executeUpdate("UPDATE ISDUSER.USERS SET ACTIVE=TRUE WHERE EMAIL='" +email+ "'");
                    return new Staff(email, fName, lName, pass, phoneNo, DOB, Boolean.parseBoolean(isCustomer), 
                            Boolean.parseBoolean(isActive), position, salary, employmentDate, permissions);
                }
            }
            
        }
        
        throw new Exception("Error: Account not found!");
    }
    
    // to set activeStatus to false when staff logouts
    // Also usable by System Admin to force logout a staff
    public void deactivateStaff(String email) throws SQLException, Exception {     
        
        ResultSet rs = st.executeQuery("SELECT EMAIL FROM ISDUSER.USERS WHERE email='" + email + "'");
        if (rs.next()) {
            String staffEmail = rs.getString(1);
            st.executeUpdate("UPDATE USERS SET ACTIVE=FALSE WHERE EMAIL='"+ staffEmail +"'");    
        }
        else {
            throw new Exception("Error: Account not found!");
        }
    }
    
    /* Staff Features only for System Admin Below */
    
    // add a Staff, System Admin does this. Can view the created staff record after creation.  
    public Staff addStaff(String email, String fname, String lname, 
                String password, String phoneNo, String DOB, 
                String staffPosition, int staffSalary, String staffEmploymentDate,
                String permissions) throws SQLException {
        
        st.executeUpdate("INSERT INTO ISDUSER.USERS VALUES "
                + "(DEFAULT, '" + fname + "', '" + lname + "', '" + password + "', "
                        + "'" + email + "', " + phoneNo + ", '" + DOB + "', FALSE, FALSE)");
        
        ResultSet rs = st.executeQuery("SELECT UserID FROM ISDUSER.USERS WHERE email='" + email + "'");
        rs.next();
        int staffID = Integer.parseInt(rs.getString(1));
        
        st.executeUpdate("INSERT INTO ISDUSER.STAFF VALUES "
                + "(" + staffID + ", '" + staffPosition + "', " + staffSalary + ", '" + staffEmploymentDate + "', '" + permissions + "')");
        
        return new Staff(email, fname, lname, password, phoneNo, DOB, false, 
                            false, staffPosition, staffSalary, staffEmploymentDate, permissions);
    }
    
    // Update Staff Info, System Admin does this
    public void updateStaff(String oldEmail, String newEmail, String fname, String lname, 
                String password, String phoneNo, String DOB,
                String staffPosition, int staffSalary, String staffEmploymentDate,
                String permissions) throws SQLException, Exception {
        
        ResultSet rs = st.executeQuery("SELECT UserID FROM ISDUSER.USERS WHERE email='" + oldEmail + "'");
        if (rs.next()) {
            int staffID = Integer.parseInt(rs.getString(1));
            
            String email;
            if (newEmail == null) {
                email = oldEmail;
            }
            else {
                email = newEmail;
            }
            
            st.executeUpdate("UPDATE ISDUSER.USERS SET EMAIL='" + email + "', First_Name= '" + fname + "', Last_Name= '" + lname + "', PASSWORD= '" + password + "', PHONENO= " + phoneNo + ", Date_Of_Birth= '" + DOB + "'  WHERE USERID= " + staffID + " ");
            st.executeUpdate("UPDATE ISDUSER.STAFF SET Staff_Position='" + staffPosition + "', Staff_Salary='" + staffSalary + "', Staff_EmploymentDate='" + staffEmploymentDate + "', Permissions='" + permissions + "' WHERE STAFFID= " + staffID + " ");
        }
        else {
            throw new Exception("Error: Account not found!");
        }
        
    }
    
    // Delete staff, sysadmin do this
    public void deleteStaff(String email) throws SQLException, Exception {
        
        ResultSet rs = st.executeQuery("SELECT UserID FROM ISDUSER.USERS WHERE email='" + email + "'");
        if (rs.next()) {
            int staffID = Integer.parseInt(rs.getString(1));
            
            st.executeUpdate("DELETE FROM ISDUSER.USERS WHERE USERID='" + staffID + "'");
            st.executeUpdate("DELETE FROM ISDUSER.STAFF WHERE USERID='" + staffID + "'");
        }
        else {
            throw new Exception("Error: Account not found!");
        }
        
    }
    
    // Search one specific staff member based on name and position
    public Staff findStaff(String fname, String lname, String position) throws SQLException, Exception  {
        String fetch = "SELECT * FROM ISDUSER.USERS A INNER JOIN ISDUSER.STAFF B on A.USERID = B.STAFFID "
                + "WHERE First_Name='" + fname + "' AND Last_Name='" + lname + "' AND Staff_Position='" + position + "'";
        ResultSet rs = st.executeQuery(fetch);
        
        if (rs.next()) {
            String email = rs.getString(5);
            String pass = rs.getString(4);
            String fName = rs.getString(2);
            String lName = rs.getString(3);
            String phoneNo = rs.getString(6);
            String DOB = rs.getString(7);
            String isCustomer = rs.getString(8);
            String isActive = rs.getString(9);
            String sPosition = rs.getString(11);
            int salary = Integer.parseInt(rs.getString(12));
            String employmentDate = rs.getString(13);
            String permissions = rs.getString(14);

            return new Staff(email, fName, lName, pass, phoneNo, DOB, Boolean.parseBoolean(isCustomer), 
                    Boolean.parseBoolean(isActive), sPosition, salary, employmentDate, permissions);

        }
        else {
            throw new Exception("Error: Account not found!");
        }
        
    }
    
    // view Staff List/Records
    public ArrayList<Staff> getStaffs() throws SQLException, Exception {
        String fetch = "SELECT * FROM ISDUSER.USERS A INNER JOIN ISDUSER.STAFF B on A.USERID = B.STAFFID";
        ResultSet rs = st.executeQuery(fetch);
        
        ArrayList<Staff> staffs = new ArrayList<Staff>();
        
        while (rs.next()) {
            String staffEmail = rs.getString(5);
            String pass = rs.getString(4);
            String fName = rs.getString(2);
            String lName = rs.getString(3);
            String phoneNo = rs.getString(6);
            String DOB = rs.getString(7);
            String isCustomer = rs.getString(8);
            String isActive = rs.getString(9);
            String position = rs.getString(11);
            int salary = Integer.parseInt(rs.getString(12));
            String employmentDate = rs.getString(13);
            String permissions = rs.getString(14);
            
            staffs.add(new Staff(staffEmail, fName, lName, pass, phoneNo, DOB, Boolean.parseBoolean(isCustomer), 
                            Boolean.parseBoolean(isActive), position, salary, employmentDate, permissions));  
            
        }
        
        if (staffs.isEmpty()) {
            throw new Exception("Error: No Staff Accounts!");
        }
        else {
            return staffs;
        }
             
    }
    
}
