-- Problem 1 - University Course Enrollment System

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

