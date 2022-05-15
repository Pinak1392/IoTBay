<%-- 
    Document   : StaffLogin
    Created on : May 13, 2022, 6:24:00 PM
    Author     : Benz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
              rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script type="text/javascript" src="js/script.js"></script>
        <title>Staff Login Page</title>
    </head> 
    
    <body>
        
        <% 
           String emailErr = (String) session.getAttribute("L_emailErr");
           String passwordErr = (String) session.getAttribute("L_passwordErr");
           String existErr = (String) session.getAttribute("L_existErr");
        %>
        
        <div class="container">
            <h1 class="h1 mb-4 mt-3">Sign In</h1>
            
            <form action="StaffLoginServlet" method="post">
                
                <div class="form-group">
                    <div class="mb-3 mr-10 col-xs-2">
                      <label for="InputEmai1" class="form-label">Email address</label>
                      <input type="text" name="email" class="form-control" id="InputEmai1" aria-describedby="emailHelp">
                      <div id="emailHelp" class="form-text"> <%= (emailErr != null ? emailErr : "Enter Email") %> </div>
                    </div>
                </div>
                    
                <div class="form-group">
                    <div class="mb-3 mr-10 col-xs-2">
                      <label class="form-label">Password</label>
                      <input type="password" name="password" class="form-control" aria-describedby="passHelp">
                      <div id="passHelp" class="form-text"> <%= (passwordErr != null ? passwordErr : "Enter Password") %> </div>
                    </div>
                </div>
                    
                <div class="form-group">
                    <span>
                        <button type="submit" class="btn btn-primary">Submit</button>
                        <a href="StaffCancelServlet" class="btn btn-primary">Cancel</a>
                    </span>
                    
                    <% if (existErr != null) { %>
                        <% if (!existErr.isEmpty()) { %>
                            <div class="mt-3 alert alert-danger"><%= existErr %></div>
                        <% } %>
                    <% } %>

                </div>
                    
            </form>
            
        </div>
    </body>
</html>