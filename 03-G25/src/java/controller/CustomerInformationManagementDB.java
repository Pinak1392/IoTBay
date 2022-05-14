/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.DBConnector;
import dao.CustomerInformationManagementManager;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.CustomerInformationManagement;

/**
 *
 * @author timmy
 */
public class CustomerInformationManagementDB {

private static Scanner in = new Scanner(System.in);
private DBConnector connector;
private Connection conn;
private CustomerInformationManagementManager db;
 

public static void main(String[] args) throws SQLException {
    (new CustomerInformationManagementDB()).runQueries();
}

public CustomerInformationManagementDB(){
    try{
        connector = new DBConnector();
        conn = connector.openConnection();
        db = new CustomerInformationManagementManager(conn);
    }
    
    catch(ClassNotFoundException | SQLException ex){
        Logger.getLogger(CustomerInformationManagementDB.class.getName()).log(Level.SEVERE, null, ex);
    }
}

private char readChoice(){
    System.out.print("Operations CRUDS or * to exit:");
    return in.nextLine().charAt(0);
}

private void runQueries() throws SQLException{
    char c;
    
    while((c = readChoice()) != '*'){
        switch(c){
            case 'C': ;
                testAdd();
                break;
            case 'R': ;
                testRead();
                break;
            case 'U': ;
                testUpdate();
                break;
            case 'D': ;
                testDelete();
                break;
            case 'S': ;
                showAll();
                break;
            default:
                System.out.println("Unknown Command");
        }
    }
}

private void testAdd(){
System.out.print("User's First Name: ");

String fname = in.nextLine();

System.out.print("User's Last Name: ");

String lname = in.nextLine();

System.out.print("User's password: ");

String password = in.nextLine();

System.out.print("User's email: ");

String email = in.nextLine();

System.out.print("User's phone number: ");

String phoneNo = in.nextLine();

System.out.print("User's date of birth: ");

String dob = in.nextLine();

System.out.print("Is the user a customer?: ");

String isCustomer = in.nextLine();

System.out.print("Is the user active?: ");

String active = in.nextLine();
    
    try{
        db.addCustomerInformationManagement(fname, lname, password, email, Integer.parseInt(phoneNo), dob, Boolean.parseBoolean(isCustomer), Boolean.parseBoolean(active));
    }
    catch(SQLException ex){
       Logger.getLogger(CustomerInformationManagementDB.class.getName()).log(Level.SEVERE, null, ex); 
    }
    System.out.println("User is added to the database.");
}

private void testRead() throws SQLException{
    System.out.print("User email: ");
    String email = in.nextLine();
    CustomerInformationManagement customerInformationManagement = db.findCustomerInformationManagement(email);
    if(customerInformationManagement != null){
        System.out.println("User " + customerInformationManagement.getfName() +" exists in the database.");
    }
    else{
        System.out.println("User does not exist.");
    }
}

private void testUpdate(){
    System.out.print("User email: ");
    String email = in.nextLine();
    
    try{
        if(db.checkCustomerInformationManagement(email)){
            System.out.print("User's First Name: ");

    String fname = in.nextLine();

    System.out.print("User's Last Name: ");

    String lname = in.nextLine();

    System.out.print("User's password: ");

    String password = in.nextLine();

    System.out.print("User's phone number: ");

    String phoneNo = in.nextLine();

    System.out.print("User's date of birth: ");

    String dob = in.nextLine();

    System.out.print("Is the user a customer?: ");

    String isCustomer = in.nextLine();

    System.out.print("Is the user active?: ");

String active = in.nextLine();
            db.updateCustomerInformationManagement(fname, lname, password, email, Integer.parseInt(phoneNo), dob, Boolean.parseBoolean(isCustomer), Boolean.parseBoolean(active));
        }
        else{
            System.out.println("User does not exist");
        }
    }
    
    catch(SQLException ex){
        Logger.getLogger(CustomerInformationManagementDB.class.getName()).log(Level.SEVERE, null, ex);
    }
}

private void testDelete(){
    System.out.print("User email: ");
    String email = in.nextLine();
    
    try{
        if(db.checkCustomerInformationManagement(email)){
            db.deleteUser(email);
        }
        else{
            System.out.println("User does not exist");
        }
    }
    
    catch (SQLException ex){
        Logger.getLogger(CustomerInformationManagementDB.class.getName()).log(Level.SEVERE, null, ex);
    }
}

private void showAll(){
    try{
        ArrayList<CustomerInformationManagement> customerInformationManagements = db.fectCustomerInformationManagement();
        System.out.println("Customer Information Management: ");
        customerInformationManagements.stream().forEach((customerInformationManagement) -> {
            System.out.printf("%-20s %-30s %-20s %-10s %-20s %-30s %-20s %-10s \n", customerInformationManagement.getfName(), customerInformationManagement.getlName(), customerInformationManagement.getPassword(), customerInformationManagement.getEmail(), customerInformationManagement.getPhoneNo(), customerInformationManagement.getDob(), customerInformationManagement.isIsCustomer(), customerInformationManagement.isActive() );
        });
        System.out.println();
    }
    catch(SQLException ex){
        Logger.getLogger(CustomerInformationManagementDB.class.getName()).log(Level.SEVERE, null, ex);

    }
}

}