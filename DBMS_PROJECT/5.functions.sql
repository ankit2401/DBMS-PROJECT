use vic_ltd2;

SET GLOBAL log_bin_trust_function_creators =1 ;

/* A function that computes the result of 4 integers and returns back the sum*/
DELIMITER //
create function CalcSum(v1 int,v2 int,v3 int,v4 int)
RETURNS int
BEGIN
	declare calcsum int;
    set calcsum = v1 + v2 + v3 + v4 ;
    RETURN calcsum;
END; //
DELIMITER ;


select CalcSum(4,5,6,7);


-- 6th query using our user defined function
select * from T7_CUSTOMER where T7_CUSTOMER.T7_Cust_Id in (select T7_Cust_Id from T7_CLAIM where 
T7_CLAIM.T7_Claim_Amount < (select T7_COVERAGE.T7_Coverage_Amount from T7_COVERAGE where T7_CLAIM.T7_Agreement_id in 
(select T7_INSURANCE_POLICY_COVERAGE.T7_Agreement_id from T7_INSURANCE_POLICY_COVERAGE where 
T7_INSURANCE_POLICY_COVERAGE.T7_Coverage_Id = T7_COVERAGE.T7_Coverage_Id))  and 
T7_CLAIM.T7_Claim_Amount > (select 
CalcSum(T7_Claim_Settlement_Id,T7_Claim_Id,T7_Vehicle_Id,T7_Cust_Id )
from T7_CLAIM_SETTLEMENT where T7_CLAIM_SETTLEMENT.T7_Claim_id = T7_CLAIM.T7_Claim_Id));

-- -------------------------------------------------------------------------------------------------------------



/* Using our User Defined Function(UDF) in a stored procedure*/
DELIMITER //
create procedure query6_udf1() 
BEGIN
		select * from T7_CUSTOMER where T7_CUSTOMER.T7_Cust_Id in (select T7_Cust_Id from T7_CLAIM where 
	T7_CLAIM.T7_Claim_Amount < (select T7_COVERAGE.T7_Coverage_Amount from T7_COVERAGE where T7_CLAIM.T7_Agreement_id in 
	(select T7_INSURANCE_POLICY_COVERAGE.T7_Agreement_id from T7_INSURANCE_POLICY_COVERAGE where 
	T7_INSURANCE_POLICY_COVERAGE.T7_Coverage_Id = T7_COVERAGE.T7_Coverage_Id))  and 
	T7_CLAIM.T7_Claim_Amount > (select 
	CalcSum(T7_Claim_Settlement_Id,T7_Claim_Id,T7_Vehicle_Id,T7_Cust_Id )
	from T7_CLAIM_SETTLEMENT where T7_CLAIM_SETTLEMENT.T7_Claim_id = T7_CLAIM.T7_Claim_Id));
END //
DELIMITER ;


call query6_udf1();

-- -------------------------------------------------------------------------------------------------------------



