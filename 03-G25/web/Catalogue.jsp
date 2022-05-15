<%@page import="java.util.List"%>
<%@ page import="model.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
              rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script type="text/javascript" src="js/script.js"></script>
        <title>Catalogue</title>
    </head> 
    
    <%new Item(1, "Item 1", "desc", 10);
          new Item(2, "Item 2", "desc", 20);
          new Item(3, "Item 3", "desc", 30);
          new Item(4, "Item 4", "desc", 40);
          List<Item> c = Item.GetCatalogue();%>
          
    <body>
        <div class="row bg-info bg-gradient pt-3 pb-2">
            <h2 class="h2 col text-center"> IoTBay - Catalogue </h2>
            
            <div class="col">
                <div class="float-end me-2">
                    <a href="index.jsp" class="btn btn-dark ms-2">Homepage</a>
                    <a href="Register.jsp" class="btn btn-dark ms-2">Register</a>
                    <a href="Catalogue.jsp" class="btn btn-dark ms-2">Catalogue</a>
                </div>
            </div>
        </div>
        
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
        
        <p align="center">Your total is $<%= Item.CalculateTotal()%></p>
        <p align="center">Total Items: <%= Item.CartSize()%></p>
        
        <div class="items">
            <table width="900px">
                <tr class="border_bottom">
                    <td align="center">#<%= c.get(0).id%></td>
                    <td align="center"><%= c.get(0).name%></td>
                    <td align="center"><%= c.get(0).desc%></td>
                    <td align="center">$<%= c.get(0).price%></td>
                    <td align="center"><img src="Img/url.jpg" width="90" height="90" /></td>
                    <td align="center"><form method="POST" action="Catalogue.jsp">
                        <input type="hidden" id="item" name="item" value="1">
                        <input type="submit" value="Add to Cart">
                    </form></td>
                </tr>
                <tr class="border_bottom">
                    <td align="center">#<%= c.get(1).id%></td>
                    <td align="center"><%= c.get(1).name%></td>
                    <td align="center"><%= c.get(1).desc%></td>
                    <td align="center">$<%= c.get(1).price%></td>
                    <td align="center"><img src="Img/url.jpg" width="90" height="90" /></td>
                    <td align="center"><form method="POST" action="Catalogue.jsp">
                        <input type="hidden" id="item" name="item" value="2">
                        <input type="submit" value="Add to Cart">
                    </form></td>
                </tr>
                <tr class="border_bottom">
                    <td align="center">#<%= c.get(2).id%></td>
                    <td align="center"><%= c.get(2).name%></td>
                    <td align="center"><%= c.get(2).desc%></td>
                    <td align="center">$<%= c.get(2).price%></td>
                    <td align="center"><img src="Img/url.jpg" width="90" height="90" /></td>
                    <td align="center"><form method="POST" action="Catalogue.jsp">
                        <input type="hidden" id="item" name="item" value="3">
                        <input type="submit" value="Add to Cart">
                    </form></td>
                </tr>
                <tr class="border_bottom">
                    <td align="center">#<%= c.get(3).id%></td>
                    <td align="center"><%= c.get(3).name%></td>
                    <td align="center"><%= c.get(3).desc%></td>
                    <td align="center">$<%= c.get(3).price%></td>
                    <td align="center"><img src="Img/url.jpg" width="90" height="90" /></td>
                    <td align="center"><form method="POST" action="Catalogue.jsp">
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
