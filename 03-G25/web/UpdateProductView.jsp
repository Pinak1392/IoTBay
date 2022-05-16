<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<html>
    <head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>Device Catalogue</title>
    </head>
    <body>
        <div class="row bg-info bg-gradient pt-3 pb-2">

            <h2 class="h2 col text-center"> IoTBay - Update Product </h2>
            <div class="col">
                <div class="float-end me-2">
                    <a href="index.jsp" class="btn btn-dark ms-2"> Homepage</a>
                    <a href="DeviceCatalogue.jsp" class="btn btn-dark ms-2"> Return to device catalogue</a>


                </div>

            </div>
        </div>


        <h2>Product list - Update</h2>
        <%
            try {
                /* Create string of connection url within specified format with machine
        name, port number and database name. Here machine name id localhost and 
        database name is student. */
                String connectionURL = "jdbc:derby://localhost:1527/";
                // declare a connection by using Connection interface
                Connection connection = null;
                /* declare object of Statement interface that is used for executing sql 
        statements. */
                Statement statement = null;
                // declare a resultset that uses as a table for output data from tha table.
                ResultSet rs = null;
                // Load JBBC driver "com.mysql.jdbc.Driver"
                Class.forName("org.apache.derby.jdbc.ClientDriver").newInstance();
                /* Create a connection by using getConnection() method that takes parameters 
        of string type connection url, user name and password to connect to database.*/
                connection = DriverManager.getConnection(connectionURL + "usersdb", "isduser", "admin");
                /* createStatement() is used for create statement object that is used for 
        sending sql statements to the specified database. */
                statement = connection.createStatement();
                // sql query to retrieve values from the secified table.
                String QueryString = "SELECT * FROM PRODUCT";
                rs = statement.executeQuery(QueryString);
        %>
        <table cellpadding="15" border="1">
            <thead>
            <tr>
                <td>Product ID</td>
                <td>Product Name</td>
                <td>Stock</td>
                <td>Price</td>
                <td>Type</td>
                <td class="text-center">Update</th>
            </tr>
            </thead>
            <tbody>
            <%
                while (rs.next()) {
            %>
            <TR>
                <TD><%=rs.getInt("PRODUCTID")%></TD>
                <TD><%=rs.getString("PRODUCTNAME")%></TD>
                <TD><%=rs.getInt("STOCK")%></TD>
                <TD><%=rs.getFloat("PRICE")%></TD>
                <TD><%=rs.getString("DESCRIPTION")%></TD>
                <td>
                    <a href ="UpdateProduct.jsp?u=<%=rs.getInt("PRODUCTID")%>" class="btn btn-warning">Edit</a>
                </td>
            </TR>
            </tbody>
            
            <% } %>
            <%
                // close all the connections.
                rs.close();
                statement.close();
                connection.close();
            } catch (Exception ex) {
            %>
        </font>
        <font size="+3" color="red"></b>
            <%
                    out.println("Unable to connect to database.");
                }
            %>







        </font>
</body>
</html>
