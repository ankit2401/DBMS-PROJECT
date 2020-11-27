use vic_ltd2;

-- a view that retrieves customer and vehicle details who has been involved in an incident and claim status is pending
create view Query1View as select distinct T1.T7_Cust_Id,concat(T1.T7_Cust_FName,T1.T7_Cust_LName) as T7_Cust_Name,T1.T7_Cust_MOB_Number,T2.T7_Vehicle_Id,T2.T7_Vehicle_Registration_Number,T2.T7_Vehicle_Manufacturer,T2.T7_Vehicle_Model_Number from T7_CUSTOMER as T1 INNER JOIN T7_VEHICLE as T2 on T2.T7_Cust_id = T1.T7_Cust_Id where T2.T7_Vehicle_Id not in (select T7_Vehicle_Id from T7_CLAIM_SETTLEMENT) and  T1.T7_Cust_Id = ANY (select  T7_Cust_Id from T7_CLAIM  where T7_Incident_Id is not null); 

select * from Query1View ; 


-- ______________________________________________________________________________________________________________________________


/* a view that selects every product in the Products table with a price higher than the average price */
create view Productpriceaboveavg as select T7_Product_Number,T7_Company_Name from T7_PRODUCT where T7_Product_Price > (select avg(T7_Product_Price) from T7_PRODUCT) ;

select * from Productpriceaboveavg ;


-- ______________________________________________________________________________________________________________________________

/* a view that selects every customer having coverage amount greater than sum of all the coverage ids in the database */
create view view1 as select * from T7_CUSTOMER where T7_CUSTOMER.T7_Cust_Id in ( select T7_Cust_Id from T7_Insurance_Policy_Coverage where T7_Insurance_Policy_Coverage.T7_Coverage_Id in (select T7_Coverage_Id from T7_COVERAGE where T7_COVERAGE.T7_Coverage_Amount > (select sum(T7_Coverage_Id) from T7_COVERAGE))); 


select * from view1 ;

-- ______________________________________________________________________________________________________________________________

/* a view that selects customer details , membership details and vehicle details in which the customers are having either paid or Honorary membership  in any organisation */
create view view2 as select t7_membership.T7_Cust_Id,Concat(T7_Cust_FName,T7_Cust_LName) as T7_Cust_Name,T7_CUST_MOB_Number,T7_Organisation_Contact,T7_Membership_Id,T7_Membership_Type,T7_Vehicle_Id,T7_Vehicle_Registration_Number from T7_CUSTOMER inner join T7_MEMBERSHIP on T7_MEMBERSHIP.T7_Cust_Id = T7_CUSTOMER.T7_Cust_Id inner join T7_VEHICLE on T7_MEMBERSHIP.T7_Cust_Id = T7_VEHICLE.T7_Cust_Id where T7_MEMBERSHIP.T7_Membership_Type = 'Paid' or T7_MEMBERSHIP.T7_Membership_Type = 'Honorary' ;

select * from view2 ;

-- ______________________________________________________________________________________________________________________________

/* a view that selects all the vehicles from Maharshtra using regex*/
create view Maharashtra_Vehicles as select T7_Vehicle_Id,T7_Vehicle_Registration_Number,T7_Vehicle_Type,
	T7_Vehicle_Manufacturer,T7_Vehicle_Engine_Number,T7_Cust_Id from T7_VEHICLE where T7_Vehicle_Registration_Number like 'MH%' ;

select * from T7_VEHICLE;
select * from Maharashtra_Vehicles;



-- ______________________________________________________________________________________________________________________________