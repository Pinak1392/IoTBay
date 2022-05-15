<%-- 
    Document   : Payment
    Created on : 14/05/2022, 9:57:46 PM
    Author     : Sean
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Transaction</title>
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
        <h1>Shipping Address</h1><br><br><br><br><br>
        <form method="POST" action="Payment.jsp">
            <label for="fname">First Name:</label>
            <input type="text" id="fname" name="fname" class="input" placeholder="First Name" required> <br>
            <label for="lname">Last Name:</label>
            <input type="text" id="lname" class="input" name="lname" placeholder="Last Name" required> <br>
            <label for="adr">Address:</label>
            <input type="text" id="adr" name="adr" class="input" placeholder="Address" required> <br><br>
            <label for="city">City:</label>
            <select id="city" name="city">
            <option value="NSW">NSW</option>
            <option value="Queensland">Queensland</option>
            <option value="Tasmania">Tasmania</option>
            <option value="WA">WA</option>
            <option value="SA">SA</option><!-- comment -->
            </select> <br><br>
            <label for="postcode">PostCode</label>
            <input type="number" id="postcode" name="postcode" class="input" inputmode="numeric" pattern="[0-9\s]" autocomplete="postcode" minlength="4" maxlength="4" placeholder="1234" required> <br>
            <input type="submit" value="Next" autocomplete="on">
        </form>
        
         <style>
            form>input{
                margin-top: 0.5%;
                margin-bottom: 0.5%;
            }
            
            .input{
                border-radius: 5px;
            }
            
            .input:valid{
                border-color: limegreen;
                outline-color: limegreen;
            }
            
            .input:invalid{
                border-color: red;
                outline-color: red;
            }
            
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
