<%-- 
    Document   : StaffIndex
    Created on : May 13, 2022, 11:45:02 PM
    Author     : Benz 
    Purpose    : temporarily created a separate index because main index doesn't initialize ConnServlet. 
                 Will have the main index.jsp redirect to this staffIndex.jsp on the click of the staff Button
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
        <title>Staff Home Page</title>
    </head> 
    
    <body>
        
        <div class="d-grid gap-3 text-center">
            <h1 class="h1">Staff Home Page</h1>

            <div>
                <a href="StaffLogin.jsp" class="btn btn-primary"> Login </a>
            </div>
        </div>
        <jsp:include page="/ConnServlet" flush="true"/>
    </body>
</html>
