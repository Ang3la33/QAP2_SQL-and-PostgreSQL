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