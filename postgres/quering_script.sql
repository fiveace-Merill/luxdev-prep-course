--Students who enrolled in at least one course
select
	s.student_id,
	s.first_name,
	s.last_name,
	count(e.course_id) as courses_enrolled
from
	students s
join enrollments e on
	s.student_id = e.student_id
group by
	s.student_id,
	s.first_name,
	s.last_name
order by
	s.student_id;s
	
--Students enrolled in more than two courses
select
	s.student_id,
	s.first_name,
	s.last_name,
	count(e.course_id) as courses_enrolled
from
	students s
join enrollments e on
	s.student_id = e.student_id
group by
	s.student_id,
	s.first_name,
	s.last_name
having
	count(e.course_id) > 2
order by
	courses_enrolled desc;

--Courses with total enrolled students
select
	c.course_id,
	c.course_name,
	count(e.student_id) as total_students
from
	courses c
left join enrollments e on
	c.course_id = e.course_id
group by
	c.course_id,
	c.course_name
order by
	total_students desc;

--Average grade per course
select
	c.course_id,
	c.course_name,
	round(
    avg(
      case e.grade
        when 'A' then 4.0
        when 'B' then 3.0
        when 'C' then 2.0
        when 'D' then 1.0
        when 'E' then 0.5
        when 'F' then 0.0
      end
    )::numeric
  , 2) as avg_grade
from
	courses c
join enrollments e on
	c.course_id = e.course_id
group by
	c.course_id,
	c.course_name
order by
	avg_grade desc;

--Students who haven't enrolled in any course
select
	student_id,
	first_name,
	last_name
from
	students
where
	student_id not in(
	select student_id from enrollments
)
order by
	first_name;

--Students with their average grades across all course
select
	s.student_id,
	s.first_name,
	s.last_name,
	round(
    avg(
      case e.grade
        when 'A' then 4.0
        when 'B' then 3.0
        when 'C' then 2.0
        when 'D' then 1.0
        when 'E' then 0.5
        when 'F' then 0.0
      end
    )::numeric
  , 2) as avg_grade
from
	students s
join enrollments e on
	s.student_id = e.student_id
group by
	s.student_id,
	s.first_name,
	s.last_name
order by
	avg_grade desc;

-- Students in a course taught by John Smith
select
	distinct
  s.student_id,
	s.first_name,
	s.last_name,
	c.course_name
from
	students s
join enrollments e on
	s.student_id = e.student_id
join courses c on
	e.course_id = c.course_id
join instructors i on
	c.instructor_id = i.instructor_id
where
	i.first_name = 'John'
	and i.last_name = 'Smith'
order by
	s.student_id;

--Instructors with the number of course they teach
select
	instructor_id,
	first_name,
	last_name,
	count(*) num_courses
from
	instructors
inner join courses
		using(instructor_id)
group by
	instructor_id;

--Top 3 students by average grade
with student_avg as (
select
	s.student_id,
	s.first_name,
	s.last_name,
	avg(
      case e.grade
        when 'A' then 4.0
        when 'B' then 3.0
        when 'C' then 2.0
        when 'D' then 1.0
        when 'E' then 0.5
        when 'F' then 0.0
      end
    ) as avg_grade
from
	students s
join enrollments e on
	s.student_id = e.student_id
group by
	s.student_id,
	s.first_name,
	s.last_name
)
select
	student_id,
	first_name,
	last_name,
	round(avg_grade::numeric, 2) as avg_grade
from
	student_avg
order by
	avg_grade desc
limit 3;

--Students failing in more than one course (grade F)
select
	s.student_id,
	s.first_name,
	s.last_name,
	count(*) as fail_count
from
	students s
join enrollments e on
	s.student_id = e.student_id
where
	e.grade = 'f'
group by
	s.student_id,
	s.first_name,
	s.last_name
having
	count(*) > 1
order by
	fail_count desc;






