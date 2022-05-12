<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
    </head>
    <body>
        <a href="index.jsp">Homepage</a>
        <a href="Login.jsp">Login</a>
        
        <div id="errorDiv">
            <%
              ArrayList<String> errors = ErrorLogger.getErrs();
              for(int i = 0; i < errors.size()){ %>
              <p><%= errors.get(i) %></p>
            <% } %>
        </div>
        
        <h1>Register</h1>
        <p>Please enter information for all fields</p>
        <form method="POST" action="index.jsp">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" class="input"> <br>
            <label for="fname">First Name:</label>
            <input type="text" id="fname" name="fname" class="input"> <br>
            <label for="lname">Last Name:</label>
            <input type="text" id="lname" class="input" name="lname"> <br>
            <label for="password" required>Password:</label>
            <input type="password" class="input" id="password" name="password" title="Password must have a capital letter, a number and a special character"> <br>
            
            <label for="phoneNo" >Phone Number:</label>
            <input type="tel" class="input" id="phoneNo" name="phoneNo"><br>
            <label for="DOB">Date of Birth:</label>
            <input type="date" class="input" id="DOB" name="DOB"><br>
            <label for="tos">Accept terms of service?</label>
            <input type="checkbox" id="tos" name="tos" value="True"> <br>
            <input type="hidden" id="form" name="form" value="register">
            <input type="submit" value="Register">
        </form>
        
        <style>
            form>input{
                margin-top: 0.5%;
                margin-bottom: 0.5%;
            }
            
            .input{
                border-radius: 5px;
            }
            
            .input:valid{
                border-color: limegreen;
                outline-color: limegreen;
            }
            
            .input:invalid{
                border-color: red;
                outline-color: red;
            }
        </style>
    </body>
</html>
