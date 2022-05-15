<%-- 
    Document   : CreateProduct
    Created on : 14/05/2022, 4:37:45 AM
    Author     : Jared
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<%@ page import="model.*" %> 
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Product</title>
    </head>
    <body>
        <div class="row bg-info bg-gradient pt-3 pb-2">

            <h2 class="h2 col text-center"> IoTBay - Create new Product </h2>
            <div class="col">
                <div class="float-end me-2">
                    <a href="index.jsp" class="btn btn-dark ms-2"> Homepage</a>
                    <a href="DeviceCatalogue.jsp" class="btn btn-dark ms-2"> Return to device catalogue</a>

                </div>

            </div>
        </div>
        <h1>Create product</h1>
        <FORM action="CreateProduct.jsp" method="get">
            <TABLE style="background-color: #34c0eb;" WIDTH="30%" >
                <TR>
                    <TH width="50%">PRODUCTID</TH>
                    <TD width="50%"><INPUT TYPE="text" NAME="PRODUCTID"></TD>
                </tr>
                <TR>
                    <TH width="50%">PRODUCTNAME</TH>
                    <TD width="50%"><INPUT TYPE="text" NAME="PRODUCTNAME"></TD>
                </tr>
                <TR>
                    <TH width="50%">STOCK</TH>
                    <TD width="50%"><INPUT TYPE="text" NAME="STOCK"></TD>
                </tr>
                <TH width="50%">PRICE</TH>
                <TD width="50%"><INPUT TYPE="text" NAME="PRICE"></TD>
                </tr>
                <TR>
                    <TH width="50%">DESCRIPTION</TH>
                    <TD width="50%"><INPUT TYPE="text" NAME="DESCRIPTION"></TD>
                </tr>
                <TR>
                <TR>
                    <TH></TH>
                    <TD width="50%"><INPUT TYPE="submit" VALUE="submit"></TD>
                </tr>
            </TABLE>
            <%
                String PRODUCTID = request.getParameter("PRODUCTID");
                String PRODUCTNAME = request.getParameter("PRODUCTNAME");
                String STOCK = request.getParameter("STOCK");
                String PRICE = request.getParameter("PRICE");
                String DESCRIPTION = request.getParameter("DESCRIPTION");
                String connectionURL = "jdbc:derby://localhost:1527/";
                Connection connection = null;
                PreparedStatement pstatement = null;

                if (PRODUCTID != null && PRODUCTNAME != null && STOCK != null && PRICE != null && DESCRIPTION != null) {
                    // check if the text box having only blank spaces
                    try {
                        /* Create a connection by using getConnection()
                          method that takes parameters of string type 
                          connection url, user name and password to connect 
                            to database. */
                        connection = DriverManager.getConnection(connectionURL + "database", "admin1", "admin");
                        // sql query to insert values in the secified table.

                        String queryString = "INSERT INTO PRODUCT(PRODUCTID, PRODUCTNAME, STOCK, PRICE, DESCRIPTION) VALUES(?, ?, ?, ?, ?)";
                        /* createStatement() is used for create statement
                          object that is used for 
                            sending sql statements to the specified database. */
                        int PRODUCTID1 = Integer.parseInt(PRODUCTID);
                        int STOCK2 = Integer.parseInt(STOCK);
                        double PRICE2 = Double.parseDouble(PRICE);

                        pstatement = connection.prepareStatement(queryString);
                        pstatement.setInt(1, PRODUCTID1);
                        pstatement.setString(2, PRODUCTNAME);
                        pstatement.setInt(3, STOCK2);
                        pstatement.setDouble(4, PRICE2);
                        pstatement.setString(5, DESCRIPTION);
                        pstatement.executeUpdate();
                        response.sendRedirect("DeviceCatalogue.jsp");
                    } catch (SQLException ex) {
                        request.setAttribute("error", ex);
                        out.println(ex);
                    }
                }

            %>
        </FORM>
    </body>
</html>
