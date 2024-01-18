CREATE DATABASE college;
#database created with name college
USE college;
#we are now using the database college
CREATE TABLE student(
id INT PRIMARY KEY,
name VARCHAR(50),
age INT NOT NULL
);
#Student named table is created with attr id,name,age
INSERT INTO student VALUES(1,"ayush",21);
INSERT INTO student VALUES(2,"pratap",22);
INSERT INTO student(id,name,age) VALUES
(3,"akshay",23),
(4,"aarnav",24),
(5,"mannu",25);
#different methods to insert values into the table

SELECT * FROM student;
#select and print all(*) rows of the table

CREATE TABLE city(
id INT,
cityName VARCHAR(10),
PRIMARY KEY(id,cityName)
);
#in same database a new table named city is created
INSERT INTO city(id,cityName) VALUES
(101,"akshay"),
(101,"aarnav"),
(102,"aarnav");
SELECT * FROM city;

SELECT name,age FROM student;
#selects and prints only 2 columns

CREATE TABLE info (
rollno INT PRIMARY KEY,
name VARCHAR(10),
marks INT,
grade CHAR(1),
city VARCHAR(10)
);


INSERT INTO info
(rollno, name, marks, grade, city)
VALUES
(101, "anil", 78, "C", "Pune"),
(102, "bhumika", 93, "A", "Mumbai"),
(103, "chetan", 85, "B", "Mumbai"),
(104, "dhruv", 96, "A", "Delhi"), 
(105, "emanuel", 12, "F", "Delhi"), 
(106, "farah", 82, "B", "Delhi");

SELECT * FROM info WHERE marks>80 AND city="Mumbai";
#use of where clause
SELECT * FROM info ORDER BY marks DESC LIMIT 3;
#use of order by clause
#use of desc/asc clause
#use of limit clause
SELECT AVG(marks) FROM info;
SELECT COUNT(rollno) FROM info;
#use of aggregate functions(avg,count,max,min,sum)

SELECT city,COUNT(name) 
FROM info 
GROUP BY city;

SELECT city,name,COUNT(rollno) 
FROM info 
GROUP BY city,name;
#use of group by clause

SELECT city,AVG(marks) 
FROM info 
GROUP BY city 
ORDER BY AVG(marks) ASC;
#printing the avg marks of student in each city in ascending order
#even if we donot write asc/desc , it prints in asc order only

SELECT city,count(rollno)
FROM info
GROUP BY city
HAVING max(marks)>90;

SELECT city
FROM info
WHERE grade = "A"
GROUP BY city
HAVING MAX(marks) >= 93
ORDER BY city DESC; 
#use of every clauses in general order

SET SQL_SAFE_UPDATES=0;
UPDATE info
SET grade="O"
WHERE grade="A";
#used to update existing data with new data
#it gives safety error as data is being changed
#to remove this safe mode we use command above update
SELECT * FROM info;
#to active safe mode again give =1;

DELETE FROM info
WHERE marks<33;
SELECT * FROM info;
#delete 


#concept of foriegn key and cascading
CREATE TABLE dept (
id INT PRIMARY KEY, 
name VARCHAR (50)
) ;


CREATE TABLE teacher (
id INT PRIMARY KEY,
name VARCHAR (50),
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES dept(id)
ON UPDATE CASCADE
ON DELETE CASCADE
);

INSERT INTO dept(id,name) VALUES
(104,"ISE"),
(105,"CSE"),
(106,"electrical");

INSERT INTO teacher(id,name,dept_id) VALUES
(101,"akshay",103),
(102,"aarnav",103),
(103,"ayush",101);
INSERT INTO teacher(id,name,dept_id) VALUES
(104,"aps",103),
(105,"aar",102),
(106,"singh",111);

SELECT * FROM teacher;
SELECT * FROM dept;

UPDATE dept
SET id=69
WHERE id=103;
INSERT INTO teacher(id,name,dept_id) VALUES
(107,"aps",69);

#table related queries
SELECT * FROM teacher;
ALTER TABLE teacher
ADD COLUMN age INT NOT NULL DEFAULT 19;

ALTER TABLE teacher
MODIFY age VARCHAR(2);
INSERT INTO teacher(id,name,dept_id,age) VALUES
(108,"aps",69,"23");

ALTER TABLE teacher
CHANGE age stu_age INT;
INSERT INTO teacher(id,name,dept_id,stu_age) VALUES
(109,"aps",69,23);






