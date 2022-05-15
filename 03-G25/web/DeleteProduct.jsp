<%-- 
    Document   : DeleteProduct
    Created on : 14/05/2022, 5:21:21 AM
    Author     : Jared
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*;" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Product from database</title>
    </head>
    <body>

        <div class="row bg-info bg-gradient pt-3 pb-2">

            <h4 class="h2 col text-center"> IoTBay - Delete a product </h4>
            <div class="col">
                <div class="float-end me-2">
                    <a href="index.jsp" class="btn btn-dark ms-2"> Homepage</a>
                    <a href="DeviceCatalogue.jsp" class="btn btn-dark ms-2"> Return to device catalogue</a>

                </div>

            </div>
        </div>

        <br>
        <form action="DeleteProduct.jsp">
            <table>
                <tr>
                <h1>Enter PRODUCT ID To Delete from list</h1>
                <br>
                <td><input type="text" name="PRODUCTID"/></td>
                </tr>
                <tr>
                    <td></td>

                    <td><input type="submit" value="Delete"/></td>
                </tr>
            </table>
        </form>
        <%! String driverName = "org.apache.derby.jdbc.ClientDriver";%>
        <%!String url = "jdbc:derby://localhost:1527/";%>
        <%!String user = "admin1";%>
        <%!String psw = "admin";%>
        <%
            String PRODUCTID = request.getParameter("PRODUCTID");
            if (PRODUCTID != null) {
                Connection con = null;
                PreparedStatement ps = null;
                int PRODUCTID1 = Integer.valueOf(PRODUCTID);
                try {
                    Class.forName(driverName);
                    con = DriverManager.getConnection(url + "database", user, psw);
                    String sql = "DELETE FROM PRODUCT WHERE PRODUCTID=" + PRODUCTID1;
                    ps = con.prepareStatement(sql);
                    int i = ps.executeUpdate();
                    if (i > 0) {%>
    <tr><th>Product was successfully deleted from
            the database.</th></tr>
            <%
            } else
            %>
            <%
                    } catch (SQLException ex) {
                        request.setAttribute("error", ex);
                        out.println(ex);
                        out.println("An error has occured, check your inputs and try again");
                    }
                }
            %>

</body>
</html>
