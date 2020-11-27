use vic_ltd2;
-- --------------------------------------------------------------------------------------------------------------------

select * from T7_CLAIM 
order by (CASE
			when T7_claim_status = 'Pending' then T7_claim_id
            when T7_claim_status = 'Approved' then T7_incident_id
            when T7_claim_status = 'Rejected' then T7_cust_id
            END);
            
-- ------------------------------------------------------------------------------------------------------------------------
            
desc t7_vehicle;            
            
select 'Hello World!';


-- --------------------------------------------------------------------------------------------------------------------------

/* print the price level of a vehicle as High or Moderate or low Considering Base value of 1000000 */
select T7_Vehicle_Id,CASE
		when T7_Vehicle_Value > 1000000 then 'High Price'
        when T7_Vehicle_Value = 1000000 then 'Moderate Price'
        else 'Low Price'
        END as T7_Vehicle_Price_Range from T7_VEHICLE ;
        
-- --------------------------------------------------------------------------------------------------------------------------

/* order males by Customer_Id and order females by date of birth ASC */
select T7_Cust_id,concat(T7_CUST_FName , T7_CUST_LName) as T7_Cust_Name,T7_CUST_Gender,T7_CUST_DOB from T7_CUSTOMER order by 
( CASE when T7_CUST_Gender = 'M' then T7_Cust_Id
	   when T7_CUST_Gender = 'F' then T7_CUST_DOB
       END);

-- --------------------------------------------------------------------------------------------------------------------------





