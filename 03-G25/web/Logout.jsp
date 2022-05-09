<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.*" %>
<!DOCTYPE html>
<html>
    <% 
        User.resetUser();
        response.sendRedirect("index.jsp");
    %>
</html>
