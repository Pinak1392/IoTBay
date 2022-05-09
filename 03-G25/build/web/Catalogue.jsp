<%@page import="java.util.List"%>
<%@ page import="model.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Catalogue</title>
    </head>
    <body>
        <a href="index.jsp">Homepage</a>
        <a href="Register.jsp">Register</a>
        <a href="Catalogue.jsp">Catalogue</a>
        <%new Item(1, "Item 1", "desc", 10);
          new Item(2, "Item 2", "desc", 20);
          new Item(3, "Item 3", "desc", 30);
          new Item(4, "Item 4", "desc", 40);
          List<Item> c = Item.GetCatalogue();%>
        
        
        <%int item = (request.getParameter("item") == null) ? 0 : Integer.parseInt(request.getParameter("item"));%>
        <%switch(item) {
            case 1:
                Item.AddToCart(1);
                break;
            case 2:
                Item.AddToCart(2);
                break;
            case 3:
                Item.AddToCart(3);
                break;
            case 4:
                Item.AddToCart(4);
                break;
            default:
                break;
        }%>
        
        <p>Your total is $<%= Item.CalculateTotal()%></p>
        <p>Total Items: <%= Item.CartSize()%></p>
        
        <div class="items">
            <table width="900px">
                <tr class="border_bottom">
                    <td>#<%= c.get(0).id%></td>
                    <td><%= c.get(0).name%></td>
                    <td><%= c.get(0).desc%></td>
                    <td>$<%= c.get(0).price%></td>
                    <td><img src="Img/url.jpg" width="90" height="90" /></td>
                    <td><form method="POST" action="Catalogue.jsp">
                        <input type="hidden" id="item" name="item" value="1">
                        <input type="submit" value="Add to Cart">
                    </form></td>
                </tr>
                <tr class="border_bottom">
                    <td>#<%= c.get(1).id%></td>
                    <td><%= c.get(1).name%></td>
                    <td><%= c.get(1).desc%></td>
                    <td>$<%= c.get(1).price%></td>
                    <td><img src="Img/url.jpg" width="90" height="90" /></td>
                    <td><form method="POST" action="Catalogue.jsp">
                        <input type="hidden" id="item" name="item" value="2">
                        <input type="submit" value="Add to Cart">
                    </form></td>
                </tr>
                <tr class="border_bottom">
                    <td>#<%= c.get(2).id%></td>
                    <td><%= c.get(2).name%></td>
                    <td><%= c.get(2).desc%></td>
                    <td>$<%= c.get(2).price%></td>
                    <td><img src="Img/url.jpg" width="90" height="90" /></td>
                    <td><form method="POST" action="Catalogue.jsp">
                        <input type="hidden" id="item" name="item" value="3">
                        <input type="submit" value="Add to Cart">
                    </form></td>
                </tr>
                <tr class="border_bottom">
                    <td>#<%= c.get(3).id%></td>
                    <td><%= c.get(3).name%></td>
                    <td><%= c.get(3).desc%></td>
                    <td>$<%= c.get(3).price%></td>
                    <td><img src="Img/url.jpg" width="90" height="90" /></td>
                    <td><form method="POST" action="Catalogue.jsp">
                        <input type="hidden" id="item" name="item" value="4">
                        <input type="submit" value="Add to Cart">
                    </form></td>
                </tr>
            </table>
        </div>
        <form method="POST" action="Checkout.jsp">
            <input type="submit" value="Checkout">
        </form>
                    
    </body>
</html>
