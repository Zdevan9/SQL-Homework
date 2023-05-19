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
StudentID int identity(1,1) not null,  
CourseID int identity(1,1) not null,
TeacherID int identity(1,1) not null,
Grade int not null,
Comment nvarchar(max) null,
CreatedDate date null,
primary key (id),
	FOREIGN KEY (StudentID) REFERENCES Student(id),
	FOREIGN KEY (CourseID) REFERENCES Course(Id),
	FOREIGN KEY (TeacherID) REFERENCES Teacher(Id),

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
    FOREIGN KEY (GradeId) REFERENCES Grade(id),
    FOREIGN KEY (AchievementTypeID) REFERENCES AchievementType(Id)
);
