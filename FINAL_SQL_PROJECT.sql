CREATE DATABASE schoolDB;

USE schoolDB;


-- Creating a certificate table for programs
CREATE TABLE certificate (
id INT PRIMARY KEY AUTO_INCREMENT,
major VARCHAR(100) NOT NULL,
courses VARCHAR(200) NOT NULL,
enrolled INT NOT NULL,
graduated INT NOT NULL
);

-- Creating a table for courses
CREATE TABLE course (
course_id INT PRIMARY KEY AUTO_INCREMENT,
course_name VARCHAR(75) NOT NULL,
course_dis VARCHAR(200) NOT NULL,
course_num INT
);

-- creating a relation table between courses and programs
CREATE TABLE program_classes (
program_id  INT NOT NULL,
course_id  INT NOT NULL,
FOREIGN KEY(program_id) REFERENCES certificate(id),
FOREIGN KEY(course_id) REFERENCES course(course_id),
PRIMARY KEY (program_id, course_id)
);


-- creating the students table
CREATE TABLE studetns (
student_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
age INT NOT NULL,
current_course INT,
program INT NOT NULL,
FOREIGN KEY(current_course) REFERENCES course(course_id),
FOREIGN KEY(program) REFERENCES certificate(id)
);


-- Creating the stuff table
CREATE TABLE staff (
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100),
age INT NOT NULL,
program INT,
FOREIGN KEY(program) REFERENCES certificate(id)
);

-- creating a relational table to create a link between staff and their classes 
CREATE TABLE staff_classes (
staff_id  INT NOT NULL,
course_id  INT NOT NULL,
FOREIGN KEY(staff_id) REFERENCES staff(id),
FOREIGN KEY(course_id) REFERENCES course(course_id),
PRIMARY KEY (staff_id, course_id)
);


