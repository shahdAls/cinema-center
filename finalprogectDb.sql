CREATE SCHEMA CRS;
CREATE TABLE Manager
	(
    ManagerID varchar(5)  NOT NULL,
    firstName VARCHAR (10),
    lastName VARCHAR (10),
    salary DECIMAL (5,3),
    city VARCHAR (20),
    street VARCHAR (20),
    CONSTRAINT Manager_PK PRIMARY KEY (ManagerID)
    );
    CREATE TABLE Movie
    (
    movieNumber INT(2) NOT NULL,
    movieDuration CHAR(5),
    movieDescription VARCHAR(500),
    movieName VARCHAR(40),
    limitAge INT(2),
    CONSTRAINT Movie_PK PRIMARY KEY (movieNumber)
    );
    CREATE TABLE Screen
    (
    screenNumber INT(2) NOT NULL,
    screenType  VARCHAR(20),
    screenAvailbility INT(1),
    CONSTRAINT Screen_PK PRIMARY KEY (screenNumber)
    );
    CREATE TABLE Branch
    (
    branchID varchar(10) NOT NULL,
    ManagerID varchar(5) ,
    city VARCHAR (20),
    street VARCHAR (50),
    CONSTRAINT Branch_PK PRIMARY KEY (branchID),
    CONSTRAINT Branch_FK1 FOREIGN KEY (ManagerID) REFERENCES Manager(ManagerID) ON DELETE SET NULL
    );
    #dateOfBirth is date not varchar
    CREATE TABLE Customer
    (
	branchID varchar(10),
    customerID INT(15),
    firstName VARCHAR (10),
    lastName VARCHAR (10),
    email  VARCHAR (40),
    dateOfBirth VARCHAR(10),
    CONSTRAINT Customer_PK PRIMARY KEY (customerID),
    CONSTRAINT Customer_FK1 FOREIGN KEY (branchID) REFERENCES Branch(branchID) ON DELETE CASCADE
    
    );
    #seatType domain = standard or vip
    CREATE TABLE Seat
    (
    seatNumber CHAR(4) NOT NULL,
    screenNumber INT(2),
    seatType VARCHAR(14),
    CONSTRAINT Seat_PK PRIMARY KEY (seatNumber),
	CONSTRAINT Seat_fk FOREIGN KEY(screenNumber) REFERENCES screen(screenNumber) ON DELETE CASCADE
    );
    #
    CREATE TABLE Display_on(
    movieNumber INT(2),
	screenNumber INT(2),
    CONSTRAINT Display_on_PK PRIMARY KEY (movieNumber,screenNumber),
    CONSTRAINT Display_on_FK1 FOREIGN KEY (movieNumber) REFERENCES Movie(movieNumber) ON DELETE CASCADE,
    CONSTRAINT Display_on_FK2 FOREIGN KEY (screenNumber) REFERENCES Screen(screenNumber) ON DELETE CASCADE);
    #
    CREATE TABLE Exhibit(
    movieNumber INT(2),
    branchID varchar(10),
     CONSTRAINT Exhibit_PK PRIMARY KEY (movieNumber,branchID),
     CONSTRAINT Exhibit_FK1 FOREIGN KEY (movieNumber) REFERENCES Movie(movieNumber) ON DELETE CASCADE,
     CONSTRAINT Exhibit_FK2 FOREIGN KEY (branchID) REFERENCES Branch(branchID) ON DELETE CASCADE);
    #phoneNumber primary key or not
    CREATE TABLE Manager_phone(
     ManagerID varchar(5) ,
     phoneNumber INT(10),
     CONSTRAINT Manager_phone_PK PRIMARY KEY (ManagerID,phoneNumber),
     CONSTRAINT Manager_phone_FK1 FOREIGN KEY (ManagerID) REFERENCES Manager(ManagerID) ON DELETE CASCADE);
    #
    CREATE TABLE Movie_type
    (
    movieNumber INT(2),
     movieType VARCHAR (20),
     CONSTRAINT Movie_type_PK PRIMARY KEY (movieType,movieNumber),
     CONSTRAINT Movie_type_FK1 FOREIGN KEY (movieNumber) REFERENCES Movie(movieNumber) ON DELETE CASCADE
    );
    #data type for movie date and pk or not
    #data type for movie time and pk or not
    CREATE TABLE Movie_date
    (
	movieDate VARCHAR(10),
    movieTime VARCHAR(5),
	movieNumber INT(2),
    CONSTRAINT Movie_date_PK PRIMARY KEY (movieDate,movieTime,movieNumber),
    CONSTRAINT  Movie_date_FK1 FOREIGN KEY (movieNumber) REFERENCES Movie(movieNumber) ON DELETE CASCADE
    );
    #
    CREATE TABLE Book
    (
    seatNumber CHAR(4) NOT NULL,
	customerID INT(15),
    movieNumber INT(2),
    bookingNumber INT(5),
    CONSTRAINT Book_PK PRIMARY KEY (seatNumber, customerID, movieNumber),
    CONSTRAINT Book_FK1 FOREIGN KEY (seatNumber) REFERENCES Seat(seatNumber) ON DELETE CASCADE,
    CONSTRAINT Book_FK2 FOREIGN KEY (customerID) REFERENCES Customer(customerID) ON DELETE CASCADE,
    CONSTRAINT Book_FK3 FOREIGN KEY (movieNumber) REFERENCES Movie(movieNumber) ON DELETE CASCADE
  
    );

INSERT INTO MANAGER
VALUES (5589,'Mohammed', 'Alharbi', 10.000, 'Jeddah', 'AlHamra Street'),
       (8723,'Ahmad', 'kinsara', 10.500, 'Riyadh', 'Alolia Street'),
       (2345,'Omar', 'Hariri', 12.000, 'Dammam', 'AlNaseem Street'),
       (6412,'Ammar', 'khateeb', 11.000, 'Qassim', 'AlGhadeer Street'),
       (5423,'Yaser', 'Alghamdi', 11.500, 'Jubail', 'AlFayha Street');
      
INSERT INTO MANAGER_PHONE
VALUES (5589, 0568736292),
	   (8723, 0543321876),
	   (2345, 0509994423),
       (6412, 0543388756),
	   (5423, 0569238163);
       
insert into Branch
values ('Br1011', 5589 , ' Jeddah' , 'King fahad Br Rd'),
('Br2011', 8723 , 'Riyadh','King  Abdulaziz Br Rd'),
('Br3011',  2345, 'Dammam','Al Nouzhah'),
('Br4011', 6412 , 'Qassim', 'King Abdallah Ibn Abdu Al Aziz'),
('Br5011' , 5423 ,  'Jubail' , ' Al Madinah Rd');


 
INSERT INTO Screen
    VALUES (01,'standard',0);
    INSERT INTO Screen
    VALUES (03,'suites',1);
    INSERT INTO Screen
    VALUES (02,'standard',0);
    INSERT INTO Screen
    VALUES (04,'suites',0); 
    INSERT INTO Screen
    VALUES (05,'standard',1); 

  INSERT INTO Movie
  values(1,100,'Julie is haunted by her grief after living through a tragic auto wreck that claimed the life of her composer husband and young daughter.','blue',14),
  (2,160,'The story of a virtuoso piano player who lives his entire life aboard an ocean liner. Born and raised on the ship','The Legend of 1900',14),
  (3,124,'A filmmaker recalls his childhood, when he fell in love with the movies at his village’s theater and formed a deep friendship with the theater’s projectionist','Cinema Paradiso',16),
  (4,135,' Nothing is as it seems when a woman experiencing misgivings about her new boyfriend joins him on a road trip to meet his parents at their remote farm.','I’m Thinking of Ending Things',16 ),
  (5,97,'A man arrives in Helsinki and gets beaten up so severely he develops amnesia. Unable to remember his name or anything from his past life, he cannot get a job or an apartment, so he starts living on the outskirts of the city and slowly starts putting his life back on track.','The Man Without a Past',14),
  (6,102,'In Casablanca, Morocco in December 1941, a cynical American expatriate meets a former lover, with unforeseen complications','Casablanca',14),
  (7,125,'Two children search for their father who is supposed to live in Germany. Their obsession for this father figure will take them to the boundaries between childhood and adolescence.','Landscape in the Mist',14);

  INSERT INTO Movie_type
  values
  (1,'Drama'),
  (2,'Drama'),
  (3,'Music'),
  (3,'Romance'),
  (4,'Mystery'),
  (4,'Drama'),
  (4,'Thriller'),
  (5,'Drama'),
  (5,'Comedy'),
  (6,'Romance'),
  (6,'Drama'),
  (7,'Drama');
  
insert INTO Movie_date
VALUES('1-11-22','6-8',1),
('2-11-22',	'6-8',1),
('1-11-22','4-7',2),
('4-11-22','9-12',2),
('4-11-22','10-1',	3),
('24-11-22','10-1',3),
('6-11-22','5-8',4),
('14-11-22','10-1',4),
('5-11-22','4-7',4);

insert INTO Movie_date
    VALUES ('6-11-22',  '10-12', 5); 
    INSERT INTO Movie_date
    VALUES ('17-11-22',  '6-8',  5); 
    INSERT INTO Movie_date
    VALUES ('25-11-22',  '4-6',  5); 
    INSERT INTO Movie_date
    VALUES ('18-11-22',  '8-10',  6);
    INSERT INTO Movie_date
    VALUES ('22-11-22',  '6-8',  6);
    INSERT INTO Movie_date
    VALUES ('22-11-22',  '10-12', 6);
    INSERT INTO Movie_date
    VALUES ('28-11-22',  '8-11',  7);
    INSERT INTO Movie_date
    VALUES ('15-11-22',  '4-7',  7);
    INSERT INTO Movie_date
    VALUES ('21-11-22',  '6-9',  7);
    
INSERT INTO Customer
    VALUES ('Br2011',442002795,'sara','alamoudi','sara@gmail.com','10-1-2002');
    INSERT INTO Customer
    VALUES ('Br1011',442002346,'nora','alahmadi','norah@gmail.com','3-5-2001');
    INSERT INTO Customer
    VALUES ('Br4011' ,452946295,'hind','algamdi','hind@gmail.com','8-4-2007');
    INSERT INTO Customer
    VALUES ('Br2011' ,442852903,'mohammed','alzahrani','mohammed@gmail.com','12-8-2004');
    INSERT INTO Customer
    VALUES ('Br3011' ,837652795,'ahmea','albarqi','ahmed@gmail.com','1-1-2002');
    INSERT INTO Customer
    VALUES ('Br5011' ,982332795,'noras','nagro','noras@gmail.com','12-5-2000');
    INSERT INTO Customer
    VALUES ('Br2011' ,335005795,'omar','khoger','omar@gmail.com','15-8-2004');
    INSERT INTO Customer
    VALUES ('Br3011' ,93683195,'yaser','alrashdi','yaser@gmail.com','6-8-2008');
    INSERT INTO Customer
    VALUES ('Br5011' ,874398126,'rawan','kamfar','rawan@gmail.com','19-11-1994');
    INSERT INTO Customer
    VALUES ('Br4011' ,985623763,'rozan','hafez','rozan@gmail.com','15-3-1999');
    

    Insert into exhibit
    values(1,'Br4011'),(1,'Br3011'),(1,'Br2011') ,(1,'Br1011') ,(1,'Br5011') ,
    (2,'Br5011') ,(2,'Br4011') ,(2,'Br2011') ,(2,'Br1011') ,(2,'Br3011') ,
     (3,'Br5011') ,(3,'Br4011') ,(3,'Br3011') ,(3,'Br2011') ,(3,'Br1011') ,
     (4,'Br1011') ,(4,'Br2011') ,(4,'Br3011') ,(4,'Br4011') ,(4,'Br5011') ,
     (5,'Br5011')  ,(5,'Br4011') ,(5,'Br3011') ,(5,'Br2011') ,(5,'Br1011') ,
     (6,'Br5011') ,(6,'Br4011') ,(6,'Br3011') ,(6,'Br2011') ,(6,'Br1011'),
     (7,'Br1011') ,(7,'Br2011') ,(7,'Br3011') ,(7,'Br4011') ,(7,'Br5011');
     
  INSERT INTO Display_on
    VALUES (1, 01),(1, 04);
    INSERT INTO Display_on
    VALUES (2, 02),(2,04);
     INSERT INTO Display_on
    VALUES (3, 03),(3,05);
    INSERT INTO Display_on
    VALUES (4, 02),(4,04);
    INSERT INTO Display_on
    VALUES (5, 03),(5,05);
    INSERT INTO Display_on
    VALUES (6, 01),(6,04);
    INSERT INTO Display_on
    VALUES (7, 03),(7,05);
    #-------------------------------------------------------------------------------
    Insert into SEAT
Values #screen1
('A1', 01,'Standard'),
('A2', 01,'Standard'),
('A3', 01,'Standard'),
('A4', 01,'Standard'),
('A5', 01,'Standard'),
('PA1', 01,'Premuim'),
('PA2', 01,'Premuim'),
('PA3', 01,'Premuim'),
('PA4', 01,'Premuim'),
('PA5', 01,'Premuim'),
#screen2
('B1', 02,'Standard'),
('B2', 02,'Standard'),
('B3', 02,'Standard'),
('B4', 02,'Standard'),
('B5', 02,'Standard'),
('PB1', 02,'Premuim'),
('PB2', 02,'Premuim'),
('PB3', 02,'Premuim'),
('PB4', 02,'Premuim'),
('PB5', 02,'Premuim'),

#screen3
('C1', 03,'Standard'),
('C2', 03,'Standard'),
('C3', 03,'Standard'),
('C4', 03,'Standard'),
('C5', 03,'Standard'),
('PC1', 03,'Premuim'),
('PC2', 03,'Premuim'),
('PC3', 03,'Premuim'),
('PC4', 03,'Premuim'),
('PC5', 03,'Premuim'),
#screen4
('E1', 04,'SuitesSeat'),
('E2', 04,'SuitesSeat'),
('E3', 04,'SuitesSeat'),
('E4', 04,'SuitesSeat'),
('E5', 04,'SuitesSeat'),
#screen5
('F1', 05,'SuitesSeat'),
('F2', 05,'SuitesSeat'),
('F3', 05,'SuitesSeat'),
('F4', 05,'SuitesSeat'),
('F5', 05,'SuitesSeat');
    
INSERT INTO book
VALUES ('E1', 442002795,1,7492 );
INSERT INTO book
VALUES ('E2' , 442002346 ,2, 1945 );
INSERT INTO book
VALUES('PC3' ,452946295 , 3,1854);
INSERT INTO book
VALUES('F3' , 442852903 , 5,1894);
INSERT INTO book
VALUES('E4' , 837652795 , 4,1038666629);
INSERT INTO Book
VALUES('F4',982332795,7,85848);
INSERT INTO Book
VALUES('E3',335005795,6,93948);
INSERT INTO Book
VALUES ('F2',93683195,3,4920);
INSERT INTO Book
VALUES ('B4',874398126,4,29311);
INSERT INTO Book
VALUES('F5',985623763,5,39111);
Insert into Book
values('A1',982332795,1,8758);
insert into Book
values ('PA3',442852903 ,6,87587);
insert into Book
values('F4',874398126,5,77804);

#update
update Movie_type
  set movieType='Thriller'
  where movieType ='Thrillemovie_typer';
  
  update MANAGER_PHONE
  set  phoneNumber=0535648430
  where phoneNumber= 0568736292;
  
#delete 
 delete from book
 where bookingNumber=7492;
 
 delete from movie_date
 where movieDate='6-11-22';
 
 

#select

# This statement displays the phone number for the managers who have an ID of 5589 or 5423
SELECT phoneNumber
  FROM MANAGER_PHONE
  WHERE ManagerID =  5589
  OR ManagerID = 5423;
  
  #Displays the first and last name of the customer and the number of customers who have a birthdate of (1-1-2002) or (10-1-2002)
  SELECT  firstName, lastName, COUNT(customerID) AS customers
        FROM Customer
        GROUP BY dateOfBirth
        HAVING 	dateOfBirth ='1-1-2002'
        OR dateOfBirth = '10-1-2002';
  
#List all details of  movies which display on screen number 4
  SELECT *
  FROM Movie
  WHERE movieNumber IN (SELECT DISTINCT movieNumber
      FROM Display_on
                        WHERE screenNumber IN (SELECT screenNumber
                                                FROM Screen
                                                WHERE screenNumber=04));
                                                
#For each Book  that has a movie, customer, and seat, list its booking number, movie number& name, customer ID & name, and seat number                                         
SELECT bookingNumber,m.movieNumber,movieName,c.customerID,firstName,s.seatNumber,seatType
 FROM book b, movie m, customer c, seat s
 WHERE m.movieNumber = b.movieNumber AND
       c.customerID = b.customerID AND
       s.seatNumber = b.seatNumber;
       
# SHOW AVALBILE & NOT AVALBILE SCREENS , AND ITS TYPE ALSO THE SECREEN NUMBER.
  SELECT *
  FROM Screen
  GROUP BY screenNumber
  HAVING screenType='Standard' OR screenType='suites';

  # dipslay number of Drama movies
SELECT MovieType , count(MovieType) AS movieCount
FROM Movie_type
GROUP BY MovieType
HAVING MovieType IN ('Drama');

#list first name, last name, branchID, city.
SELECT m.ManagerID , m. firstName , m.lastName , b.branchID , b.city
FROM Manager m , Branch b
WHERE m.ManagerID=b.ManagerID;

# display all romance movies
SELECT *
   FROM Movie_type
   WHERE movieType IN  ('Romance');
	
   #display all movie details where limit ages above 14
   SELECT *
   FROM Movie
   WHERE limitAge >14;
   
   #select all details from the movie and order by ascending order
SELECT *
	FROM Movie
	ORDER BY limitAge ASC;
        
#order the seat type based on which one is Premuim in which Screen
  select *
  from seat
  where seatType='Premuim'
  order by seatType;
  
  # display the manger has slasry >11.000
  select *
 from Manager
 group by ManagerID
 having salary>11.000;
        
  # select all details from the movie and order by movieDuration in descending order
  SELECT movieDuration,movieName
  FROM Movie
  ORDER BY movieDuration DESC;
  
  SELECT firstName,ManagerID,salary
  FROM Manager
  ORDER BY salary ;
  
        
        
