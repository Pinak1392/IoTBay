<%-- 
    Document   : PaymentSuccess
    Created on : 14/05/2022, 9:58:12 PM
    Author     : Sean
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PaymentSuccess</title>
    </head>
    <body>
        <header>
            <div class="container">
                <nav>
                    <ul>
                        <li><a href="#">Home</a></li>
                        <li><a href="#">Catalogue</a></li>
                        <li><a href="#">Cart</a></li>
                    </ul>
                </nav>
            </div>
        </header>
                <h1>Payment Successful! Click here to return to the catalogue page</h1><br><br><br>
        <form method="POST" action="DeviceCatalogueSearch.jsp">
            <input type="submit" value="Continue" autocomplete="on">
        </form>
        <style>
            body {
                margin: 0;
                padding: 0;
                font-family: 'Work Sans', sans-serif;
                font-weight: 300;
            }
            
            header{
                width: 100%;
                height: 70px;
                background-color: #282828;
            }
            
            h1{
                position: absolute;
                padding: 3px;
                float: left;
                margin-left: 1.5%;
                margin-top: 20px;
                font-family: 'Alfa Slab One';
            }
            
            span {
                color: #ffffff;
            }
            
            ul {
                width: auto;
                float: right;
                margin-top: 8px;
            }
            
            li {
                display: inline-block;
                padding: 15px 30px;
            }
            
            a {
                text-align: center;
                color: #ffffff;
                text-decoration: none;
                font-family: 'Work Sans', sans serif;
                font-size: 1.2vw;
            }
            
            a:hover {
                color: #F0c330;
                transition: 0.15s;

            }
            
            form {
                margin-left: 1.5%;
                font-family: 'Work Sans', sans-serif;
            }
            
        </style>
    </body>
</html>
