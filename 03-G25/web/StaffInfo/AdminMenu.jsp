<%-- 
    Document   : StaffIndex
    Created on : May 13, 2022, 11:45:02 PM
    Author     : Benz 
   
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*" %>
<%@page import="java.util.ArrayList"%>
<%@page import="controller.staffinfo.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
              rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script type="text/javascript" src="js/script.js"></script>
        <title>Admin Menu Page</title>
    </head> 
    
    <body class="bg-dark">
        
        <div class="float-end me-3">
                <a href="StaffLogoutServlet" class="btn btn-light text-dark ms-2"> Logout </a>
        </div>

        <div class="container-fluid text-center">
            <h1 class="h1 text-light mt-3 ms-5">Admin Menu</h1>
            
            <div class="mt-4 text-center"> 
                <a href="StaffListServlet" class="btn btn-light text-dark me-2"> List Of Staffs </a>
                <a href="CreateStaff.jsp" class="btn btn-light text-dark me-2"> Add Staff </a>
                <a href="UpdateStaff.jsp" class="btn btn-light text-dark me-2"> View/Update Staff </a>
                <a href="DeleteStaff.jsp" class="btn btn-light text-dark me-2"> Delete Staff </a>
            </div>
            
            <% 
                    String existErr = (String) session.getAttribute("A_existErr");
            %>  
            
            <% if (existErr != null) { %>
                <% if (!existErr.isEmpty()) { %>
                    <div class="mt-3 alert alert-danger"><%= existErr %></div>
                <% } %>
            <% } %>

        </div>
        

        
    </body>
</html>
