<%-- 
    Document   : TransactionToWork
    Created on : 14/05/2022, 10:36:59 PM
    Author     : Sean
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment&Billing</title>
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
        <h1>Payment</h1><br><br><br><br><br><br>
        <form method="POST" action="Payment.jsp">
        <select id="paymentmethod">
            <option value="Credit Card" >Credit Card</option>
            <option value="PayPal" disabled>PayPal (temporarily unavailable)</option> </select><br><br>
        <label for="lname">Name on Card:</label>
        <input type="text" id="cardname" class="input" name="cardname" placeholder="Name" required> <br><br>
        <label for="cardNo">Card Number:</label>
        <input type="tel" id="cardNo" name="cardNo" class="input" inputmode="numeric" pattern="[0-9\s]{13,19}" autocomplete="cardNo" minlength="16" maxlength="19" placeholder="1234 5678 9012 3456" required> <br><br>
        <label for="cvv">CVV:</label>
        <input type="tel" id="cvv" name="cvv" class="input" inputmode="numeric" pattern="[0-3\s]" autocomplete="cvv" minlength="3" placeholder="123" required> <br><br>
        <label for="lname">Expiry Date</label>
        <input type="month" id="expirydate" class="input" name="expirydate" required> <br><br>
        <input type="submit" value="Purchase">
        </form>
        <form method="POST" action="ShippingAddress.jsp">
            <input type="submit" value="Back" autocomplete="on">
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
