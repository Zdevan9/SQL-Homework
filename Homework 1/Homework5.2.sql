CREATE PROCEDURE CreateGradeDetail
	@GradeID int,
	@AchievementTypeID int,
	@AchievementPoints int,
	@AchievementMaxPoints int,
	@AchievementDate date,
	@GradePoints int OUT
AS
BEGIN 

INSERT INTO GradeDetails(GradeID, AchievementTypeID, AchievementPoints, AchievementMaxPoints, AchievementDate)
VALUES (@GradeID, @AchievementTypeID, @AchievementPoints, @AchievementMaxPoints, @AchievementDate)

--Output from this procedure
SET @GradePoints = (SELECT SUM(AchievementPoints / AchievementMaxPoints * ParticipationRate)
FROM GradeDetails
INNER JOIN AchievementType ON AchievementType.Id = GradeDetails.AchievementTypeID
WHERE GradeDetails.GradeID = @GradeID);

END;

DECLARE @GradePointsDeclaration int;

EXEC CreateGradeDetail
	@GradeID = 1,
	@AchievementTypeID = 1,
	@AchievementPoints = 10,
	@AchievementMaxPoints = 20,
	@AchievementDate = '2023-05-28',
	@GradePoints = @GradePointsDeclaration OUT;
