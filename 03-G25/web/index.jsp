<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="controller.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IoTBay Home</title>
    </head>
    <body>
        <% User u = (User)session.getAttribute("user"); %>
        
        <% if(u == null){ %>
            <a href="Login.jsp">Login</a>
            <a href="Register.jsp">Register</a>
        <%} else { %>
            <a href="Logout.jsp">Logout</a>
        <%}%>
        <a href="Catalogue.jsp">Catalogue</a>
        <h1>Welcome</h1>
        
        <% if(u != null){ %>
            <h2><%= u.getName() %></h2>
            <p>Your email is <%= u.getEmail() %> and your date of birth is <%= u.getDOB() %>. Also your phone number is <%= u.getPhoneNo() %>.</p>

        <%} else { %>
            <h2>Guest</h2>
            
        <%}%>
        
        <style>
            body {background: #fdfdfd; color: #2f2f2f;}
        </style>
    </body>
</html>
