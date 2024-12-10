#Topic : Library Management System You are going to build a project based on Library Management System. It keeps track of all information about books in the library, their cost, status and total number of books available in the library. Create a database named library and following TABLES in the database: 1. Branch 2. Employee 3. Books 4. Customer 5. IssueStatus 6. ReturnStatus Attributes for the tables: 1. Branch Branch_no - Set as PRIMARY KEY Manager_Id Branch_address Contact_no 2. Employee Emp_Id – Set as PRIMARY KEY Emp_name Position Salary Branch_no - Set as FOREIGN KEY and it refer Branch_no in Branch table 3. Books ISBN - Set as PRIMARY KEY Book_title Category Rental_Price Status [Give yes if book available and no if book not available] Author Publisher 4. Customer Customer_Id - Set as PRIMARY KEY Customer_name Customer_address Reg_date 5. IssueStatus Issue_Id - Set as PRIMARY KEY Issued_cust – Set as FOREIGN KEY and it refer customer_id in CUSTOMER table Issued_book_name Issue_date Isbn_book – Set as FOREIGN KEY and it should refer isbn in BOOKS table 6. ReturnStatus Return_Id - Set as PRIMARY KEY Return_cust Return_book_name Return_date Isbn_book2 - Set as FOREIGN KEY and it should refer isbn in BOOKS table Display all the tables and Write the queries for the following : 
#1. Retrieve the book title, category, and rental price of all available books. 
#2. List the employee names and their respective salaries in descending order of salary. 
#3. Retrieve the book titles and the corresponding customers who have issued those books. 
#4. Display the total count of books in each category. 
#5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000. 
#6. List the customer names who registered before 2022-01-01 and have not issued any books yet. 
#7. Display the branch numbers and the total count of employees in each branch. 
#8. Display the names of customers who have issued books in the month of June 2023. 
#9. Retrieve book_title from book table containing history. 
#10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees 
#11. Retrieve the names of employees who manage branches and their respective branch addresses. 
#12. Display the names of customers who have issued books with a rental price higher than Rs. 25. Score Distribution: 1 point for correctly formulating the query of each question (12 x 1 = 12). 1 point for providing screenshots of the output for each question (12 x 1 = 12). 1 point for timely submission. Total = 25. PS : After completing the project upload your project with screenshots in the github and share the link.

CREATE DATABASE LIBRARY;
USE LIBRARY;

CREATE TABLE BRANCH (
BRANCH_NO INT PRIMARY KEY,
MANAGER_ID INT,
BRANCH_ADDRESS VARCHAR(50),
CONTACT_NO INT );

INSERT INTO BRANCH (BRANCH_NO, MANAGER_ID, BRANCH_ADDRESS, CONTACT_NO)
VALUES 
(1, 101, 'Main Street, City A', 987654321),
(2, 102, 'Park Lane, City B', 912345678),
(3, 103, 'Green Road, City C', 998877665),
(4, 104, 'Hilltop View, City D', 889977665),
(5, 105, 'Lakeside, City E', 778899665);

CREATE TABLE EMPLOYEE (
EMP_ID INT PRIMARY KEY,
EMP_NAME VARCHAR(30),
POSITION VARCHAR(15),
SALARY DECIMAL(10,2),
BRANCH_NO INT,
FOREIGN KEY(BRANCH_NO) REFERENCES BRANCH(BRANCH_NO) );

INSERT INTO EMPLOYEE (EMP_ID, EMP_NAME, POSITION, SALARY, BRANCH_NO)
VALUES 
(1, 'Alice', 'Manager', 75000.00, 1),
(2, 'Bob', 'Clerk', 30000.00, 1),
(3, 'Charlie', 'Assistant', 25000.00, 2),
(4, 'David', 'Manager', 78000.00, 2),
(5, 'Eve', 'Clerk', 32000.00, 3);

CREATE TABLE BOOKS (
ISBN VARCHAR(15) PRIMARY KEY,
 BOOK_TITLE VARCHAR(100) NOT NULL,
 CATEGORY VARCHAR(30),
 RENTAL_PRICE DECIMAL(10,2),
 STATUS VARCHAR(3) DEFAULT 'YES',
 AUTHOR VARCHAR(30),
 PUBLISHER VARCHAR(40) );
 
 INSERT INTO BOOKS (ISBN, BOOK_TITLE, CATEGORY, RENTAL_PRICE, STATUS, AUTHOR, PUBLISHER)
VALUES 
('9780131103627', 'Data Structures', 'Computer Science', 12.00, 'YES', 'John Smith', 'Pearson'),
('9783161484100', 'Introduction to SQL', 'Programming', 10.50, 'YES', 'Alice Brown', 'McGraw-Hill'),
('9780201616224', 'Clean Code', 'Programming', 15.00, 'NO', 'Robert Martin', 'Prentice Hall'),
('9780132350884', 'Design Patterns', 'Software Design', 18.50, 'YES', 'Erich Gamma', 'Addison-Wesley'),
('9780596007126', 'Head First Java', 'Programming', 14.00, 'YES', 'Kathy Sierra', 'Reilly');

 CREATE TABLE CUSTOMER (
 CUS_ID INT PRIMARY KEY,
 CUS_NAME VARCHAR(30),
 CUS_ADDRESS VARCHAR(40),
 REG_DATE DATE );
 
 INSERT INTO CUSTOMER (CUS_ID, CUS_NAME, CUS_ADDRESS, REG_DATE)
VALUES 
(1, 'John Doe', '123 Elm St', '2024-01-01'),
(2, 'Jane Smith', '456 Oak St', '2024-02-01'),
(3, 'Michael Brown', '789 Pine St', '2024-03-01'),
(4, 'Emily Davis', '101 Maple St', '2024-04-01'),
(5, 'David Wilson', '202 Birch St', '2024-05-01');

 CREATE TABLE ISSUESTATUS (
 ISSUE_ID INT PRIMARY KEY,
 ISSUED_CUS INT,
 ISSUED_BOOK_NAME VARCHAR(50),
 ISSUE_DATE DATE,
 ISBN_BOOK VARCHAR(15), 
 FOREIGN KEY(ISSUED_CUS) REFERENCES CUSTOMER(CUS_ID),
 FOREIGN KEY(ISBN_BOOK) REFERENCES BOOKS(ISBN) );

INSERT INTO ISSUESTATUS (ISSUE_ID, ISSUED_CUS, ISSUED_BOOK_NAME, ISSUE_DATE, ISBN_BOOK)
VALUES 
(1, 1, 'Data Structures', '2024-06-01', '9780131103627'),
(2, 2, 'Clean Code', '2024-06-10', '9780201616224'),
(3, 3, 'Head First Java', '2024-06-15', '9780596007126'),
(4, 4, 'Design Patterns', '2024-06-20', '9780132350884'),
(5, 5, 'Introduction to SQL', '2024-06-25', '9783161484100');

CREATE TABLE RETURNSTATUS (
RETURN_ID INT PRIMARY KEY,
RETURN_CUS VARCHAR(30),
RETURN_BOOK_NAME VARCHAR(50),
RETURN_DATE DATE,
ISBN_BOOK2 VARCHAR(13),
FOREIGN KEY(ISBN_BOOK2) REFERENCES BOOKS(ISBN) );

INSERT INTO RETURNSTATUS (RETURN_ID, RETURN_CUS, RETURN_BOOK_NAME, RETURN_DATE, ISBN_BOOK2)
VALUES 
(1, 'John Doe', 'Data Structures', '2024-07-01', '9780131103627'),
(2, 'Jane Smith', 'Clean Code', '2024-07-05', '9780201616224'),
(3, 'Michael Brown', 'Head First Java', '2024-07-10', '9780596007126'),
(4, 'Emily Davis', 'Design Patterns', '2024-07-15', '9780132350884'),
(5, 'David Wilson', 'Introduction to SQL', '2024-07-20', '9783161484100');

SELECT BOOK_TITLE, CATEGORY, RENTAL_PRICE 
FROM BOOKS; -- 1

SELECT EMP_NAME, SALARY 
FROM EMPLOYEE ORDER BY SALARY DESC; -- 2

SELECT B.BOOK_TITLE AS BOOK_TITLE,
C.CUS_NAME AS CUSTOMER_NAME
FROM ISSUESTATUS I
JOIN BOOKS B ON I.ISBN_BOOk = B.ISBN
JOIN CUSTOMER C ON I.ISSUED_CUS = C.CUS_ID; -- 3

SELECT CATEGORY, COUNT(*) AS TOT_COUNT
FROM BOOKS 
GROUP BY CATEGORY; -- 4

SELECT EMP_NAME, POSITION, SALARY 
FROM EMPLOYEE 
WHERE SALARY < 50000; -- 5

SELECT CUS_NAME
FROM CUSTOMER
WHERE REG_DATE < '2022-01-01' 
AND CUS_ID NOT IN (
	SELECT ISSUED_CUS
	FROM ISSUESTATUS ); -- 6
    
INSERT INTO CUSTOMER (CUS_ID, CUS_NAME, CUS_ADDRESS, REG_DATE)
VALUES (6, 'Alice Green', '789 Cedar St', '2021-05-01'),
(7, 'Bob White', '890 Walnut St', '2020-11-15');


SELECT BRANCH_NO, COUNT(EMP_ID)
FROM EMPLOYEE 
GROUP BY BRANCH_NO; -- 7

SELECT C.CUS_NAME AS CUSTOMER_NAME
FROM CUSTOMER C
JOIN ISSUESTATUS I ON C.CUS_ID = I.ISSUED_CUS
WHERE I.ISSUE_DATE BETWEEN '2024-06-01' AND '2024-06-30'; -- 8 #VALUES ARE ON THE YEAR 2024

SELECT BOOK_TITLE 
FROM BOOKS
WHERE BOOK_TITLE LIKE '%Clean Code%'; -- 9

SELECT BRANCH_NO, COUNT(EMP_ID) AS Total_Employees
FROM EMPLOYEE
GROUP BY BRANCH_NO
HAVING COUNT(EMP_ID) > 1; -- 10 #COUNT OF EMPLOYEES IS AROUND 2 IN THE CURRENT VALUES CAN BE CHANGE BY ADDING VALUES

SELECT E.EMP_NAME AS MANAGER_NAME, B.BRANCH_ADDRESS
FROM EMPLOYEE E
JOIN BRANCH B ON E.BRANCH_NO = B.BRANCH_NO; -- 11

SELECT C.Cus_Name AS Customer_Name
FROM CUSTOMER C
JOIN ISSUESTATUS I ON c.Cus_Id = I.Issued_Cus
JOIN BOOKS B ON I.ISBN_Book = B.ISBN
WHERE B.Rental_Price > 15; -- 12  #OUTPUT CAN BE OBTAINED WHEN THE RENTAL PRICE CHANGED TO 15






