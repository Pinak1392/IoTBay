/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  benz
 * Created: 11/05/2022
 */

/* USERS TABLE */
INSERT INTO USERS(First_Name, Last_Name, Password, Email, PhoneNo, Date_Of_Birth, isCustomer, Active)
VALUES 
('Thomas', 'Muller', 'ThomasTheTrain', 'thomasmuller@gmail.com', 04879032718, '2003-01-05', True, False),
('Bobby', 'Lee', 'EmotionalDamage', 'bobbylee@gmail.com', 04990083376, '2000-08-23', True, False),
('Tom', 'Jerry', 'TomJerry', 'tomnjerry@gmail.com', 04768920344, '2001-08-08', True, False),
('Xavier', 'Chan', 'wasdwasdwasd', 'gamer123@gmail.com', 04908879987, '1998-04-18', True, False),
('Rocco', 'Norman', 'xyz232', 'rocco@gmail.com', 04233322232, '1980-11-07', False, False),
('Jack', 'Narrow', 'jacksparrow', 'realjack@gmail.com', 04234567767, '1999-10-05', True, False),
('Osian', 'Rocha', '1234567890', 'osian@gmail.com', 04112234341, '1998-09-20', True, False),
('Jim', 'Tyler', 'KingTyler', 'tyler211@gmail.com', 04908879982, '2000-04-19', False, False),
('Calvin', 'Client', '101903', 'calvin@gmail.com', 04332237689, '2003-10-19', False, False),
('Hash', 'Brown', 'Mcdonalds', 'hbrown@gmail.com', 04789230029, '1999-06-27', False, False),
('Bernard', 'Roberson', 'bus123xyz', 'bossbernard@gmail.com', 04980078283, '1989-02-03', True, False),
('Ioan', 'Becker', 'qwertyuiop', 'ioanbeck@gmail.com', 04823328767, '1999-03-14', True, False),
('Harvey', 'Normie', 'electronicsftw', 'harver@gmail.com', 04232789967, '2001-06-21', False, False),
('Ryan', 'Gibson', 'gibryagibrya', 'ryangibson@gmail.com', 04223236678, '2003-07-05', True, False),
('Scott', 'Sterling', 'ball12345', 'scottsterling@gmail.com', 04238799986, '1995-02-22', True, False),
('Jerry', 'Connor', 'connorjerry123', 'jerrycornor@gmail.com', 04293567123, '2000-04-15', True, False),
('Jacob', 'Holt', 'jacobxyz', 'jacobholt@gmail.com', 04237867954, '1992-10-16', False, False),
('Oskar', 'Wonker', 'oscarwinner', 'oskarwonker@gmail.com', 04238879056, '1987-07-18', False, False),
('Will', 'Smeth', 'slapper', 'willsmeth@gmail.com', 04835672289, '1986-06-27', False, False),
('Ryan', 'Finale', 'finally', 'finaleryan@gmail.com', 04289990845, '2001-08-02', False, False),
('Manly', 'Cooper', 'cooooper', 'coopergang@gmail.com', 04768852345, '2003-08-14', False, False),
('Michael', 'Jacker', 'moonwalker', 'michaelj@gmail.com', 04223326657, '2002-07-03', True, False),
('Bob', 'Son', '1234xyz', 'sonbob@gmail.com', 04232442311, '1999-03-11', False, False),
('Sean', 'Siu', 'siuuuu', 'seans@gmail.com', 04564244253, '1983-08-16', True, False),
('Jean', 'Bart', 'uteeee', 'jeanthebart@gmail.com', 04336663363, '1999-04-12', True, False),
('Sui', 'Sei', 'simp', 'suisei@gmail.com', 04884362553, '1990-10-03', True, False),
('King', 'Fahrun', 'gainandgun', 'gainz4life@gmail.com', 04225735424, '2001-02-20', False, False),
('Peter', 'Driver', 'spooderman', 'spooderman@gmail.com', 04225678325, '1993-04-21', True, False),
('Jarett', 'Kim', 'fortnitegamer', 'jarettthelegend@gmail.com', 04256683256, '1998-02-01', False, False),
('Gary', 'Kim', 'eh123', 'soso@gmail.com', 04623463453, '1992-07-18', False, False),
('Han', 'Coop', 'lightside', 'hancoop@gmail.com', 04464642224, '2002-10-11', False, False),
('Wao', 'Lim', 'chiopdgnda', 'waolim@gmail.com', 04257255544, '2003-10-12', False, False),
('Nanami', 'Sato', 'nanamiheart', 'satonanami@gmail.com', 04437711545, '2002-11-21', True, False),
('Kanna', 'Yuuki', 'dgagasads', 'yuuki@gmail.com', 04884445571, '2001-09-21', False, False),
('Naru', 'Hodo', 'understood', 'naruhoto@gmail.com', 04117589247, '1996-03-26', False, False),
('Persia', 'Juliet', 'myRomeo', 'julietpersia@gmail.com', 04233578955, '2000-04-21', True, False),
('Don', 'Maki', 'don12345', 'makidon@gmail.com', 04336547885, '1997-02-18', True, False),
('Dom', 'Torretto', 'family', 'familyman@gmail.com', 04994238878, '1976-03-11', False, False),
('Pen', 'Piper', 'fadgaergaeezaf', 'piper@gmail.com', 04556577458, '1984-12-02', True, False),
('Anos', 'Voldigord', 'demonlord', 'voldigord@gmail.com', 04668852347, '1979-11-03', False, False);

/* ULogs TABLE */
-- INSERT INTO ULogs(UserID, Time_Of_Action, "Action")
-- VALUES 

-- PLEASE FILL THE ABOVE, ID range goes from 1-20

/* Customer TABLE */
INSERT INTO Customer(CustomerID, Street_Number, Street_Name, Postcode, "STATE", Suburb, Country)
VALUES
(1, 23, 'Alfred', 2789, 'NSW', 'Kingston', 'Australia'),
(2, 11, 'Alice', 2720, 'NSW', 'Boston', 'Australia'),
(3, 21, 'Baltic', 2724, 'NSW', 'Koogarah', 'Australia'),
(4, 42, 'Dellington', 2735, 'NSW', 'Winsville', 'Australia'),
(6, 43, 'Darley', 2768, 'NSW', 'Hokings', 'Australia'),
(7, 24, 'Don', 2742, 'NSW', 'Bondie', 'Australia'),
(11, 33, 'Egan', 2712, 'NSW', 'Junktion', 'Australia'),
(12, 31, 'Gibbs', 2721, 'NSW', 'Cental', 'Australia'),
(14, 38, 'Gowrie', 2774, 'NSW', 'Gorden', 'Australia'),
(15, 96, 'Boochamp', 2777, 'NSW', 'Riversdale', 'Australia'),
(16, 58, 'Harold', 2786, 'NSW', 'Farmvalley', 'Australia'),
(22, 37, 'Harry', 2784, 'NSW', 'Cronala', 'Australia'),
(24, 74, 'Nuts', 2773, 'NSW', 'Haymarden', 'Australia'),
(25, 62, 'Herbert', 2720, 'NSW', 'Boston', 'Australia'),
(26, 60, 'Hollis', 2721, 'NSW', 'Cental', 'Australia'),
(28, 12, 'Balled', 2721, 'NSW', 'Cental', 'Australia'),
(33, 13, 'Capped', 2721, 'NSW', 'Cental', 'Australia'),
(36, 78, 'Forbes', 2790, 'NSW', 'Nellar', 'Australia'),
(37, 79, 'Maria', 2725, 'NSW', 'Vermicci', 'Australia'),
(39, 84, 'Missi', 2794, 'NSW', 'Schogarden', 'Australia');

/*Product Table*/
INSERT INTO PRODUCT(PRODUCTID, PRODUCTNAME, STOCK, PRICE, DESCRIPTION, ARCHIVED)
VALUES
(1, 'Hr202L Humidity Sensor', 10, 46.00, 'sensor', 0),
(2, 'SHT30 Temperature and Humidity Sensor', 33, 17.65, 'sensor', 0),
(3, 'VCNL4010 Proximity/Light sensor', 7, 14.74, 'sensor', 0),
(4, 'DFRobot SEN0312 Proximity Sensor', 10, 23.99, 'sensor', 0),
(5, 'TankMate R3 Tank Level Sensor', 12, 350.00, 'sensor', 0),
(6, 'Optomax Digital Liquid Level Sensor', 8, 43.99, 'sensor', 0),
(7, 'Autonics Inductive Proximity Sensor', 9, 40.00, 'sensor', 0),
(8, 'Spring Return Pneumatic Actuator', 5, 150.00, 'actuator', 0),
(9, 'VEVOR 20" Stroke Linear Actuator', 9, 52.99, 'actuator', 0),
(10, 'ACTUATOR - ELECTRIC 24DC X F05', 2, 1300.00, 'actuator', 0),
(11, 'Schmersal Magnetic Actuator, Plastic', 21, 31.99, 'actuator', 0),
(12, 'Hamlin 57135-000 Magnetic Actuator', 10, 17.50, 'actuator', 0),
(13, '230v Electric Thermal Actuator', 23, 10.33, 'actuator', 0),
(14, 'TG451 Industrial Cellular', 5, 399.00, 'gateway', 0),
(15, 'F-DPU100', 2, 699.00, 'gateway', 0),
(16, 'TG452', 9, 530.00, 'gateway', 0),
(17, 'TY511', 2, 499.00, 'gateway', 0),
(18, 'Advantech UTX-3117FS-S6A1N', 5, 1490.00, 'gateway', 0),
(19, 'Lantronix SGX 5150', 3, 688.50, 'gateway', 0),
(20, 'Ig902', 9, 1000.00, 'gateway', 0),
(21, 'GL-S10', 9, 36.35, 'gateway', 0);

 /* Card TABLE */
INSERT INTO Card(CardNo, CustomerID, CardName, CardExpiry, CardPin)
VALUES 
(4539878081538978, 1, 'Thomas Muller', '5/24', 297),
(4532251611706175, 2, 'Bobby Lee', '4/23', 892),
(6226984405246174, 3, 'Tom Jerry', '2/24', 246),
(4532845698352769, 4, 'Xavier Chan', '12/22', 276),
(5576643891292534, 6, 'Jack Narrow', '3/24', 231),
(5496199986474369, 7, 'Osian Rocha', '8/24', 368),
(4916104773752402, 11, 'Bernard Roberson', '7/24', 346),
(4539814402266510, 12, 'Ioan Becker', '8/24', 685),
(5101404895516111, 14, 'Ryan Gibson', '1/24', 272),
(4024007109877307, 15, 'Scott Sterling', '1/23', 655),
(6223059373857923, 16, 'Jerry Connor', '8/22', 967),
(4556017496281605, 22, 'Michael Jacker', '9/23', 754),
(4929369081986472, 24, 'Sean Siu', '1/23', 677),
(5115865636349067, 25, 'Jean Bart', '2/24', 685),
(5172977726468291, 26, 'Sui Sei', '8/24', 543),
(5180180805689156, 28, 'Peter Driver', '9/23', 435),
(4024007164947920, 33, 'Nanami Sato', '9/22', 124),
(6223057859229450, 36, 'Persia Juliet', '10/24', 436),
(5403525313938704, 37, 'Don Maki', '10/22', 346),
(4929277877296362, 39, 'Pen Piper', '11/23', 866);

/* Staff TABLE */
INSERT INTO Staff(StaffID, Staff_Position, Staff_Salary, Staff_EmploymentDate, Permissions)
VALUES
(5, 'Employee', 5000, '2020-10-08', '1'),
(8, 'Employee', 5000, '2020-10-08', '1'),
(9, 'Employee', 5000, '2020-10-08', '1'),
(10, 'Supervisor', 6500, '2020-10-08', '2'),
(13, 'Employee', 5000, '2020-10-08', '1'),
(17, 'Manager', 8000, '2020-10-08', '3'),
(18, 'Supervisor', 6500, '2020-10-08', '2'),
(19, 'Employee', 5000, '2020-10-08', '1'),
(20, 'Employee', 5000, '2020-10-08', '1'),
(21, 'Supervisor', 6500, '2020-10-08', '2'),
(23, 'Employee', 5000, '2020-10-08', '1'),
(27, 'Manager', 8000, '2020-10-08', '3'),
(29, 'Owner', 10000, '2020-10-08', '4'),
(30, 'Supervisor', 6500, '2020-10-08', '2'),
(31, 'Employee', 5000, '2020-10-08', '1'),
(32, 'Employee', 5000, '2020-10-08', '1'),
(34, 'Supervisor', 6500, '2020-10-08', '2'),
(35, 'Manager', 8000, '2020-10-08', '3'),
(38, 'Supervisor', 6500, '2020-10-08', '2'),
(40, 'Employee', 5000, '2020-10-08', '1');

