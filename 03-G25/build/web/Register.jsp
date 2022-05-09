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
        <p style="color:red">
            <%String formType = request.getParameter("form"); %>
            <%if(formType != null){ %>
                Please accept the terms of service
            <%}%>
        </p>
        <h1>Register</h1>
        <p>Hover for tool tips, if input box is green the input is valid</p>
        <form method="POST" action="index.jsp">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" class="input" required> <br>
            <label for="fname">First Name:</label>
            <input type="text" id="fname" name="fname" class="input" required> <br>
            <label for="lname">Last Name:</label>
            <input type="text" id="lname" class="input" name="lname" required> <br>
            <label for="password" required>Password:</label>
            <input type="password" class="input" id="password" name="password" minlength="8" title="Password must have a capital letter, a number and a special character"
                    pattern="((.*[A-Z].*[^\w\s].*[0-9].*)|(.*[A-Z].*[0-9].*[^\w\s].*)|(.*[0-9].*[A-Z].*[^\w\s].*)|(.*[0-9].*[^\w\s].*[A-Z].*)|(.*[^\w\s].*[A-Z].*[0-9].*)|(.*[^\w\s].*[0-9].*[A-Z].*))" required> <br>
            
            <label for="phoneNo" >Phone Number:</label>
            <input type="tel" class="input" id="phoneNo" name="phoneNo" pattern="[0-9]{10}" required><br>
            <label for="DOB">Date of Birth:</label>
            <input type="date" class="input" id="DOB" name="DOB" required><br>
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
