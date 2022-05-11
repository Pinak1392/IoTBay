/* ---------------------------------------------------------------------- */
/* Drop foreign key constraints                                           */
/* ---------------------------------------------------------------------- */

ALTER TABLE ULogs DROP CONSTRAINT Users_ULogs;


ALTER TABLE Customer DROP CONSTRAINT Users_Customer;


ALTER TABLE Staff DROP CONSTRAINT Users_Staff;


ALTER TABLE Orders DROP CONSTRAINT Customer_Orders;


ALTER TABLE Order_Product DROP CONSTRAINT Orders_Order_Product;


ALTER TABLE Order_Product DROP CONSTRAINT Product_Order_Product;


ALTER TABLE Category DROP CONSTRAINT Category_Category;


ALTER TABLE Category_Product DROP CONSTRAINT Category_Category_Product;


ALTER TABLE Category_Product DROP CONSTRAINT Product_Category_Product;


ALTER TABLE Supplier_Product DROP CONSTRAINT Supplier_Supplier_Product;


ALTER TABLE Supplier_Product DROP CONSTRAINT Product_Supplier_Product;


ALTER TABLE SupplierTransaction DROP CONSTRAINT Supplier_SupplierTransaction;


ALTER TABLE SupplierTransaction DROP CONSTRAINT Product_SupplierTransaction;


/* ---------------------------------------------------------------------- */
/* Drop table "SupplierTransaction"                                         */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE SupplierTransaction DROP CONSTRAINT PK_SupplierTransaction;


DROP TABLE SupplierTransaction;


/* ---------------------------------------------------------------------- */
/* Drop table "Supplier_Product"                                          */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE Supplier_Product DROP CONSTRAINT PK_Supplier_Product;


DROP TABLE Supplier_Product;


/* ---------------------------------------------------------------------- */
/* Drop table "Supplier"                                                  */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE Supplier DROP CONSTRAINT PK_Supplier;


DROP TABLE Supplier;


/* ---------------------------------------------------------------------- */
/* Drop table "Category_Product"                                          */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE Category_Product DROP CONSTRAINT PK_Category_Product;


DROP TABLE Category_Product;


/* ---------------------------------------------------------------------- */
/* Drop table "Category"                                                  */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE Category DROP CONSTRAINT PK_Category;


DROP TABLE Category;


/* ---------------------------------------------------------------------- */
/* Drop table "Order_Product"                                             */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE Order_Product DROP CONSTRAINT PK_Order_Product;


DROP TABLE Order_Product;


/* ---------------------------------------------------------------------- */
/* Drop table "Product"                                                   */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE Product DROP CONSTRAINT PK_Product;


DROP TABLE Product;


/* ---------------------------------------------------------------------- */
/* Drop table "Orders"                                                    */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE Orders DROP CONSTRAINT PK_Orders;


DROP TABLE Orders;


/* ---------------------------------------------------------------------- */
/* Drop table "Staff"                                                     */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE Staff DROP CONSTRAINT PK_Staff;


DROP TABLE Staff;


/* ---------------------------------------------------------------------- */
/* Drop table "Customer"                                                  */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE Customer DROP CONSTRAINT PK_Customer;


DROP TABLE Customer;


/* ---------------------------------------------------------------------- */
/* Drop table "ULogs"                                                     */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE ULogs DROP CONSTRAINT PK_ULogs;


DROP TABLE ULogs;


/* ---------------------------------------------------------------------- */
/* Drop table "Users"                                                     */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE Users DROP CONSTRAINT PK_Users;


DROP TABLE Users;

