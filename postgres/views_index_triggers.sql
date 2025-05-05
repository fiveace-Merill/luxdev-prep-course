--View a view on enrollment.id
create view student_course_summary as
select
  students.student_id,
  students.first_name || ' ' || students.last_name as student_name,
  courses.course_name        as course,
  enrollments.grade          as grade
from students
join enrollments
  on students.student_id = enrollments.student_id
join courses
  on enrollments.course_id = courses.course_id
;

--creating an index on enrollments to speed up lookups
create index idx_enrollments_student_id
  on enrollments(student_id)
;