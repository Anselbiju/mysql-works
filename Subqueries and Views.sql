#Consider the Country table and Persons table that you created earlier and perform the following: 
#1. Find the number of persons in each country. 
#2. Find the number of persons in each country sorted from high to low. 
#3. Find out an average rating for Persons in respective countries if the average is greater than 3.0 
#4. Find the countries with the same rating as the USA. (Use Subqueries) 
#5. Select all countries whose population is greater than the average population of all nations. 


#1
SELECT COUNT(fname) AS Count_Persons,country_name  AS Country
FROM PERSONS 
GROUP BY country_name;

#2
SELECT COUNT(fname) AS Count_Persons,country_name  AS Country
FROM PERSONS 
GROUP BY country_name 
ORDER BY Count_Persons DESC;

#3
SELECT AVG(rating) AS Avg_Rating, country_name
FROM PERSONS 
WHERE rating > 3
GROUP BY Country_name;

#4
SELECT COUNTRY_NAME,RATING
FROM PERSONS
WHERE rating = (SELECT RATING
FROM PERSONS 
WHERE COUNTRY_NAME = "USA");

SELECT * FROM PERSONS;

#5
SELECT Country_name, POPULATION
FROM persons WHERE POPULATION > (SELECT AVG(population)
FROM persons);



#Create a database named Product and create a table called Customer with the following fields in the Product database: Customer_Id - Make PRIMARY KEY First_name Last_name Email Phone_no Address City State Zip_code Country 

#1. Create a view named customer_info for the Customer table that displays Customer’s Full name and email address. Then perform the SELECT operation for the customer_info view. 
#2. Create a view named US_Customers that displays customers located in the US. 
#3. Create another view named Customer_details with columns full name(Combine first_name and last_name), email, phone_no, and state. 
#4. Update phone numbers of customers who live in California for Customer_details view. 
#5. Count the number of customers in each state and show only states with more than 5 customers. 
#6. Write a query that will return the number of customers in each state, based on the "state" column in the "customer_details" view. 
#7. Write a query that returns all the columns from the "customer_details" view, sorted by the "state" column in ascending order.

CREATE DATABASE PRODUCT;
USE PRODUCT;

CREATE TABLE Customer(
Customer_id INT PRIMARY KEY,
First_name VARCHAR(20),
Last_name VARCHAR(20),
Email VARCHAR(30),
Phone_no INT,
Address VARCHAR(30),
City VARCHAR(20),
State VARCHAR(15),
Zip_code VARCHAR(5),
Country VARCHAR(10));

DESC Customer;

INSERT INTO Customer (Customer_id, First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country)
VALUES
(1, 'John', 'Doe', 'johndoe@example.com', 987654321, '123 Elm Street', 'New York', 'NY', '10001', 'USA'),
(2, 'Jane', 'Smith', 'janesmith@example.com', 912345678, '456 Oak Avenue', 'Los Angeles', 'CA', '90001', 'USA'),
(3, 'Rahul', 'Sharma', 'rahul.sharma@example.in', 987123456, '789 Pine Road', 'Mumbai', 'MH', '40001', 'India'),
(4, 'Emily', 'Brown', 'emily.brown@example.com', 982345678, '321 Maple Lane', 'Chicago', 'IL', '60601', 'USA'),
(5, 'Liam', 'Wilson', 'liam.wilson@example.com', 981234567, '654 Cedar Street', 'Sydney', 'NSW', '2000', 'Australia'),
(6, 'Sophia', 'Garcia', 'sophia.garcia@example.com', 986789123, '987 Birch Avenue', 'Toronto', 'ON', 'MH2N2', 'Canada'),
(7, 'Wei', 'Zhang', 'wei.zhang@example.cn', 981112223, '111 Bamboo Street', 'Beijing', 'BJ', '10000', 'China'),
(8, 'Ahmed', 'Khan', 'ahmed.khan@example.pk', 989876543, '222 Crescent Road', 'Karachi', 'SD', '74200', 'Pakistan'),
(9, 'Olivia', 'Martinez', 'olivia.martinez@example.com', 982223344, '333 Palm Drive', 'Madrid', 'MD', '28001', 'Spain'),
(10, 'Ethan', 'Lee', 'ethan.lee@example.sg', 987456321, '444 Orchid Street', 'Singapore', 'SG', '04948', 'Singapore');

SELECT * FROM Customer;

#1
CREATE VIEW customer_info AS
SELECT 
CONCAT(First_name, ' ', Last_name) AS Full_name, Email
FROM Customer;

SELECT * FROM customer_info;

#2
CREATE VIEW US_Customers AS
SELECT *
FROM Customer
WHERE Country = 'USA';

SELECT * FROM US_Customers;

#3
CREATE VIEW Customer_details AS
SELECT 
CONCAT(First_name, ' ', Last_name) AS Full_name, Email, Phone_no, State
FROM Customer;

SELECT * FROM Customer_details;

#4
SET SQL_SAFE_UPDATES = 0;
UPDATE Customer
SET Phone_no = 974453562
WHERE State = 'CA';

SELECT * FROM Customer_details WHERE State = 'CA';

#5
SELECT State, COUNT(*) AS Customer_count
FROM Customer
GROUP BY State
HAVING COUNT(*) > 5;

#6
SELECT State, COUNT(*) AS Customer_count
FROM Customer_details
GROUP BY State;

#7
SELECT * FROM Customer_details
ORDER BY State ASC;



