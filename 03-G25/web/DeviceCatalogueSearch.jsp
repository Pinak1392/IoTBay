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

            <h2 class="h2 col text-center"> IoTBay - Device Catalogue </h2>
            <div class="col">
                <div class="float-end me-2">
                    <a href="index.jsp" class="btn btn-dark ms-2"> Homepage</a>
                    <a href="DeviceCatalogue.jsp" class="btn btn-dark ms-2"> Return to Device Catalogue</a>

                </div>

            </div>
        </div>


        <h2>Product list</h2>
        
                <div
            <div class ="col-md-4">
            <form action="" method="get">
                <input type="text" class="form-control" name="q" placeholder="Search here for product name or type..." />
            </form>
        </div>
        
        <%
            try {
                String connectionURL = "jdbc:derby://localhost:1527/";
                Connection connection = null;
                Statement statement = null;
                ResultSet rs = null;
                Class.forName("org.apache.derby.jdbc.ClientDriver").newInstance();
                connection = DriverManager.getConnection(connectionURL + "usersdb", "isduser", "admin");
                statement = connection.createStatement();
                String query = request.getParameter("q");
                String QueryString;
                if(query!=null){
                QueryString = "SELECT * FROM PRODUCT WHERE PRODUCTNAME LIKE  '%"+query+"%' or DESCRIPTION LIKE '%"+query+"%'";
                }else {
                    
                    QueryString = "SELECT * FROM PRODUCT";
                }
                rs = statement.executeQuery(QueryString);
        %>
        <table cellpadding="15" border="1">
            <thead>
            <tr>
                <td>ID</td>
                <td>Product Name</td>
                <td>Stock</td>
                <td>Price</td>
                <td>Type</td>
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
