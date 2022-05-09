<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IoTBay Home</title>
    </head>
    <body>
        <%String formType = request.getParameter("form"); %>
        <%String email; %>
        <%String password; %>
        <%--Item.ClearCart();--%>
        <%if(formType != null && formType.equals("register")){ %>
            <%email = request.getParameter("email");%>
            <%String fname = request.getParameter("fname");%>
            <%String lname = request.getParameter("lname");%>
            <%password = request.getParameter("password");%>
            <%String phoneNo = request.getParameter("phoneNo");%>
            <%String DOB = request.getParameter("DOB");%>
            <%String tos = request.getParameter("tos");%>
            <%if(tos != null){%>
                <%new User(email,fname,lname,password,phoneNo,DOB,true);%>
                <%User.setUser(email, password);%>
            <%} else {%>
                <jsp:forward page="Register.jsp" />
            <%}%>
        <%}else if(formType != null && formType.equals("login")) {%>
            <%email = request.getParameter("email");%>
            <%password = request.getParameter("password");%>
            <%User.setUser(email, password);%>
            <%if(User.getUser() == null){%>
                <jsp:forward page="Login.jsp" />
            <%}%>
        <%}%>
        <%User u = User.getUser();%>
        
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
