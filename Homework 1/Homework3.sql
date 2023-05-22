SELECT Course.Name, AchievementType.Name AS Achievement
FROM Course, AchievementType

SELECT Teacher.FirstName, Teacher.LastName 
FROM Teacher
LEFT JOIN Grade ON Teacher.Id = Grade.TeacherID
WHERE Grade.id IS NULL

SELECT Teacher.FirstName, COUNT(Grade.id) AS NumofGrades
FROM Teacher
LEFT JOIN Grade ON Teacher.Id = Grade.TeacherID
GROUP BY  FirstName

SELECT Teacher.FirstName, COUNT(Grade.id) AS NumofGrades
FROM Teacher
LEFT JOIN Grade ON Teacher.Id = Grade.TeacherID
WHERE Teacher.Id < 100
GROUP BY  FirstName 

SELECT MAX(Grade) AS MaxGrade, AVG(GRADE) AS AverageGrade, Student.FirstName, Student.LastName
FROM GRADE 
RIGHT JOIN Student ON Student.id = Grade.StudentID
GROUP BY Student.FirstName, Student.LastName

SELECT Teacher.FirstName, COUNT(Grade.id) AS NumofGrades
FROM Teacher
LEFT JOIN Grade ON Teacher.Id = Grade.TeacherID
WHERE Grade.id > 200
GROUP BY  FirstName  

SELECT Student.FirstName, Student.LastName,
COUNT(Grade.Grade) AS TotalGrades, MAX(Grade.Grade) AS MaxGrade, AVG(Grade.Grade) AS AverageGrade
FROM Grade
LEFT JOIN Student ON Student.id = Grade.StudentID
GROUP BY Student.FirstName, Student.LastName
HAVING MAX(Grade.GRADE) = AVG(Grade.Grade)

SELECT Student.FirstName, Student.LastName,
	TotalGrades,
	MaxGrade,
	AverageGrade
FROM (SELECT Student.FirstName, Student.LastName,
COUNT(Grade.Grade) AS TotalGrades, MAX(Grade.Grade) AS MaxGrade, AVG(Grade.Grade) AS AverageGrade
FROM Grade
LEFT JOIN Student ON Student.id = Grade.StudentID
GROUP BY Student.FirstName, Student.LastName
HAVING MAX(Grade.GRADE) = AVG(Grade.Grade)) AS StudentGrades
JOIN Student ON Student.FirstName = StudentGrades.FirstName