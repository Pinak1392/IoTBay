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
import model.CIM;

/**
 *
 * @author timmy
 */

/* 
* DBManager is the primary DAO class to interact with the database. 
* Complete the existing methods of this classes to perform CRUD operations with the db.
*/

public class CIMManager {
    private Statement st;
   
public CIMManager(Connection conn) throws SQLException {       
   st = conn.createStatement();   
}

//Find user by email and password in the database   
public CIM findCustomerInformationManagement(String email) throws SQLException {       
   String fetch = "select * from USERS where EMAIL = '" + email + "'";
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
           return new CIM(customerFirstName, customerLastName, customerPassword, customerEmail,Integer.parseInt(customerPhoneNo), customerDOB, Boolean.parseBoolean(customerIsCustomer), Boolean.parseBoolean(customerActive));
       }
   }
   
   return null;   
}


//Add a user-data into the database   
public void addCustomerInformationManagement(String fName, String lName, String password, String email, int phoneNo, String dob, boolean isCustomer, boolean active) throws SQLException {                   //code for add-operation       

String insert = "INSERT INTO USERS(FIRST_NAME, LAST_NAME, PASSWORD, EMAIL, PHONENO, DATE_OF_BIRTH, ISCUSTOMER, ACTIVE)";
String values = "VALUES('"+fName+"', '"+lName+"', '"+password+"', '"+email+"', "+phoneNo+", '"+dob+"', '"+isCustomer+"', '"+active+"')";

st.executeUpdate(insert + values);
}

//update a user details in the database   
public void updateCustomerInformationManagement(String fName, String lName, String password, String email, int phoneNo, String dob, boolean isCustomer, boolean active) throws SQLException {       
    //st.executeUpdate("UPDATE ISDUSER.USERS SET NAME= '"+name+"', GENDER='"+gender+"', FAVOURITECOLOUR='"+favcol+"' WHERE EMAIL = '"+email+"' AND PASSWORD = '"+password+"' ");
    st.executeUpdate("UPDATE USERS SET FIRST_NAME= '"+fName+"', LAST_NAME='"+lName+"', PASSWORD='"+password+"', PHONENO="+phoneNo+", DATE_OF_BIRTH='"+dob+"', ISCUSTOMER='"+isCustomer+"', ACTIVE='"+active+"' WHERE EMAIL='"+email+"'");
}       

//delete a user from the database   
public void deleteUser(String email) throws SQLException{       
   st.executeUpdate("DELETE FROM USERS WHERE EMAIL ='" + email +"' ");  

}

public ArrayList<CIM> fectCustomerInformationManagement() throws SQLException{
    String fetch = "SELECT * from USERS";
    ResultSet rs = st.executeQuery(fetch);
    ArrayList<CIM> temp = new ArrayList();
    
    while(rs.next()){
        String customerFirstName = rs.getString(2);
        String customerLastName = rs.getString(3);
        String customerPassword = rs.getString(4);
        String customerEmail = rs.getString(5);
        String customerPhoneNo = rs.getString(6);
        String customerDOB = rs.getString(7);
        String customerIsCustomer = rs.getString(8);
        String customerActive = rs.getString(9); 
        temp.add(new CIM(customerFirstName, customerLastName, customerPassword, customerEmail,Integer.parseInt(customerPhoneNo), customerDOB, Boolean.parseBoolean(customerIsCustomer), Boolean.parseBoolean(customerActive)));
     }
    return temp;
}

public boolean checkCustomerInformationManagement(String email) throws SQLException{
    String fetch = "SELECT * FROM USERS WHERE EMAIL = '" + email +"'";
    ResultSet rs = st.executeQuery(fetch);
    
    while(rs.next()){
        String userEmail = rs.getString(5);
        if(userEmail.equals(email)){
            return true;
        }
    }
    return false;
    
}

}



