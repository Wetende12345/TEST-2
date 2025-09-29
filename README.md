#Student-Course Database Project

This project demonstrates a simple relational database schema for managing "students", "courses", and their "enrollments".
It also includes sample data inserts and a collection of SQL queries to showcase different types of joins, aggregations, and conditions.
---
##Step 1: Schema Setup

```sql
-- Create students table
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    age INT,
    grade TEXT
);

-- Create courses table
CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name TEXT NOT NULL,
    credits INT
);

-- Create enrollments table
CREATE TABLE enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(student_id),
    course_id INT REFERENCES courses(course_id),
    semester TEXT
);
```

---

##Step 2: Insert Sample Data

```sql
-- Insert students
INSERT INTO students (name, age, grade) VALUES
('Alice', 20, 'A'),
('Bob', 22, 'B'),
('Charlie', 21, 'A'),
('Diana', 23, 'C'),
('Ethan', 24, 'B');

-- Insert courses
INSERT INTO courses (course_name, credits) VALUES
('Mathematics', 4),
('Physics', 3),
('History', 2),
('Chemistry', 5);

-- Insert enrollments
INSERT INTO enrollments (student_id, course_id, semester) VALUES
(1, 1, 'Fall'),
(1, 2, 'Spring'),
(2, 1, 'Fall'),
(3, 3, 'Fall'),
(4, 2, 'Spring'),
(5, 4, 'Fall'),
(2, 4, '
```
