CREATE TABLE CUSTOMER_DETAILS
( License_No CHAR(8) NOT NULL,
 F_name VARCHAR(25) NOT NULL,
 L_name VARCHAR(25) NOT NULL,
 Ph_No VARCHAR(10) NOT NULL,
 email_id VARCHAR(30) NOT NULL,
 Area VARCHAR(30) NOT NULL,
 City VARCHAR(20) NOT NULL,
 State VARCHAR(20) NOT NULL,
 Pincode INTEGER(6) NOT NULL,
 CHECK (Age>=18)
 MEMBERSHIP_ID CHAR(5) Default '00000' NOT NULL,
 PRIMARY KEY (License_No)
);

CREATE TABLE CAR_CATEGORY
( Category VARCHAR(25) NOT NULL,
  No_of_persons INTEGER(2) NOT NULL,
 Cost_per_day INTEGER(5)  DEFAULT '500' NOT NULL,
 LateFee_charges INTEGER(4) NOT NULL,
 PRIMARY KEY (Category)
);

CREATE TABLE LOCATION_DETAILS
( Loc_ID CHAR(4) NOT NULL,
 Loc_Name VARCHAR(50) NOT NULL,
 Area VARCHAR(30) NOT NULL,
 City VARCHAR(20) NOT NULL,
 State VARCHAR(20) NOT NULL,
 Pincode INTEGER(6) NOT NULL,
 PRIMARY KEY (Loc_ID)
);

CREATE TABLE CAR
( Reg_no CHAR(7) NOT NULL,
 Model VARCHAR(25) NOT NULL,
 Make VARCHAR(25) NOT NULL,
 Car_category_name VARCHAR(25) NOT NULL,
 Car_loc CHAR(4) NOT NULL,
 Availability CHAR(1) default 'Y' NOT NULL,
 PRIMARY KEY (Reg_no),
 FOREIGN KEY (Car_category_name) REFERENCES 
CAR_CATEGORY(Category) on  delete cascade on update cascade,
 FOREIGN KEY (Car_loc) REFERENCES LOCATION_DETAILS(LOC_ID) on  delete cascade on update cascade
);

CREATE TABLE INSURANCE
( Ins_code CHAR(5) NOT NULL,
 Ins_name VARCHAR(50) NOT NULL,
 Coverage_type VARCHAR(200) NOT NULL,
 Cost INTEGER(4) NOT NULL,
 PRIMARY KEY (Ins_code),
 UNIQUE (Ins_name)
);

CREATE TABLE BOOKING_DETAILS
( Booking_ID CHAR(5) NOT NULL,
 From_date DATE NOT NULL,
 Ret_date DATE NOT NULL,
 Booking_status CHAR(1) DEFAULT 'N' NOT NULL,
 Pickup_Loc CHAR(4) NOT NULL,
 Drop_Loc CHAR(4) NOT NULL,
 Reg_No CHAR(7) NOT NULL,
 DL_No CHAR(8) NOT NULL,
 Insurance_Code CHAR(5),
 PRIMARY KEY (Booking_ID),
 FOREIGN KEY ( Pickup_Loc) REFERENCES LOCATION_DETAILS(Loc_ID) on  delete cascade on update cascade,
 FOREIGN KEY (Drop_Loc) REFERENCES LOCATION_DETAILS(Loc_ID) on  delete cascade on update cascade,
 FOREIGN KEY (Reg_No) REFERENCES CAR(Reg_no) on  delete cascade on update cascade,
 FOREIGN KEY (DL_No) REFERENCES CUSTOMER_DETAILS(License_No) on  delete cascade on update cascade,
 FOREIGN KEY (Insurance_Code) REFERENCES INSURANCE(Ins_code) on  delete cascade on update cascade
 );

CREATE TABLE BILLING_DETAILS
( BILL_ID CHAR(6) NOT NULL,
 BILL_DATE DATE NOT NULL,
 BILL_STATUS CHAR(2) DEFAULT 'NP' NOT NULL,
 Total_amt INTEGER(6) NOT NULL,
 GST INTEGER(5) NOT NULL,
 B_ID CHAR(5) NOT NULL,
 Delay_charges INTEGER(4) DEFAULT '0' NOT NULL,
 PRIMARY KEY (BILL_ID),
 FOREIGN KEY (B_ID) REFERENCES BOOKING_DETAILS(Booking_ID) on  delete cascade on update cascade
);



INSERT INTO CUSTOMER_DETAILS VALUES('F1234554', 'Surya','Teja',9063147965,'teju0262@gmail.com',
'Water front','Kurnool','A.P',750808,'M1001');
INSERT INTO CUSTOMER_DETAILS VALUES('F9764521', 'Neelesh','NP','9764567903', 'neeleshnp@gmail.com',
'Rajajinagar','Bengaluru','Karnataka',750801,'M1002');
INSERT INTO CUSTOMER_DETAILS VALUES('F2345611', 'Varun','meda','8189187546', 'varunmeda@gmail.com',
'MR layout','Ananthapur','A.P',913035,'M1003');
INSERT INTO CUSTOMER_DETAILS VALUES('R8763578', 'Mohith','Sai','7345678902', 'mohith@gmail.com','L.B Nagar',
'Hyderabad','Telangana',752024,'M1004');
INSERT INTO CUSTOMER_DETAILS VALUES('I3478953', 'Rohan','Reddy','9872563478', 'rohan7112@gmail.com','Venkatesh nagar',
'Gulbarga','Karnataka',752523,'M1005');
INSERT INTO CUSTOMER_DETAILS VALUES('E7521097', 'Shanmukh','Kalyan','9098123429', 'shanmukh@gmail.com','XYZ layout',
'Nellore','A.P',762452,'M10006');
INSERT INTO CUSTOMER_DETAILS VALUES('T0981237', 'Kiran','Reddy','6712890345', 'kiran@gmail.com','888 ROAD',
'Vijayawada','A.P',923674,'M1008');
INSERT INTO CUSTOMER_DETAILS VALUES('F0091266', 'Karthik','Jampani','7892340918', 'karthik@gmail.com','1007  PARKWAY',
'Prakasam','A.P',722125,'M1010');
INSERT INTO CUSTOMER_DETAILS VALUES('P1234567', 'Aneela','Gurram','9902489357', 'aneela@gmail.com','2256  STREET',
'Bengaluru','Karnataka',652892,'M10009');
INSERT INTO CUSTOMER_DETAILS VALUES('V5690245', 'Sathvika','Reddy','9908762514', 'sathvika@gmail.com','0099 X ROAD',
'Hyderabad','Telangana',973254,'M1020');

INSERT INTO CAR_CATEGORY VALUES('ECONOMY',5,DEFAULT,900);
INSERT INTO CAR_CATEGORY VALUES('COMPACT',5,3200,300);
INSERT INTO CAR_CATEGORY VALUES('MID SIZE',5,1500,200);
INSERT INTO CAR_CATEGORY VALUES('STANDARD',5,2200,400);
INSERT INTO CAR_CATEGORY VALUES('FULL SIZE',4,1800,1200);
INSERT INTO CAR_CATEGORY VALUES('LUXURY CAR',5,7500,2250);
INSERT INTO CAR_CATEGORY VALUES('MID SIZE SUV',5,DEFAULT,1000);
INSERT INTO CAR_CATEGORY VALUES('STANDARD SUV',5,3000,1200);
INSERT INTO CAR_CATEGORY VALUES('FULL SIZE SUV',8,6000,1800);
INSERT INTO CAR_CATEGORY VALUES('MINI VAN',7,DEFAULT,2000);

INSERT INTO LOCATION_DETAILS VALUES('L101',' KIA',
'ORR','Bengaluru','Karnataka',752352);
INSERT INTO LOCATION_DETAILS VALUES('L102','2256 road',
'Church Street','bengaluru','Karnataka',900454);
INSERT INTO LOCATION_DETAILS VALUES('L103','road no52',
'Electronic city','Bengaluru','Karnataka',752613);
INSERT INTO LOCATION_DETAILS VALUES('L104','T hub',
'Hi-tech city','Hyderabad','Telangana',770949);
INSERT INTO LOCATION_DETAILS VALUES('L105','80/112G',
'Banjara Hills','Hyderabad','Telangana',201566);
INSERT INTO LOCATION_DETAILS VALUES('L106','54/11',
'Banasankari','Bengaluru','Karnataka',071914);


INSERT INTO CAR VALUES('ABX1234','CIVIC','HONDA','ECONOMY','L101',DEFAULT);
INSERT INTO CAR VALUES('SDF4567','FIESTA','FORD',
'STANDARD','L102','N');
INSERT INTO CAR VALUES('GLZ2376','COROLLA','TOYOTA',
'ECONOMY','L104','Y');
INSERT INTO CAR VALUES('HJK1234','CIVIC','HONDA',
'ECONOMY','L102','N');
INSERT INTO CAR VALUES('GLS7625','SELTOS','KIA',
'STANDARD SUV','L106','N');
INSERT INTO CAR VALUES('FKD8202','GOLF','VOLKSWAGAN',
'LUXURY CAR','L106',DEFAULT);
INSERT INTO CAR VALUES('HNX1890','PRIUS','TOYOTA',
'COMPACT','L105','N');
INSERT INTO CAR VALUES('KJS1983','PRIUS','TOYOTA',
'ECONOMY','L104','Y');
INSERT INTO CAR VALUES('SDL9356','FOCUS','FORD',
'COMPACT','L103',DEFAULT);
INSERT INTO CAR VALUES('OTY7293','CRUZE','CHEVROLET',
'MID SIZE','L102','Y');
INSERT INTO CAR VALUES('QWE4562','LEGACY','SUBARU',
'FULL SIZE','L101','Y');
INSERT INTO CAR VALUES('CXZ2356','AVENGER','DODGE',
'MID SIZE','L102','Y');

INSERT INTO INSURANCE VALUES('I201', 'COLLISION DAMAGE WAIVER',
'Covers theft and total damage to the rental car',800);
INSERT INTO INSURANCE VALUES('I202', 
'SUPPLEMENTAL LIABILITY PROTECTION', 'Covers damage done to others',500);
INSERT INTO INSURANCE VALUES('I203', 
'PERSONAL ACCIDENT INSURANCE', 'Covers medical costs for driver and passengers',600);
INSERT INTO INSURANCE VALUES('I204', 
'PERSONAL EFFECTS COVERAGE', 'Covers theft of personal belongings',300);

INSERT INTO BOOKING_DETAILS VALUES('B1001','2016-01-20','2016-01-25','Y','L101','L101','ABX1234','F1234554','I201');
INSERT INTO BOOKING_DETAILS VALUES('B1002','2016-01-21','2016-01-24',DEFAULT,'L102','L103','GLS7625','R8763578','I204');
INSERT INTO BOOKING_DETAILS VALUES('B1003','2016-02-10', '2016-01-15','N','L103','L105','SDF4567','F9764521','I203');

-- joins
SELECT * FROM car_category LEFT JOIN car ON car_category.Category = car.Car_category_name ORDER BY car.Car_loc;
SELECT * FROM car_category RIGHT JOIN car ON car_category.Category = car.Car_category_name ORDER BY car.Car_loc;
SELECT * FROM customer_details INNER JOIN booking_details ON customer_details.License_No = booking_details.DL_No;
SELECT A.Loc_id, B.Loc_ID , A.Loc_name,A.area FROM location_details A, location_details B WHERE A.Loc_ID <> B.Loc_ID ORDER BY A.Area;
SELECT * FROM booking_details INNER JOIN location_details ON booking_details.Pickup_Loc = location_details.Loc_ID;
SELECT * FROM booking_details INNER JOIN billing_details ON booking_details.Booking_ID = billing_details.B_ID;

-- aggregate 
SELECT category,avg(no_of_persons),SUM(cost_per_day) FROM car_category group by category ;
SELECT state,count(License_no) FROM `customer_details` group by State;
SELECT car_loc,COUNT(Reg_no) FROM car GROUP BY car_loc;
SELECT avg(cost),sum(cost) from insurance;
SELECT category, avg(cost_per_day + Latefee_charges) FROM car_category group by no_of_persons;
select count(bill_id),((total_amt * (GST/100) ) + total_amt + Delay_charges) as total from billing_details;
SELECT count(total_amt) FROM booking_details INNER JOIN billing_details ON booking_details.Booking_ID = billing_details.B_ID where Dl_no='F1234554';

--set operations
SELECT City,State FROM customer_details WHERE state='Karnataka' UNION SELECT City,state FROM location_details WHERE state='Karnataka' ORDER BY City;
SELECT City,State FROM customer_details WHERE state='Karnataka' UNION all SELECT City,state FROM location_details WHERE state='Karnataka' ORDER BY City;
SELECT car_category_name FROM car INTERSECT SELECT  category FROM car_category; 
SELECT License_no FROM customer_details intersect SELECT DL_no FROM booking_details; 
SELECT car_loc FROM car intersect SELECT Loc_ID FROM location_details; 

-- procedure
DELIMITER @
create procedure booking_status(in b_id varchar(5))
BEGIN
 select * from booking_details where Booking_ID=b_id;
end @
DELIMITER ;
call booking_status('');

-- function
DELIMITER /
CREATE FUNCTION  offer_applicable(cost int)
      returns VARCHAR(20)
      DETERMINISTIC
      BEGIN
      IF cost > 500 THEN 
        RETURN ('Yes');
      ELSE 
        RETURN ('No');
     END IF;
      end /
DELIMITER ;
 select cost, Coverage_type, Ins_code, Ins_name, offer_applicable(cost) as offer_applicable from insurance;

-- trigger
DELIMITER //
CREATE TRIGGER category_insertion
BEFORE INSERT
ON car_category FOR EACH ROW
BEGIN
DECLARE error_msg VARCHAR(255);
SET error_msg = ('late_fee_charges exceeded cost_per_day');

IF (New.cost_per_day ) < (New.Latefee_charges) 
THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = error_msg; 
END IF;
END //
DELIMITER ;

-- cursor
create table car_backup ( R_ID varchar(8), 
car_name varchar(30),
Company varchar(16),
category_name varchar(10) ,
loc varchar(6),
Status_of_car VARCHAR(1));


DELIMITER //
CREATE PROCEDURE cursor_1()
   BEGIN
      DECLARE done INT DEFAULT 0;
      DECLARE ID,name,manufacturer,name2,loc_id,status varchar(25);
      DECLARE cur CURSOR FOR SELECT * FROM car;
      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
      OPEN cur;
      label: LOOP
      FETCH cur INTO ID,name,manufacturer,name2,loc_id,status;
      INSERT INTO car_backup VALUES(ID,name,manufacturer,name2,loc_id,status);
      IF done = 1 THEN LEAVE label;
      END IF;
      END LOOP;
      CLOSE cur;
   END//
DELIMITER ;

 call cursor_1();