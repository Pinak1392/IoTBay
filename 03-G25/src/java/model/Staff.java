package model;

public class Staff extends User {

    private String staffPosition;
    private int staffSalary;
    private String staffEmploymentDate;
    private String permissions;

    public Staff(String email, String fname, String lname, 
                String password, int phoneNo, String DOB, Boolean isCustomer,
                String staffPosition, int staffSalary, String staffEmploymentDate,
                String permissions) {

        super(email, fname, lname, password, phoneNo, DOB, isCustomer);
        this.staffPosition = staffPosition;
        this.staffEmploymentDate = staffEmploymentDate;
        this.staffSalary = staffSalary;
        this.permissions = permissions;
    }
    
    /* Getters and Setters below */

    public String getStaffPosition() {
            return staffPosition;
    }

    public int getStaffSalary() {
            return staffSalary;
    }

    public String getStaffEmploymentDate() {
            return staffEmploymentDate;
    }

    public String getPermissions() {
            return permissions;
    }

    public void setStaffPosition(String staffPosition) {
            this.staffPosition = staffPosition;
    }

    public void setStaffSalary(int staffSalary) {
            this.staffSalary = staffSalary;
    }

    public void setStaffEmploymentDate(String staffEmploymentDate) {
            this.staffEmploymentDate = staffEmploymentDate;
    }

    public void setPermissions(String permissions) {
            this.permissions = permissions;
    }

    /* Getters and Setters above */


}