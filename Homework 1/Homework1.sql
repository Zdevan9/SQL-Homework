create table Student (
id int identity (1,1) not null,
FirstName nvarchar(20) not null,
LastName nvarchar(20) not null,
DateofBirth date not null,
EnrolledDate date null,
Gender nchar(1) null,
NationalIdNumber nvarchar(10) not null,
StudentCardNumber nvarchar(10) not null,
primary key (id),
);

create table Teacher (
Id int identity(1,1) not null,
FirstName nvarchar(20) not null,
LastName nvarchar(20) not null,
DateofBirth date not null,
AcademicRank nvarchar(10) not null,
HireDate date null,
primary key (id),
);

create table Course (
Id int identity(1,1) not null,
[Name] nvarchar(20) not null,
Credit int not null,
AcademicYear int not null,
Semester int not null,
primary key (id),
);

create table Grade (
id int identity(1,1) not null,
StudentID int not null,  
CourseID int not null,
TeacherID int not null,
Grade int not null,
Comment nvarchar(max) null,
CreatedDate date null,
primary key (id),
);

create table AchievementType (
Id int identity(1,1) not null,
[Name] nvarchar(20) not null,
[Description] nvarchar(max) null,
ParticipationRate bigint null,
primary key (id)
);

create table GradeDetails (
Id int identity(1,1) not null,
GradeId int not null,                 
AchievementTypeID int not null,
AchievementPoints int not null,
AchievementMaxPoints bigint not null,
AchievementDate date not null,
);
