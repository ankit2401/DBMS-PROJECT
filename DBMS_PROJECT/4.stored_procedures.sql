use vic_ltd2 ;

-- 1
/* retrieve customer and vehicle details who has been involved in an incident and claim status is pending*/
/* Claim is settled only when it is Approved or Rejected but not pending*/
DELIMITER //
create procedure query1() 
BEGIN
	select distinct T1.T7_Cust_Id,concat(T1.T7_Cust_FName,T1.T7_Cust_LName) as T7_Cust_Name,T1.T7_Cust_MOB_Number,T2.T7_Vehicle_Id,T2.T7_Vehicle_Registration_Number,T2.T7_Vehicle_Manufacturer,T2.T7_Vehicle_Model_Number from T7_CUSTOMER as T1 INNER JOIN T7_VEHICLE as T2 on T2.T7_Cust_id = T1.T7_Cust_Id where T2.T7_Vehicle_Id not in (select T7_Vehicle_Id from T7_CLAIM_SETTLEMENT) and  T1.T7_Cust_Id = ANY (select T7_Cust_Id from T7_CLAIM  where T7_Incident_Id is not null);
END //
DELIMITER ;




-- 2
/* retrieve customer details who has premium payment amount greater than the sum of all customer ids in the database */
DELIMITER //
create procedure query2() 
BEGIN
	select * from T7_CUSTOMER where T7_CUSTOMER.T7_Cust_Id in ( select T7_Cust_Id from T7_PREMIUM_PAYMENT where T7_PREMIUM_PAYMENT.T7_Premium_Payment_Amount > (select sum(T7_Cust_Id) from T7_CUSTOMER)); 
END //
DELIMITER ;




-- 3
/*retrieve company details whose number of products is greater than the departments, where the departments are located 
in more than one location */
DELIMITER //
create procedure query3() 
BEGIN
	select * from T7_INSURANCE_COMPANY where T7_Company_Name in (select T7_Company_Name from T7_OFFICE group by T7_Company_Name having T7_Company_Name in (select T7_OFFICE.T7_Company_Name from T7_PRODUCT inner join T7_OFFICE on T7_OFFICE.T7_Company_Name=T7_PRODUCT.T7_Company_Name group by T7_OFFICE.T7_Company_Name having Count(distinct(T7_Product_Number))>Count(distinct(T7_Office_Name))) and count(distinct T7_Address)>1 );
END //
DELIMITER ;



-- 4
/*select customers who have more than one vehicle , where the premium for one of the vehicles is not paid and it is involved in accident*/
DELIMITER //
create procedure query4() 
BEGIN
	select * from T7_CUSTOMER where T7_CUSTOMER.T7_Cust_id in (select T7_Cust_Id from T7_VEHICLE where T7_VEHICLE.T7_Policy_Number not in (select T7_Policy_Number from T7_PREMIUM_PAYMENT) and T7_VEHICLE.T7_Cust_Id in (select T7_Cust_Id from T7_VEHICLE GROUP BY T7_VEHICLE.T7_Cust_Id having count(T7_VEHICLE.T7_Cust_Id) > 1) and T7_VEHICLE.T7_Cust_Id in (select T7_Cust_Id from T7_INCIDENT_REPORT where T7_Incident_Type = 'Accident'));
END //
DELIMITER ;




-- 5 
/* select all vehicles which have premium more than its vehicle number */
DELIMITER //
create procedure query5() 
BEGIN
	select * from T7_Vehicle,T7_Premium_Payment where T7_Vehicle.T7_cust_id=T7_Premium_Payment.T7_cust_id and  T7_Premium_Payment.T7_Premium_Payment_Amount>T7_Vehicle.T7_Vehicle_Number;
END //
DELIMITER ;





-- 6
/*retreive customer details whose claim amount is less than coverage amount and claim amount is greater than 
sum of (Claim_settlement_id,vehicle_id,claim_id,cust_id) */

DELIMITER //
create procedure query6() 
BEGIN
	select * from T7_CUSTOMER where T7_CUSTOMER.T7_Cust_Id in (select T7_Cust_Id from T7_CLAIM where 
	T7_CLAIM.T7_Claim_Amount < (select T7_COVERAGE.T7_Coverage_Amount from T7_COVERAGE where T7_CLAIM.T7_Agreement_id in 
	(select T7_INSURANCE_POLICY_COVERAGE.T7_Agreement_id from T7_INSURANCE_POLICY_COVERAGE where 
	T7_INSURANCE_POLICY_COVERAGE.T7_Coverage_Id = T7_COVERAGE.T7_Coverage_Id))  and 
	T7_CLAIM.T7_Claim_Amount > (select T7_Claim_Settlement_Id+T7_Claim_Id+T7_Vehicle_Id+T7_Cust_Id
	from T7_CLAIM_SETTLEMENT where T7_CLAIM_SETTLEMENT.T7_Claim_id = T7_CLAIM.T7_Claim_Id));
END //
DELIMITER ;


-- ------------------------------------------------------------------------------------------------------------



/*Cust and Vehicle details who has been involved in an incident and claim status is pending */
call query1();

/*Cust details who has premium payment amt > sum of all cust_id's in the database*/
call query2();

/*comp details |products| > |Departments|,where the departments are located in more than one location  */
call query3();

/*Customers who has more than one vehicle, where the premium for one of the vehicles is not paid and it is involved in an accident*/
call query4();

/*All vehicles which have premium more than its vehicle number*/
call query5();

 /* cust details whose claim_amt < covg_amt and claim_amt > sum of (claim_settlement_id,vehicle_id,claim_id,cust_id) */
call query6(); 


-- ---------------------------------------------------------------------------------------------------------------------

-- stored procedure having parameters
DELIMITER //
create procedure selectcustomersonmaritalstatus(M_Status varchar(20))
BEGIN
select * from T7_CUSTOMER where T7_CUST_Marital_Status = M_Status;
END //
DELIMITER ;

/* customer details based on Marital Status */
call selectcustomersonmaritalstatus('Married');
call selectcustomersonmaritalstatus('Single');



-- drop procedure selectcustomersonmaritalstatus ;

