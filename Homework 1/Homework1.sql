create table Student (
id int identity (1,1) not null,
FirstName nvarchar(20) not null,
LastName nvarchar(20) not null,
DateofBirth date not null,
EnrolledDate date null,
Gender nchar(1) null,
NationalIdNumber nvarchar(10) not null,
StudentCardNumber nvarchar(10) not null,
);

create table Teacher (
Id int identity(1,1) not null,
FirstName nvarchar(20) not null,
LastName nvarchar(20) not null,
DateofBirth date not null,
AcademicRank nvarchar(10) not null,
HireDate date null,
);

create table Grade (
id int identity(1,1) not null,
StudentID int identity(1,1) not null,   --Not sure if these need to be taken with foreign keys from the other tables
CourseID int identity(1,1) not null,
TeacherID int identity(1,1) not null,
Grade int not null,
Comment nvarchar(max) null,
CreatedDate date null,
);

create table Course (
Id int identity(1,1) not null,
[Name] nvarchar(20) not null,
Credit int not null,
AcademicYear int not null,
Semester int not null,
);

create table GradeDetails (
Id int identity(1,1) not null,
GradeId int not null,                 --Also these
AchievementTypeID int not null,
AchievementPoints int not null,
AchievementMaxPoints bigint not null,
AchievementDate date not null,
);

create table AchivementType (
Id int identity(1,1) not null,
[Name] nvarchar(20) not null,
[Description] nvarchar(max) null,
ParticipationRate bigint null,
);
