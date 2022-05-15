/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.format.DateTimeFormatter;  
import java.time.LocalDateTime;
import java.util.ArrayList;
import model.Log;
import model.User;

/**
 *
 * @author timmy
 */

/* 
* DBManager is the primary DAO class to interact with the database. 
* Complete the existing methods of this classes to perform CRUD operations with the db.
*/

public class UserManager {
    private Statement st;
   
    public UserManager(Connection conn) throws SQLException {       
       st = conn.createStatement();   
    }

    //Find user by email and password in the database   
    public User setUser(String email, String password) throws SQLException, Exception { 
       String fetch = "select * from USERS where EMAIL = '" + email + "' and PASSWORD = '" + password + "'";
       ResultSet rs = st.executeQuery(fetch);

       while(rs.next()){
           String customerEmail = rs.getString(5);
           if(customerEmail.equals(email)){
               String uid = rs.getString(1);
               String customerFirstName = rs.getString(2);
               String customerLastName = rs.getString(3);
               String customerPassword = rs.getString(4);
               System.out.println();
               String customerPhoneNo = rs.getString(6);
               String customerDOB = rs.getString(7);
               String customerIsCustomer = rs.getString(8);
               String customerActive = rs.getString(9);

               if(Boolean.parseBoolean(customerActive)){
                   throw new Exception("Error: User is already logged on elsewhere");
               }

               st.executeUpdate("UPDATE USERS SET ACTIVE='true' WHERE EMAIL='"+email+"'");
               createLog(uid,"Login");
               return new User(customerFirstName, customerLastName, customerPassword, customerEmail, customerPhoneNo, customerDOB, Boolean.parseBoolean(customerIsCustomer), true);
           }
       }

       throw new Exception("Error: Incorrect credentials");   
    }

    public void createLog(String uid, String log) throws SQLException, Exception {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
        LocalDateTime now = LocalDateTime.now();
        String insert = "INSERT INTO ULOGS(ULOGSID,TIME_OF_ACTION,ACTIONDESC)";
        String values = "VALUES("+uid+",'"+dtf.format(now)+"','Logged in')";

        st.executeUpdate(insert + values); 
    }

    
    public ArrayList<Log> viewLogs(String email, String date) throws SQLException, Exception {       
       String fetch = "select * from USERS where EMAIL = '" + email + "'";
       ResultSet rs = st.executeQuery(fetch);

       while(rs.next()){
           String customerEmail = rs.getString(5);
           if(customerEmail.equals(email)){
               String uid = rs.getString(1);
               String customerFirstName = rs.getString(2);
               String customerLastName = rs.getString(3);
               String customerPassword = rs.getString(4);
               String customerPhoneNo = rs.getString(6);
               String customerDOB = rs.getString(7);
               String customerIsCustomer = rs.getString(8);
               String customerActive = rs.getString(9);
               
               st.executeUpdate("UPDATE USERS SET ACTIVE='false' WHERE EMAIL='"+email+"'");
               return getLogs(uid,date);
           }
       }

       throw new Exception("Error: User not found");
    }
    
    public ArrayList<Log> getLogs(String uid, String date) throws SQLException, Exception {       
       String fetch = "select * from ULOGS where ULOGSID = " + uid;
       ResultSet rs = st.executeQuery(fetch);
       ArrayList<Log> logs = new ArrayList<Log>();

       while(rs.next()){
           String userid = rs.getString(2);
           if(userid.equals(uid)){
               String datetime = rs.getString(3);
               String action = rs.getString(4);
               
               if(datetime.contains(date)){
                   logs.add(new Log(datetime,action));
               }
           }
       }

       return logs;
    }
    
    public void deactivateUser(String email) throws SQLException, Exception {       
       String fetch = "select * from USERS where EMAIL = '" + email + "'";
       ResultSet rs = st.executeQuery(fetch);

       while(rs.next()){
           String customerEmail = rs.getString(5);
           if(customerEmail.equals(email)){
               String uID = rs.getString(1);
               String customerFirstName = rs.getString(2);
               String customerLastName = rs.getString(3);
               String customerPassword = rs.getString(4);
               String customerPhoneNo = rs.getString(6);
               String customerDOB = rs.getString(7);
               String customerIsCustomer = rs.getString(8);
               String customerActive = rs.getString(9);

               st.executeUpdate("UPDATE USERS SET ACTIVE='false' WHERE EMAIL='"+email+"'");
               createLog(uID,"Logout");
               return;
           }
       }

       throw new Exception("Error: User not found");
    }

    //Add a user-data into the database   
    public User addUser(String fName, String lName, String password, String email, String phoneNo, String dob, boolean isCustomer) throws SQLException{                   //code for add-operation       

        String insert = "INSERT INTO USERS(FIRST_NAME, LAST_NAME, PASSWORD, EMAIL, PHONENO, DATE_OF_BIRTH, ISCUSTOMER, ACTIVE)";
        String values = "VALUES('"+fName+"', '"+lName+"', '"+password+"', '"+email+"', '"+phoneNo+"', '"+dob+"', '"+isCustomer+"', 'false')";

        st.executeUpdate(insert + values);
        return new User(fName, lName, password, email, phoneNo, dob, isCustomer, false);
        // By default the added user is not active unless logged in. 
    }
    
    //Add a user-data into the database   
    public void delUser(String email) throws SQLException{
        String fetch = "select * from USERS where EMAIL = '" + email + "'";
       ResultSet rs = st.executeQuery(fetch);

       while(rs.next()){
           String customerEmail = rs.getString(5);
           if(customerEmail.equals(email)){
               String uid = rs.getString(1);
               String customerFirstName = rs.getString(2);
               String customerLastName = rs.getString(3);
               String customerPassword = rs.getString(4);
               String customerPhoneNo = rs.getString(6);
               String customerDOB = rs.getString(7);
               String customerIsCustomer = rs.getString(8);
               String customerActive = rs.getString(9);
               
               String sql = "delete from USERS where USERID = " + uid;
               st.executeUpdate(sql);
               return;
           }
       }     
    }
    
    public User updateUser(String fName, String lName, String password, String email, String phoneNo, String dob, boolean isCustomer) throws SQLException, Exception{                   //code for add-operation       
        
       String fetch = "select * from USERS where EMAIL = '" + email + "'";
       ResultSet rs = st.executeQuery(fetch);

       while(rs.next()){
           String customerEmail = rs.getString(5);
           if(customerEmail.equals(email)){
               String uid = rs.getString(1);
               String customerFirstName = rs.getString(2);
               String customerLastName = rs.getString(3);
               String customerPassword = rs.getString(4);
               String customerPhoneNo = rs.getString(6);
               String customerDOB = rs.getString(7);
               String customerIsCustomer = rs.getString(8);
               String customerActive = rs.getString(9);
               
            
               st.executeUpdate("UPDATE USERS SET FIRST_NAME='"+fName+"', LAST_NAME='"+lName+"', PASSWORD='"+password+"', EMAIL='"+email+"', PHONENO='"+phoneNo+"', DATE_OF_BIRTH='"+dob+"' WHERE EMAIL='"+email+"'");
               createLog(uid,"User info updated");
               
               return new User(fName, lName, password, email, phoneNo, dob, isCustomer, true);
           }
       }
       
       throw new Exception("User not found");
    }

}


