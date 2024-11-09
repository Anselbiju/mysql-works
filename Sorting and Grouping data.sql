-- 5-Sorting and Grouping data

-- Insert 10 rows into both tables, as given below. Create a table named Country with fields: Id Country_name Population Area Create another table named Persons with fields: Id Fname Lname Population Rating Country_Id Country_name 


-- 1. Write an SQL query to print the first three characters of Country_name from the 	Country table. 
-- 2. Write an SQL query to concatenate first name and last name from Persons table. 
-- 3. Write an SQL query to count the number of unique country names from Persons table.   
-- 4. Write a query to print the maximum population from the Country table. 
-- 5. Write a query to print the minimum population from Persons table. 
-- 6. Insert 2 new rows to the Persons table making the Lname NULL. Then write another query to count Lname from Persons table. 
-- 7. Write a query to find the number of rows in the Persons table. 
-- 8. Write an SQL query to show the population of the Country table for the first 3 rows. (Hint: Use LIMIT) 
-- 9. Write a query to print 3 random rows of countries. (Hint: Use rand() function and LIMIT) 
-- 10. List all persons ordered by their rating in descending order. 
-- 11. Find the total population for each country in the Persons table. 
-- 12. Find countries in the Persons table with a total population greater than 50,000 
-- 13. List the total number of persons and average rating for each country, but only for countries with more than 2 persons, ordered by the average rating in ascending order

use entri;
desc country;
select * from country;
select * from persons;

-- 1.
select substring(country_name, 1,3) as first_three_char from country;

-- 2.
select concat(fname," ",lname) as full_name from persons;

-- 3.
select count(*)as count, country_name from persons group by country_name ;

-- 4.
select max(population) as max_population,country_name from country  group by country_name  order by max_population desc;

-- 5.
select min(population) as min_population,country_name from persons  group by country_name  order by min_population;

-- 6.
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name)
VALUES
 (11, 'Achu', 'Mol', 800000, 4.5, 11, 'Africa'),
 (12, 'Ammu', 'Khan', 450000, 3.7, 12, 'UK');
 
SET SQL_SAFE_UPDATES = 0;

UPDATE Persons SET LNAME = CASE 
              WHEN Fname = 'Achu' THEN null
              WHEN Fname = 'Ammu' THEN null            
              END
WHERE Fname IN ('Achu', 'Ammu');

select count(lname) from persons;

-- 7.
select count(*) as row_count from persons;

-- 8.
select population, country_name from country limit 3;

-- 9.
select * from country order by rand() limit 3;

-- 10.
select * from persons order by rating  desc;

-- 11.
select sum(population) as tot_population,country_name from persons  group by country_name  order by tot_population;

-- 12.
select sum(population) as tot_population,country_name from persons group by country_name having sum(population) > 50000;

-- 13.
SELECT Country_name, COUNT(*) AS total_persons, AVG(Rating) AS average_rating
FROM Person GROUP BY Country_name HAVING COUNT(*) > 2 ORDER BY average_rating ASC;
