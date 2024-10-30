-- Create a table named Managers with fields : Manager_Id First_name Last_Name DOB Age ->Use check constraint Last_update Gender Department Salary -> NOT NULL 1. Insert 10 rows. 2. Write a query that retrieves the name and date of birth of the manager with Manager_Id 1. 3. Write a query to display the annual income of all managers. 4. Write a query to display records of all managers except ‘Aaliya’. 5. Write a query to display details of managers whose department is IT and earns more than 25000 per month. 6. Write a query to display details of managers whose salary is between 10000 and 35000.--

use entri;

-- Create the Managers table
CREATE TABLE Managers (
    Manager_Id INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    DOB DATE,
    Age INT CHECK (Age >= 18),
    Last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Gender CHAR(1) CHECK (Gender IN ('M', 'F')),
    Department VARCHAR(50) NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL
);

-- Insert 10 rows
INSERT INTO Managers (Manager_Id, First_name, Last_name, DOB, Age, Gender, Department, Salary)
VALUES 
		(1, 'Aaliya', 'Khan', '1985-06-15', 39, 'F', 'HR', 30000),
		(2, 'Rahul', 'Sharma', '1990-08-25', 34, 'M', 'Finance', 28000),
		(3, 'Priya', 'Singh', '1987-12-10', 36, 'F', 'IT', 40000),
		(4, 'Karan', 'Verma', '1988-03-05', 36, 'M', 'IT', 26000),
		(5, 'Neha', 'Bansal', '1992-11-22', 31, 'F', 'Marketing', 22000),
		(6, 'Vikram', 'Yadav', '1982-09-30', 42, 'M', 'IT', 35000),
		(7, 'Anjali', 'Patel', '1995-07-01', 29, 'F', 'HR', 15000),
		(8, 'Rohit', 'Kumar', '1983-04-14', 41, 'M', 'Finance', 32000),
		(9, 'Sneha', 'Rai', '1991-10-18', 32, 'F', 'Marketing', 18000),
		(10, 'Amit', 'Mehta', '1986-01-28', 38, 'M', 'IT', 30000);

-- Retrieve name and DOB of manager with Manager_Id 1
SELECT First_name, Last_name, DOB 
FROM Managers 
WHERE Manager_Id = 1;

-- Display annual income of all managers
SELECT First_name, Last_name, Salary * 12 AS Annual_Income 
FROM Managers;

-- Display records of all managers except 'Aaliya'
SELECT * 
FROM Managers 
WHERE First_name != 'Aaliya';

-- Display details of managers in IT department earning more than 25000
SELECT * 
FROM Managers 
WHERE Department = 'IT' AND Salary > 25000;

-- Display details of managers whose salary is between 10000 and 35000
SELECT * 
FROM Managers 
WHERE Salary BETWEEN 10000 AND 35000;

