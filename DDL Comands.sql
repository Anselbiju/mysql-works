use school;

desc STUDENT; 
-- student table is already created --
-- for refernece can be used
--CREATE TABLE STUDENT (
   -- Id INT,
   -- Name VARCHAR(30),
   -- Marks INT,
   -- Grade CHAR(2)
-- );

insert into STUDENT values
(1,'ansel',40,'A'),
(2,'ans',45,'A+'),
(3,'ebin',48,'A+');

select * from STUDENT;

alter table STUDENT add column contact int;

select * from STUDENT;

alter table STUDENT drop column Grade;

rename table STUDENT to CLASSTEN;

truncate table CLASSTEN;

drop table CLASSTEN;


