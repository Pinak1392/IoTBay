/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  timmy
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

-- /* Card TABLE */
-- INSERT INTO Card(CardNo, CustomerID, CardName, CardExpiry, CardPin)
-- VALUES 
-- (, 1, )

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

