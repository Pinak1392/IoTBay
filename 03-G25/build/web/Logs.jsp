<%@page import="model.Log"%>
<%@page import="model.User"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controller.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logs</title>
    </head>
    <body>
        <a href="index.jsp">Homepage</a>
        
        <%
            User u = (User)session.getAttribute("user");
            String date = (String)session.getAttribute("date");
            
            LogController l = new LogController();
            ArrayList<Log> logs = l.getLogs(u.getEmail(), date);
        %>
        
        <h1>Logs</h1>
        <form>
            <label for="Date">Date search:</label>
            <input type="date" class="input" id="Date" name="Date"><br>
            <input type="submit" value="Search">
        </form>
        <br>
        <ul>
            <%for(int i = 0; i < logs.size(); i++){%>
            <li>{%= logs.get(i) %}</li>
            <%}%>
        </ul>
    </body>
</html>