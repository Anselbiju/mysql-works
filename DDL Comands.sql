use school;

desc STUDENT;

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


