<%@page import="model.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Purchase</title>
    </head>
    <body>
        <a href="index.jsp">Homepage</a>
        <a href="Register.jsp">Register</a>
        <a href="Catalogue.jsp">Catalogue</a>
        <%Item.ClearCart();%>
        
        <h1>Thank you for your purchase.</h1>
    </body>
</html>
