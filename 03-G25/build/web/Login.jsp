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
        <title>Catalogue</title>
    </head> 
    
    <body>
        <div class="row bg-info bg-gradient pt-3 pb-2">
            <h2 class="h2 col text-center"> IoTBay - Login </h2>
            
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
        
        <h1>Login</h1>
        <form method="POST" action="LoginServelet">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email"> <br>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password"> <br>
            <input type="submit" value="Login">
        </form>
    </body>
</html>
