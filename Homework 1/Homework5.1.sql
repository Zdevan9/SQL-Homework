CREATE PROCEDURE CreateGrade 
	@StudentID int,
	@CourseID int,
	@TeacherID int,
	@Grade int,
	@Comment nvarchar(max),
	@CreatedDate date,
	@TotalGradesOutput int OUTPUT
AS
BEGIN
	DECLARE @TotalGrades INT;
	SET @TotalGradesOutput = @TotalGrades;
	
	INSERT INTO Grade (StudentID, CourseID, TeacherID, Grade, Comment, CreatedDate)
	VALUES (@StudentID, @CourseID, @TeacherID, @Grade, @Comment, @CreatedDate);

	SELECT @TotalGrades = COUNT(*)
	FROM Grade 
	WHERE StudentID = @StudentID;

	SELECT MAX(Grade) AS MaxGrade
	FROM Grade
	WHERE TeacherID = @TeacherID AND StudentID = @StudentID


END;

DECLARE @TotalGradesResult int;
EXEC CreateGrade
	@StudentID = 100,
	@CourseID = 100,
	@TeacherID = 100,
	@Grade = 75,
	@Comment = 'Very Good',
	@CreatedDate = '2023-05-21',
	@TotalGradesOutput = @TotalGradesResult OUTPUT;
SELECT @TotalGradesResult AS TotalGrades;

