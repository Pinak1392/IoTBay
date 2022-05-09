<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout</title>
    </head>
    <body>
        <a href="index.jsp">Homepage</a>
        <a href="Register.jsp">Register</a>
        <a href="Catalogue.jsp">Catalogue</a>
        
        <%int itemNo = (request.getParameter("itemNo") == null) ? -1 : Integer.parseInt(request.getParameter("itemNo"));%>
        <%String clear = request.getParameter("clear");%>
        
        <table width="900px">
        <%List<Item> c = Item.GetCart();
        if (clear != null) {
            c.clear();
            clear = null;
        }
        if (itemNo != -1) {
            c.get(itemNo).quantity--;
            if (c.get(itemNo).quantity == 0) {
                c.remove(itemNo);
            }
        }
        if (c.size() != 0) {%>
        <tr>
            <td align="center" style="font-weight:bold">Name</td> 
            <td align="center" style="font-weight:bold">Price</td>
            <td align="center" style="font-weight:bold">Quantity</td>
            <td align="center"></td>
        </tr>
        <%}
        for (int i = 0; i < c.size(); i++) {
            Item item = (Item) c.get(i);%>
        <tr>
            <td align="center"><% out.print(item.name);%></td> 
            <td align="center"><% out.print(item.price);%></td>
            <td align="center"><% out.print(item.quantity);%></td>
            <td align="center">
            <form method="POST" action="Checkout.jsp">
                <input type="hidden" id="itemNo" name="itemNo" value=<%out.print(i);%>>
                <input type="submit" value="Remove">
            </form></td>
        </tr>
        <%}%>
        
        <% if (c.size() != 0) {%>
        <tr>
            <td align="center" style="font-weight:bold">Total: </td>
            <td align="center" style="font-weight:bold">$<%= Item.CalculateTotal()%></td>
        </tr>
        <tr>
            <td align="center"></td>
            <form method="POST" action="Purchase.jsp">
                <input type="submit" value="Purchase">
            </form></td>
            <td align="center"></td>
            <form method="POST" action="Checkout.jsp">
                <input type="hidden" id="clear" name="clear" value=clear>
                <input type="submit" value="Clear Cart">
            </form></td>
        </tr>
        <%}
        else {%>
        <h1>Cart is empty.</h1>
        <%}%>
        </table>
    </body>
</html>
