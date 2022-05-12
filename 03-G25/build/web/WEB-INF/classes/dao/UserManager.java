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
import java.util.ArrayList;
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
       String fetch = "select * from USERS where EMAIL = '" + email + "' and PASSWORD = " + password;
       ResultSet rs = st.executeQuery(fetch);

       while(rs.next()){
           String customerEmail = rs.getString(5);
           if(customerEmail.equals(email)){
               String customerFirstName = rs.getString(2);
               String customerLastName = rs.getString(3);
               String customerPassword = rs.getString(4);
               String customerPhoneNo = rs.getString(6);
               String customerDOB = rs.getString(7);
               String customerIsCustomer = rs.getString(8);
               String customerActive = rs.getString(9);

               if(Boolean.parseBoolean(customerActive)){
                   throw new Exception("Error: User is already logged on elsewhere");
               }

               st.executeUpdate("UPDATE USERS SET ACTIVE='true' WHERE EMAIL='"+email+"'");
               return new User(customerFirstName, customerLastName, customerPassword, customerEmail, customerPhoneNo, customerDOB, Boolean.parseBoolean(customerIsCustomer));
           }
       }

       throw new Exception("Error: Incorrect credentials");   
    }

    public void createLog(String uid, String log) throws SQLException, Exception {       
        String insert = "INSERT INTO USERS(USERID,TIME_OF_ACTION,ACTION)";
        String values = "VALUES("+uid+")";

        st.executeUpdate(insert + values); 
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
           }
       }

       throw new Exception("Error: User not found");
    }

    //Add a user-data into the database   
    public void addUser(String fName, String lName, String password, String email, int phoneNo, String dob, boolean isCustomer) throws SQLException{                   //code for add-operation       

        String insert = "INSERT INTO USERS(FIRST_NAME, LAST_NAME, PASSWORD, EMAIL, PHONENO, DATE_OF_BIRTH, ISCUSTOMER, ACTIVE)";
        String values = "VALUES('"+fName+"', '"+lName+"', '"+password+"', '"+email+"', "+phoneNo+", '"+dob+"', '"+isCustomer+"', 'true')";

        st.executeUpdate(insert + values);
    }


}



