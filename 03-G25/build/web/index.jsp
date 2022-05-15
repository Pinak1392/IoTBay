<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="controller.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
              rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script type="text/javascript" src="js/script.js"></script>
        <title>IoTBay Home Page</title>
    </head> 
    
    <body class="overflow-hidden">
            <% User u = (User)session.getAttribute("user"); %>
            
            <div class="row bg-info bg-gradient pt-3 pb-2">
              
                    <h3 class="h3 col text-left ms-2"> Welcome 
                    
                        <span class="h3">
                            <% if(u != null){ %>

                                <%= u.getName() %>!

                            <%} else { %>

                                Guest!

                            <%}%>
                        </span>
                        
                    </h3>
                
                <h2 class="h2 col text-center"> IoTBay - Home </h2>
                
                <div class="col">
                    <div class="float-end me-2">
                        <!-- The Buttons on the third column -->     
                        <% if(u == null){ %>

                          <a href="Login.jsp" class="btn btn-dark ms-2"> Login </a>
                          <a href="Register.jsp" class="btn btn-dark ms-2"> Register </a>

                        <%} else { %>
                          <a href="Logs.jsp" class="btn btn-dark ms-2"> Check logs </a>
                          <a href="UpdateUser.jsp" class="btn btn-dark ms-2"> Update Info </a>
                          <a href="LogoutServlet" class="btn btn-dark ms-2"> Logout </a>

                        <%}%>

                          <a href="Catalogue.jsp" class="btn btn-dark ms-2"> Catalogue </a>
                    </div>
                </div>
            </div>  
                        
            
            <img class="img-responsive" src="index.jpeg"> 
            

        <jsp:include page="/ConnServlet" flush="true"/>
    </body>
</html>
