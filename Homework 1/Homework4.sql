--1st query--

CREATE VIEW NewStudents
AS 
SELECT Student.id, Student.FirstName,Student.LastName,Count(Grade.Grade) AS GradeCount
FROM Student
LEFT JOIN Grade ON Student.id = Grade.StudentID
GROUP BY Student.id, Student.FirstName, Student.LastName
GO

SELECT *
FROM NewStudents
GO

--2nd query--

CREATE VIEW StudentsWithoutID
AS 
SELECT Student.FirstName, Student.LastName, Count(Grade.Grade) AS GradeCount
FROM Student
LEFT JOIN Grade ON Student.id = Grade.StudentID
GROUP BY Student.FirstName, Student.LastName
GO

SELECT *
FROM StudentsWithoutID
GO

--3rd query--

SELECT *
FROM StudentsWithoutID
ORDER BY GradeCount DESC

--4th query--

DECLARE @FirstName NVARCHAR(20)
SET @FirstName = 'Antonio'

SELECT *
FROM Student
WHERE FirstName = @FirstName

--5th query--

DECLARE @TableVariable TABLE (
    StudentID INT,
    StudentName NVARCHAR(30),
    DateOfBirth DATE
);

INSERT INTO @TableVariable (StudentID, StudentName, DateOfBirth)
SELECT Student.id, Student.FirstName, Student.DateofBirth
FROM Student
WHERE Student.Gender = 'F';

SELECT *
FROM @TableVariable;

--6th query--

DROP TABLE IF EXISTS #TempTable
CREATE TABLE #TempTable (
LastName nvarchar(30),
EnrolledDate Date
);
INSERT INTO #TempTable (LastName, EnrolledDate)
SELECT Student.LastName, Student.EnrolledDate
FROM Student
WHERE Student.Gender = 'M' AND Student.FirstName LIKE 'A%'

SELECT *
FROM #TempTable

SELECT *
FROM #TempTable
WHERE LEN(LastName) = 7

--7th query--

SELECT Teacher.FirstName
FROM Teacher
WHERE LEN(Teacher.FirstName) = 5

SELECT Teacher.FirstName, Teacher.LastName
FROM Teacher
WHERE LEFT(Teacher.FirstName, 3) = RIGHT(Teacher.LastName, 3)