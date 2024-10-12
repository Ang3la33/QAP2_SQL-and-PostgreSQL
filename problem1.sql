-- Problem 1 - University Course Enrollment System


-- Create Tables

CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    email TEXT,
    school_enrollment_date DATE
);

CREATE TABLE professors (
	id SERIAL PRIMARY KEY,
	first_name TEXT,
	last_name TEXT,
	department TEXT
);

CREATE TABLE courses (
    id SERIAL PRIMARY KEY,
    course_name TEXT,
    course_description TEXT,
    professor_id INT REFERENCES professors(id)
);

CREATE TABLE enrollments (
	student_id INT REFERENCES students(id),
	course_id INT REFERENCES courses(id),
	enrollment_date DATE,
	PRIMARY KEY (student_id, course_id)
);


-- Insert Data

INSERT INTO students (first_name, last_name, email, school_enrollment_date)
VALUES
	('Jane', 'Doe', 'janedoe@example.com', '2024-01-01'),
	('John', 'Doe', 'johnny@example.com', '2024-01-01'),
	('Diane', 'Ross', 'dedeross@example.com', '2024-04-20'),
	('Bob', 'Ross', 'happylittleaccidents@example.com', '2024-04-20'),
	('Marshall','Mathers', 'realslimshady@example.com', '2000-04-18');
	
INSERT INTO professors (first_name, last_name, department)
VALUES
	('Charles', 'Xavier','Philosophy'),
	('Stephen','Hawking','Science'),
	('Virginia','Woolf','English'),
	('Gerda','Lerner','History');

INSERT INTO courses (course_name, course_description, professor_id)
VALUES
	('Ethics 101', 'Intro to moral philosophy and the ethical use of power', 1),
	('Physics 101', 'Black holes and the big bang theory', 2),
	('Literature 101', 'Modernist and feminist literature', 3);

INSERT INTO enrollments (student_id, course_id, enrollment_date)
VALUES
	((SELECT id FROM students WHERE first_name = 'Jane' AND last_name = 'Doe'), 1, '2024-09-01'),
	(1,2,'2024-09-01'),
	(1,3,'2024-01-01'),
	(5,1,'2024-09-20'),
	(2,2,'2024-09-20'),
	(2,3,'2024-01-01'),
	(4,2,'2024-01-01'),
	(3,1,'2024-01-02'),
	(3,2,'2024-01-02');


-- Write SQL Queries

-- Retrieve full names of all students enrolled in "Physics 101"
SELECT first_name || ' ' || last_name AS full_name
FROM students
JOIN enrollments ON students.id = enrollments.student_id
JOIN courses ON enrollments.course_id = courses.id
WHERE courses.course_name = 'Physics 101';

-- Retrieve a list of all courses along with the professor's full name who teachers each course
SELECT courses.course_name, first_name || ' ' || last_name AS full_name
FROM courses
JOIN professors ON courses.professor_id = professors.id;

-- Retrieve all courses that have students enrolled in them
SELECT DISTINCT courses.course_name FROM courses 
JOIN enrollments ON courses.id = enrollments.course_id;


-- Update Data

-- Update one of the student's emails
UPDATE students
SET email = 'bob.ross@example.com'
WHERE first_name = 'Bob' AND last_name = 'Ross';


-- Delete Data

-- Remove a student from one of their courses
DELETE FROM enrollments
WHERE student_id = 1 AND course_id = 1;


