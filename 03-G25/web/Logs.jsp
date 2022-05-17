<%@page import="model.Log"%>
<%@page import="model.User"%>
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
        <title>Logs</title>
    </head>
    <body>
        <div class="row bg-dark pt-3 pb-2">
              
                
                <h2 class="h2 col text-light text-center">IoTBay - Home </h2>
                
                <div class="col">
                    <div class="float-end me-2">
                        <!-- The Buttons on the third column -->     
                          <a href="index.jsp" class="btn btn-light text-dark ms-2"> Homepage </a>
                          <a href="UpdateUser.jsp" class="btn btn-light text-dark ms-2"> Update Info </a>
                          <a href="LogoutServlet" class="btn btn-light text-dark ms-2"> Logout </a>
                          
                          <a href="StaffInfo/StaffLogin.jsp" class="btn btn-light text-dark ms-2"> Staff Login </a>
                          <a href="Catalogue.jsp" class="btn btn-light text-dark ms-2"> Catalogue </a>
                        <a href="DeviceCatalogue.jsp" class="btn btn-dark ms-2"> Device Catalogue </a>
                    </div>
                </div>
                
            </div>
        
        <%
            User u = (User)session.getAttribute("user");
            String date = (String)session.getAttribute("date");
            ArrayList<Log> logs = (ArrayList<Log>)session.getAttribute("logs");
        %>
        
        <div class="container">
        <h1 class="h1 mb-4 mt-3">Logs</h1>
        <form method="POST" action="LogController">
            <div class="form-group">
                    <div class="mb-3 mr-10 col-xs-2">
                        <label for="Date">Date search:</label>
                        <input type="date" class="input" id="Date" name="Date">
                        <input type="submit" value="Search">
                    </div>
            </div>
        </form>
        <br>
        <ul class="list-group list-group-flush">
            <%for(int i = 0; i < logs.size(); i++){%>
            <li class="list-group-item"><%= logs.get(i) %></li>
            <%}%>
        </ul>
        </div>
    </body>
</html>