--PART FOUR

--View a view on enrollment.id
CREATE VIEW student_course_summary AS
SELECT
  students.student_id,
  students.first_name || ' ' || students.last_name AS student_name,
  courses.course_name        AS course,
  enrollments.grade          AS grade
FROM students
JOIN enrollments
  ON students.student_id = enrollments.student_id
JOIN courses
  ON enrollments.course_id = courses.course_id
;

--Creating an INDEX on enrollments to speed up lookups
CREATE INDEX idx_enrollments_student_id
  ON enrollments(student_id)
;