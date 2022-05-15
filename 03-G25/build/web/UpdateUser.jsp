<%@page import="model.User"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
    </head>
    <body>
        <a href="index.jsp">Homepage</a>
        
        <div>
            <%
                User u = (User)session.getAttribute("user");
                if (null != session.getAttribute("errors")){
                    ArrayList<String> errors = (ArrayList<String>)session.getAttribute("errors");
                    for(int i = 0; i < errors.size(); i++){ %>
                        <p> <%= errors.get(i) %> </p>
            <%    
                    }
                }
                session.setAttribute("errors", new ArrayList<String>());
            %>
        </div>
        
        <h1>Update your info</h1>
        <form method="POST" action="UpdateServlet">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="<%= u.getEmail() %>" class="input"> <br>
            <label for="fname">First Name:</label>
            <input type="text" id="fname" name="fname" value="<%= u.getFname() %>" class="input"> <br>
            <label for="lname">Last Name:</label>
            <input type="text" id="lname" class="input" value="<%= u.getLname() %>" name="lname"> <br>
            <label for="password" required>Password:</label>
            <input type="password" class="input" value="<%= u.getPassword() %>" id="password" name="password" title="Password must have a capital letter, a number and a special character"> <br>
            
            <label for="phoneNo" >Phone Number:</label>
            <input type="tel" class="input" value="<%= u.getPhoneNo() %>" id="phoneNo" name="phoneNo"><br>
            <label for="DOB">Date of Birth:</label>
            <input type="date" class="input" value="<%= u.getDOB() %>" id="DOB" name="DOB"><br>

            <input type="submit" value="Update">
        </form>
        
        <style>
            form>input{
                margin-top: 0.5%;
                margin-bottom: 0.5%;
            }
            
            .input{
                border-radius: 5px;
            }
        </style>
    </body>
</html>
