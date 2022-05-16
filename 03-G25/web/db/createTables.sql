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
    PhoneNo VARCHAR(100) NOT NULL,
    Date_Of_Birth DATE NOT NULL,
    isCustomer BOOLEAN NOT NULL,
    Active BOOLEAN NOT NULL,
    CONSTRAINT PK_Users PRIMARY KEY(UserID)
);




/* ---------------------------------------------------------------------- */
/* Add table "ULogs"                                                      */
/* ---------------------------------------------------------------------- */



CREATE TABLE ULogs (
    ULogsSurrogate INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY(START WITH 1, INCREMENT BY 1),
    ULogsID INTEGER,
    Time_Of_Action VARCHAR(40) NOT NULL,
    ActionDesc VARCHAR(40) NOT NULL,
    CONSTRAINT PK_ULogs PRIMARY KEY (ULogsSurrogate),
    CONSTRAINT FK_ULogs FOREIGN KEY(ULogsID) REFERENCES Users(UserID) ON DELETE SET NULL
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
    CONSTRAINT PK_Customer PRIMARY KEY(CustomerID),
    CONSTRAINT FK_Customer FOREIGN KEY(CustomerID) REFERENCES Users(UserID) ON DELETE CASCADE
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
    CONSTRAINT PK_Staff PRIMARY KEY(StaffID),
    CONSTRAINT FK_Staff FOREIGN KEY(StaffID) REFERENCES Users(UserID) ON DELETE CASCADE
);

/* ---------------------------------------------------------------------- */
/* Add table "Card"                                                    */
/* ---------------------------------------------------------------------- */

CREATE TABLE Card (
    CardNo NUMERIC(16) NOT NULL,
    CustomerID INTEGER NOT NULL,
    CardName VARCHAR(40) NOT NULL,
    CardExpiry VARCHAR(40) NOT NULL,
    CardPin INTEGER NOT NULL,
    CONSTRAINT PK_Card PRIMARY KEY(CardNo),
    CONSTRAINT FK_Card FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID) ON DELETE CASCADE
);

/* ---------------------------------------------------------------------- */
/* Add table "Payment"                                                    */
/* ---------------------------------------------------------------------- */

CREATE TABLE Payment (
    PaymentID INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY(START WITH 1, INCREMENT BY 1),
    PaymentMeth VARCHAR(40) NOT NULL,
    Cost NUMERIC(10,2) NOT NULL,
    CardNo NUMERIC(16),
    CONSTRAINT PK_Payment PRIMARY KEY(PaymentID),
    CONSTRAINT FK_Payment FOREIGN KEY(CardNo) REFERENCES Card(CardNo) ON DELETE SET NULL
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
    CONSTRAINT PK_Orders PRIMARY KEY(OrderID),
    CONSTRAINT FK_Orders1 FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID) ON DELETE SET NULL,
    CONSTRAINT FK_Orders2 FOREIGN KEY(PaymentID) REFERENCES Payment(PaymentID)
);

/* ---------------------------------------------------------------------- */
/* Add table "Product"                                                    */
/* ---------------------------------------------------------------------- */

CREATE TABLE Product (
    ProductID INTEGER NOT NULL,
    ProductName VARCHAR(40) NOT NULL,
    Stock INTEGER NOT NULL,
    Price NUMERIC(10,2) NOT NULL,
    Description VARCHAR(40),
    CONSTRAINT PK_Product PRIMARY KEY (ProductID)
);

/* ---------------------------------------------------------------------- */
/* Add table "Order_Product"                                              */
/* ---------------------------------------------------------------------- */

CREATE TABLE Order_Product (
    OrderID INTEGER NOT NULL,
    ProductID INTEGER NOT NULL,
    Quantity INTEGER NOT NULL,
    CONSTRAINT PK_Order_Product PRIMARY KEY(OrderID, ProductID),
    CONSTRAINT FK_Order_Product1 FOREIGN KEY(OrderID) REFERENCES Orders(OrderID),
    CONSTRAINT FK_Order_Product2 FOREIGN KEY(ProductID) REFERENCES Product(ProductID)
);
