/* ---------------------------------------------------------------------- */
/* Add tables                                                             */
/* ---------------------------------------------------------------------- */

/* ---------------------------------------------------------------------- */
/* Add table "Users"                                                      */
/* ---------------------------------------------------------------------- */



CREATE TABLE Users (
    UserID INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY(START WITH 1, INCREMENT BY 1),
    First_Name VARCHAR(40) NOT NULL,
    Last_Name VARCHAR(40) NOT NULL,
    Password VARCHAR(40) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    PhoneNo INTEGER NOT NULL,
    Date_Of_Birth DATE NOT NULL,
    isCustomer BOOLEAN NOT NULL,
    Active BOOLEAN NOT NULL,
    CONSTRAINT PK_Users PRIMARY KEY (UserID)
);




/* ---------------------------------------------------------------------- */
/* Add table "ULogs"                                                      */
/* ---------------------------------------------------------------------- */



CREATE TABLE ULogs (
    UserID INTEGER NOT NULL,
    Time_Of_Action VARCHAR(40) NOT NULL,
    Action VARCHAR(40) NOT NULL,
    CONSTRAINT PK_ULogs PRIMARY KEY (UserID)
);




/* ---------------------------------------------------------------------- */
/* Add table "Customer"                                                   */
/* ---------------------------------------------------------------------- */



CREATE TABLE Customer (
    UserID INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY(START WITH 1, INCREMENT BY 1),
    Street_Number INTEGER,
    Street_Name VARCHAR(40),
    Postcode INTEGER,
    State VARCHAR(40),
    Suburb VARCHAR(40),
    Country VARCHAR(40),
    CardNo INTEGER,
    CardExpiry VARCHAR(40),
    CardPin INTEGER,
    PaymentMeth VARCHAR(40),
    CONSTRAINT PK_Customer PRIMARY KEY (UserID)
);




/* ---------------------------------------------------------------------- */
/* Add table "Staff"                                                      */
/* ---------------------------------------------------------------------- */

CREATE TABLE Staff (
    UserID INTEGER NOT NULL,
    Staff_Position VARCHAR(40),
    Staff_Salary INTEGER,
    Staff_EmploymentDate DATE,
    Permissions VARCHAR(5),
    CONSTRAINT PK_Staff PRIMARY KEY (UserID)
);


/* ---------------------------------------------------------------------- */
/* Add table "Orders"                                                     */
/* ---------------------------------------------------------------------- */



CREATE TABLE Orders (
    OrderID INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY(START WITH 1, INCREMENT BY 1),
    Status VARCHAR(10) NOT NULL,
    Street_Number INTEGER,
    Street_Name VARCHAR(40),
    Postcode INTEGER,
    State VARCHAR(40),
    Suburb VARCHAR(40),
    Country VARCHAR(40),
    Order_Date VARCHAR(40) NOT NULL,
    Cost NUMERIC(10,2) NOT NULL,
    PaymentMeth VARCHAR(40),
    UserID INTEGER,
    CONSTRAINT PK_Orders PRIMARY KEY (OrderID)
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
    Archived BOOLEAN NOT NULL,
    CONSTRAINT PK_Product PRIMARY KEY (ProductID)
);




/* ---------------------------------------------------------------------- */
/* Add table "Order_Product"                                              */
/* ---------------------------------------------------------------------- */

CREATE TABLE Order_Product (
    OrderID INTEGER NOT NULL,
    ProductID INTEGER NOT NULL,
    Quantity INTEGER NOT NULL,
    CONSTRAINT PK_Order_Product PRIMARY KEY (OrderID, ProductID)
);


/* ---------------------------------------------------------------------- */
/* Add table "Cate;ry"                                                   */
/* ---------------------------------------------------------------------- */



CREATE TABLE Category (
    CatID INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY(START WITH 1, INCREMENT BY 1),
    Category VARCHAR(40) NOT NULL,
    ParentCat INTEGER,
    CONSTRAINT PK_Category PRIMARY KEY (CatID)
);




/* ---------------------------------------------------------------------- */
/* Add table "Cate;ry_Product"                                           */
/* ---------------------------------------------------------------------- */

CREATE TABLE Category_Product (
    CatID INTEGER NOT NULL,
    ProductID INTEGER NOT NULL,
    CONSTRAINT PK_Category_Product PRIMARY KEY (CatID, ProductID)
);


/* ---------------------------------------------------------------------- */
/* Add table "Supplier"                                                   */
/* ---------------------------------------------------------------------- */



CREATE TABLE Supplier (
    SupplierID INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY(START WITH 1, INCREMENT BY 1),
    Supplier_Name VARCHAR(40) NOT NULL,
    Supplier_ContactNumber INTEGER NOT NULL,
    Supplier_StreetNumber INTEGER NOT NULL,
    Supplier_StreetName VARCHAR(40) NOT NULL,
    Supplier_State VARCHAR(40) NOT NULL,
    Supplier_Suburb VARCHAR(40) NOT NULL,
    Supplier_Country VARCHAR(40) NOT NULL,
    CONSTRAINT PK_Supplier PRIMARY KEY (SupplierID)
);




/* ---------------------------------------------------------------------- */
/* Add table "SupplierTransaction"                                           */
/* ---------------------------------------------------------------------- */

CREATE TABLE SupplierTransaction (
    SupplierID INTEGER NOT NULL,
    ProductID INTEGER NOT NULL,
    Cost NUMERIC(10,2) NOT NULL,
    CONSTRAINT PK_SupplierTransaction PRIMARY KEY (SupplierID, ProductID)
);


/* ---------------------------------------------------------------------- */
/* Add table "Supplier_Product"                                          */
/* ---------------------------------------------------------------------- */

CREATE TABLE Supplier_Product (
    SupplierID INTEGER NOT NULL,
    ProductID INTEGER NOT NULL,
    Purchase_Date VARCHAR(40) NOT NULL,
    Quantity_Ordered INTEGER NOT NULL,
    Total_Price NUMERIC(10,2) NOT NULL,
    CONSTRAINT PK_Supplier_Product PRIMARY KEY (SupplierID, ProductID)
);


/* ---------------------------------------------------------------------- */
/* Add foreign key constraints                                            */
/* ---------------------------------------------------------------------- */

ALTER TABLE ULogs ADD CONSTRAINT Users_ULogs 
    FOREIGN KEY (UserID) REFERENCES Users (UserID)
;


ALTER TABLE Customer ADD CONSTRAINT Users_Customer 
    FOREIGN KEY (UserID) REFERENCES Users (UserID) ON DELETE CASCADE
;


ALTER TABLE Staff ADD CONSTRAINT Users_Staff 
    FOREIGN KEY (UserID) REFERENCES Users (UserID) ON DELETE CASCADE
;


ALTER TABLE Orders ADD CONSTRAINT Customer_Orders 
    FOREIGN KEY (UserID) REFERENCES Customer (UserID)
;


ALTER TABLE Order_Product ADD CONSTRAINT Orders_Order_Product 
    FOREIGN KEY (OrderID) REFERENCES Orders (OrderID)
;


ALTER TABLE Order_Product ADD CONSTRAINT Product_Order_Product 
    FOREIGN KEY (ProductID) REFERENCES Product (ProductID)
;


ALTER TABLE Category ADD CONSTRAINT Category_Category 
    FOREIGN KEY (ParentCat) REFERENCES Category (CatID) ON DELETE SET NULL
;


ALTER TABLE Category_Product ADD CONSTRAINT Category_Category_Product 
    FOREIGN KEY (CatID) REFERENCES Category (CatID)
;


ALTER TABLE Category_Product ADD CONSTRAINT Product_Category_Product 
    FOREIGN KEY (ProductID) REFERENCES Product (ProductID)
;


ALTER TABLE SupplierTransaction ADD CONSTRAINT Supplier_SupplierTransaction 
    FOREIGN KEY (SupplierID) REFERENCES Supplier (SupplierID)
;


ALTER TABLE SupplierTransaction ADD CONSTRAINT Product_SupplierTransaction 
    FOREIGN KEY (ProductID) REFERENCES Product (ProductID)
;


ALTER TABLE Supplier_Product ADD CONSTRAINT Supplier_Supplier_Product 
    FOREIGN KEY (SupplierID) REFERENCES Supplier (SupplierID)
;


ALTER TABLE Supplier_Product ADD CONSTRAINT Product_Supplier_Product 
    FOREIGN KEY (ProductID) REFERENCES Product (ProductID)
;

