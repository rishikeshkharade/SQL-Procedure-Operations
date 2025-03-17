CREATE DATABASE All_In_One_Practise;

USE All_In_One_Practise;

CREATE TABLE Employee
(
	empId INT,
	empName VARCHAR(50),
	deptID INT,
	salary DECIMAL (10, 2),
	joinYear INT
);

INSERT INTO Employee (empId, empName, deptID, salary, joinYear) VALUES
(1001, 'Amol Gosavi', 1, 45000, 2002),
(1002, 'Asmita Girhepunje', 2, 55000, 2000),
(1003, 'Puja Borse', 1, 35000, 2005),
(1004, 'Disha Kanmble', 4, 32000, 2004),
(1005, 'NP Narsimha', 2, 40000, 2002),
(1006, 'Rishikesh Kharade', 3, 50000, 2001);
GO
--Normal retreiving data 
SELECT * FROM Employee WHERE deptID = 1;

--Creating Stored Procedure
ALTER PROC spDepartmentList1
AS
BEGIN
SELECT * FROM Employee WHERE deptID = 1;
SELECT * FROM Employee WHERE deptID = 2;
END

-- Drop Procedure
DROP PROC spDepartmentList;


-- 3 ways to execute procedure
spDepartmentList
EXECUTE spDepartmentList1 2, 'Puja Borse';
EXEC spDepartmentList;


--Parameter in stored procedure (Input Parameter, Ouput Parameter) 
ALTER PROC spDepartmentList1
@dept_id INT = 1,
@emp_name VARCHAR(50) = 'Asmita Girhepunje'
AS
BEGIN
SELECT * FROM Employee WHERE deptID = @dept_id;
SELECT * FROM Employee WHERE empName = @emp_name;
END


--Output parameter
ALTER PROC spAddDigit
@Num1 INT,
@Num2 INT,
@Result INT OUTPUT
WITH ENCRYPTION
AS
BEGIN 
	SET @Result = @Num1 + @Num2;
END

DECLARE @EId INT
EXEC spAddDigit 23, 27, @EId OUTPUT;
SELECT @EId;

--stored procedure security
sp_helptext spAddDigit;