<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <a href="index.jsp">Homepage</a>
        <a href="Register.jsp">Register</a>
        <p style="color:red">
            <%String formType = request.getParameter("form"); %>
            <%if(formType != null){ %>
                Error: Invalid credentials
            <%}%>
        </p>
        
        <div id="errorDiv">
            <%
              ArrayList<String> errors = ErrorLogger.getErrs();
              for(int i = 0; i < errors.size()){ %>
              <p><%= errors.get(i) %></p>
            <% } %>
        </div>
        
        <h1>Login</h1>
        <form method="POST" action="index.jsp">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email"> <br>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password"> <br>
            <input type="hidden" id="form" name="form" value="login">
            <input type="submit" value="Login">
        </form>
    </body>
</html>
