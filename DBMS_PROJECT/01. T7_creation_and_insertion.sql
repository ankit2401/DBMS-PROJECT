create database vic_ltd2;
use vic_ltd2;

CREATE TABLE `t7_application` (
  `T7_Application_Id` varchar(20) NOT NULL,
  `T7_Vehicle_Id` varchar(20) NOT NULL,
  `T7_Application_Status` char(8) NOT NULL,
  `T7_Coverage` varchar(50) NOT NULL,
  `T7_Cust_Id` varchar(20) NOT NULL,
  PRIMARY KEY (`T7_Application_Id`,`T7_Cust_Id`),
  UNIQUE KEY `XPKAPPLICATION_2` (`T7_Application_Id`,`T7_Cust_Id`),
  KEY `R_93` (`T7_Cust_Id`),
  CONSTRAINT `R_93` FOREIGN KEY (`T7_Cust_Id`) REFERENCES `t7_customer` (`T7_CUST_Id`) on delete cascade on update cascade
);
INSERT INTO `t7_application` VALUES ('70701','70401','ACCEPTED','Liability Insurance Coverage','70101'),
	('70702','70402','ACCEPTED','Uninsured And Underinsured Motorist Coverage','70101'),
    ('70703','70403','ACCEPTED','Comprehensive Coverage','70102'),
    ('70704','70404','ACCEPTED','Collision Coverage','70102'),
    ('70705','70405','ACCEPTED','Medical Payments Coverage','70102'),
    ('70706','70406','ACCEPTED','Personal Injury Protection','70103'),
    ('70707','70407','ACCEPTED','Uninsured And Underinsured Motorist Coverage','70103'),
    ('70708','70408','ACCEPTED','Liability Coverage','70104'),
    ('70709','70409','ACCEPTED','Medical Payments Coverage','70104'),
    ('70710','70410','ACCEPTED','Medical Payments Coverage','70105'),
    ('70711','70411','ACCEPTED','Liability Coverage','70106'),
    ('70712','70412','ACCEPTED','Comprehensive Coverage','70107'),
    ('70713','70413','ACCEPTED','Uninsured And Underinsured Motorist Coverage','70108'),
    ('70714','70414','ACCEPTED','Medical Payments Coverage','70109'),
    ('70715','70415','ACCEPTED','Collision Coverage','70109'),
    ('70716','70416','ACCEPTED','Liability Coverage','70110'),
    ('70717','70417','ACCEPTED','Personal Injury Protection','70110'),
    ('70718','70418','ACCEPTED','Personal Injury Protection','70111'),
    ('70719','70419','ACCEPTED','Comprehensive Coverage','70112'),
    ('70720','70420','ACCEPTED','Collision Coverage','70115'),
    ('70721','70421','ACCEPTED','Collision Coverage','70115'),
    ('70722','70422','ACCEPTED','Liability Coverage','70113');


CREATE TABLE `t7_claim` (
  `T7_Claim_Id` varchar(20) NOT NULL,
  `T7_Agreement_Id` varchar(20) NOT NULL,
  `T7_Claim_Amount` int NOT NULL,
  `T7_Incident_id` varchar(20) DEFAULT NULL,
  `T7_Damage_Type` varchar(20) DEFAULT NULL,
  `T7_Date_Of_Claim` date NOT NULL,
  `T7_Claim_Status` char(10) NOT NULL,
  `T7_Cust_Id` varchar(20) NOT NULL,
  PRIMARY KEY (`T7_Claim_Id`,`T7_Cust_Id`),
  UNIQUE KEY `XPKCLAIM_7` (`T7_Claim_Id`,`T7_Cust_Id`),
  KEY `R_88` (`T7_Cust_Id`),
  CONSTRAINT `R_88` FOREIGN KEY (`T7_Cust_Id`) REFERENCES `t7_customer` (`T7_CUST_Id`) on delete cascade on update cascade
);
INSERT INTO `t7_claim` VALUES ('77501','70801',1200000,'70001','Engine Fire','2020-03-03','Pending','70101'),
	('77502','70802',800000,'70004','Damaged in Tsunami','2019-02-04','Approved','70101'),
    ('77503','70803',150000,'70002','Theft','2020-07-29','Pending','70102'),
    ('77504','70804',180000,'70013','Fully Burnt','2019-02-23','Approved','70102'),
    ('77505','70805',4500000,NULL,NULL,'2020-03-06','Pending','70102'),
    ('77506','70806',2700000,'70003','Collision with Tree','2020-08-23','Pending','70103'),
    ('77507','70807',350000,NULL,NULL,'2018-12-19','Rejected','70103'),
    ('77508','70808',500000,'70005','Tyres Caught Fire','2019-05-03','Pending','70104'),
    ('77509','70809',200000,'70006','Vehicle Collision','2018-05-04','Rejected','70104'),
    ('77510','70810',4500000,'70015','Accident','2020-05-22','Pending','70105'),
    ('77511','70811',180000,'70007','Theft','2019-12-20','Rejected','70106'),
    ('77512','70812',450000,NULL,NULL,'2020-06-16','Pending','70107'),
    ('77513','70813',270000,NULL,NULL,'2020-08-20','Pending','70108'),
    ('77514','70814',550000,NULL,NULL,'2017-12-19','Rejected','70109'),
    ('77515','70815',450000,NULL,NULL,'2020-03-09','Pending','70109'),
    ('77516','70816',70000,NULL,NULL,'2019-08-25','Pending','70110'),
    ('77517','70817',450000,NULL,NULL,'2018-12-19','Rejected','70110'),
    ('77518','70818',450000,'70010','Accident','2020-03-06','Pending','70111'),
    ('77519','70819',270000,'70011','Theft','2019-08-23','Rejected','70112'),
    ('77520','70820',350000,NULL,NULL,'2018-12-19','Rejected','70115'),
    ('77521','70821',200000,'70009','Vehicle Collision','2020-08-23','Approved','70115'),
    ('77522','70822',300000,NULL,NULL,'2018-12-19','Rejected','70113');


CREATE TABLE `t7_claim_settlement` (
  `T7_Claim_Settlement_Id` varchar(20) NOT NULL,
  `T7_Vehicle_Id` varchar(20) NOT NULL,
  `T7_Date_Settled` date NOT NULL,
  `T7_Amount_Paid` int NOT NULL,
  `T7_Coverage_Id` varchar(20) NOT NULL,
  `T7_Claim_Id` varchar(20) NOT NULL,
  `T7_Cust_Id` varchar(20) NOT NULL,
  PRIMARY KEY (`T7_Claim_Settlement_Id`,`T7_Claim_Id`,`T7_Cust_Id`),
  UNIQUE KEY `XPKCLAIM_SETTLEMENT_8` (`T7_Claim_Settlement_Id`,`T7_Claim_Id`,`T7_Cust_Id`),
  KEY `R_90` (`T7_Claim_Id`,`T7_Cust_Id`),
  CONSTRAINT `R_90` FOREIGN KEY (`T7_Claim_Id`, `T7_Cust_Id`) REFERENCES `t7_claim` (`T7_Claim_Id`, `T7_Cust_Id`) on delete restrict on update cascade
);
INSERT INTO `t7_claim_settlement` VALUES ('77601','70402','2019-03-23',800000,'77402','77502','70101'),
	('77602','70404','2019-03-20',180000,'77404','77504','70102'),
    ('77603','70407','2019-01-11',0,'77407','77507','70103'),
    ('77604','70409','2019-03-09',0,'77409','77509','70104'),
    ('77605','70411','2020-03-15',0,'77411','77511','70106'),
    ('77606','70414','2018-09-07',0,'77414','77514','70109'),
    ('77607','70417','2018-12-30',0,'77417','77517','70110'),
    ('77608','70419','2019-10-29',0,'77419','77519','70112'),
    ('77609','70420','2019-01-13',0,'77420','77520','70115'),
    ('77610','70421','2020-10-28',200000,'77421','77521','70115'),
    ('77611','70422','2019-02-24',0,'77422','77522','70113');



CREATE TABLE `t7_coverage` (
  `T7_Coverage_Id` varchar(20) NOT NULL,
  `T7_Coverage_Amount` int NOT NULL,
  `T7_Coverage_Type` char(30) NOT NULL,
  `T7_Coverage_Level` char(30) NOT NULL,
  `T7_Product_Id` varchar(20) NOT NULL,
  `T7_Coverage_Description` varchar(400) DEFAULT NULL,
  `T7_Coverage_Terms` varchar(200) DEFAULT NULL,
  `T7_Company_Name` varchar(400) NOT NULL,
  PRIMARY KEY (`T7_Coverage_Id`,`T7_Company_Name`),
  UNIQUE KEY `XPKCOVERAGE_19` (`T7_Coverage_Id`,`T7_Company_Name`),
  KEY `R_102` (`T7_Company_Name`),
  CONSTRAINT `R_102` FOREIGN KEY (`T7_Company_Name`) REFERENCES `t7_insurance_company` (`T7_Company_Name`) on update cascade on delete cascade
);
INSERT INTO `t7_coverage` VALUES ('77401',1500000,'Liability','primary','T7001','Coverage Maturity period is 5 years','Accidents and thefts due to Traffic Violations are not covered,Half of the amount in case of natural calamity would be given after 1-2 years','ABC ltd'),
	('77402',1000000,'Uninsured And Underinsured','Full','T7002','Coverage Maturity period is 5 years','Accidents and thefts due to Traffic Violations are not covered','ABC ltd'),
    ('77403',800000,'Comprehensive','Secondary','T7003','Coverage Maturity period is 5 years','Accidents and thefts due to Traffic Violations are not covered','ABC ltd'),
    ('77404',900000,'Collision','primary','T7004','Coverage Maturity period is 6 years','Accidents and thefts due to Traffic Violations are not covered','ABC ltd'),
    ('77405',1500000,'Medical Payments','Full','T7005','Coverage Maturity period is 5 years','Accidents and thefts due to Traffic Violations are not covered','BCD ltd'),
    ('77406',1060000,'Personal Injury','Secondary','T7006','Coverage Maturity period is 5 years','Accidents and thefts due to Traffic Violations are not covered,Half of the amount in case of natural calamity would be given after 1-2 years','BCD ltd'),
    ('77407',1080000,'Uninsured And Underinsured','primary','T7007','Coverage Maturity period is 5 years','Accidents and thefts due to Traffic Violations are not covered','BCD ltd'),
    ('77408',900000,'Liability','Full','T7008','Coverage Maturity period is 4 years','Accidents and thefts due to Traffic Violations are not covered,Half of the amount in case of natural calamity would be given after 1-2 years','CDE ltd'),
    ('77409',100000,'Medical Payments','Secondary','T7009','Coverage Maturity period is 5 years','Accidents and thefts due to Traffic Violations are not covered,Half of the amount in case of natural calamity would be given after 1-2 years','CDE ltd'),
    ('77410',1900000,'Medical Payments','primary','T7010','Coverage Maturity period is 5 years','Accidents and thefts due to Traffic Violations are not covered','CDE ltd'),
    ('77411',900000,'Liability','Secondary','T7011','Coverage Maturity period is 4 years','Accidents and thefts due to Traffic Violations are not covered','CDE ltd'),
    ('77412',1230000,'Comprehensive','Full','T7012','Coverage Maturity period is 6 years','Accidents and thefts due to Traffic Violations are not covered','DEF ltd'),
    ('77413',1506000,'Uninsured And Underinsured','Secondary','T7013','Coverage Maturity period is 5 years','Accidents and thefts due to Traffic Violations are not covered','DEF ltd'),
    ('77414',743000,'Medical Payments','Full','T7014','Coverage Maturity period is 5 years','Accidents and thefts due to Traffic Violations are not covered,Half of the amount in case of natural calamity would be given after 1-2 years','DEF ltd'),
    ('77415',687000,'Collision','Full','T7015','Coverage Maturity period is 4 years','Accidents and thefts due to Traffic Violations are not covered,Half of the amount in case of natural calamity would be given after 1-2 years','DEF ltd'),
    ('77416',653000,'Liability','Full','T7016','Coverage Maturity period is 6 years','Accidents and thefts due to Traffic Violations are not covered','EFG ltd'),
    ('77417',886000,'Personal Injury','Secondary','T7017','Coverage Maturity period is 5 years','Accidents and thefts due to Traffic Violations are not covered','EFG ltd'),
    ('77418',907000,'Personal Injury','Full','T7018','Coverage Maturity period is 5 years','Accidents and thefts due to Traffic Violations are not covered','FGH ltd'),
    ('77419',1102000,'Comprehensive','Secondary','T7019','Coverage Maturity period is 6 years','Accidents and thefts due to Traffic Violations are not covered,Half of the amount in case of natural calamity would be given after 1-2 years','GHI ltd'),
    ('77420',1907000,'Collision','Full','T7020','Coverage Maturity period is 6 years','Accidents and thefts due to Traffic Violations are not covered,Half of the amount in case of natural calamity would be given after 1-2 years','HIJ ltd'),
    ('77421',110000,'Collision','Full','T7021','Coverage Maturity period is 5 years','Accidents and thefts due to Traffic Violations are not covered','IJK ltd'),
    ('77422',2007000,'Liability','Secondary','T7022','Coverage Maturity period is 5 years','Accidents and thefts due to Traffic Violations are not covered','JKL ltd');



CREATE TABLE `t7_customer` (
  `T7_CUST_Id` varchar(15) NOT NULL,
  `T7_CUST_FName` varchar(15) NOT NULL,
  `T7_CUST_LName` varchar(15) NOT NULL,
  `T7_CUST_DOB` date NOT NULL,
  `T7_CUST_Gender` char(2) NOT NULL,
  `T7_CUST_Address` varchar(35) NOT NULL,
  `T7_CUST_MOB_Number` bigint NOT NULL UNIQUE ,
  `T7_CUST_Email` varchar(25) DEFAULT NULL UNIQUE,
  `T7_CUST_Passport_Number` varchar(20) DEFAULT NULL UNIQUE,
  `T7_CUST_Marital_Status` char(12) DEFAULT NULL,
  `T7_CUST_PPS_Number` int DEFAULT NULL UNIQUE,
  PRIMARY KEY (`T7_CUST_Id`),
  UNIQUE KEY `XPKCUSTOMER_1` (`T7_CUST_Id`)
);
INSERT INTO `t7_customer` VALUES ('70101','Arun','Kumar','1999-10-24','M','Chennai',9000000001,'1@gmail.com','7X101','Single',101),
	('70102','Varun ','Kumar ','1999-07-25','M','Mumbai ',8000010001,'2@gmail.com','7X102','Married',102),
    ('70103','Nidhi  ','Agarwal  ','1997-05-02','F','Hyderabad ',9000000002,'3@gmail.com',NULL,'Divorced',103),
    ('70104','Sharukh  ','Khan  ','1998-07-13','M','Chennai ',8307468394,'4@gmail.com','7X104','Single',104),
    ('70105','Shilpa','Shetty  ','1999-02-20','F','Delhi ',9000000003,'5@gmail.com ',NULL,'Married',105),
    ('70106','Rhea  ','Chakraborty  ','1998-05-07','F','Banglore ',8005010001,'6@gmail.com','7X106','Divorced',106),
    ('70107','Aamir  ','Khan  ','1997-06-08','M','Mumbai ',9000000004,'7@gmail.com',NULL,'Single',107),
    ('70108','Ayushmann  ','Khurana  ','1996-07-06','M','Hyderabad ',9007568394,'8@gmail.com','7X108','Married',108),
    ('70109','Kareena  ','Kapoor  ','1995-08-21','F','Banglore ',9000000005,'9@gmail.com',NULL,'Single',109),
    ('70110','Anushka  ','Sharma  ','1994-09-27','F','Mumbai ',8009010001,'10@gmail.com','7X110','Married',110),
    ('70111','Virat  ','Kohli  ','1993-10-09','M','Hyderabad ',9000000006,'11@gmail.com',NULL,'Single',111),
    ('70112','Rohit  ','Sharma  ','1992-11-01','M','Mumbai ',8000014301,'12@gmail.com','7X112','Divorced',112),
    ('70113','Himanshu  ','Singh  ','1993-12-03','M','Hyderabad ',9000000007,'13@gmail.com','7X113','Single',113),
    ('70114',' Abhijeet ',' Patel ','1991-12-31','M','Delhi ',8000010781,'14@gmail.com','7X114','Married',114),
    ('70115',' Nagarjuna ','Akkineni  ','1991-03-30','M','Banglore ',9000001008,'15@gmail.com','7X115','Divorced',115);



CREATE TABLE `t7_department` (
  `T7_Department_Name` varchar(50) NOT NULL,
  `T7_Department_ID` varchar(50) NOT NULL,
  `T7_Department_Staff` varchar(50) DEFAULT NULL,
  `T7_Company_Name` varchar(100) NOT NULL,
  PRIMARY KEY (`T7_Department_Name`,`T7_Department_ID`,`T7_Company_Name`),
  UNIQUE KEY `XPKDEPARTMENT` (`T7_Department_Name`,`T7_Department_ID`,`T7_Company_Name`),
  KEY `R_56` (`T7_Company_Name`),
  CONSTRAINT `R_56` FOREIGN KEY (`T7_Company_Name`) REFERENCES `t7_insurance_company` (`T7_Company_Name`) on update cascade 
);
INSERT INTO `t7_department` VALUES ('Accounts and Legal Department','70311','Vishnu','DEF ltd'),
	('Accounts Department','70303','Sufyan','ABC ltd'),
    ('Accounts Department','70304','Shantanu','BCD ltd'),
    ('Accounts Department','70313','Ramesh','EFG ltd'),
    ('Accounts Department','70319','Rahul','GHI ltd'),
    ('Accounts Department','70320','Srujana','HIJ ltd'),
    ('Claims Department','70302','Rishabh','ABC ltd'),
    ('Claims Department','70306','Tushar','BCD ltd'),
    ('Claims Department','70310','Krishna','CDE ltd'),
    ('Claims Department','70312','Mahesh','DEF ltd'),
    ('Claims Department','70316','Deeksha','FGH ltd'),
    ('Claims Department','70318','Suraj','GHI ltd'),
    ('Investment Department','70307','Amitabh','BCD ltd'),
    ('Legal Department','70301','Sumith','ABC ltd'),
    ('Legal Department','70305','Prabhdeep','BCD ltd'),
    ('Legal Department','70314','Suresh','EFG ltd'),
    ('Legal Department','70317','Praneetha','GHI ltd'),
    ('Legal Department','70321','Varun','HIJ ltd'),
    ('Loss Control Department','70309','Sachin','CDE ltd'),
    ('Marketing Department','70308','Ankit','BCD ltd'),
    ('Statistical Department','70315','Malini','FGH ltd');



CREATE TABLE `t7_incident` (
  `T7_Incident_Id` varchar(20) NOT NULL,
  `T7_Incident_Type` varchar(50) DEFAULT NULL,
  `T7_Incident_Date` date NOT NULL,
  `T7_Incident_Description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`T7_Incident_Id`),
  UNIQUE KEY `XPKINCIDENT_17` (`T7_Incident_Id`)
);
INSERT INTO `t7_incident` VALUES ('70001','Fire','2018-06-15','Fire accident due to external factors not mentioned in the policy are not covered'),
	('70002','Theft','2019-01-01','Insurance for vehicles lost in unauthorised parking areas are not covered'),
    ('70003','Accident','2019-07-09','Insurance in case of accident can be availed as per the terms and conditions of policy and traffic laws'),
    ('70004','Act Of God','2019-08-09','Half of the insurance amount can be availed by the customers immediately and the other half after a maturity period of 2 years'),
    ('70005','Fire','2016-10-14','Fire accident due to external factors not mentioned in the policy are not covered'),
    ('70006','Accident','2018-05-23','Insurance in case of accident can be availed as per the terms and conditions of policy and traffic laws'),
    ('70007','Theft','2017-01-15','Insurance for vehicles lost in unauthorised parking areas are not covered'),
    ('70009','Accident','2014-01-07','Insurance in case of accident can be availed as per the terms and conditions of policy and traffic laws'),
    ('70010','Accident','2014-01-20','Insurance in case of accident can be availed as per the terms and conditions of policy and traffic laws'),
    ('70011','Theft','2014-11-21','Insurance for vehicles lost in unauthorised parking areas are not covered'),
    ('70013','Fire','2015-11-17','Fire accident due to external factors not mentioned in the policy are not covered'),
    ('70015','Accident','2019-10-21','Insurance in case of accident can be availed as per the terms and conditions of policy and traffic laws');


CREATE TABLE `t7_incident_report` (
  `T7_Incident_Report_Id` varchar(20) NOT NULL,
  `T7_Incident_Type` char(50) DEFAULT NULL,
  `T7_Incident_Inspector` varchar(20) DEFAULT NULL,
  `T7_Incident_Cost` int DEFAULT NULL,
  `T7_Incident_Report_Description` varchar(1000) DEFAULT NULL,
  `T7_Incident_Id` varchar(20) NOT NULL,
  `T7_Cust_Id` varchar(20) NOT NULL,
  PRIMARY KEY (`T7_Incident_Report_Id`,`T7_Incident_Id`,`T7_Cust_Id`),
  UNIQUE KEY `XPKINCIDENT_REPORT_18` (`T7_Incident_Report_Id`,`T7_Incident_Id`,`T7_Cust_Id`),
  KEY `R_83` (`T7_Incident_Id`),
  KEY `R_86` (`T7_Cust_Id`),
  CONSTRAINT `R_83` FOREIGN KEY (`T7_Incident_Id`) REFERENCES `t7_incident` (`T7_Incident_Id`) on delete cascade on update cascade,
  CONSTRAINT `R_86` FOREIGN KEY (`T7_Cust_Id`) REFERENCES `t7_customer` (`T7_CUST_Id`) on update cascade on delete cascade
);
INSERT INTO `t7_incident_report` VALUES ('70201','Fire','Sumith',20000,'Due to overheat, the wires got burnt out','70001','70101'),
	('70202','Theft','Rishabh',500000,'Vehicle was stolen infront of a temple at an authorised parking space','70002','70102'),
    ('70203','Accident','Prabhdeep',78000,'Vehicle collided to a tree','70003','70103'),
    ('70204','Act Of God','Sufyan',500000,'Due to tsunami, the vehicle was damaged','70004','70101'),
    ('70205','Fire','Tushar',21000,'The Tyres caught up fire due to excessive friction','70005','70104'),
    ('70206','Accident','Shantanu',80000,'The driver was drunk ','70006','70104'),
    ('70207','Theft','Ankit',100000,'The vehicle was parked in a no parking lot','70007','70106'),
    ('70209','Accident','Ankitha',51000,'The vehicle was on a right way and an other vehicle coming in the wrong route collided with the vehicle','70009','70115'),
    ('70210','Accident','Trishul',89000,'The accident occured due to overspeed','70010','70111'),
    ('70211','Theft','Prakash',250000,'The vehicle was parked in a no parking lot','70011','70112'),
    ('70213','Fire','Tushar Yadav',15000,'The vehicle was burnt by some protestors in a clash','70013','70102'),
    ('70215','Accident','Varun',100000,'The driver was using mobile phone while driving and hence the accident occured','70015','70105');



CREATE TABLE `t7_insurance_company` (
  `T7_Company_Name` varchar(70) NOT NULL,
  `T7_Company_Address` varchar(400) DEFAULT NULL,
  `T7_Company_Contact_Number` bigint DEFAULT NULL UNIQUE,
  `T7_Company_Fax` bigint DEFAULT NULL UNIQUE,
  `T7_Company_Email` varchar(50) DEFAULT NULL UNIQUE,
  `T7_Company_Website` varchar(50) DEFAULT NULL UNIQUE,
  `T7_Company_Location` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`T7_Company_Name`),
  UNIQUE KEY `XPKINSURANCE_COMPANY_15` (`T7_Company_Name`)
);
INSERT INTO `t7_insurance_company` VALUES ('ABC ltd','HNo 17,LB Nagar,Hyderabad',1100272272,206026789,'abc@gmail.com','https://www.abc.com','Hyderabad'),
	('BCD ltd','HNo 18,Dharawi, Mumbai',1100270700,180007000,'bcd@gmail.com','https://www.bcd.com','Mumbai '),
    ('CDE ltd','Hno 02, Patel Nagar, Delhi',1100264977,810823774664,'cde@gmail.com','https://www.cde.com','Delhi'),
    ('DEF ltd','Hno 12 , Shivaji Road,Mumbai ',1160267766,8872456139,'def@gmail.com','https://www.def.com','Mumbai'),
    ('EFG ltd','Hno 34 , Beach Road, Chennai',11001411414,893624388947,'efg@gmail.com','https://www.efg.com','Chennai'),
    ('FGH ltd','3rd Floor, IT Park , Hubballi',1105522552,46184864112444,'fgh@gmail.com','https://www.fgh.com','Hubballi'),
    ('GHI ltd','Opp More Mall, Tilak Nagar ,Hyderabad',1160105577,4471414141411,'ghi@gmail.com','https://www.ghi.com','Hyderabad'),
    ('HIJ ltd','Opp Metro Pillar 27,JP Nagar, Banglore',1100712127,579563234956,'hij@gmail.com','https://www.hij.com','Banglore'),
    ('IJK ltd','Near IKEA Solutions,Delhi',1100287160,5743956622020,'ijk@gmail.com','https://www.ijk.com','Delhi'),
    ('JKL ltd','Hno 35,Navnagar,Banglore',11057154020,55657635871687,'jkl@gmail.com','https://www.jkl.com','Banglore');




CREATE TABLE `t7_insurance_policy` (
  `T7_Agreement_id` varchar(20) NOT NULL,
  `T7_Department_Name` varchar(20) DEFAULT NULL,
  `T7_Policy_Number` varchar(20) DEFAULT NULL,
  `T7_Start_Date` date DEFAULT NULL,
  `T7_Expiry_Date` date DEFAULT NULL,
  `T7_Term_Condition_Description` varchar(400) DEFAULT NULL,
  `T7_Application_Id` varchar(20) NOT NULL,
  `T7_Cust_Id` varchar(20) NOT NULL,
  PRIMARY KEY (`T7_Agreement_id`,`T7_Application_Id`,`T7_Cust_Id`),
  UNIQUE KEY `XPKINSURANCE_POLICY_4` (`T7_Agreement_id`,`T7_Application_Id`,`T7_Cust_Id`),
  KEY `R_95` (`T7_Application_Id`,`T7_Cust_Id`),
  CONSTRAINT `R_95` FOREIGN KEY (`T7_Application_Id`, `T7_Cust_Id`) REFERENCES `t7_application` (`T7_Application_Id`, `T7_Cust_Id`) on update cascade on delete restrict
);
INSERT INTO `t7_insurance_policy` VALUES ('70801','Legal department','700001','2019-02-08','2025-02-08','Coverage against Accident,Theft,Fire or Act of God following the guidelines','70701','70101'),
	('70802','Legal department','700002','2019-03-08','2025-03-08','Coverage against Accident,Theft,Fire or Act of God following the guidelines','70702','70101'),
    ('70803','Legal department','700003','2019-04-08','2025-04-08','Coverage against Accident,Theft,Fire or Act of God following the guidelines','70703','70102'),
    ('70804','Legal department','700004','2019-05-01','2025-05-03','Coverage against Accident,Theft,Fire or Act of God following the guidelines','70704','70102'),
    ('70805','Legal department','700005','2019-05-08','2025-05-08','Coverage against Accident,Theft,Fire or Act of God following the guidelines','70705','70102'),
    ('70806','Legal department','700006','2019-06-08','2025-01-08','Coverage against Accident,Theft,Fire or Act of God following the guidelines','70706','70103'),
    ('70807','Legal department','700007','2019-07-08','2025-02-08','Coverage against Accident,Theft,Fire or Act of God following the guidelines','70707','70103'),
    ('70808','Legal department','700008','2019-02-08','2025-02-08','Coverage against loss of or damage to your vehicle caused by accident','70708','70104'),
    ('70809','Legal department','700009','2019-04-08','2025-03-08','Coverage against loss of or damage to your vehicle caused by theft','70709','70104'),
    ('70810','Legal department','700010','2019-07-08','2025-01-08','Coverage against loss of or damage to your vehicle caused by manual damage,Theft,Fire','70710','70105'),
    ('70811','Legal department','700011','2019-02-08','2025-02-08','Coverage against loss of or damage to your vehicle caused by manual damage,Theft,Fire','70711','70106'),
    ('70812','Verifying department','700012','2019-12-08','2025-12-08','Coverage against loss of or damage to your vehicle caused by manual damage,Theft,Fire','70712','70107'),
    ('70813','Legal department','700013','2019-07-08','2025-07-08','Coverage against loss of or damage to your vehicle caused by manual damage,Theft,Fire','70713','70108'),
    ('70814','Legal department','700014','2019-05-08','2025-08-20','Coverage against Accident,Theft,Fire or Act of God following the guidelines','70714','70109'),
    ('70815','Legal department','700015','2019-09-08','2025-01-08','Coverage against Accident,Theft,Fire or Act of God following the guidelines','70715','70109'),
    ('70816','Legal department','700016','2019-11-08','2025-11-08','Coverage against Accident,Theft,Fire or Act of God following the guidelines','70716','70110'),
    ('70817','Legal department','700017','2019-10-08','2025-12-08','Coverage against Accident,Theft,Fire or Act of God following the guidelines','70717','70110'),
    ('70818','Legal department','700018','2019-02-08','2025-01-08','Coverage against Accident,Theft,Fire or Act of God following the guidelines','70718','70111'),
    ('70819','Legal department','700019','2019-02-08','2025-02-08','Coverage against Accident,Theft,Fire or Act of God following the guidelines','70719','70112'),
    ('70820','Legal department','700020','2019-05-08','2025-02-08','Coverage against Accident,Theft,Fire or Act of God following the guidelines','70720','70115'),
    ('70821','Legal department','700021','2019-02-08','2025-02-08','Coverage against Accident,Theft,Fire or Act of God following the guidelines','70721','70115'),
    ('70822','Verifying department','700022','2019-05-08','2025-02-08','Coverage against Accident,Theft,Fire or Act of God following the guidelines','70722','70113');




CREATE TABLE `t7_insurance_policy_coverage` (
  `T7_Agreement_id` varchar(20) NOT NULL,
  `T7_Application_Id` varchar(20) NOT NULL,
  `T7_Cust_Id` varchar(20) NOT NULL,
  `T7_Coverage_Id` varchar(20) NOT NULL,
  `T7_Company_Name` varchar(200) NOT NULL,
  PRIMARY KEY (`T7_Agreement_id`,`T7_Application_Id`,`T7_Cust_Id`,`T7_Coverage_Id`,`T7_Company_Name`),
  UNIQUE KEY `XPKINSURANCE_POLICY_4_COVERAGE` (`T7_Agreement_id`,`T7_Application_Id`,`T7_Cust_Id`,`T7_Coverage_Id`,`T7_Company_Name`),
  KEY `R_98` (`T7_Coverage_Id`,`T7_Company_Name`),
  CONSTRAINT `R_97` FOREIGN KEY (`T7_Agreement_id`, `T7_Application_Id`, `T7_Cust_Id`) REFERENCES `t7_insurance_policy` (`T7_Agreement_id`, `T7_Application_Id`, `T7_Cust_Id`) on update cascade, 
  CONSTRAINT `R_98` FOREIGN KEY (`T7_Coverage_Id`, `T7_Company_Name`) REFERENCES `t7_coverage` (`T7_Coverage_Id`, `T7_Company_Name`) on delete cascade
);
INSERT INTO `t7_insurance_policy_coverage` VALUES ('70801','70701','70101','77401','ABC ltd'),
	('70802','70702','70101','77402','ABC ltd'),
    ('70803','70703','70102','77403','ABC ltd'),
    ('70804','70704','70102','77404','ABC ltd'),
    ('70805','70705','70102','77405','BCD ltd'),
    ('70806','70706','70103','77406','BCD ltd'),
    ('70807','70707','70103','77407','BCD ltd'),
    ('70808','70708','70104','77408','CDE ltd'),
    ('70809','70709','70104','77409','CDE ltd'),
    ('70810','70710','70105','77410','CDE ltd'),
    ('70811','70711','70106','77411','CDE ltd'),
    ('70812','70712','70107','77412','DEF ltd'),
    ('70813','70713','70108','77413','DEF ltd'),
    ('70814','70714','70109','77414','DEF ltd'),
    ('70815','70715','70109','77415','DEF ltd'),
    ('70816','70716','70110','77416','EFG ltd'),
    ('70817','70717','70110','77417','EFG ltd'),
    ('70818','70718','70111','77418','FGH ltd'),
    ('70819','70719','70112','77419','GHI ltd'),
    ('70820','70720','70115','77420','HIJ ltd'),
    ('70821','70721','70115','77421','IJK ltd'),
    ('70822','70722','70113','77422','JKL ltd');




CREATE TABLE `t7_membership` (
  `T7_Membership_Id` varchar(20) NOT NULL,
  `T7_Membership_Type` char(15) NOT NULL,
  `T7_Organisation_Contact` varchar(20) DEFAULT NULL,
  `T7_Cust_Id` varchar(20) NOT NULL,
  PRIMARY KEY (`T7_Membership_Id`,`T7_Cust_Id`),
  UNIQUE KEY `XPKMEMBERSHIP_12` (`T7_Membership_Id`,`T7_Cust_Id`),
  KEY `R_91` (`T7_Cust_Id`),
  CONSTRAINT `R_91` FOREIGN KEY (`T7_Cust_Id`) REFERENCES `t7_customer` (`T7_CUST_Id`) on delete cascade on update cascade
);
INSERT INTO `t7_membership` VALUES ('77001','Associate','org1@gmail.com','70101'),
	('77002','Paid','org1@gmail.com','70102'),
    ('77003','Honorary','org1@gmail.com','70103'),
    ('77004','Business','org1@gmail.com','70104'),
    ('77005','Institutional','org1@gmail.com','70105'),
    ('77006','Associate','org1@gmail.com','70106'),
    ('77007','Paid','org1@gmail.com','70107'),
    ('77008','Associate','org2@gmail.com','70108'),
    ('77009','Institutional','org2@gmail.com','70109'),
    ('77010','Associate','org1@gmail.com','70110'),
    ('77011','Paid','org1@gmail.com','70111'),
    ('77012','Associate','org2@gmail.com','70112'),
    ('77013','Honorary','org1@gmail.com','70113'),
    ('77014','Honorary','org2@gmail.com','70114'),
    ('77015','Paid','org1@gmail.com','70115'),
    ('77016','Institutional','org2@gmail.com','70101'),
    ('77017','Business','org1@gmail.com','70102'),
    ('77018','Business','org2@gmail.com','70104'),
    ('77019','Honorary','org1@gmail.com','70103'),
    ('77020','Paid','org1@gmail.com','70104');



CREATE TABLE `t7_nok` (
  `T7_Nok_Id` varchar(20) NOT NULL,
  `T7_Nok_Name` varchar(20) DEFAULT NULL,
  `T7_Nok_Address` varchar(200) DEFAULT NULL,
  `T7_Nok_Phone_Number` bigint DEFAULT NULL,
  `T7_Nok_Gender` char(10) DEFAULT NULL,
  `T7_Nok_Marital_Status` char(8) DEFAULT NULL,
  `T7_Agreement_id` varchar(20) NOT NULL,
  `T7_Application_Id` varchar(20) NOT NULL,
  `T7_Cust_Id` varchar(20) NOT NULL,
  PRIMARY KEY (`T7_Nok_Id`,`T7_Agreement_id`,`T7_Application_Id`,`T7_Cust_Id`),
  UNIQUE KEY `XPKNOK_14` (`T7_Nok_Id`,`T7_Agreement_id`,`T7_Application_Id`),
  KEY `R_99` (`T7_Agreement_id`,`T7_Application_Id`,`T7_Cust_Id`),
  CONSTRAINT `R_99` FOREIGN KEY (`T7_Agreement_id`, `T7_Application_Id`, `T7_Cust_Id`) REFERENCES `t7_insurance_policy` (`T7_Agreement_id`, `T7_Application_Id`, `T7_Cust_Id`) on delete cascade
);
INSERT INTO `t7_nok` VALUES ('77301','Varun','Chennai',9898989898,'M','Single','70801','70701','70101'),
	('77302','Mahesh','Mumbai',9998989898,'M','Married','70802','70702','70101'),
    ('77303','Suresh','Hyderabad',9798989898,'M','Married','70803','70703','70102'),
    ('77304','Ramesh','Chennai',9698989898,'M','Married','70804','70704','70102'),
    ('77305','Aakanksha','Delhi',9598989898,'F','Single','70805','70705','70102'),
    ('77306','Meghana','Banglore',9498989898,'F','Single','70806','70706','70103'),
    ('77307','Sudheer','Delhi',9398989898,'M','Single','70807','70707','70103'),
    ('77308','Rashmi','Bangalore',9298989898,'F','Married','70808','70708','70104'),
    ('77309','Goutham','Delhi',9198989898,'M','Single','70809','70709','70104'),
    ('77310','Charan','Hyderabad',9098989898,'M','Married','70810','70710','70105'),
    ('77311','Kiran','Mumbai',9018989898,'M','Married','70811','70711','70106'),
    ('77312','Siddarth','Bangalore',9828989898,'M','Single','70812','70712','70107'),
    ('77313','Varsha','Mumbai',9838989898,'F','Married','70813','70713','70108'),
    ('77314','Harsha','Chennai',9848989898,'M','Single','70814','70714','70109'),
    ('77315','Tarak','Mumbai',9895989898,'M','Single','70815','70715','70109'),
    ('77316','Harshad','Mumbai',9895945698,'M','Married','70816','70716','70110'),
    ('77317','Vishal','Hyderabad',9895983298,'M','Single','70817','70717','70110'),
    ('77318','Rekha','Bangalore',9895989678,'F','Married','70818','70718','70111'),
    ('77319','Bhavana','Chennai',9895989834,'F','Single','70819','70719','70112'),
    ('77320','Arun','Delhi',9895989856,'M','Single','70820','70720','70115'),
    ('77321','Kiran Kumar','Hyderabad',9895989876,'M','Married','70821','70721','70115'),
    ('77322','Suhana','Kolkata',9895989899,'F','Single','70822','70722','70113');






CREATE TABLE `t7_office` (
  `T7_Office_Name` varchar(200) NOT NULL,
  `T7_Office_Leader` varchar(200) NOT NULL,
  `T7_Contact_Information` varchar(200) NOT NULL,
  `T7_Address` varchar(200) NOT NULL,
  `T7_Admin_Cost` int DEFAULT NULL,
  `T7_Staff` varchar(50) DEFAULT NULL,
  `T7_Department_Name` varchar(200) NOT NULL,
  `T7_Department_ID` varchar(200) NOT NULL,
  `T7_Company_Name` varchar(200) NOT NULL,
  PRIMARY KEY (`T7_Office_Name`,`T7_Department_Name`,`T7_Company_Name`),
  UNIQUE KEY `XPKOFFICE_11` (`T7_Office_Name`,`T7_Department_Name`,`T7_Company_Name`),
  KEY `R_104` (`T7_Department_Name`,`T7_Department_ID`,`T7_Company_Name`),
  CONSTRAINT `R_104` FOREIGN KEY (`T7_Department_Name`, `T7_Department_ID`, `T7_Company_Name`) REFERENCES `t7_department` (`T7_Department_Name`, `T7_Department_ID`, `T7_Company_Name`) on delete cascade on update cascade
);
INSERT INTO `t7_office` VALUES ('ABC1','Sumith','6000000000','Hyderabad',1300000,'20','Legal Department','70301','ABC ltd'),
	('ABC2','Rishabh','6000100000','Mumbai',1200000,'21','Claims Department','70302','ABC ltd'),
    ('ABC3','Sufyan','6000002000','Chennai',1600000,'22','Accounts Department','70303','ABC ltd'),
    ('BCD1','Shantanu','6000300000','Banglore',1500000,'23','Accounts Department','70304','BCD ltd'),
    ('BCD2','Prabhdeep','6003000000','Delhi',1400000,'15','Legal Department','70305','BCD ltd'),
    ('BCD3','Tushar','6000045000','Hyderabad',1100000,'24','Claims Department','70306','BCD ltd'),
    ('CDE1','Sachin','6000678000','Delhi',1800000,'17','Loss Control Department','70309','CDE ltd'),
    ('CDE2','Krishna','600090000','Hyderbad',1900000,'18','Claims Department','70310','CDE ltd'),
    ('DEF1','Vishnu','6000034000','Chennai',1200000,'19','Accounts and Legal Department','70311','DEF ltd'),
    ('DEF2','Mahesh','6000045000','Mumbai',1250000,'22','Claims Department','70312','DEF ltd'),
    ('EFG1','Ramesh','6000067000','Chennai',1560000,'24','Accounts Department','70313','EFG ltd'),
    ('EFG2','Suresh','6022067000','Chennai',1360000,'21','Legal Department','70314','EFG ltd'),
    ('FGH1','Deeksha','6000890000','Chennai',1650000,'22','Claims Department','70316','FGH ltd'),
    ('FGH2','Malini','6000234000','Chennai',1870000,'25','Statistical Department','70315','FGH ltd'),
    ('GHI1','Suraj','6000123400','Delhi',2110000,'30','Claims Department','70318','GHI ltd'),
    ('HIJ1','Srujana','6034560000','Chennai',1670000,'18','Accounts Department','70320','HIJ ltd');




CREATE TABLE `t7_policy_renewable` (
  `T7_Policy_Renewable_Id` varchar(20) NOT NULL,
  `T7_Date_Of_Renewal` date NOT NULL,
  `T7_Type_Of_Renewal` char(15) NOT NULL,
  `T7_Agreement_id` varchar(20) NOT NULL,
  `T7_Application_Id` varchar(20) NOT NULL,
  `T7_Cust_Id` varchar(20) NOT NULL,
  PRIMARY KEY (`T7_Policy_Renewable_Id`,`T7_Agreement_id`,`T7_Application_Id`,`T7_Cust_Id`),
  UNIQUE KEY `XPKPOLICY_RENEWABLE_16` (`T7_Policy_Renewable_Id`,`T7_Agreement_id`,`T7_Application_Id`,`T7_Cust_Id`),
  KEY `R_101` (`T7_Agreement_id`,`T7_Application_Id`,`T7_Cust_Id`),
  CONSTRAINT `R_101` FOREIGN KEY (`T7_Agreement_id`, `T7_Application_Id`, `T7_Cust_Id`) REFERENCES `t7_insurance_policy` (`T7_Agreement_id`, `T7_Application_Id`, `T7_Cust_Id`) on delete cascade on update restrict
);
INSERT INTO `t7_policy_renewable` VALUES ('70901','2025-10-08','Online','70801','70701','70101'),
	('70902','2025-02-08','Offline','70802','70702','70101'),
    ('70903','2025-11-08','Online','70803','70703','70102'),
    ('70904','2025-06-08','Offline','70804','70704','70102'),
    ('70905','2025-02-08','Online','70805','70705','70102'),
    ('70906','2025-04-08','Offline','70806','70706','70103'),
    ('70907','2025-02-08','Online','70807','70707','70103'),
    ('70908','2025-02-08','Offline','70808','70708','70104'),
    ('70909','2025-02-08','Online','70809','70709','70104'),
    ('70910','2025-07-08','Offline','70810','70710','70105'),
    ('70911','2025-02-08','Online','70811','70711','70106'),
    ('70912','2025-08-08','Offline','70812','70712','70107'),
    ('70913','2025-02-08','Online','70813','70713','70108'),
    ('70914','2025-02-08','Offline','70814','70714','70109'),
    ('70915','2025-09-08','Online','70815','70715','70109'),
    ('70916','2025-02-08','Online','70816','70716','70110'),
    ('70917','2025-10-08','Online','70817','70717','70110'),
    ('70918','2025-02-08','Offline','70818','70718','70111'),
    ('70919','2025-11-08','Online','70819','70719','70112'),
    ('70920','2025-02-08','Offline','70820','70720','70115'),
    ('70921','2025-11-08','Online','70821','70721','70115'),
    ('70922','2025-05-08','Offline','70822','70722','70113');





CREATE TABLE `t7_premium_payment` (
  `T7_Premium_Payment_Id` varchar(20) NOT NULL,
  `T7_Policy_Number` varchar(20) NOT NULL,
  `T7_Premium_Payment_Amount` int NOT NULL,
  `T7_Premium_Payment_Schedule` date NOT NULL,
  `T7_Receipt_Id` varchar(20) NOT NULL UNIQUE,
  `T7_Cust_Id` varchar(20) NOT NULL,
  PRIMARY KEY (`T7_Premium_Payment_Id`,`T7_Cust_Id`),
  UNIQUE KEY `XPKPREMIUM_PAYMENT_5` (`T7_Premium_Payment_Id`,`T7_Cust_Id`),
  KEY `R_85` (`T7_Cust_Id`),
  CONSTRAINT `R_85` FOREIGN KEY (`T7_Cust_Id`) REFERENCES `t7_customer` (`T7_CUST_Id`) on delete cascade
);
INSERT INTO `t7_premium_payment` VALUES ('70501','700001',4000000,'2017-02-14','70601','70101'),
	('70502','700002',5200000,'2018-11-01','70602','70101'),
    ('70503','700003',200000,'2019-02-09','70603','70102'),
    ('70504','700004',400000,'2020-05-15','70604','70102'),
    ('70505','700005',620000,'2017-04-13','70605','70102'),
    ('70506','700006',400000,'2019-04-21','70606','70103'),
    ('70507','700009',380000,'2018-09-11','70607','70104'),
    ('70508','700010',400000,'2020-09-04','70608','70105'),
    ('70509','700011',1100000,'2018-08-12','70609','70106'),
    ('70510','700012',2800000,'2019-01-03','70610','70107'),
    ('70511','700013',290000,'2017-11-17','70611','70108'),
    ('70512','700014',380000,'2018-12-16','70612','70109'),
    ('70513','700015',800000,'2017-10-06','70613','70109'),
    ('70514','700016',4000000,'2019-10-19','70614','70110'),
    ('70515','700017',350000,'2020-05-12','70615','70110'),
    ('70516','700018',1380000,'2019-05-10','70616','70111');




CREATE TABLE `t7_product` (
  `T7_Product_Number` varchar(20) NOT NULL,
  `T7_Product_Price` int DEFAULT NULL,
  `T7_Product_Type` char(40) DEFAULT NULL,
  `T7_Company_Name` varchar(200) NOT NULL,
  PRIMARY KEY (`T7_Product_Number`,`T7_Company_Name`),
  UNIQUE KEY `XPKPRODUCT_20` (`T7_Product_Number`,`T7_Company_Name`),
  KEY `R_107` (`T7_Company_Name`),
  CONSTRAINT `R_107` FOREIGN KEY (`T7_Company_Name`) REFERENCES `t7_insurance_company` (`T7_Company_Name`) on delete cascade on update restrict
);
INSERT INTO `t7_product` VALUES ('T7001',40000,'4 wheeler Insurance','ABC ltd'),
	('T7002',120000,'4 wheeler Insurance','ABC ltd'),
    ('T7003',20000,'4 wheeler Insurance','ABC ltd'),
    ('T7004',80000,'4 wheeler Insurance','ABC ltd'),
    ('T7005',90000,'4 wheeler Insurance','BCD ltd'),
    ('T7006',200000,'4 wheeler Insurance','BCD ltd'),
    ('T7007',4000,'4 wheeler Insurance','BCD ltd'),
    ('T7008',10000,'2 wheeler Insurance','CDE ltd'),
    ('T7009',10000,'4 wheeler Insurance','CDE ltd'),
    ('T7010',40000,'4 wheeler Insurance','CDE ltd'),
    ('T7011',40000,'4 wheeler Insurance','CDE ltd'),
    ('T7012',40000,'4 wheeler Insurance','DEF ltd'),
    ('T7013',40000,'4 wheeler Insurance','DEF ltd'),
    ('T7014',40000,'4 wheeler Insurance','DEF ltd'),
    ('T7015',40000,'4 wheeler Insurance','DEF ltd'),
    ('T7016',40000,'4 wheeler Insurance','EFG ltd'),
    ('T7017',40000,'4 wheeler Insurance','EFG ltd'),
    ('T7018',40000,'4 wheeler Insurance','FGH ltd'),
    ('T7019',40000,'4 wheeler Insurance','GHI ltd'),
    ('T7020',40000,'4 wheeler Insurance','HIJ ltd'),
    ('T7021',40000,'2 wheeler Insurance','IJK ltd'),
    ('T7022',40000,'4 wheeler Insurance','JKL ltd'),
    ('T7023',50000,'4 wheeler Insurance','EFG ltd');




CREATE TABLE `t7_quote` (
  `T7_Quote_Id` varchar(20) NOT NULL,
  `T7_Issue_Date` date NOT NULL,
  `T7_Valid_From_Date` date NOT NULL,
  `T7_Valid_Till_Date` date NOT NULL,
  `T7_Description` varchar(100) DEFAULT NULL,
  `T7_Product_Id` varchar(20) NOT NULL,
  `T7_Coverage_Level` varchar(20) NOT NULL,
  `T7_Application_Id` varchar(20) NOT NULL,
  `T7_Cust_Id` varchar(20) NOT NULL,
  PRIMARY KEY (`T7_Quote_Id`,`T7_Application_Id`,`T7_Cust_Id`),
  UNIQUE KEY `XPKQUOTE_3` (`T7_Quote_Id`,`T7_Application_Id`,`T7_Cust_Id`),
  KEY `R_94` (`T7_Application_Id`,`T7_Cust_Id`),
  CONSTRAINT `R_94` FOREIGN KEY (`T7_Application_Id`, `T7_Cust_Id`) REFERENCES `t7_application` (`T7_Application_Id`, `T7_Cust_Id`) on delete cascade on update restrict
);
INSERT INTO `t7_quote` VALUES ('77101','2019-02-08','2020-02-08','2025-02-08',NULL,'T7001','primary','70701','70101'),
	('77102','2019-04-01','2020-04-01','2025-04-01',NULL,'T7002','Full','70702','70101'),
    ('77103','2019-06-08','2020-06-08','2025-06-08',NULL,'T7003','Secondary','70703','70102'),
    ('77104','2019-09-29','2020-09-29','2025-09-29',NULL,'T7004','primary','70704','70102'),
    ('77105','2019-07-04','2020-07-04','2025-07-04',NULL,'T7005','Full','70705','70102'),
    ('77106','2019-12-09','2020-12-09','2025-12-09',NULL,'T7006','Secondary','70706','70103'),
    ('77107','2019-10-23','2020-10-23','2025-10-23',NULL,'T7007','primary','70707','70103'),
    ('77108','2019-05-29','2020-05-29','2025-05-29',NULL,'T7008','Full','70708','70104'),
    ('77109','2019-11-06','2020-11-06','2025-11-06',NULL,'T7009','Secondary','70709','70104'),
    ('77110','2019-09-08','2020-09-08','2025-09-08',NULL,'T7010','primary','70710','70105'),
    ('77111','2019-07-10','2020-07-10','2025-07-10',NULL,'T7011','Secondary','70711','70106'),
    ('77112','2019-12-10','2020-12-10','2025-12-10',NULL,'T7012','Full','70712','70107'),
    ('77113','2019-01-02','2020-01-02','2025-01-02',NULL,'T7013','Secondary','70713','70108'),
    ('77114','2019-11-10','2020-11-10','2025-11-10',NULL,'T7014','Full','70714','70109'),
    ('77115','2019-02-09','2020-02-09','2025-02-09',NULL,'T7015','Full','70715','70109'),
    ('77116','2019-10-06','2020-10-06','2025-10-06',NULL,'T7016','Full','70716','70110'),
    ('77117','2019-04-28','2020-04-28','2025-04-28',NULL,'T7017','Secondary','70717','70110'),
    ('77118','2019-06-11','2020-06-11','2025-06-11',NULL,'T7018','Full','70718','70111'),
    ('77119','2019-03-03','2020-03-03','2025-03-03',NULL,'T7019','Secondary','70719','70112'),
    ('77120','2019-05-04','2020-05-04','2025-05-04',NULL,'T7020','Full','70720','70115'),
    ('77121','2019-03-03','2020-03-03','2025-03-03',NULL,'T7021','Full','70721','70115'),
    ('77122','2019-05-04','2020-05-04','2025-05-04',NULL,'T7022','Secondary','70722','70113');





CREATE TABLE `t7_receipt` (
  `T7_Receipt_Id` varchar(20) NOT NULL,
  `T7_Gen_Time` date NOT NULL,
  `T7_Cost` int NOT NULL,
  `T7_Premium_Payment_Id` varchar(20) NOT NULL,
  `T7_Cust_Id` varchar(20) NOT NULL,
  PRIMARY KEY (`T7_Receipt_Id`,`T7_Premium_Payment_Id`,`T7_Cust_Id`),
  UNIQUE KEY `XPKRECEIPT_21` (`T7_Receipt_Id`,`T7_Premium_Payment_Id`,`T7_Cust_Id`),
  KEY `R_84` (`T7_Premium_Payment_Id`,`T7_Cust_Id`),
  CONSTRAINT `R_84` FOREIGN KEY (`T7_Premium_Payment_Id`, `T7_Cust_Id`) REFERENCES `t7_premium_payment` (`T7_Premium_Payment_Id`, `T7_Cust_Id`) on update cascade on delete restrict
);
INSERT INTO `t7_receipt` VALUES ('70601','2020-12-12',4000000,'70501','70101'),
	('70602','2020-12-12',5200000,'70502','70101'),
    ('70603','2020-11-12',200000,'70503','70102'),
    ('70604','2020-12-12',400000,'70504','70102'),
    ('70605','2020-12-12',620000,'70505','70102'),
    ('70606','2020-10-02',400000,'70506','70103'),
    ('70607','2020-12-12',380000,'70507','70104'),
    ('70608','2020-10-15',400000,'70508','70105'),
    ('70609','2020-10-13',1100000,'70509','70106'),
    ('70610','2020-12-12',2800000,'70510','70107'),
    ('70611','2020-10-09',290000,'70511','70108'),
    ('70612','2020-12-12',380000,'70512','70109'),
    ('70613','2020-12-12',800000,'70513','70109'),
    ('70614','2020-10-12',4000000,'70514','70110'),
    ('70615','2020-12-12',350000,'70515','70110'),
    ('70616','2020-12-12',1380000,'70516','70111');





CREATE TABLE `t7_staff` (
  `T7_Staff_Id` varchar(200) NOT NULL,
  `T7_Staff_Fname` varchar(100) DEFAULT NULL,
  `T7_Staff_LName` varchar(100) DEFAULT NULL,
  `T7_Staff_Address` varchar(200) DEFAULT NULL,
  `T7_Staff_Contact` bigint DEFAULT NULL UNIQUE,
  `T7_Staff_Gender` char(2) DEFAULT NULL,
  `T7_Staff_Marital_Status` char(8) DEFAULT NULL,
  `T7_Staff_Nationality` char(15) DEFAULT NULL,
  `T7_Staff_Qualification` varchar(20) DEFAULT NULL,
  `T7_Staff_Allowance` bigint DEFAULT NULL,
  `T7_Staff_PPS_Number` bigint DEFAULT NULL UNIQUE,
  `T7_Company_Name` varchar(400) NOT NULL,
  PRIMARY KEY (`T7_Staff_Id`,`T7_Company_Name`),
  UNIQUE KEY `XPKSTAFF_9` (`T7_Staff_Id`,`T7_Company_Name`),
  KEY `R_105` (`T7_Company_Name`),
  CONSTRAINT `R_105` FOREIGN KEY (`T7_Company_Name`) REFERENCES `t7_insurance_company` (`T7_Company_Name`) on update cascade on delete cascade
);
INSERT INTO `t7_staff` VALUES ('77201','Sumith','Sai','Hyderabad',7000000000,'M','Married','Indian','Btech',100000,70,'ABC ltd'),
	('77202','Rishabh','Dwivedi','Mumbai',7000010000,'M','Single','Indian','Mtech',70000,71,'ABC ltd'),
    ('77203','Sufyan','Ahmed','Chennai',7000000200,'M','Married','Indian','PG',20000,72,'ABC ltd'),
    ('77204','Shantanu','Tripathi','Banglore',7300000000,'M','Single','Indian','Bcom',50000,73,'BCD ltd'),
    ('77205','Prabhdeep','Singh','Delhi',7000004000,'M','Married','Indian','BA',50000,74,'BCD ltd'),
    ('77206','Tushar','Yadav','Hyderabad',7000050000,'M','Married','Indian','MBA',37000,75,'BCD ltd'),
    ('77207','Amitabh','Bachchan','Mumbai',7000600000,'M','Single','Indian','Btech',18000,76,'BCD ltd'),
    ('77208','Ankit','Kumar','Chennai',7000000070,'M','Married','Indian','Mtech',21000,77,'BCD ltd'),
    ('77209','Sachin','Verma','Delhi',7000000008,'M','Single','Indian','Mtech',32500,78,'CDE ltd'),
    ('77210','Krishna','Rao','Hyderabad',7000009000,'M','Married','Indian','Btech',70000,79,'CDE ltd'),
    ('77211','Vishnu','Manchu','Chennai',7000088000,'M','Married','Indian','MBA',86000,80,'DEF ltd'),
    ('77212','Mahesh','Kumar','Mumbai',7000000990,'M','Single','Indian','Comm',76000,81,'DEF ltd'),
    ('77213','Ramesh','Verma','Chennai',7000007700,'M','Married','Indian','Btech',80000,82,'EFG ltd'),
    ('77214','Suresh','Verma','Delhi',7000000066,'M','Married','Indian','MBA',56000,83,'EFG ltd'),
    ('77215','Malini','Reddy','Chennai',7000005500,'F','Married','Indian','MCOM',37000,84,'FGH ltd'),
    ('77216','Deeksha','Seth','Mumbai',7000000440,'F','Single','Indian','Btech',62000,85,'FGH ltd'),
    ('77217','Praneetha','Vishwas','Mumbai',7033000000,'F','Indian','indian','BCOM',44000,86,'GHI ltd'),
    ('77218','Suraj','Kumar','Delhi',7000000220,'M','Married','Indian','Mtech',39000,87,'GHI ltd'),
    ('77219','Rahul','Kumar','Hyderabad',7001100000,'M','Married','Indian','Mtech',45000,88,'GHI ltd'),
    ('77220','Srujana','','Chennai',7000000120,'F','Married','Indian','BA',34000,89,'HIJ ltd'),
    ('77221','Varun','Kumar','Delhi',7000003400,'M','Divorced','Indian','BA',34000,90,'HIJ ltd');



CREATE TABLE `t7_vehicle` (
  `T7_Vehicle_Id` varchar(20) NOT NULL,
  `T7_Policy_Number` varchar(20) DEFAULT NULL,
  `T7_Vehicle_Registration_Number` varchar(20) NOT NULL UNIQUE,
  `T7_Vehicle_Value` bigint DEFAULT NULL,
  `T7_Vehicle_Type` varchar(20) NOT NULL,
  `T7_Vehicle_Size` int DEFAULT NULL,
  `T7_Vehicle_Number_Of_Seat` int DEFAULT NULL,
  `T7_Vehicle_Manufacturer` varchar(20) DEFAULT NULL,
  `T7_Vehicle_Engine_Number` int DEFAULT NULL UNIQUE,
  `T7_Vehicle_Chasis_Number` int DEFAULT NULL UNIQUE,
  `T7_Vehicle_Number` int DEFAULT NULL UNIQUE,
  `T7_Vehicle_Model_Number` varchar(20) DEFAULT NULL,
  `T7_Cust_Id` varchar(20) NOT NULL,
  PRIMARY KEY (`T7_Vehicle_Id`,`T7_Cust_Id`),
  UNIQUE KEY `XPKVEHICLE_6` (`T7_Vehicle_Id`,`T7_Cust_Id`),
  KEY `R_92` (`T7_Cust_Id`),
  CONSTRAINT `R_92` FOREIGN KEY (`T7_Cust_Id`) REFERENCES `t7_customer` (`T7_CUST_Id`) on delete cascade
) ;
INSERT INTO `t7_vehicle` VALUES ('70401','700001','TN 01 AZ 9009',200000,'4 wheeler',14,4,'Skoda',51701,52701,991101,'RTX-500100','70101'),
	('70402','700002','TN 09 BY 8118',500000,'4 wheeler',15,8,'Suzuki',70425,72702,485641,'AB940100','70101'),
    ('70403','700003','MH 11 CX 7227',700000,'4 wheeler',11,4,'Tata',70426,72703,320901,'CD5433100','70102'),
    ('70404','700004','MH 35 DW 6336',1200000,'4 wheeler',19,6,'Benz',70427,72704,485632,'EF-487100','70102'),
    ('70405','700005','MH 02 EV 5445',190000,'4 wheeler',15,8,'Maruti',70428,72705,994100,'GH848500','70102'),
    ('70406','700006','TS 29 FU 4554',800000,'4 wheeler',15,6,'Honda',70429,72706,485633,'IJ430100','70103'),
    ('70407','700007','TS 56 GT 3663',900000,'4 wheeler',18,4,'Alto',70430,72707,799110,'JK587130','70103'),
    ('70408','700008','TN 10 HS 2772',50000,'2 wheeler',16,2,'Activa',70431,72708,485634,'KL503452','70104'),
    ('70409','700009','TN 17 IR 1881',920000,'4 wheeler',15,4,'Altroz',70432,72709,2990101,'LM340100','70104'),
    ('70410','700010','DL 41 JQ 0990',2100000,'4 wheeler',25,8,'BMW',70433,72710,485635,'MN450100','70105'),
    ('70411','700011','KA 35 KP 0000',2500000,'4 wheeler',26,8,'Audi',70434,72711,881101,'NO343100','70106'),
    ('70412','700012','MH 27 LO 1111',1600000,'4 wheeler',19,6,'Audi',70435,72712,485636,'OP554100','70107'),
    ('70413','700013','TS 18 MN 2222',1700000,'4 wheeler',12,4,'Maruti',70436,72713,459110,'PQ555400','70108'),
    ('70414','700014','KA 09 AB 3333',1500000,'4 wheeler',16,4,'Honda',70437,72714,488101,'QR534100','70109'),
    ('70415','700015','KA 11 CD 4444',1100000,'4 wheeler',15,4,'Tata',70438,72715,978901,'RS5002300','70109'),
    ('70416','700016','MH 07 EF 5555',700000,'4 wheeler',19,5,'Ford',70439,72716,999901,'ST2340100','70110'),
    ('70417','700017','MH 34 GH 6666',810000,'4 wheeler',12,4,'Volkswagon',70440,72717,279101,'TU000100','70110'),
    ('70418','700018','TS 14 HI 7777',920000,'4 wheeler',15,6,'Skoda',70441,72718,191877,'UV430100','70111'),
    ('70419','700019','TS 34 JK 8888',160000,'4 wheeler',13,4,'Maruti',70442,72719,698741,'VW5433100','70112'),
    ('70420','700020','MH 12 LM 9999',1200000,'4 wheeler',19,6,'BMW',70443,72720,476631,'WX940101','70115'),
    ('70421','700021','MH 02 LM 9998',75000,'2 wheeler',19,4,'Maestro',70444,72721,485631,'YZ940100','70115'),
    ('70422','700022','MH 03 LM 9998',750000,'4 wheeler',20,4,'Innova',70445,72722,925631,'MK940110','70113');
















