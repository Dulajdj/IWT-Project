/*Table customer*/
CREATE TABLE Customer
(
User_ID varchar (10) not null,
Salutation varchar (8) not null,
F_Name varchar (30) not null,
L_Name varchar (30) not null,
House_no varchar (20) not null,
Street varchar (20) not null,
City varchar (20) not null,
Postal_Code varchar (10) not null,
Country varchar (20) not null,
DOB date not null,
Password varchar (10) not null,
Gender varchar (10) not null,
Email varchar (30) not null,
CONSTRAINT Customer_PK PRIMARY KEY (User_ID)
);
/*Table Customer_ Phone*/
CREATE TABLE Customer_Phone
(
User_ID varchar (10) not null,
Phone_no decimal (10,0) not null,
CONSTRAINT Customer_Phone_PK PRIMARY KEY(User_ID),
CONSTRAINT Customer_Phone_FK FOREIGN KEY(User_ID) References Customer (User_ID)

);
/*Table Tour_Guide*/
CREATE TABLE Tour_Guide
(
T_G_ID varchar (10) not null,
F_Name varchar (30) not null,
L_Name varchar (30) not null,
House_no varchar (20) not null,
Street varchar (20) not null,
City varchar (20) not null,
Postal_Code varchar (10) not null,
Password varchar (10) not null,
Email varchar (30) not null,
CONSTRAINT Tour_Guide_PK PRIMARY KEY(T_G_ID)
);
CREATE TABLE Tour_Guide_Phone /*Table Tour Guide Phone*/
(
T_G_ID varchar (10) not null,
Phone_no decimal (10,0) not null,
CONSTRAINT Tour_Guide_Phone_PK PRIMARY KEY(T_G_ID),
CONSTRAINT Tour_Guide_Phone_FK FOREIGN KEY(T_G_ID) References Tour_Guide (T_G_ID)
);
/*Table Travel_Advissor */
CREATE TABLE Travel_Advissor (
 T_A_ID varchar (10) not null,
 F_Name varchar (30) not null,
 L_Name varchar (30) not null,
 House_no varchar (20) not null,
 Street varchar (20) not null,
 city varchar (20) not null,
 Postal_Code varchar (10) not null,
 Password varchar (10) not null,
 Email varchar (30) CHECK (Email LIKE '%_@_%._%') not null,

 constraint Travel_Advissor_PK PRIMARY KEY (T_A_ID)
);
/*Table Travel_Advissor_phone */
CREATE TABLE Travel_Advissor_phone (

 T_A_ID varchar (10) not null,
 Phone_no decimal (10, 0) not null,

 CONSTRAINT Travel_Advissor_phone_PK PRIMARY KEY (T_A_ID),
 CONSTRAINT Travel_Advissor_phone_FK FOREIGN KEY (T_A_ID) REFERENCES 
 Travel_Advissor (T_A_ID)

);
/* Table Manager */
CREATE TABLE Manager (
 M_ID varchar (10) not null,
 Name varchar (30) not null,
 House_no varchar (20) not null,
 Street varchar (20) not null,
 city varchar (20) not null,
 Postal_code varchar (10) not null,
 Password varchar (10) not null,
 DOB date not null,
 Email varchar (30) CHECK (Email LIKE '%_@_%._%') not null,

 CONSTRAINT Manager_PK PRIMARY KEY (M_ID)
);
/* Table Manager_phone  */
CREATE TABLE Manager_Phone (
 M_ID varchar (10) not null,
 Phone_no decimal (10, 0) not null,

 CONSTRAINT Manager_Phone_PK PRIMARY KEY (M_ID),
 CONSTRAINT Manager_Phone_FK FOREIGN KEY (M_ID) REFERENCES Manager(M_ID)
);
/*Table Driver */
CREATE TABLE Driver (

 D_ID varchar (10) not null,
 Name varchar (30) not null,
 Email varchar (30) CHECK (Email LIKE '%_@_%._%') not null,

 CONSTRAINT Driver_PK PRIMARY KEY (D_ID),
);
/*Table Driver_Phone*/
CREATE TABLE Driver_Phone (

 D_ID varchar (10) not null,
 Phone_no decimal (10, 0) not null,

 CONSTRAINT Driver_Phone_PK PRIMARY KEY (D_ID),
 CONSTRAINT Driver_Phone_FK FOREIGN KEY (D_ID) REFERENCES Driver(D_ID)
);
/*Table Hotel_Reservation*/
CREATE TABLE Hotel_Reservation(
 H_R_ID varchar (10) not null,
 User_ID varchar (10) not null,
 T_G_ID varchar (10) not null,
 T_A_ID varchar (10) not null,
 Date date not null,
 F_Name varchar (30) not null,
 L_Name varchar (30) not null,
 Country varchar (20) not null,
 No_childrens int not null,
 status varchar not null,
 P_ID varchar (10) not null,
 Invoice_no varchar (10) not null,

 CONSTRAINT Hotel_Reservation_PK PRIMARY KEY ( H_R_ID),
 CONSTRAINT Hotel_Reservation_FK FOREIGN KEY (User_ID) REFERENCES Customer (User_ID),
 CONSTRAINT Hotel_Reservation1_FK FOREIGN KEY (T_G_ID ) REFERENCES Tour_Guide(T_G_ID),
 CONSTRAINT Hotel_Reservation2_FK FOREIGN KEY (T_A_ID) REFERENCES Travel_Advissor(T_A_ID)
);
/*Table Hotel_Reservation_Email */
CREATE TABLE Hotel_Reservation_Email (

 H_R_ID varchar (10) not null,
 Email varchar (30) CHECK (Email LIKE '%_@_%._%') not null,

 CONSTRAINT Hotel_Reservation_Email_PK PRIMARY KEY ( H_R_ID),
 CONSTRAINT Hotel_Reservation_Email_FK FOREIGN KEY ( H_R_ID) REFERENCES Hotel_Reservation(H_R_ID)
);
/*Table Hotel_Reservation_Phone */
CREATE TABLE Hotel_Reservation_Phone (
 H_R_ID varchar (10) not null,
 Phone_no decimal (10, 0) not null,

 CONSTRAINT Hotel_Reservation_Phone_PK PRIMARY KEY ( H_R_ID),
 CONSTRAINT Hotel_Reservation2_FK FOREIGN KEY (T_A_ID) REFERENCES Travel_Advissor (T_A_ID ) 
);
/*Table Vehicle*/
CREATE TABLE Vehicle(
 V_ID varchar (10) not null,
 V_No varchar (10) not null,
 V_Type varchar (10) not null,
 V_Model varchar (10) not null,
 Rental_Rate varchar (10) not null,
 Capacity varchar (30) not null,
 T_A_ID varchar (10) not null,
 D_ID varchar (10) not null,

 CONSTRAINT Vehicle_PK PRIMARY KEY ( V_ID),
 CONSTRAINT Vehicle_FK FOREIGN KEY ( T_A_ID ) REFERENCES Travel_Advissor(T_A_ID ),
 CONSTRAINT Vehicle1_FK FOREIGN KEY ( D_ID ) REFERENCES Driver (D_ID )
);
/*Table Report*/
CREATE TABLE Report (
 R_ID varchar (10) not null,
 M_ID varchar (10) not null,
 R_Type varchar (10) not null,
 R_Date date not null,
 
 CONSTRAINT Report_PK PRIMARY KEY ( R_ID),
 CONSTRAINT Report_FK FOREIGN KEY (M_ID ) REFERENCES Manager (M_ID )
 );
 /*Table Invoice*/
CREATE TABLE Invoice (
 User_ID varchar (10) not null,
 Invoice_No varchar (10) not null,
 P_method varchar (10) not null,
 Discounts float not null,
 M_ID varchar (10) not null,
 
 CONSTRAINT Invoice_PK PRIMARY KEY ( Invoice_No ),
 CONSTRAINT Invoice_FK FOREIGN KEY (User_ID ) REFERENCES Customer (User_ID ),
 CONSTRAINT Invoice1_FK FOREIGN KEY (M_ID ) REFERENCES Manager (M_ID )
 );
  /*Table Feedback*/
CREATE TABLE Feedback  (
 Feedback_ID varchar (10) not null,
 User_ID varchar (10) not null,
 F_Date date not null,
 comment varchar not null,
 
 CONSTRAINT Feedback_PK PRIMARY KEY (Feedback_ID ),
 CONSTRAINT Feedback_FK FOREIGN KEY (User_ID) REFERENCES Customer (User_ID)
 );
  /*Table Tour_Packages*/
CREATE TABLE Tour_Packages (
 P_ID varchar (10) not null,
 User_ID varchar (10) not null,
 P_Type varchar (10) not null,
 P_Price float not null,
 T_A_ID varchar (10) not null,
 
 
 CONSTRAINT Tour_Packages_PK PRIMARY KEY ( P_ID),
 CONSTRAINT Tour_Packages_FK FOREIGN KEY (User_ID ) REFERENCES Customer (User_ID ),
 CONSTRAINT Tour_Packages_FK FOREIGN KEY ( T_A_ID ) REFERENCES Travel_Advissor(T_A_ID )
 );
 /*Table Manager managers TA*/
CREATE TABLE Manager managers TA (
 M_ID varchar (10) not null,
 T_A_ID varchar (10) not null,
 
 
 
 CONSTRAINT Manager managers TA_PK PRIMARY KEY ( P_ID),
 CONSTRAINT Manager managers TA_FK FOREIGN KEY (T_A_ID) REFERENCES Travel_Advissor(T_A_ID)
 
 );



/* Add table details */


/* Customer table details*/
INSERT INTO Customer VALUES ('IT0001', 'Mrs', 'Pawani', 'Chandrasiri', 'No.66/1', 'colombo
road','Colombo', 11536, 'Sri lanka', '1995-01-11', '*****','Female', 'pawani@gmail.com');
INSERT INTO Customer VALUES ('IT0002', 'Mrs', 'piyumi', 'Perera', 'No.78/2',
'kandy road','Kandy', 11122, 'Sri lanka', '1997-04-06','*****','Female',
'piyumi@gmail.com');
INSERT INTO Customer VALUES ('IT0003', 'Mr', 'isuru', 'Rathnasiri', 'No.35/3',
'Awissawella road','Awissawella', 11052, 'Australia', '1985-10-08','*****','Male',
'isuru@gmail.com');
INSERT INTO Customer VALUES ('IT0004', 'Mr', 'janindu', 'Gimhan', 'No.22/37',
'Gothami road','Gampaha', 11212, 'Australia', '1996-03-08','*****','Male',
'gimhan@gmail.com');
INSERT INTO Customer VALUES ('IT0005', 'Mrs', 'Mithma', 'Premasiri', 'No.61/1',
'Hansagiri road','Gampaha', 11020, 'Sri lanka', '1995-10-11','*****','Female',
'mithma@gmail.com');


/*Customer_Phone table details*/
INSERT INTO Customer_Phone VALUES ('IT0001', 0777456123);
INSERT INTO Customer_Phone VALUES ('IT0002', 0714422168);
INSERT INTO Customer_Phone VALUES ('IT0003', 0760162134);
INSERT INTO Customer_Phone VALUES ('IT0004', 0777441567);
INSERT INTO Customer_Phone VALUES ('IT0005', 0717080913);

/* Tour_Guide table details*/
INSERT INTO Tour_Guide VALUES ('TG0001', 'Shammi', 'Nawoda', 'No.66/9', 'Nugegoda
road','Nugegoda', 10732,'*****, 'shammi@gmail.com');
INSERT INTO Tour_Guide VALUES ('TG0002', 'Ridmi', 'Chandrasiri', 'No.75/2',
'Colombo road','Colombo', 11536,'*****', 'ridmi@gmail.com');
INSERT INTO Tour_Guide VALUES ('TG0003', 'Sahan', 'Narangoda', 'No.90/3',
'kandy road','Kandy', 10120, '*****', 'sahan@gmail.com');
INSERT INTO Tour_Guide VALUES ('TG0004', 'Sithum', 'Perera', 'No.78/37',
'Kurunagala','Kurunagala', 10100, '*****', 'sithum@gmail.com');
INSERT INTO Tour_Guide  VALUES ('TG0005', 'Shenori', 'Kaushalya', 'No.60/1',
'Kuliyapitiya road','Kuliyapitiya', 10107, '*****', 'shenori@gmail.com');

/*Tour_Guide_Phone Table details*/
INSERT INTO Tour_Guide_Phone VALUES ('TG0001', 0772706678);
INSERT INTO Tour_Guide_Phone VALUES ('TG0002', 0713030917);
INSERT INTO Tour_Guide_Phone VALUES ('TG0003', 0764422131);
INSERT INTO Tour_Guide_Phone VALUES ('TG0004', 0730162181);
INSERT INTO Tour_Guide_Phone VALUES ('TG0005', 0755152315);

/* Travel_Advissor_ table details*/
INSERT INTO Travel_Advissor VALUES ('TA0001', 'Githmi', 'Perera', 'No.64/9', 'Nugegoda
road','Nugegoda', 10100,'*****', 'githmi@gmail.com’);
INSERT INTO Travel_Advissor VALUES ('TA0002', 'kasuni', 'Lakshika', 'No.61/2',
'Colombo road','Colombo', 11052,'*****', 'kasuni@gmail.com');
INSERT INTO Travel_Advissor VALUES ('TA0003', 'Tharindu', 'Sandeepa', 'No.78/3',
'kandy road','Kandy', 00800, '*****', 'tharindu@gmail.com');
INSERT INTO Travel_Advissor VALUES ('TA0004', 'dewmini', 'Perera', 'No.98/37',
'Kurunagala','Kurunagala', 11212, '*****', 'dewmini@gmail.com');
INSERT INTO Travel_Advissor VALUES ('TA0005', 'Shesha', 'Kaushalya', 'No.60/1',
'Kuliyapitiya road','Kuliyapitiya', 00200, '*****', 'shesha@gmail.com');

/*Travel_Advissor_Phone Table details*/
INSERT INTO Travel_Advissor_Phone VALUES ('TA0001', 0772706678);
INSERT INTO Travel_Advissor_Phone VALUES ('TA0002', 0713030917);
INSERT INTO Travel_Advissor_Phone VALUES ('TA0003', 0764422131);
INSERT INTO Travel_Advissor_Phone VALUES ('TA0004', 0730162181);
INSERT INTO Travel_Advissor_Phone VALUES ('TA0005', 0755152315);

/* Manager table details*/
INSERT INTO Manager VALUES ('MA0001', 'Githmi', 'No.64/9', 'Nugegoda
road','Nugegoda', 10100,'*****', '1985-10-08', 'githmi@gmail.com');
INSERT INTO Manager VALUES ('MA0002', 'kasuni', 'No.61/2',
'Colombo road','Colombo', 11052,'*****', '1985-10-08', 'kasuni@gmail.com');
INSERT INTO Manager VALUES ('MA0003', 'Tharindu', 'No.78/3',
'kandy road','Kandy', 00800, '*****', '1985-10-08', 'tharindu@gmail.com');
INSERT INTO Manager VALUES ('MA0004', 'dewmini', 'No.98/37',
'Kurunagala','Kurunagala', 11212, '*****', '1985-10-08', 'dewmini@gmail.com');
INSERT INTO Manager VALUES ('MA0005', 'Shesha', 'No.60/1',
'Kuliyapitiya road','Kuliyapitiya', 00200, '*****', '1985-10-08', 'shesha@gmail.com');


/*Manager_Phone Table details*/
INSERT INTO Manager_Phone VALUES ('TA0001', 0772678232);
INSERT INTO Manager_Phone VALUES ('TA0002', 0713030917);
INSERT INTO Manager_Phone VALUES ('TA0003', 0764422131);
INSERT INTO Manager_Phone VALUES ('TA0004', 0730162181);
INSERT INTO Manager_Phone VALUES ('TA0005', 0755152315);


/*Driver Table details*/
INSERT INTO Driver VALUES ('D0001','Amashi', 0778528569);
INSERT INTO Driver VALUES ('D0002','Kithmi', 0715250425);
INSERT INTO Driver VALUES ('D0003','Nethmi', 0765632336);
INSERT INTO Driver VALUES ('D0004','Githmi', 0768521145);
INSERT INTO Driver VALUES ('D0005', 'Sithmi',0755554658);

/*Driver_Phone Table details*/
INSERT INTO Driver_Phone VALUES ('D0001', 0772706609);
INSERT INTO Driver_Phone VALUES ('D0002', 0713256352);
INSERT INTO Driver_Phone VALUES ('D0003', 0764425225);
INSERT INTO Driver_Phone VALUES ('D0004', 0775658222);
INSERT INTO Driver_Phone VALUES ('D0005', 0753467123);

/* Hotel_Reservation table details*/
INSERT INTO Hotel_Reservation VALUES ('H0001','IT0001','TG0001','TA0001,'2020/05/05', 'Githmi', 'Chandrasiri','Sri lanka', 5,
2,'Married', 'P0001', 'I0001');
INSERT INTO Hotel_Reservation VALUES ('H0002','IT0002', 'TG0002','TA0002','2020/05/05','sithmi', ‘Narangoda','Canada',9,
1,'Married', 'P0002', 'I0002');
INSERT INTO Hotel_Reservation VALUES ('H0003','IT0003','TG0003','TA0003','2020/05/05', 'kavindu', 'Rathnasiri','India',4,
2,'Married', 'P0003', 'I0003');
INSERT INTO Hotel_Reservation VALUES ('H0004','IT0004','TG0004','TA0004','2020/05/05', 'dewmi', 'Shehana','Canada', 6,
1,'Married', 'P0004', 'I0004');
INSERT INTO Hotel_Reservation VALUES ('H0005','IT0005','TG0005','TA0005','2020/05/05', 'Shammai', 'Nawoda','Sri lanka',3,
2,'Married', 'P0005', 'I0005');


/* Hotel_Reservation_Email Table details*/
INSERT INTO  Hotel_Reservation_Email VALUES ('H0001','githmi@gmail.com');
INSERT INTO  Hotel_Reservation_Email VALUES ('H0002', 'sithmi@gmail.com');
INSERT INTO  Hotel_Reservation_Email VALUES ('H0003', 'kavindu@gmail.com');
INSERT INTO  Hotel_Reservation_Email VALUES ('H0004', 'dewmi@gmail.com');
INSERT INTO  Hotel_Reservation_Email VALUES ('H0005', 'shammi@gmail.com');


/* Hotel_Reservation_Phone Table details*/
INSERT INTO  Hotel_Reservation_Phone  VALUES ('H0001',0714422131);
INSERT INTO  Hotel_Reservation_Phone  VALUES ('H0002', 0772709608);
INSERT INTO  Hotel_Reservation_Phone  VALUES ('H0003', 0712324540);
INSERT INTO  Hotel_Reservation_Phone  VALUES ('H0004', 0767881089);
INSERT INTO  Hotel_Reservation_Phone  VALUES ('H0005', 0760132456);
 

/* Vehicle table details*/
INSERT INTO Vehicle  VALUES ('V0001','CAR0001','Car','BMW',10000 ,7, 'TA0002','D0002');
INSERT INTO Vehicle  VALUES ('V0002','CAR0002', 'Car','Bence',20000,6,'TA0001', 'D0003');
INSERT INTO Vehicle VALUES ('V0003','CB0003','Bike','Yamaha',10000, 4, 'TA0003','D0001');
INSERT INTO Vehicle  VALUES ('V0004','CAR0004','Car','BMW',20000, 5, 'TA0005','D0005');
INSERT INTO Vehicle  VALUES ('V0005','CAR0005','Car','BMW',30000, 3, 'TA0004','D0005');

/* Report Table details*/
INSERT INTO  Report  VALUES ('R0001','MA0001','pass','2020/05/07’);
INSERT INTO  Report  VALUES ('R0002','MA0003','pass','2020/02/05');
INSERT INTO  Report  VALUES ('R0003','MA0002','pass','2020/08/15');
INSERT INTO  Report  VALUES ('R0004','MA0004','fail','2020/03/25');
INSERT INTO  Report  VALUES ('R0005','MA0005','pass','2020/08/29');


/* Invoice Table details*/
INSERT INTO  Invoice  VALUES ('IT0001','I0001','cash',100000,'MA0001');
INSERT INTO  Invoice  VALUES ('IT0002','I0002','online',20000,'MA0002');
INSERT INTO  Invoice  VALUES ('IT0003','I0003','cash',10000,'MA0003');
INSERT INTO  Invoice  VALUES ('IT0004','I0004','online',1000,'MA0004');
INSERT INTO  Invoice  VALUES ('IT0005','I0005','online',20000,'MA0005');

/* Feedback Table details*/
INSERT INTO  Feedback VALUES ('F0001','IT0001','2020/05/05','Good');
INSERT INTO  Feedback VALUES ('F0002','IT0002','2020/07/05','Excellent');
INSERT INTO  Feedback VALUES ('F0003','IT0003''2020/06/05','bad');
INSERT INTO  Feedback VALUES ('F0004','IT0004''2020/08/05','good');
INSERT INTO  Feedback  VALUES ('F0005','IT0005','2020/07/05','Excellent');

/*Tour_Packages Table details*/
INSERT INTO  Tour_Packages VALUES ('P0001','IT0001','cash',1000,'TA0001');
INSERT INTO  Tour_Packages VALUES ('P0001','IT0002','online',1500,'TA0002');
INSERT INTO  Tour_Packages VALUES ('P0001','IT0003','online',2000,'TA0003');
INSERT INTO  Tour_Packages VALUES ('P0001','IT0004','cash',1500,'TA0004');
INSERT INTO  Tour_Packages VALUES ('P0001','IT0005','online',1000,'TA0005');


/* Manager_manages_TA Table details*/
INSERT INTO   Manager_manages_TA VALUES ('MA0001','TA0001’);
INSERT INTO   Manager_manages_TA   VALUES ('MA0002','TA0002');
INSERT INTO   Manager_manages_TA   VALUES ('MA0003','TA0003');
INSERT INTO   Manager_manages_TA   VALUES ('MA0004','TA0004');
INSERT INTO   Manager_manages_TA   VALUES ('MA0005','TA0005');
