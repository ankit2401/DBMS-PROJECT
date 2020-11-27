use vic_ltd2;

select host,user from mysql.user;

create user 'T7_CUSTOMER'@localhost identified by 'vic_user1';
create user 'T7_MANAGER'@localhost identified by 'vic_user2';
create user 'T7_AGENT'@localhost identified by 'vic_user3';
create user 'T7_ACCOUNTANT'@localhost identified by 'vic_user4';
create user 'T7_HR_DEPARTMENT'@localhost identified by 'vic_user5';
create user 'T7_DAMAGE_INSPECTOR'@localhost identified by 'vic_user6';
create user 'T7_DATABASE_ADMIN'@localhost identified by 'vic_user7';
create user 'T7_FINANCE_DEPARTMENT'@localhost identified by 'vic_user8';

-- grants to Customer
grant select,insert on T7_CUSTOMER to 'T7_CUSTOMER' @localhost;
grant select on T7_APPLICATION to 'T7_CUSTOMER' @localhost;
grant select on T7_QUOTE to 'T7_CUSTOMER' @localhost;
grant select on T7_INSURANCE_POLICY to 'T7_CUSTOMER' @localhost ;
grant select on T7_CLAIM_SETTLEMENT to 'T7_CUSTOMER' @localhost ;
grant select on T7_OFFICE to 'T7_CUSTOMER' @localhost;
grant select,insert on T7_MEMBERSHIP to 'T7_CUSTOMER' @localhost;
grant select on T7_NOK to 'T7_CUSTOMER' @localhost;
grant select on T7_INSURANCE_COMPANY to 'T7_CUSTOMER' @localhost;
grant select on T7_POLICY_RENEWABLE to 'T7_CUSTOMER' @localhost;
grant select on T7_INCIDENT_REPORT to 'T7_CUSTOMER' @localhost;
grant select on T7_COVERAGE to 'T7_CUSTOMER' @localhost;
grant select on T7_PRODUCT to 'T7_CUSTOMER' @localhost;
grant select on T7_RECEIPT to 'T7_CUSTOMER' @localhost;



-- grants to Manager of Insurance
grant select on T7_CUSTOMER to 'T7_MANAGER' @localhost;
grant select on T7_APPLICATION to 'T7_MANAGER' @localhost;
grant select on T7_QUOTE to 'T7_MANAGER' @localhost;
grant select on T7_INSURANCE_POLICY to 'T7_MANAGER' @localhost ;
grant select on T7_VEHICLE to 'T7_MANAGER' @localhost ;
grant select on T7_CLAIM to 'T7_MANAGER' @localhost ;
grant select,insert,update,delete on T7_CLAIM_SETTLEMENT to 'T7_MANAGER' @localhost ;
grant select,insert on T7_STAFF to 'T7_MANAGER' @localhost;
grant select on T7_DEPARTMENT to 'T7_MANAGER' @localhost;
grant select on T7_OFFICE to 'T7_MANAGER' @localhost;
grant select on T7_MEMBERSHIP to 'T7_MANAGER' @localhost;
grant select on T7_NOK to 'T7_MANAGER' @localhost;
grant select on T7_INSURANCE_COMPANY to 'T7_MANAGER' @localhost;
grant select,insert,update,delete on T7_POLICY_RENEWABLE to 'T7_MANAGER' @localhost;
grant select,insert,delete on T7_INCIDENT to 'T7_MANAGER' @localhost;
grant select,insert,delete on T7_INCIDENT_REPORT to 'T7_MANAGER' @localhost;
grant select on T7_COVERAGE to 'T7_MANAGER' @localhost;
grant select,insert,update,delete on T7_PRODUCT to 'T7_MANAGER' @localhost;
grant select,insert,update,delete on T7_RECEIPT to 'T7_MANAGER' @localhost;



-- grants to Insurance Agent
grant select,insert,update,delete on T7_CUSTOMER to 'T7_AGENT' @localhost;
grant select,insert,delete on T7_APPLICATION to 'T7_AGENT' @localhost;
grant select,insert,update,delete on T7_QUOTE to 'T7_AGENT' @localhost;
grant select,insert,update,delete on T7_INSURANCE_POLICY to 'T7_AGENT' @localhost ;
grant select,insert,update,delete on T7_PREMIUM_PAYMENT to 'T7_AGENT' @localhost ;
grant select,insert,update,delete on T7_VEHICLE to 'T7_AGENT' @localhost ;
grant select,insert,update,delete on T7_CLAIM to 'T7_AGENT' @localhost ;
grant select,insert on T7_CLAIM_SETTLEMENT to 'T7_AGENT' @localhost ;
grant select on T7_STAFF to 'T7_AGENT' @localhost;
grant select on T7_DEPARTMENT to 'T7_AGENT' @localhost;
grant select on T7_OFFICE to 'T7_AGENT' @localhost;
grant select,insert,delete on T7_MEMBERSHIP to 'T7_AGENT' @localhost;
grant select,insert,update,delete on T7_NOK to 'T7_AGENT' @localhost;
grant select on T7_INSURANCE_COMPANY to 'T7_AGENT' @localhost;
grant select,insert,update on T7_POLICY_RENEWABLE to 'T7_AGENT' @localhost;
grant select on T7_INCIDENT to 'T7_AGENT' @localhost;
grant select on T7_INCIDENT_REPORT to 'T7_AGENT' @localhost;
grant select,insert,delete on T7_COVERAGE to 'T7_AGENT' @localhost;
grant select on T7_PRODUCT to 'T7_AGENT' @localhost;
grant select,insert,delete on T7_RECEIPT to 'T7_AGENT' @localhost;


-- grants to Accountant
grant select on T7_CUSTOMER to 'T7_ACCOUNTANT' @localhost;
grant select on T7_APPLICATION to 'T7_ACCOUNTANT' @localhost;
grant select on T7_QUOTE to 'T7_ACCOUNTANT' @localhost;
grant select on T7_INSURANCE_POLICY to 'T7_ACCOUNTANT' @localhost ;
grant select,insert,update,delete on T7_PREMIUM_PAYMENT to 'T7_ACCOUNTANT' @localhost ;
grant select,insert,delete on T7_CLAIM to 'T7_ACCOUNTANT' @localhost ;
grant select on T7_STAFF to 'T7_ACCOUNTANT' @localhost;
grant select on T7_OFFICE to 'T7_ACCOUNTANT' @localhost;
grant select on T7_INSURANCE_COMPANY to 'T7_ACCOUNTANT' @localhost;
grant select on T7_INCIDENT_REPORT to 'T7_ACCOUNTANT' @localhost;
grant select on T7_COVERAGE to 'T7_ACCOUNTANT' @localhost;
grant select on T7_PRODUCT to 'T7_ACCOUNTANT' @localhost;
grant select,insert,delete on T7_RECEIPT to 'T7_ACCOUNTANT' @localhost;


-- grants to HR Department
grant select on T7_APPLICATION to 'T7_HR_DEPARTMENT' @localhost;
grant select on T7_QUOTE to 'T7_HR_DEPARTMENT' @localhost;
grant select,insert,update,delete on T7_STAFF to 'T7_HR_DEPARTMENT' @localhost;
grant select,insert,update,delete on T7_DEPARTMENT to 'T7_HR_DEPARTMENT' @localhost;
grant select,insert,update,delete on T7_OFFICE to 'T7_HR_DEPARTMENT' @localhost;
grant select on T7_INSURANCE_COMPANY to 'T7_HR_DEPARTMENT' @localhost;
grant select on T7_PRODUCT to 'T7_HR_DEPARTMENT' @localhost;


-- grants to Damage Inspector
grant select on T7_INSURANCE_POLICY to 'T7_DAMAGE_INSPECTOR' @localhost ;
grant select on T7_INCIDENT to 'T7_DAMAGE_INSPECTOR' @localhost;
grant select,insert,update,delete on T7_INCIDENT_REPORT to 'T7_DAMAGE_INSPECTOR' @localhost;
grant select on T7_PRODUCT to 'T7_DAMAGE_INSPECTOR' @localhost;


-- grants to Database Administrator
grant select on T7_CUSTOMER to 'T7_DATABASE_ADMIN' @localhost;
grant select,insert,delete on T7_APPLICATION to 'T7_DATABASE_ADMIN' @localhost;
grant select on T7_QUOTE to 'T7_DATABASE_ADMIN' @localhost;
grant select,insert,delete on T7_INSURANCE_POLICY to 'T7_DATABASE_ADMIN' @localhost ;
grant select on T7_PREMIUM_PAYMENT to 'T7_DATABASE_ADMIN' @localhost ;
grant select on T7_VEHICLE to 'T7_DATABASE_ADMIN' @localhost ;
grant select on T7_CLAIM to 'T7_DATABASE_ADMIN' @localhost ;
grant select on T7_CLAIM_SETTLEMENT to 'T7_DATABASE_ADMIN' @localhost ;
grant select on T7_STAFF to 'T7_DATABASE_ADMIN' @localhost;
grant select on T7_DEPARTMENT to 'T7_DATABASE_ADMIN' @localhost;
grant select on T7_OFFICE to 'T7_DATABASE_ADMIN' @localhost;
grant select on T7_MEMBERSHIP to 'T7_DATABASE_ADMIN' @localhost;
grant select on T7_NOK to 'T7_DATABASE_ADMIN' @localhost;
grant select on T7_INSURANCE_COMPANY to 'T7_DATABASE_ADMIN' @localhost;
grant select on T7_POLICY_RENEWABLE to 'T7_DATABASE_ADMIN' @localhost;
grant select on T7_INCIDENT to 'T7_DATABASE_ADMIN' @localhost;
grant select on T7_INCIDENT_REPORT to 'T7_DATABASE_ADMIN' @localhost;
grant select on T7_COVERAGE to 'T7_DATABASE_ADMIN' @localhost;
grant select on T7_PRODUCT to 'T7_DATABASE_ADMIN' @localhost;
grant select on T7_RECEIPT to 'T7_DATABASE_ADMIN' @localhost;



-- grants to Finance Department
grant select on T7_APPLICATION to 'T7_FINANCE_DEPARTMENT' @localhost;
grant select on T7_QUOTE to 'T7_FINANCE_DEPARTMENT' @localhost;
grant select on T7_INSURANCE_POLICY to 'T7_FINANCE_DEPARTMENT' @localhost ;
grant select,insert,update,delete on T7_PREMIUM_PAYMENT to 'T7_FINANCE_DEPARTMENT' @localhost ;
grant select,insert,update,delete on T7_CLAIM to 'T7_FINANCE_DEPARTMENT' @localhost ;
grant select,insert,update,delete on T7_CLAIM_SETTLEMENT to 'T7_FINANCE_DEPARTMENT' @localhost ;
grant select on T7_DEPARTMENT to 'T7_FINANCE_DEPARTMENT' @localhost;
grant select on T7_OFFICE to 'T7_FINANCE_DEPARTMENT' @localhost;
grant select on T7_MEMBERSHIP to 'T7_FINANCE_DEPARTMENT' @localhost;
grant select on T7_NOK to 'T7_FINANCE_DEPARTMENT' @localhost;
grant select on T7_INSURANCE_COMPANY to 'T7_FINANCE_DEPARTMENT' @localhost;
grant select on T7_INCIDENT to 'T7_FINANCE_DEPARTMENT' @localhost;
grant select on T7_INCIDENT_REPORT to 'T7_FINANCE_DEPARTMENT' @localhost;
grant select on T7_COVERAGE to 'T7_FINANCE_DEPARTMENT' @localhost;
grant select on T7_PRODUCT to 'T7_FINANCE_DEPARTMENT' @localhost;
grant select,insert,update,delete on T7_RECEIPT to 'T7_FINANCE_DEPARTMENT' @localhost;



