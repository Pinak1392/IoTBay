<%-- 
    Document   : UpdateProduct
    Created on : 15/05/2022, 2:19:39 AM
    Author     : Jared
--%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.io.*" %> 
<%@ page import="model.*" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update product</title>
    </head>
    <body>
        <div class="row bg-info bg-gradient pt-3 pb-2">
            <h2 class="h2 col text-center"> IoTBay - Create new Product </h2>
            <div class="col">
                <div class="float-end me-2">
                    <a href="index.jsp" class="btn btn-dark ms-2"> Homepage</a>
                    <a href="DeviceCatalogue.jsp" class="btn btn-dark ms-2"> Device catalogue</a>
                    <a href="UpdateProductView.jsp" class="btn btn-dark ms-2"> Return to update page</a>
                </div>
            </div>
        </div>

        <%
            String host = "jdbc:derby://localhost:1527/";
            Statement stat = null;
            ResultSet res = null;
            PreparedStatement stmt = null;
            Connection conn = null;
            Class.forName("org.apache.derby.jdbc.ClientDriver").newInstance();
            conn = DriverManager.getConnection(host + "usersdb", "isduser", "admin");
        %>
        <form action="" method="post">
            <%
                stat = conn.createStatement();
                String u = request.getParameter("u");
                int num = Integer.parseInt(u);
                String data = "select * from Product where PRODUCTID = "+ num +"";
                res = stat.executeQuery(data);
                while (res.next()) {
            %>
            <input type="hidden" name ="PRODUCTID" value=' <%=String.valueOf(res.getInt("PRODUCTID"))%>'/>

            <div class="form-group">
                <label>PRODUCT NAME</label>
                <input type="text" class="form-control" name="PRODUCTNAME" value = '<%=res.getString("PRODUCTNAME") %>'/>
            </div>

            <div class="form-group">
                <label>STOCK</label>
                <input type="text" class="form-control" name="STOCK" value = '<%=String.valueOf(res.getInt("STOCK")) %>'/>
            </div>

            <div class="form-group">
                <label>PRICE</label>
                <input type="text" class="form-control" name="PRICE" value = '<%=String.valueOf(res.getFloat("PRICE")) %>'/>
            </div>           

            <div class="form-group">
                <label>Type</label>
                <input type="text" class="form-control" name="DESCRIPTION" value = '<%=res.getString("DESCRIPTION") %>'/>
            </div>    

            <%
                }
            %>

            <button type ="submit" class ="btn btn-warning">Update</button>
            <a href ="UpdateProductView.jsp" class ="btn btn-default">Back</a> 

</body>
</form>
</html>
<%
    String a = request.getParameter("PRODUCTID");
    String b = request.getParameter("PRODUCTNAME");
    String c = request.getParameter("STOCK");
    String d = request.getParameter("PRICE");
    String e = request.getParameter("DESCRIPTION");
    if (a != null && b != null && c != null && d != null && e != null) {
        String query = "UPDATE PRODUCT SET PRODUCTNAME=?, STOCK=?, PRICE=?, DESCRIPTION=? where PRODUCTID = " +num+ "";
        
        stmt = conn.prepareStatement(query);
        int c1 = Integer.parseInt(c);
        double d1 = Double.parseDouble(d);
        
        stmt.setString(1, b);
        stmt.setInt(2, c1);
        stmt.setDouble(3, d1);
        stmt.setString(4, e);
        stmt.executeUpdate();
        response.sendRedirect("UpdateProductView.jsp");
    }
%>
