use vic_ltd2;


-- query1
/* retrieve customer and vehicle details who has been involved in an incident and claim status is pending*/
/* Claim is settled only when it is Approved or Rejected but not pending*/
select distinct T1.T7_Cust_Id,concat(T1.T7_Cust_FName,T1.T7_Cust_LName) as T7_Cust_Name,T1.T7_Cust_MOB_Number,
	T2.T7_Vehicle_Id,T2.T7_Vehicle_Registration_Number,T2.T7_Vehicle_Manufacturer,T2.T7_Vehicle_Model_Number from 
    T7_CUSTOMER as T1 INNER JOIN T7_VEHICLE as T2 on T2.T7_Cust_id = T1.T7_Cust_Id where T2.T7_Vehicle_Id not in 
    (select T7_Vehicle_Id from T7_CLAIM_SETTLEMENT) and  T1.T7_Cust_Id = ANY (select T7_Cust_Id from T7_CLAIM  
    where T7_Incident_Id is not null);


-- _________________________________________________________________________________________________________________________

-- query2
/* retrieve customer details who has premium payment amount greater than the sum of all customer ids in the database */
select * from T7_CUSTOMER where T7_CUSTOMER.T7_Cust_Id in ( select T7_Cust_Id from T7_PREMIUM_PAYMENT where 
		T7_PREMIUM_PAYMENT.T7_Premium_Payment_Amount > (select sum(T7_Cust_Id) from T7_CUSTOMER)); 





-- _________________________________________________________________________________________________________________________




-- query3
/*retrieve company details whose number of products is greater than the departments, where the departments are located 
in more than one location */
select * from T7_INSURANCE_COMPANY where T7_Company_Name in (select T7_Company_Name from T7_OFFICE group by T7_Company_Name 
	having T7_Company_Name in (select T7_OFFICE.T7_Company_Name from T7_PRODUCT inner join T7_OFFICE on 
	T7_OFFICE.T7_Company_Name=T7_PRODUCT.T7_Company_Name group by T7_OFFICE.T7_Company_Name having 
    Count(distinct(T7_Product_Number))>Count(distinct(T7_Department_Name))) and count(distinct T7_Address)>1 );



-- _________________________________________________________________________________________________________________________



-- query4
/*select customers who have more than one vehicle , where the premium for one of the vehicles is not paid and it is involved in accident*/
select * from T7_CUSTOMER where T7_CUSTOMER.T7_Cust_id in (select T7_Cust_Id from T7_VEHICLE where 
	T7_VEHICLE.T7_Policy_Number not in (select T7_Policy_Number from T7_PREMIUM_PAYMENT) and T7_VEHICLE.T7_Cust_Id in 
    (select T7_Cust_Id from T7_VEHICLE GROUP BY T7_VEHICLE.T7_Cust_Id having count(T7_VEHICLE.T7_Cust_Id) > 1) and 
    T7_VEHICLE.T7_Cust_Id in (select T7_Cust_Id from T7_INCIDENT_REPORT where T7_Incident_Type = 'Accident'));
    



-- _________________________________________________________________________________________________________________________



-- query5
/* select all vehicles which have premium more than its vehicle number */
select * from T7_VEHICLE where T7_VEHICLE.T7_Vehicle_Number < (select T7_Premium_Payment_Amount from T7_PREMIUM_PAYMENT
		where T7_Vehicle.T7_Policy_number=T7_Premium_Payment.T7_Policy_number);




-- _________________________________________________________________________________________________________________________


-- query6
/*retreive customer details whose claim amount is less than coverage amount and claim amount is greater than 
sum of (Claim_settlement_id,vehicle_id,claim_id,cust_id) */

select distinct T7_Customer.T7_Cust_Id,T7_CUST_FNAME,T7_CUST_LNAME,T7_CUST_GENDER,T7_CUST_DOB,T7_CUST_MOB_NUMBER from T7_CUSTOMER inner join T7_Claim_Settlement on T7_CUSTOMER.T7_Cust_Id = T7_Claim_Settlement.T7_Cust_Id  where T7_CUSTOMER.T7_Cust_Id in (select T7_Cust_Id from T7_CLAIM where 
	T7_CLAIM.T7_Claim_Amount < (select T7_COVERAGE.T7_Coverage_Amount from T7_COVERAGE where T7_CLAIM.T7_Agreement_id in 
	(select T7_INSURANCE_POLICY_COVERAGE.T7_Agreement_id from T7_INSURANCE_POLICY_COVERAGE where 
	T7_INSURANCE_POLICY_COVERAGE.T7_Coverage_Id = T7_COVERAGE.T7_Coverage_Id))  and 
	T7_CLAIM.T7_Claim_Amount > T7_Claim_Settlement_Id+T7_CLAIM.T7_Claim_Id+T7_Vehicle_Id+T7_CLAIM.T7_Cust_Id );



-- _________________________________________________________________________________________________________________________






