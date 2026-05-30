CREATE TABLE Student(
StudentID int primary key,
Name varchar(50),
Major varchar(50),
StudentEmail varchar(50)
);

CREATE TABLE Session(
SessionID int primary key,
SessionDate date,
SessionTime time,
SessionType varchar(50),
DurationMinutes int
);

CREATE TABLE Course(
CourseID int primary key,
CourseTitle varchar(50)
);

CREATE TABLE Tutor(
TutorID int primary key,
TutorName varchar(50),
TutorEmail varchar(50),
HourlyRate decimal(10, 2)
);


CREATE TABLE Room(
RoomID int primary key,
RoomBuilding varchar(50),
Department varchar(50)
);

CREATE TABLE TutorSessions(
SessionID int,
CONSTRAINT Session_ID FOREIGN KEY (SessionID) REFERENCES Session(SessionID),
TutorID int,
CONSTRAINT Tutor_ID FOREIGN KEY (TutorID) REFERENCES Tutor(TutorID),
StudentID int,
CONSTRAINT Student_ID FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
RoomID int,
CONSTRAINT Room_ID FOREIGN KEY (RoomID) REFERENCES Room(RoomID),
CourseID int,
CONSTRAINT Course_ID FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);


INSERT INTO Student(StudentID, Name, Major)
VALUES (1, "Mark Grayson", "Fighting villains"), 
		(2, "James Jameson", "Journalism"),
        (3, "Peter Parker", "Biophysics"),
        (4, "Jane Doe", "Mathematics"),
        (5, "Mary Jane", "Botany");
        
INSERT INTO Tutor(TutorID, TutorName, TutorEmail, HourlyRate)
VALUES (1000, "Davendra", "davendra@gmail.com", 16.50),
		(1001, "Zhu", "zhu@hotmail.com", 17.86),
        (1002, "Klieve", "klieve@email.com", 20.00),
        (1003, 'Mary', 'mary@gmail.com', 21.22),
        (1004, 'John', 'john@hotmail.com', 19.00);

INSERT INTO Course(CourseID, CourseTitle)
VALUES (2000, "Ethics"), 
		(2001, "Swinging Physics"),
        (2002, "Researching a Topic"),
        (2003, "Algebra 2"),
        (2004, "Intro to Python");

INSERT INTO Session(SessionID, SessionDate, SessionType, DurationMinutes)
VALUES (3000, '2026-05-30', '8:15:00', 30),
		(3001, '2026-04-28', '15:15:00', 30),
        (3002, '2026-04-10', '10:15:00', 30),
        (3003, '2026-04-1', '8:15:00', 30),
        (3004, '2026-04-20', '7:15:00', 30),
        (3005, '2026-02-17', '9:15:00', 30);
INSERT INTO Room(RoomID, RoomBuilding, Department)
VALUES (4000, 'Math', 'Math'),
		(4001, 'Music', 'Music'),
        (4002, 'Discovery', 'Research'),
        (4003, 'Wendell', 'Science'),
        (4004, 'Black', 'Philosophy'),
        (4005, 'Samuelson', 'Computer Science');
INSERT INTO TutorSessions(SessionID, StudentID, TutorID, RoomID, CourseID)
VALUES (3001, 1, 1001, 4000, 2000),
		(3002, 2, 1000, 4001, 2001),
        (3003, 3, 1002, 4002, 2002),
        (3004, 4, 1003, 4003, 2003),
        (3005, 5, 1004, 4004, 2004);
        

-- Retrieval and JOIN queries.
SELECT s.Name, t.TutorName, c.CourseTitle, ts.roomID
FROM TutorSessions AS ts
JOIN Student AS s 
JOIN Tutor AS t
JOIN Course AS c
WHERE ts.StudentID = s.StudentID AND ts.TutorID = t.TutorID AND ts.CourseID = c.CourseID;

SELECT * FROM TutorSessions WHERE StudentID = 3;

SELECT * FROM TutorSessions WHERE TutorID = 1000;
