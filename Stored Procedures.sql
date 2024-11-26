#Consider the Worker table with following fields: Worker_Id INT FirstName CHAR(25), LastName CHAR(25), Salary INT(15), JoiningDate DATETIME, Department CHAR(25)) 
#1. Create a stored procedure that takes in IN parameters for all the columns in the Worker table and adds a new record to the table and then invokes the procedure call. 
#2. Write stored procedure takes in an IN parameter for WORKER_ID and an OUT parameter for SALARY. It should retrieve the salary of the worker with the given ID and returns it in the p_salary parameter. Then make the procedure call. 
#3. Create a stored procedure that takes in IN parameters for WORKER_ID and DEPARTMENT. It should update the department of the worker with the given ID. Then make a procedure call. 
#4. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_workerCount. It should retrieve the number of workers in the given department and returns it in the p_workerCount parameter. Make procedure call. 
#5. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_avgSalary. It should retrieve the average salary of all workers in the given department and returns it in the p_avgSalary parameter and call the procedure.

#1
CREATE TABLE Workers (
    Worker_Id INT PRIMARY KEY,
    FirstName CHAR(25),
    LastName CHAR(25),
    Salary INT,
    JoiningDate DATETIME,
    Department CHAR(25)
);

DELIMITER $$
CREATE PROCEDURE AddWorker(
    IN n_Worker_Id INT,
    IN n_FirstName CHAR(25),
    IN n_LastName CHAR(25),
    IN n_Salary INT,
    IN n_JoiningDate DATETIME,
    IN n_Department CHAR(25)
)
BEGIN
    INSERT INTO Workers (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
    VALUES (n_Worker_Id, n_FirstName, n_LastName, n_Salary, n_JoiningDate, n_Department);
END $$
DELIMITER ;

CALL AddWorker(7, 'Laura', 'Taylor', 48000, '2023-08-15', 'Marketing');
SELECT * FROM Workers;

#2
DELIMITER $$
CREATE PROCEDURE GETSALARY(
	IN n_Worker_id INT,
    OUT p_Salary INT
)
BEGIN
	SELECT Salary INTO p_Salary
    FROM Workers 
    WHERE Worker_ID = n_Worker_id;
END $$
DELIMITER ;

SET @Salary = 0;
CALL GETSALARY(7, @Salary);
SELECT @Salary AS Workersalary;


#3
DELIMITER $$
CREATE PROCEDURE GETDEPT(
	IN n_Worker_id INT,
    IN Dept CHAR(15)
)
BEGIN
	UPDATE Workers
    SET Department = DEPT
    WHERE Worker_id = n_Worker_id;
END $$
DELIMITER ;

CALL GETDEPT(7, "ICU");
SELECT * FROM Workers;
    

#4
DELIMITER $$
CREATE PROCEDURE GetWorkerCount(
    IN p_Department CHAR(25),
    OUT p_workerCount INT
)
BEGIN
    SELECT COUNT(*) INTO p_workerCount
    FROM Workers
    WHERE Department = p_Department;
END $$
DELIMITER ;

SET @WORKERCOUNT = 0;
CALL GetWorkerCount('ICU', @WORKERCOUNT);
SELECT @WORKERCOUNT AS DEPT_COUNT_MEMBERS;


#5
DELIMITER $$
CREATE PROCEDURE GetAverageSalaryByDepartment(
    IN p_Department CHAR(25),
    OUT p_avgSalary DECIMAL(10, 2)
)
BEGIN
    SELECT AVG(Salary) INTO p_avgSalary
    FROM Workers
    WHERE Department = p_Department;
END $$
DELIMITER ;

SET @AVG_SAL = 0;
CALL GetAverageSalaryByDepartment('ICU', @AVG_SAL);
SELECT @AVG_SAL AS Average_Salary;

