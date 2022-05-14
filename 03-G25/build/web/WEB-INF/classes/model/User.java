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
    private Boolean isActive;
    // private static ArrayList cart = new ArrayList();
    // cart shouldn't be in User, should be in Customer model. 
    // Customer model has additional fields: address, suburb...
    
    public User(String fname, String lname, String password, String email, int phoneNo, String DOB, Boolean isCustomer, Boolean isActive) {
        this.email = email;
        this.fname = fname;
        this.lname = lname;
        this.password = password;
        this.phoneNo = phoneNo;
        this.DOB = DOB;
        this.isCustomer = isCustomer;
        this.isActive = isActive;
    } // Added isActive needed by System Admin to check list of staff and who's online so don't delete pls

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
    
    public void setActive(Boolean active) {
        this.isActive = active;
    }
    
    public Boolean getActive() {
        return this.isActive;
    }
    
    @Override
    public String toString() {
        return email + ": " + this.getName();
    }

}