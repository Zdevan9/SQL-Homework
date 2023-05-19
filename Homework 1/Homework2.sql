select *
from dbo.Student
where FirstName = 'Antonio'

select *
from dbo.Student
where DateofBirth > '01-01-1999'

select *
from dbo.Student
where LastName like 'J%' and EnrolledDate >= '1998-01-01' and EnrolledDate < '1998-02-01';

select *
from dbo.Student
order by FirstName asc;

select LastName
from dbo.Teacher
union
select LastName
from dbo.Student;