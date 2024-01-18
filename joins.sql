CREATE DATABASE ayush;
USE ayush;
CREATE TABLE student2 (
id INT PRIMARY KEY, 
name VARCHAR (50)
);
INSERT INTO student2 (id, name)
VALUES
(101, "adam"),
(102,"bob"),
(103, "casey");

CREATE TABLE course( 
id INT PRIMARY KEY,
course VARCHAR (50)
);
INSERT INTO course (id, course)
VALUES 
(102, "english"),
(105, "math"),
(103,"science"),
(107, "computer science");
#inner join 
SELECT * 
FROM student2 as s #alias
INNER JOIN course as c
ON s.id=c.id; #after alias we cannot write student2 and course
#3 TYPES OF OUTER JOINS
#left join
SELECT * 
FROM student2 as s 
LEFT JOIN course as c
ON s.id=c.id;

#right join
SELECT * 
FROM student2 as s 
RIGHT JOIN course as c
ON s.id=c.id;
#full join(union keyword is used with the syntax of left and right join)
SELECT * 
FROM student2 as s 
LEFT JOIN course as c
ON s.id=c.id
UNION
SELECT * 
FROM student2 as s 
RIGHT JOIN course as c
ON s.id=c.id;

#EXTRA
#left exclusive(we want only id=101)
SELECT * 
FROM student2 as s 
LEFT JOIN course as c
ON s.id=c.id
#by looking at the output we can see c.id is null )
WHERE c.id IS NULL;

#right exclusive(we want only id=105,107)
SELECT * 
FROM student2 as s 
RIGHT JOIN course as c
ON s.id=c.id
WHERE s.id IS NULL;

CREATE TABLE employee( 
id INT PRIMARY KEY, 
name VARCHAR (50),
manager_id INT
);
INSERT INTO employee (id, name, manager_id)
VALUES (101, "adam", 103), 
(102, "bob", 104), 
(103, "casey", NULL),
(104, "donald", 103);
SELECT * from employee;
#self join
SELECT*
FROM employee as a
JOIN employee as b
ON a. id = b.manager_id;#a ka id b ke manager id se equal ho
#output me 1st and last column same hoga
#our task is to print the table jisme name ke bagal uske manager ka naam ho
SELECT a.name,b.name #although we are aliasing in next step , still we can use the alias over it
FROM employee as a
JOIN employee as b
ON a. id = b.manager_id;
# for better representation we can write "name" as "manager name' in table A
#in sql we read from right to left
SELECT a.name as manager_name, b.name as name
FROM employee as a
JOIN employee as b
ON a. id = b.manager_id;

#union 
SELECT name from student2
UNION #only unique records
SELECT name from employee;

SELECT name from student2
UNION ALL#duplicates are also allowed
SELECT name from employee;

#nested queries
USE college;
#get names of all students whose marks is greater than the avg marks
SELECT name 
from info
WHERE marks>(SELECT AVG(marks) FROM info);
#get names of all students whose rollno is even
SELECT name,rollno 
from info
WHERE rollno IN(SELECT rollno FROM info WHERE rollno%2=0);
#or
SELECT name,rollno 
FROM info
WHERE rollno%2=0;
#get names of student with maximum marks in delhi(using from)
SELECT MAX(marks)
FROM (SELECT * FROM info where city="Delhi") as temp;#we have to use alias in from
#or
SELECT MAX(marks)
FROM info
WHERE city="Mumbai";

#mysql views 
CREATE VIEW view1 AS
select rollno,name,marks from info;
select * from view1;






