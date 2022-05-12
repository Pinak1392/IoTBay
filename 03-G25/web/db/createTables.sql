/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  timmy
 * Created: 11/05/2022
 */

CREATE TABLE Users (
    UserID INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY(START WITH 1, INCREMENT BY 1),
    First_Name VARCHAR(40) NOT NULL,
    Last_Name VARCHAR(40) NOT NULL,
    Password VARCHAR(40) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    PhoneNo NUMERIC(10) NOT NULL,
    Date_Of_Birth DATE NOT NULL,
    isCustomer BOOLEAN NOT NULL,
    Active BOOLEAN NOT NULL,
    PRIMARY KEY(UserID)
);




/* ---------------------------------------------------------------------- */
/* Add table "ULogs"                                                      */
/* ---------------------------------------------------------------------- */



CREATE TABLE ULogs (
    UserID INTEGER NOT NULL,
    Time_Of_Action VARCHAR(40) NOT NULL,
    Action VARCHAR(40) NOT NULL,
    PRIMARY KEY (UserID)
);

/* ---------------------------------------------------------------------- */
/* Add table "Customer"                                                   */
/* ---------------------------------------------------------------------- */



CREATE TABLE Customer (
    CustomerID INTEGER NOT NULL,
    Street_Number INTEGER,
    Street_Name VARCHAR(40),
    Postcode INTEGER,
    "STATE" VARCHAR(40),
    Suburb VARCHAR(40),
    Country VARCHAR(40),
    PRIMARY KEY(CustomerID),
    FOREIGN KEY(CustomerID) REFERENCES Users(UserID)
);




/* ---------------------------------------------------------------------- */
/* Add table "Staff"                                                      */
/* ---------------------------------------------------------------------- */
CREATE TABLE Staff (
    StaffID INTEGER NOT NULL,
    Staff_Position VARCHAR(40),
    Staff_Salary INTEGER,
    Staff_EmploymentDate DATE,
    Permissions VARCHAR(5),
    PRIMARY KEY(StaffID),
    FOREIGN KEY(StaffID) REFERENCES Users(UserID)
);

/* ---------------------------------------------------------------------- */
/* Add table "Card"                                                    */
/* ---------------------------------------------------------------------- */

CREATE TABLE Card (
    CardNo INTEGER NOT NULL,
    CustomerID INTEGER NOT NULL,
    CardName VARCHAR(40) NOT NULL,
    CardExpiry VARCHAR(40) NOT NULL,
    CardPin INTEGER NOT NULL,
    PRIMARY KEY(CardNo),
    FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID)
);

/* ---------------------------------------------------------------------- */
/* Add table "Payment"                                                    */
/* ---------------------------------------------------------------------- */

CREATE TABLE Payment (
    PaymentID INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY(START WITH 1, INCREMENT BY 1),
    PaymentMeth VARCHAR(40) NOT NULL,
    Cost NUMERIC(10,2) NOT NULL,
    CardNo INTEGER,
    PRIMARY KEY(PaymentID),
    FOREIGN KEY(CardNo) REFERENCES Card(CardNo)
);

/* ---------------------------------------------------------------------- */
/* Add table "Orders"                                                     */
/* ---------------------------------------------------------------------- */

CREATE TABLE Orders (
    OrderID INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY(START WITH 1, INCREMENT BY 1),
    CustomerID INTEGER NOT NULL,
    PaymentID INTEGER NOT NULL,
    Order_Date VARCHAR(40) NOT NULL,
    Status VARCHAR(10) NOT NULL,
    Street_Number INTEGER,
    Street_Name VARCHAR(40),
    Postcode INTEGER,
    "State" VARCHAR(40),
    Suburb VARCHAR(40),
    Country VARCHAR(40),
    PRIMARY KEY(OrderID),
    FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY(PaymentID) REFERENCES Payment(PaymentID)
);

/* ---------------------------------------------------------------------- */
/* Add table "Product"                                                    */
/* ---------------------------------------------------------------------- */

CREATE TABLE Product (
    ProductID INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY(START WITH 1, INCREMENT BY 1),
    ProductName VARCHAR(40) NOT NULL,
    Stock INTEGER NOT NULL,
    Price NUMERIC(10,2) NOT NULL,
    Description VARCHAR(40),
    PRIMARY KEY (ProductID)
);

/* ---------------------------------------------------------------------- */
/* Add table "Order_Product"                                              */
/* ---------------------------------------------------------------------- */

CREATE TABLE Order_Product (
    OrderID INTEGER NOT NULL,
    ProductID INTEGER NOT NULL,
    Quantity INTEGER NOT NULL,
    PRIMARY KEY(OrderID, ProductID),
    FOREIGN KEY(OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY(ProductID) REFERENCES Product(ProductID)
);
