<%-- 
    Document   : StaffList.jsp
    Created on : May 15, 2022, 7:09:57 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*" %>
<%@page import="java.util.ArrayList"%>
<%@page import="controller.staffinfo.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
              rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script type="text/javascript" src="js/script.js"></script>
        <title>List Of Staffs</title>
    </head>
    <body class="bg-dark ">
        
        <div class="container-fluid text-center">
            
            <div class="float-end me-3">
                <a href="AdminMenu.jsp" class="btn btn-light text-dark ms-2"> Back </a>
                <a href="StaffLogoutServlet" class="btn btn-light text-dark ms-2"> Logout </a>
            </div>
            
            <h1 class="h1 text-light mt-3 ms-5">List Of Staffs</h1>
            
            <% ArrayList<Staff> staffs = (ArrayList) session.getAttribute("staffs");%>
            
            <table class="table text-center table-light mt-4">
                <tr>
                    <th class="text-dark">Email</th>
                    <th class="text-dark">Name</th>
                    <th class="text-dark">Position</th>
                </tr>
                
                <c:forEach items="${staffs}" var="staff">
                    <tr>
                        <td class="text-dark">${staff.email}</td>
                        <td class="text-dark">${staff.fname}${' '}${staff.lname}</td>
                        <td class="text-dark">${staff.staffPosition}</td>
                    </tr>
                </c:forEach>
            </table>


        </div>
                    
    </body>
</html>
