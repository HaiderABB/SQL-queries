create table Students
(
  RollNo varchar(7) primary key
,
  Name varchar(30)
,
  WarningCount int
,
  Department varchar(15)
)
GO
INSERT [dbo].[Students]
  ([RollNo], [Name], [WarningCount], [Department])
VALUES
  (N'1', N'Ali', 0, N'CS')
INSERT [dbo].[Students]
  ([RollNo], [Name], [WarningCount], [Department])
VALUES
  (N'2', N'Bilal', 0, N'CS')
INSERT [dbo].[Students]
  ([RollNo], [Name], [WarningCount], [Department])
VALUES
  (N'3', N'Ayesha', 0, N'CS')
INSERT [dbo].[Students]
  ([RollNo], [Name], [WarningCount], [Department])
VALUES
  (N'4', N'Ahmed', 0, N'CS')
INSERT [dbo].[Students]
  ([RollNo], [Name], [WarningCount], [Department])
VALUES
  (N'5', N'Sara', 0, N'EE')
INSERT [dbo].[Students]
  ([RollNo], [Name], [WarningCount], [Department])
VALUES
  (N'6', N'Salman', 1, N'EE')
INSERT [dbo].[Students]
  ([RollNo], [Name], [WarningCount], [Department])
VALUES
  (N'7', N'Zainab', 2, N'CS')
INSERT [dbo].[Students]
  ([RollNo], [Name], [WarningCount], [Department])
VALUES
  (N'8', N'Danial', 1, N'CS')

go
create table Courses
(
  CourseID int primary key,
  CourseName varchar(40),
  PrerequiteCourseID int,
  CreditHours int
) 
GO
INSERT [dbo].[Courses]
  ([CourseID], [CourseName], [PrerequiteCourseID],CreditHours)
VALUES
  (10, N'Database Systems', 20, 3)
INSERT [dbo].[Courses]
  ([CourseID], [CourseName], [PrerequiteCourseID],CreditHours)
VALUES
  (20, N'Data Structures', 30, 3)
INSERT [dbo].[Courses]
  ([CourseID], [CourseName], [PrerequiteCourseID],CreditHours)
VALUES
  (30, N'Programing', NULL, 3)
INSERT [dbo].[Courses]
  ([CourseID], [CourseName], [PrerequiteCourseID],CreditHours)
VALUES
  (40, N'Basic Electronics', NULL, 3)
go

go
Create table Instructors
(
  InstructorID int Primary key,
  Name varchar(30),
  Department varchar(7)
  ,
)
GO
INSERT [dbo].[Instructors]
  ([InstructorID], [Name], [Department])
VALUES
  (100, N'Ishaq Raza', N'CS')
INSERT [dbo].[Instructors]
  ([InstructorID], [Name], [Department])
VALUES
  (200, N'Zareen Alamgir', N'CS')
INSERT [dbo].[Instructors]
  ([InstructorID], [Name], [Department])
VALUES
  (300, N'Saima Zafar', N'EE')
go
Create table Semester
(
  Semester varchar(15) Primary key,
  [Status] varchar(10),
)
GO
INSERT [dbo].[Semester]
  ([Semester], [Status])
VALUES
  (N'Fall2016', N'Complete')
INSERT [dbo].[Semester]
  ([Semester], [Status])
VALUES
  (N'Spring2016', N'Complete')
INSERT [dbo].[Semester]
  ([Semester], [Status])
VALUES
  (N'Spring2017', N'InProgress')
INSERT [dbo].[Semester]
  ([Semester], [Status])
VALUES
  (N'Summer2016', N'Cancelled')
go
Create table Courses_Semester
(
  InstructorID int Foreign key References Instructors(InstructorID),
  CourseID int Foreign key References Courses(CourseID),
  Semester varchar(15) Foreign key References Semester(Semester),
  Section varchar(1) ,
  AvailableSeats int,
  Department varchar(2)
)
GO
INSERT [dbo].[Courses_Semester]
  ([InstructorID], [CourseID], [Semester], [Section], [AvailableSeats], [Department])
VALUES
  (200, 10, N'Spring2017', N'D', 45, N'CS')
INSERT [dbo].[Courses_Semester]
  ([InstructorID], [CourseID], [Semester], [Section], [AvailableSeats], [Department])
VALUES
  (200, 10, N'Spring2017', N'C', 0, N'CS')
INSERT [dbo].[Courses_Semester]
  ([InstructorID], [CourseID], [Semester], [Section], [AvailableSeats], [Department])
VALUES
  (100, 10, N'Spring2017', N'A', 6, N'CS')
INSERT [dbo].[Courses_Semester]
  ([InstructorID], [CourseID], [Semester], [Section], [AvailableSeats], [Department])
VALUES
  (300, 40, N'Spring2017', N'A', 6, N'CS')
INSERT [dbo].[Courses_Semester]
  ([InstructorID], [CourseID], [Semester], [Section], [AvailableSeats], [Department])
VALUES
  (300, 40, N'Spring2016', N'A', 6, N'CS')
INSERT [dbo].[Courses_Semester]
  ([InstructorID], [CourseID], [Semester], [Section], [AvailableSeats], [Department])
VALUES
  (200, 10, N'Spring2016', N'A', 0, N'CS')

go



create table Registration
(
  Semester varchar(15) Foreign key References Semester(Semester),
  RollNumber varchar(7) Foreign key References Students(RollNo),
  CourseID int Foreign key References Courses(CourseID),
  Section varchar(1),
  GPA float
)
INSERT [dbo].[Registration]
  ([Semester], [RollNumber], [CourseID], [Section],GPA)
VALUES
  (N'Fall2016', N'1', 20, N'A', 3.3)
INSERT [dbo].[Registration]
  ([Semester], [RollNumber], [CourseID], [Section],GPA)
VALUES
  (N'Fall2016', N'2', 20, N'B', 4)
INSERT [dbo].[Registration]
  ([Semester], [RollNumber], [CourseID], [Section],GPA)
VALUES
  (N'Spring2016', N'1', 30, N'A', 1.0)
INSERT [dbo].[Registration]
  ([Semester], [RollNumber], [CourseID], [Section],GPA)
VALUES
  (N'Fall2016', N'6', 40, N'D', 0.0)
INSERT [dbo].[Registration]
  ([Semester], [RollNumber], [CourseID], [Section],GPA)
VALUES
  (N'Spring2017', N'6', 40, N'D', 1)


go

Create table ChallanForm
(
  Semester varchar(15) Foreign key References Semester(Semester),
  RollNumber varchar(7) Foreign key References Students(RollNo),
  TotalDues int,
  [Status] varchar(10)
)
GO
INSERT [dbo].[ChallanForm]
  ([Semester], [RollNumber], [TotalDues], [Status])
VALUES
  (N'Fall2016', N'1', 100000, N'Paid')
INSERT [dbo].[ChallanForm]
  ([Semester], [RollNumber], [TotalDues], [Status])
VALUES
  (N'Fall2016', N'2', 13333, N'Paid')
INSERT [dbo].[ChallanForm]
  ([Semester], [RollNumber], [TotalDues], [Status])
VALUES
  (N'Fall2016', N'3', 5000, N'Paid')
INSERT [dbo].[ChallanForm]
  ([Semester], [RollNumber], [TotalDues], [Status])
VALUES
  (N'Fall2016', N'4', 20000, N'Pending')


select *
from Students
select *
from Courses
select *
from Instructors
select *
from Registration
select *
from Semester
select *
from Courses_Semester
select *
from ChallanForm



--Question 1
-- CREATE TRIGGER PreventDeleteStudent
-- ON Students
-- INSTEAD OF DELETE
-- AS
-- BEGIN
--     SET NOCOUNT ON;
    
--     PRINT 'You don''t have the permission to delete the student';
    
--     ROLLBACK TRANSACTION;
-- END;

--Question 2
-- CREATE TRIGGER InsertCoursePrevention
-- ON Courses
-- INSTEAD OF INSERT
-- AS
-- BEGIN
--     SET NOCOUNT ON;
    
--     PRINT 'You don''t have the permission to insert a new course';
    
--     ROLLBACK TRANSACTION;
-- END;

--Question 3
-- CREATE TABLE Notify (
--     NotificationID INT PRIMARY KEY,
--     StudentID VARCHAR(7),
--     NotificationString VARCHAR(255)
-- );

-- CREATE TRIGGER SuccessfulRegistration
-- ON Registration
-- AFTER INSERT
-- AS
-- BEGIN
--     SET NOCOUNT ON;

--     DECLARE @StudentID VARCHAR(7);
--     DECLARE @CourseID INT;
--     DECLARE @PrerequisiteCourseID INT;
--     DECLARE @AvailableSeats INT;

--     SELECT @StudentID = i.RollNumber, @CourseID = i.CourseID
--     FROM inserted i;

--     SELECT @PrerequisiteCourseID = c.PrerequiteCourseID, @AvailableSeats = cs.AvailableSeats
--     FROM Courses c
--     JOIN Courses_Semester cs ON c.CourseID = cs.CourseID
--     WHERE c.CourseID = @CourseID;

--     IF (@PrerequisiteCourseID IS NULL OR EXISTS (SELECT 1 FROM Registration WHERE RollNumber = @StudentID AND CourseID = @PrerequisiteCourseID))
--     BEGIN
--         IF (@AvailableSeats > 0)
--         BEGIN
--             INSERT INTO Notify (StudentID, NotificationString)
--             VALUES (@StudentID, 'Your registration for the course was successful.');
--         END
--         ELSE
--         BEGIN
--             INSERT INTO Notify (StudentID, NotificationString)
--             VALUES (@StudentID, 'Your registration for the course was not successful. No available seats.');
--         END
--     END
--     ELSE
--     BEGIN
--         INSERT INTO Notify (StudentID, NotificationString)
--         VALUES (@StudentID, 'Your registration for the course was not successful. Prerequisite not met.');
--     END
-- END;

--Question 4
-- CREATE TRIGGER FeeChargesTrigger
-- ON Registration
-- INSTEAD OF INSERT
-- AS
-- BEGIN
--     SET NOCOUNT ON;

--     DECLARE @RollNumber VARCHAR(7);
--     DECLARE @TotalDues INT;

--     SELECT @RollNumber = i.RollNumber, @TotalDues = cf.TotalDues
--     FROM inserted i
--     JOIN ChallanForm cf ON i.RollNumber = cf.RollNumber
--     WHERE i.Semester = cf.Semester;

--     IF @TotalDues <= 20000
--     BEGIN
--         INSERT INTO Registration (Semester, RollNumber, CourseID, Section, GPA)
--         SELECT Semester, RollNumber, CourseID, Section, GPA
--         FROM inserted;
--     END
--     ELSE
--     BEGIN
--         PRINT 'You cannot enroll in a new course with more than 20,000 fee charges due.';
--     END
-- END;

-- CREATE TRIGGER DeleteCourseTrigger
-- ON Courses_Semester
-- INSTEAD OF DELETE
-- AS
-- BEGIN
--     SET NOCOUNT ON;

--     DECLARE @CourseID INT;
--     DECLARE @AvailableSeats INT;

--     SELECT @CourseID = d.CourseID
--     FROM deleted d;

--     SELECT @AvailableSeats = AvailableSeats
--     FROM Courses_Semester
--     WHERE CourseID = @CourseID;

--     IF @AvailableSeats >= 10
--     BEGIN
--         DELETE FROM Courses_Semester
--         WHERE CourseID = @CourseID;
        
--         PRINT 'Successfully deleted.';
--     END
--     ELSE
--     BEGIN
--         PRINT 'Not possible. Available seats are less than 10.';
--     END
-- END;

-- CREATE TRIGGER ModifyDropInstructorsPrevention
-- ON DATABASE
-- FOR DROP_TABLE, ALTER_TABLE
-- AS
-- BEGIN
--     SET NOCOUNT ON;
    
--     IF EXISTS (SELECT * FROM sys.tables WHERE name = 'Instructors')
--     BEGIN
--         PRINT 'You cannot modify or drop the Instructors table.';
--         ROLLBACK;
--     END
-- END;