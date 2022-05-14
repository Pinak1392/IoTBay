package controller;

   import java.io.Serializable;
   import java.util.regex.Matcher;
   import java.util.regex.Pattern;


   public class Validator implements Serializable { 

        private String emailPattern = "([a-zA-Z0-9]+)(([._-])([a-zA-Z0-9]+))*(@)([a-z]+)(.)([a-z]{3})((([.])[a-z]{0,2})*)";      
        private String namePattern = "^[A-Z][a-zA-Z ]+[A-Z][a-zA-Z]+$";       
        private String passwordPattern = "(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@$!%*#?&^_-]).{8,}"; 
        private String phonePattern = "^[0-9]{8}$";
        private String salaryPattern = "^([0-9]{4}|[0-9]{5})$";
        private String datePattern = "^\\d{4}-\\d{2}-\\d{2}$";
        private String permissionsPattern = "^[1-4]{1}$";

        public Validator(){}       

        public boolean validate(String pattern, String input){       
           Pattern regEx = Pattern.compile(pattern);       
           Matcher match = regEx.matcher(input);       

           return match.matches(); 

        }       

        public boolean checkEmpty(String email, String password){       

           return  email.isEmpty() || password.isEmpty();   

        }

        public boolean validateEmail(String email){                       

           return validate(emailPattern,email);   

        }

        public boolean validateName(String fname, String lname){

           return validate(namePattern,fname + " " + lname); 

        }       

        public boolean validatePassword(String password){

           return validate(passwordPattern,password); 

        }

        public boolean validatePhone(String phone){

           return validate(phonePattern,phone); 

        }

        public boolean validateSalary(String salary){

           return validate(salaryPattern,salary); 

        }

        public boolean validateDate(String date) {

           return validate(datePattern,date); 

        }

        public boolean validatePermissions(String permissions){

           return validate(permissionsPattern,permissions); 

        }
    
 }
