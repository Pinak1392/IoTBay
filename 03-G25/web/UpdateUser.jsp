<%@page import="model.User"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
              rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script type="text/javascript" src="js/script.js"></script>
        <title>Update Info</title>
    </head>
    <body>
        <div class="row bg-dark pt-3 pb-2">
              
                
            <h2 class="h2 col text-light text-center"> IoTBay - Home  </h2>
                
                <div class="col">
                    <div class="float-end me-2">
                        <a href="index.jsp" class="btn btn-light text-dark ms-2"> Homepage </a>
                        <a href="LogController" class="btn btn-light text-dark ms-2"> Logs </a>
                        <a href="LogoutServlet" class="btn btn-light text-dark ms-2"> Logout </a>
                        <!-- The Buttons on the third column -->     
                          <a href="Catalogue.jsp" class="btn btn-light text-dark ms-2"> Catalogue </a>

                          <a href="Catalogue.jsp" class="btn btn-dark ms-2"> Catalogue </a>
                          <a href="DeviceCatalogue.jsp" class="btn btn-dark ms-2"> Device Catalogue </a>
                    </div>
                </div>
                
            </div>
        
        <div>
            <%
                User u = (User)session.getAttribute("user");
            %>
        </div>
        
        <div class="container">
        <h1 class="h1 mb-4 mt-3">Update your info</h1>
        
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
        
        
        <form method="POST" action="UpdateServlet">
            <div class="form-group">
                    <div class="mb-3 mr-10 col-xs-2">
                        <label for="email">Email:</label>
                        <input type="email" id="email" name="email" value="<%= u.getEmail() %>" class="input form-control">
                    </div>
            </div>
            <div class="form-group">
                    <div class="mb-3 mr-10 col-xs-2">
                        <label for="fname">First Name:</label>
                        <input type="text" id="fname" name="fname" value="<%= u.getFname() %>" class="input form-control">
                    </div>
            </div>
            <div class="form-group">
                    <div class="mb-3 mr-10 col-xs-2">
                        <label for="lname">Last Name:</label>
                        <input type="text" id="lname" class="input form-control" value="<%= u.getLname() %>" name="lname">
                        </div>
            </div>
            <div class="form-group">
                    <div class="mb-3 mr-10 col-xs-2">
                        <label for="password" required>Password:</label>
                        <input type="password" class="input form-control" value="<%= u.getPassword() %>" id="password" name="password">
                    </div>
            </div>
            <div class="form-group">
                    <div class="mb-3 mr-10 col-xs-2">
                        <label for="phoneNo" >Phone Number:</label>
                        <input type="tel" class="input form-control" value="<%= u.getPhoneNo() %>" id="phoneNo" name="phoneNo">
                    </div>
            </div>
            <div class="form-group">
                    <div class="mb-3 mr-10 col-xs-2">
                        <label for="DOB">Date of Birth:</label>
                        <input type="date" class="input form-control" value="<%= u.getDOB() %>" id="DOB" name="DOB">
                    </div>
            </div>
            
            <div class="form-group">
                <span>
                    <input class="btn btn-primary" type="submit" value="Update">
                </span>
            </div>
        </form>
                    <br>
         <form method="POST" action="UpdateServlet">
            <div class="form-group">
                <span>
                   <input type="hidden" id="delete" name="delete" value="delete">
                   <input type="submit" class="btn btn-danger" value="Delete">
                </span>
            </div>
        </form>
        </div>
    </body>
</html>