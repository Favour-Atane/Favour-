CREATE DATABASE customer_db;
USE customer_db;

CREATE TABLE customer
   (
       custid VARCHAR(6) NOT NULL,
       fname VARCHAR(30) NOT NULL,
       mname VARCHAR(30),
       ltname VARCHAR(30) NOT NULL,
       city VARCHAR(15),
       age INT NOT NULL,
       mobileno VARCHAR(10) NOT NULL,
       occupation VARCHAR(10),
       dob DATE NOT NULL,
       CONSTRAINT custid_pk PRIMARY KEY(custid)   
   );
   
ALTER TABLE customer ADD Age INT NOT NULL;
drop table customer;
show tables;

select * from  customer;
   
INSERT INTO customer VALUES('C00001','Ramesh','Chandra','Sharma','Delhi',45,'9543198345','Service','1976-12-06');
INSERT INTO customer VALUES('C00002','Avinash','Sunder','Minha','Delhi',32,'9876532109','Service','1974-10-16');
INSERT INTO customer VALUES('C00003','Rahul',null,'Rastogi','Delhi',24,'9765178901','Student','1981-09-26');
INSERT INTO customer VALUES('C00004','Parul',null,'Gandhi','Delhi',46,'9876532109','Housewife','1976-11-03');
INSERT INTO customer VALUES('C00005','Naveen','Chandra','Aedekar','Mumbai',23,'8976523190','Service','1976-09-19');
INSERT INTO customer VALUES('C00006','Chitresh',null,'Barwe','Mumbai',18,'7651298321','Student','1992-11-06');
INSERT INTO customer VALUES('C00007','Amit','Kumar','Borkar','Mumbai',76,'9875189761','Student','1981-09-06');
INSERT INTO customer VALUES('C00008','Nisha',null,'Damle','Mumbai',43,'7954198761','Service','1975-12-03');
INSERT INTO customer VALUES('C00009','Abhishek',null,'Dutta','Kolkata',67,'9856198761','Service','1973-05-22');
INSERT INTO customer  VALUES('C00010','Shankar',null,'Nair','Chennai',90,'8765489076','Service','1976-07-12');  

Select * from customer;

# Count
Select count(*) from customer;  #Output = 10

# Minimum Age of customer
Select MIN(age) from customer; #Output = 18

# Maximum Age of customer
Select MAX(age) from customer; #Output = 90

# The customer whose age is 90
Select * from customer where age = 90;

# Checking the customer that was born in year 1990 above
Select * from customer where dob > '1990-01-01';

# Stored Procedure
delimiter &&
create procedure old_age_customer()
begin
select fname, mname, ltname, 
	age from customer where age > 50
    order by age;
end &&
delimiter ;
# The call
call old_age_customer();

# Distinct City
Select distinct(city), count(*) As total_number 
	from customer 
    group by 1 
    order by 2 DESC;
    
# Distinct Occupation
Select distinct(occupation), Count(*) as Total_occupation
	from customer
    group by 1
    order by 2;

# Deleting the middle name column in the table
ALTER TABLE customer DROP mname;

# Check all
Select * from customer;

/*MySQL Restricting and Sorting data
1. Writing a query to display the name (first_name, last_name) and for all customer 
	whose age is not in the range 50 through 90.

Sample table: customers
*/
Select fname, ltname, age from customer
where age NOT BETWEEN 50 AND 90 ;

/*Sample table: employees
2. Write a query to display the first_name of all customer who have both "a" in their first name.

Sample table: employees
*/
select fname from customer
where fname LIKE 'A%';

# Age segregation
Select fname, ltname,
CASE
	WHEN age > 50 THEN "Adult"
    WHEN age = 50 THEN "Adolescent"
    ELSE "Child"
END AS Age_label
From customer ;