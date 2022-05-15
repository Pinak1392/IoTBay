<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controller.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <a href="index.jsp">Homepage</a>
        <a href="Register.jsp">Register</a>
        
        <div>
            <%
                if (null != session.getAttribute("errors")){
                    ArrayList<String> errors = (ArrayList<String>)session.getAttribute("errors");
                    for(int i = 0; i < errors.size(); i++){ %>
                        <p> <%= errors.get(i) %> </p>
            <%    
                    }
                }
                session.setAttribute("errors", new ArrayList<String>());
            %>
        </div>
        
        <h1>Login</h1>
        <form method="POST" action="LoginServelet">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email"> <br>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password"> <br>
            <input type="submit" value="Login">
        </form>
    </body>
</html>
