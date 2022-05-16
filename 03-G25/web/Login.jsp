<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controller.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
              rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script type="text/javascript" src="js/script.js"></script>
        <title>Login</title>
    </head>
    <body>
        <div class="row bg-dark pt-3 pb-2">
              
                
                <h2 class="h2 col text-light text-center">IoTBay - Home </h2>
                
                <div class="col">
                    <div class="float-end me-2">
                        <!-- The Buttons on the third column -->     
                          <a href="index.jsp" class="btn btn-light text-dark ms-2"> Homepage </a>
                          <a href="Register.jsp" class="btn btn-light text-dark ms-2"> Register </a>
                          
                          <a href="StaffInfo/StaffLogin.jsp" class="btn btn-light text-dark ms-2"> Staff Login </a>
                          <a href="Catalogue.jsp" class="btn btn-light text-dark ms-2"> Catalogue </a>

                          <a href="Catalogue.jsp" class="btn btn-dark ms-2"> Catalogue </a>
                        <a href="DeviceCatalogue.jsp" class="btn btn-dark ms-2"> Device Catalogue </a>
                    </div>
                </div>
                
            </div>
        
        <div class="container">
        <h1 class="h1 mb-4 mt-3">Log In</h1>
        
        <div>
            <%
                if (null != session.getAttribute("errors")){
                    ArrayList<String> errors = (ArrayList<String>)session.getAttribute("errors");
                    for(int i = 0; i < errors.size(); i++){ %>
                        <p class="form-text mt-3 alert alert-danger"> <%= errors.get(i) %> </p>
            <%    
                    }
                }
                session.setAttribute("errors", new ArrayList<String>());
            %>
        </div>
        
        <form method="POST" action="LoginServelet">
            <div class="form-group">
                    <div class="mb-3 mr-10 col-xs-2">
                        <label for="email">Email:</label>
                        <input type="email" id="email" class="form-control" name="email">
                    </div>
            </div>
            <div class="form-group">
                    <div class="mb-3 mr-10 col-xs-2">
                        <label for="password">Password:</label>
                        <input type="password" id="password" class="form-control" name="password">
                    </div>
            </div>
            <div class="form-group">
                <span>
                    <input type="submit" class="btn btn-primary" value="Login">
                </span>
            </div>
        </form>
        </div>
    </body>
</html>
