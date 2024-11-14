#Functions

#Consider the Country table and Persons table that you created earlier and perform the following:
 #1. Add a new column called DOB in Persons table with data type as Date. 
 #2. Write a user-defined function to calculate age using DOB. 
 #3. Write a select query to fetch the Age of all persons using the function that has been created. 
 #4. Find the length of each country name in the Country table. 
 #5. Extract the first three characters of each country's name in the Country table. 
 #6. Convert all country names to uppercase and lowercase in the Country table.##
 
 alter table persons add column DOB date;
 SELECT * FROM PERSONS;
 
 DELIMITER $$

CREATE FUNCTION CalculateAge(dob DATE) 
RETURNS INT 
DETERMINISTIC
BEGIN
    DECLARE age INT;
    
    SET age = TIMESTAMPDIFF(YEAR, dob, CURDATE());
    
    -- Adjust age if the current date is before the birth date in the current year
    IF DATE_FORMAT(dob, '%m%d') > DATE_FORMAT(CURDATE(), '%m%d') THEN
        SET age = age - 1;
    END IF;

    RETURN age;
END $$

DELIMITER ;


SELECT CalculateAge('2001-01-20') AS Age;

SELECT fname, CalculateAge(DOB) AS Age
FROM Persons;

SELECT Country_Name, LENGTH(Country_Name) AS NameLength
FROM Country;

 SELECT Country_Name, SUBSTRING(Country_Name, 1, 3) AS FirstThreeChars
FROM Country;

SELECT Country_Name, UPPER(Country_Name) AS UpperCaseName, LOWER(Country_Name) AS LowerCaseName
FROM Country;

