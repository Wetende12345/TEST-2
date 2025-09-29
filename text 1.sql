Step 1: Schema Setup
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


 Step 2: Insert Sample Data
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
(2, 4, 'Spring');
v


```sql
-- 1. Show each student with the courses they are enrolled in
SELECT s.name, c.course_name
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id;

-- 2. Show student names and the semester of their enrollments
SELECT s.name, e.semester
FROM enrollments e
JOIN students s ON e.student_id = s.student_id;

-- 3. Show course names along with the names of students enrolled
SELECT c.course_name, s.name
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id;

-- 4. Show all students who are NOT enrolled in any course (use LEFT JOIN)
SELECT s.name
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
WHERE e.enrollment_id IS NULL;

-- 5. Show the total number of students enrolled in each course
SELECT c.course_name, COUNT(e.student_id) AS total_students
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name;

-- 6. Show average age of students per course
SELECT c.course_name, AVG(s.age) AS avg_age
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id
GROUP BY c.course_name;

-- 7. Show student names with their grades and the courses they take
SELECT s.name, s.grade, c.course_name
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id;

-- 8. Show each course with the semester it is taken in
SELECT DISTINCT c.course_name, e.semester
FROM enrollments e
JOIN courses c ON e.course_id = c.course_id;

-- 9. Show names of students enrolled in courses with more than 3 credits
SELECT DISTINCT s.name
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE c.credits > 3;

-- 10. Show all enrollments with student name, course name, and semester
SELECT s.name, c.course_name, e.semester
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id;

-- 11. Show each student and their courses using INNER JOIN
SELECT s.name, c.course_name
FROM students s
INNER JOIN enrollments e ON s.student_id = e.student_id
INNER JOIN courses c ON e.course_id = c.course_id;

-- 12. Show all students and their courses using LEFT JOIN
SELECT s.name, c.course_name
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
LEFT JOIN courses c ON e.course_id = c.course_id;

-- 13. Show all courses and their students using RIGHT JOIN
SELECT s.name, c.course_name
FROM students s
RIGHT JOIN enrollments e ON s.student_id = e.student_id
RIGHT JOIN courses c ON e.course_id = c.course_id;

-- 14. Show all students and all courses (whether matched or not) using FULL JOIN
SELECT s.name, c.course_name
FROM students s
FULL JOIN enrollments e ON s.student_id = e.student_id
FULL JOIN courses c ON e.course_id = c.course_id;

-- 15. Show each student and how many courses they are enrolled in
SELECT s.name, COUNT(e.course_id) AS total_courses
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
GROUP BY s.name;

-- 16. Show each course and how many students are enrolled in it
SELECT c.course_name, COUNT(e.student_id) AS total_students
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name;

-- 17. Show students and the total credits they are taking
SELECT s.name, COALESCE(SUM(c.credits), 0) AS total_credits
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
LEFT JOIN courses c ON e.course_id = c.course_id
GROUP BY s.name;

-- 18. Show the average credits of courses each student is enrolled in
SELECT s.name, AVG(c.credits) AS avg_credits
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
GROUP BY s.name;

-- 19. Show all students with 'No Course' if they are not enrolled in any
SELECT s.name, COALESCE(c.course_name, 'No Course') AS course_name
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
LEFT JOIN courses c ON e.course_id = c.course_id;

-- 20. Show all courses with 'No Student' if no one is enrolled
SELECT COALESCE(s.name, 'No Student') AS student_name, c.course_name
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
LEFT JOIN students s ON e.student_id = s.student_id;
```
