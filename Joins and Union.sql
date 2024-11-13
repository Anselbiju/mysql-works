#Consider the Country table and Persons table that you created earlier and perform the following: 
#(1)Perform inner join, Left join, and Right join on the tables. 
#(2)List all distinct country names from both the Country and Persons tables. 
#(3)List all country names from both the Country and Persons tables, including duplicates. 
#(4)Round the ratings of all persons to the nearest integer in the Persons table.

-- (1)
SELECT Persons.fName, Country.Country_Name, Persons.Rating
FROM Persons
INNER JOIN Country ON Persons.ID = Country.ID;

SELECT Persons.fName, Country.Country_Name, Persons.Rating
FROM Persons
LEFT JOIN Country ON Persons.ID = Country.ID;

SELECT Persons.fName, Country.Country_Name, Persons.Rating
FROM Persons
RIGHT JOIN Country ON Persons.ID = Country.ID;

-- (2)
SELECT DISTINCT Country_Name FROM Country
UNION
SELECT DISTINCT Country_Name FROM Persons;

-- (3)
SELECT Country_Name FROM Country
UNION ALL
SELECT Country_Name FROM Persons;

-- (4)
SELECT ID, FName, ID, ROUND(Rating) AS RoundedRating
FROM Persons;


