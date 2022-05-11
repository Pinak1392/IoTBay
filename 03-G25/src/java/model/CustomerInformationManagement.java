/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author timmy
 */
public class CustomerInformationManagement {
    private String fName;
    private String lName;
    private String password;
    private String email;
    private int phoneNo;
    private String dob;
    private boolean isCustomer;
    private boolean active;

    public String getfName() {
        return fName;
    }

    public String getlName() {
        return lName;
    }

    public String getPassword() {
        return password;
    }

    public String getEmail() {
        return email;
    }

    public int getPhoneNo() {
        return phoneNo;
    }

    public String getDob() {
        return dob;
    }

    public boolean isIsCustomer() {
        return isCustomer;
    }

    public boolean isActive() {
        return active;
    }

    public void setfName(String fName) {
        this.fName = fName;
    }

    public void setlName(String lName) {
        this.lName = lName;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPhoneNo(int phoneNo) {
        this.phoneNo = phoneNo;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public void setIsCustomer(boolean isCustomer) {
        this.isCustomer = isCustomer;
    }

    public void setActive(boolean active) {
        this.active = active;
    }
    
    public CustomerInformationManagement(String fName, String lName, String password, String email, int phoneNo, String dob, boolean isCustomer, boolean active){
        this.fName = fName;
        this.lName = lName;
        this.password = password;
        this.email = email;
        this.phoneNo = phoneNo;
        this.dob = dob;
        this.isCustomer = isCustomer;
        this.active = active;
    }
    
    
}
