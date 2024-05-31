USE School;
-- Create Students Table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY ,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Phone VARCHAR(15),
    Address VARCHAR(255)
);

-- Create Courses Table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    CourseDescription TEXT,
    Credits INT NOT NULL CHECK (Credits > 0)
);

-- Create Enrollments Table
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY ,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE NOT NULL,
    Grade CHAR(2),
    CONSTRAINT FK_Student
        FOREIGN KEY (StudentID)
        REFERENCES Students(StudentID),
    CONSTRAINT FK_Course
        FOREIGN KEY (CourseID)
        REFERENCES Courses(CourseID)
        
);

-- Insert into Students Table
INSERT INTO Students (StudentID,FirstName, LastName, DateOfBirth, Email, Phone, Address) 
VALUES 
(01,'Ali', 'Khan', '2001-02-15', 'ali.khan@example.pk', '0301-2345678', 'House 1, Street 1, Islamabad'),
(02,'Sara', 'Ahmad', '1999-03-25', 'sara.ahmad@example.pk', '0302-3456789', 'House 2, Street 2, Lahore'),
(03,'Zain', 'Malik', '2002-04-30', 'zain.malik@example.pk', '0303-4567890', 'House 3, Street 3, Karachi'),
(04,'Ayesha', 'Shaikh', '2000-06-10', 'ayesha.shaikh@example.pk', '0304-5678901', 'House 4, Street 4, Quetta'),
(05,'Ahmed', 'Butt', '1998-07-20', 'ahmed.butt@example.pk', '0305-6789012', 'House 5, Street 5, Peshawar');

-- Insert into Courses Table
INSERT INTO Courses (CourseID,CourseName, CourseDescription, Credits) 
VALUES 
(1,'Mathematics', 'Introduction to Mathematics', 3),
(2,'Physics', 'Basics of Physics', 4),
(3,'Chemistry', 'Fundamentals of Chemistry', 3),
(4,'Biology', 'Introduction to Biology', 3),
(5,'Computer Science', 'Basics of Computer Science', 4);

-- Insert into Enrollments Table
INSERT INTO Enrollments ( EnrollmentID,StudentID, CourseID, EnrollmentDate, Grade) 
VALUES 
(11,1, 1, '2024-01-10', 'A'),
(12,2, 2, '2024-01-11', 'B'),
(13,3, 3, '2024-01-12', 'A'),
(14,4, 4, '2024-01-13', 'B'),
(15,5, 5, '2024-01-14', 'A'),
(16,1, 2, '2024-01-15', 'C'),
(17,2, 3, '2024-01-16', 'B'),
(18,3, 4, '2024-01-17', 'A'),
(19,4, 5, '2024-01-18', 'A'),
(20,5, 1, '2024-01-19', 'B');

SELECT *
FROM Students;

SELECT *
FROM Courses;

SELECT *
FROM Enrollments;

--FOR DELETION
DELETE FROM Students 
WHERE StudentID = 1;

--FOR UPDATE 
UPDATE Students 
SET Email = 'new.email@example.pk', Phone = '0306-7890123'
WHERE StudentID = 1;

SELECT Students.FirstName, Students.LastName, Courses.CourseName, Enrollments.EnrollmentDate, Enrollments.Grade
FROM Enrollments
INNER JOIN Students ON Enrollments.StudentID = Students.StudentID
INNER JOIN Courses ON Enrollments.CourseID = Courses.CourseID;
