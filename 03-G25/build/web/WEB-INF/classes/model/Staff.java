package model;

/* @author Benz Chua Zi Chern 14303489 */

public class Staff extends User {

    private String staffPosition;
    private int staffSalary;
    private String staffEmploymentDate;
    private String permissions;

    // used by DAO and only DAO
    public Staff(String email, String fname, String lname, 
                String password, String phoneNo, String DOB, Boolean isCustomer, Boolean isActive,
                String staffPosition, int staffSalary, String staffEmploymentDate,
                String permissions) {

        super(fname, lname, password, email, phoneNo, DOB, isCustomer, isActive);
        this.staffPosition = staffPosition;
        this.staffEmploymentDate = staffEmploymentDate;
        this.staffSalary = staffSalary;
        this.permissions = permissions;
    }
    
    /* Getters and Setters below */
    /* Used by DAO and Controller */

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