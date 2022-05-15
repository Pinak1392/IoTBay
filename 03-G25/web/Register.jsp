<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
              rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script type="text/javascript" src="js/script.js"></script>
        <title>Catalogue</title>
    </head> 
    
    <body>
        <div class="row bg-info bg-gradient pt-3 pb-2">
            <h2 class="h2 col text-center"> IoTBay - Register </h2>
            
            <div class="col">
                <div class="float-end me-2">
                    <a href="index.jsp" class="btn btn-dark ms-2">Homepage</a>
                    <a href="Register.jsp" class="btn btn-dark ms-2">Register</a>
                    <a href="Catalogue.jsp" class="btn btn-dark ms-2">Catalogue</a>
                </div>
            </div>
        </div>
        
        <div>
            <%
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
        
        <h1>Register</h1>
        <p>Please enter information for all fields</p>
        <form method="POST" action="RegisterServlett">
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
        </style>
    </body>
</html>
