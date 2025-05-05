# Student Course Management System

This PostgreSQL-based project for an EdTech Company models a basic student enrollment system. It enables tracking of students, instructors, courses, and student enrollments. The database schema is quite intuitive, with four tables to capture the said entities.

### Entity Relationship Diagram 
The ER diagram below visualizes the relationships between the tables.

![Enity Relationship Diagram](https://github.com/fiveace-Merill/luxdev-prep-course/blob/main/postgres/course_management%20-%20public.png)

### How to run
1. Ensure PostgreSQL is installed.
2. Clone the repository 
3. Open your SQL client: psql, DBeaver
4. Create a database connection to the course_management database.
5. Execute the SQL scripts in the following order:

    - [Create Tables](https://github.com/fiveace-Merill/luxdev-prep-course/blob/main/postgres/tables_creation.sql)
    - [Insert Into Tables](https://github.com/fiveace-Merill/luxdev-prep-course/blob/main/postgres/data_insertions.sql)
    - [Create Indexes](https://github.com/fiveace-Merill/luxdev-prep-course/blob/main/postgres/views_index_triggers.sql)
    - [Sample Database Queries](https://github.com/fiveace-Merill/luxdev-prep-course/blob/main/postgres/quering_script.sql)

### Schema Overview
 1. **Tables**

 **Students** Contains Students' personal information.

 **Instructors** Stores Instructors' details.

 **Courses** Records each instructor who  teaches the company.

 **Enrollments** Tracks which students are enrolled in which course.

 2. **Relationships**

One instructor can teach many courses.

One Student can enroll in more than one course.

The Enrollments table links students to courses, storing grades per enrollment.

### Key Queries Description

Below are some useful queries for reporting and monitoring academic performance. Each of these provides some actionable insights.

1. **Students in at least one course**

A query to identify active learners and can be used to do follow up interventions for students who haven't enrolled to any course.

2. **Students enrolled in more than two Courses**

Gets students currently enrolled in more than two courses, maybe used to flag students who have a heavier course workload.

3. **Course with total enrollments**

Reveal the popularity of a course and can help in resource planning, e.g, classroom capacity, course material printing, and can inform curriculum decisions.

4. **Average grade per score**

For each letter, find the corresponding numeric score, and finds the mean score per course. Can be used for ranking overall course perfomance.

5. **Students not enrolled in any course**

Finds the students in the system who are not yet enrolled to any course.

6. **Average grade per student**

For each student, find the average score for all their enrolled courses.

7. **Students enrolled in a course taught by a specific instructor**

8. **Top 3 students by average score**

9. **Students failing multiple courses**

### Sample Outputs

- Top Three students by average grade

```sql
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

```
Output: 
|student_id|first_name|last_name|avg_grade|
|----------|----------|---------|---------|
|7|Nancy|Wambui|4.00|
|4|Achieng|Otieno|3.50|
|1|Tom|Odhong|3.50|


- Course with total enrolled students

```sql
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
```

Output: 

|course_id|course_name|total_students|
|---------|-----------|--------------|
|110|Database Management Systems|4|
|120|Data Structures and Algorithms|3|
|100|Web Development|3|
|140|Computer Networks|3|
|130|Mobile Application Development|3|

### Challenges and lessons learned

This project presented valuable challenges. At its inception seemed like a rather straightforward process, however, I discovered that creating relationships with foreign keys required a lot of planning and a meticulous sequential approach when inserting values into the database. It finally came alive after a few iterations of DROP, ALTER, and DELETE. 

I was also able to resolve common mistakes with GROUP BY and JOIN operations, gaining practical experience creating meaningful aggregations.







 
