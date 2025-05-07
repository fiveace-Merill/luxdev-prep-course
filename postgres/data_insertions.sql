insert into students(first_name, last_name, email, date_of_birth) values
('Tom',       'Odhong',    'todhong12@gmail.com',       '2001-01-01'),
('Chris',     'Kirubi',    'chirubi@gmail.com',         '1999-07-17'),
('Fredrick',  'Ogutu',     'freddie.ogutu@gmail.com',   '2004-02-10'),
('Achieng',   'Otieno',    'aotieno05@gmail.com',        '2002-04-23'),
('Patience',   'Gakuya',    'peshgakuya@outlook.com', '2000-11-02'),
('Mathew',     'Kimani',    'mathewkimani@gmail.com',        '2003-06-14'),
('Nancy',     'Wambui',    'nancy.wambui@gmail.com',     '2001-09-29'),
('Brian',     'Kiplagat',  'b.kiplagat@edu.org',         '2002-08-05'),
('Mercy',     'Kemunto',   'mercykemunto@gmail.com',     '2004-05-21'),
('David',     'Mutua',     'david.mutua@gmail.com',      '2001-07-11');

insert into instructors(first_name, last_name, email) values
('Paul', 'Mwai', 'mwai.paul@caltech.edu'),
('Abigail', 'Njoroge', 'abbykim@caltech.edu'),
('Emma', 'Kerubo', 'emma.kerubo@caltech.edu');

insert into courses(course_name, instructor_id, course_description) values
('Web Development', 1000, 'Covers building responsive web applications using HTML, CSS, JavaScript, and modern frameworks such as React and Node.js'),
('Database Management Systems', 1200, 'Introduction to relational databases, SQL querying, normalization, and database design principles'),
('Data Structures and Algorithms', 1200, 'Study of fundamental data structures (arrays, lists, trees, graphs) and algorithms (sorting, searching, recursion) for efficient problem solving'),
('Mobile Application Development', 1100, 'Hands-on development of mobile apps for Android and iOS using cross-platform tools like React Native or Flutter'),
('Computer Networks', 1000, 'Exploration of networking concepts, OSI and TCP/IP models, routing, switching, and network security fundamentals');


insert into enrollments(student_id, course_id, enrollment_date, grade) values
(1,  100, '2024-09-01', 'A'),
(1,  110, '2024-09-02', 'B'),
(2,  120, '2024-09-03', 'C'),
(2,  130, '2024-09-04', 'D'),
(3,  140, '2024-09-05', 'E'),
(3,  100, '2024-09-06', 'F'),
(4,  110, '2024-09-07', 'A'),
(4,  120, '2024-09-08', 'B'),
(5,  130, '2024-09-09', 'C'),
(5,  140, '2024-09-10', 'D'),
(6,  100, '2024-09-11', 'E'),
(6,  110, '2024-09-12', 'F'),
(7,  120, '2024-09-13', 'A'),
(8,  130, '2024-09-14', 'B'),
(9,  140, '2024-09-15', 'C'),
(3,  110, '2024-09-06', 'B');