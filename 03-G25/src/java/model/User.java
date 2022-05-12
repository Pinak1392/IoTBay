package model;

import java.util.ArrayList;
import java.util.List;

public class User {

    private String email;
    private String fname;
    private String lname;
    private String password;
    private int phoneNo;
    private String DOB;
    private Boolean isCustomer;
    private static ArrayList cart = new ArrayList();
    
    public User(String fname, String lname, String password, String email, int phoneNo, String DOB, Boolean customer) {
        this.email = email;
        this.fname = fname;
        this.lname = lname;
        this.password = password;
        this.phoneNo = phoneNo;
        this.DOB = DOB;
        this.isCustomer = customer;
    }

    public String getEmail() {
        return email;
    }

    public String getName() {
        return fname + " " + lname;
    }

    public String getPassword() {
        return password;
    }
    
    public String getFname() {
        return fname;
    }

    public String getLname() {
        return lname;
    }

    public int getPhoneNo() {
        return phoneNo;
    }

    public String getDOB() {
        return DOB;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setPhoneNo(int phoneNo) {
        this.phoneNo = phoneNo;
    }

    public void setDOB(String DOB) {
        this.DOB = DOB;
    }
    
    @Override
    public String toString() {
        return email + ": " + this.getName();
    }

}