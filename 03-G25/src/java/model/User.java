package model;

import java.util.ArrayList;
import java.util.List;

public class User {

    private String email;
    private String fname;
    private String lname;
    private String password;
    private String phoneNo;
    private String DOB;
    private Boolean isCustomer;
    private static List<User> cachedUsers = new ArrayList<User>();
    private static ArrayList cart = new ArrayList();
    private static User activeUser;
    
    public User(String email, String fname, String lname, String password, String phoneNo, String DOB) {

        this.email = email;
        this.fname = fname;
        this.lname = lname;
        this.password = password;
        this.phoneNo = phoneNo;
        this.DOB = DOB;
    }
    
    public User(String email, String fname, String lname, String password, String phoneNo, String DOB, Boolean isCustomer) {
        this(email,fname,lname,password,phoneNo,DOB);
        this.isCustomer = isCustomer;
        cachedUsers.add(this);
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
    
    private String invertColor(String myColorString) {
        myColorString = myColorString.substring(1);
        int color = (int)Long.parseLong(myColorString, 16);
        int r = (color >> 16) & 0xFF;
        int g = (color >> 8) & 0xFF;
        int b = (color) & 0xFF;

        double luma = (0.299*r + 0.587*g + 0.114*b);
        
        if(luma < 50){
            return "#fdfdfd";
        }
        return "#2f2f2f";
    }
    
    public static void setUser(String email, String password){
        for(int i = 0;i < User.cachedUsers.size();i++){
            if(email.equals(User.cachedUsers.get(i).getEmail()) && password.equals(User.cachedUsers.get(i).getPassword())){
                User.activeUser = User.cachedUsers.get(i);
            }
        }
    }
    
    public String getFname() {
        return fname;
    }

    public String getLname() {
        return lname;
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public String getDOB() {
        return DOB;
    }
    
    public static User getUser(){
        return User.activeUser;
    }
    
    public static void resetUser(){
        User.activeUser = null;
    }

    @Override
    public String toString() {
        return email + ": " + this.getName();
    }

}