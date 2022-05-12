/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  timmy
 * Created: 11/05/2022
 */

/* ---------------------------------------------------------------------- */
/* Drop foreign key constraints                                           */
/* ---------------------------------------------------------------------- */

ALTER TABLE ULogs DROP CONSTRAINT FK_ULogs;


ALTER TABLE Customer DROP CONSTRAINT FK_Customer;


ALTER TABLE Staff DROP CONSTRAINT FK_Staff;


ALTER TABLE Card DROP CONSTRAINT FK_Card;


ALTER TABLE Payment DROP CONSTRAINT FK_Payment;


ALTER TABLE Orders DROP CONSTRAINT FK_Orders1;


ALTER TABLE Orders DROP CONSTRAINT FK_Orders2;


ALTER TABLE Order_Product DROP CONSTRAINT FK_Order_Product1;


ALTER TABLE Order_Product DROP CONSTRAINT FK_Order_Product2;


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
/* Drop table "Payment"                                                    */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE Payment DROP CONSTRAINT PK_Payment;


DROP TABLE Payment;



/* ---------------------------------------------------------------------- */
/* Drop table "Card"                                                    */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE Card DROP CONSTRAINT PK_Card;


DROP TABLE Card;




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


