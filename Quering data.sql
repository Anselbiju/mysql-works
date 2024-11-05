-- Insert 10 rows into both tables, as given below. Create a table named Country with fields: Id Country_name Population Area Create another table named Persons with fields: Id Fname Lname Population Rating Country_Id Country_name 
-- (1)List the distinct country names from the Persons table 
-- (2)Select first names and last names from the Persons table with aliases. 
-- (3)Find all persons with a rating greater than 4.0. 
-- (4)Find countries with a population greater than 10 lakhs. 
-- (5)Find persons who are from 'USA' or have a rating greater than 4.5. 
-- (6)Find all persons where the country name is NULL. 
-- (7)Find all persons from the countries 'USA', 'Canada', and 'UK'. 
-- (8)Find all persons not from the countries 'India' and 'Australia'. 
-- (9)Find all countries with a population between 5 lakhs and 20 lakhs. 
-- (10)Find all countries whose names do not start with 'C'.

use entri;

create table Country (
	Id int,
    Country_name varchar(20),
    Population int,
    Area varchar(20)
    );
    

INSERT INTO Country (Id, Country_name, Population, Area) VALUES
(1, 'India', 1380004385, '3,287,263 sq km'),
(2, 'United States', 331002651, '9,826,675 sq km'),
(3, 'China', 1439323776, '9,596,961 sq km'),
(4, 'Brazil', 212559417, '8,515,767 sq km'),
(5, 'Pakistan', 220892340, '881,912 sq km'),
(6, 'Nigeria', 206139589, '923,769 sq km'),
(7, 'Russia', 145934462, '17,098,242 sq km'),
(8, 'Japan', 126476461, '377,975 sq km'),
(9, 'Mexico', 128932753, '1,964,375 sq km'),
(10, 'Germany', 83783942, '357,022 sq km');
    
create table Persons (
	Id int,
    Fname varchar(30),
    Lname varchar(30),
    Population int,
    Rating decimal(2,1),
    Country_Id int,
    Country_name varchar(20)
    );
    
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name)
VALUES
    (1, 'John', 'Doe', 200000, 5, 1, 'USA'),
    (2, 'Jane', 'Smith', 500000, 4, 2, 'Canada'),
    (3, 'Akira', 'Tanaka', 700000, 3, 3, 'Japan'),
    (4, 'Maria', 'Garcia', 300000, 4, 4, 'Spain'),
    (5, 'Li', 'Wang', 800000, 5, 5, 'China'),
    (6, 'Liam', 'Connor', 150000, 3, 6, 'Ireland'),
    (7, 'Carlos', 'Mendez', 250000, 4, 7, 'Mexico'),
    (8, 'Sofia', 'Rossi', 400000, 4, 8, 'Italy'),
    (9, 'Elena', 'Petrova', 600000, 5, 9, 'Russia'),
    (10, 'Amir', 'Khan', 350000, 3, 10, 'India');
    
-- (1)List the distinct country names from the Persons table 
select distinct Country_name from persons;

-- (2)Select first names and last names from the Persons table with aliases. 
select fname as first_name, lname as last_name from persons;

-- (3)Find all persons with a rating greater than 4.0. 
select concat(fname," ",lname) as full_name, rating from persons where rating > 4;

-- (4)Find countries with a population greater than 10 lakhs. 
select country_name, population from Country where population > 1000000; 

-- (5)Find persons who are from 'USA' or have a rating greater than 4.5. 
select concat(fname," ",lname) as full_name, country_name, rating from persons where country_name = 'usa' or rating > 4.5;

-- (6)Find all persons where the country name is NULL. 
select concat(fname," ",lname) as full_name, country_name from persons where country_name = null;   

-- (7)Find all persons from the countries 'USA', 'Canada', and 'UK'. 
select concat(fname," ",lname) as full_name, country_name from persons where country_name in ('usa','canada','uk'); -- uk is not in the table --

-- (8)Find all persons not from the countries 'India' and 'Australia'. 
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name)
VALUES
    (11, 'Andrew', 'Vasco', 250000, 4.5, 1, 'Australia');
select concat(fname," ",lname) as full_name, country_name from persons where country_name not in ('India','Australia');

-- (9)Find all countries with a population between 5 lakhs and 20 lakhs. ## NOTE :( Here values in population of table country are beyond 20,00,000)
select country_name, population from country where population between 5000000 and 200000000;

-- (10)Find all countries whose names do not start with 'C'.
select id, country_name from country where country_name not like 'c%';
