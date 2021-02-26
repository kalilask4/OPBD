CREATE DATABASE UNIVER_Lb1;
USE UNIVER_Lb1;

CREATE TABLE STUDENTS
(id int not null IDENTITY(1,1),
last_name nvarchar(25) not null,
first_name nvarchar(25) not null,
surname nvarchar(25),
id_group int,
br_date date,
CONSTRAINT PK_STUDENTS Primary key (id)
);

CREATE TABLE GROUPS
(id_group int not  NULL IDENTITY(1,1),
group_name nvarchar(10) not NULL,
year int default NULL,
CONSTRAINT PK_GROUPS Primary key (id_group)
);

CREATE TABLE PLANS
(id_group int not NULL,
id_subj int not NULL,
CONSTRAINT PK_PLANS Primary key (id_group, id_subj)
);

CREATE TABLE SUBJECTS
(id_subj int not NULL IDENTITY(1,1),
subj_name nvarchar(100) not NULL,
hours int default NULL,
CONSTRAINT PK_SUBJECTS Primary key (id_subj)
);

ALTER table STUDENTS
ADD CONSTRAINT FK_id_group1
FOREIGN KEY (id_group) REFERENCES GROUPS(id_group);

ALTER table PLANS
ADD CONSTRAINT FK_id_group
FOREIGN KEY (id_group) REFERENCES GROUPS(id_group);

ALTER table PLANS
ADD CONSTRAINT FK_id_subj
FOREIGN KEY (id_subj) REFERENCES SUBJECTS(id_subj);

INSERT INTO GROUPS
(group_name,year) values
(N'ПО135',N'1'),
(N'ПО134',N'1'),
(N'ПО235',N'2'),
(N'ПО335',N'3');

INSERT INTO STUDENTS
(last_name,first_name,surname, br_date, id_group) values
(N'Федоренко',N'П',N'Р','19971225',1),
(N'Михеенок',N'П',N'Г','19930205',2),
(N'Савицкая',N'Н',Null,'19870922',3),
(N'Ковальчук',N'M',N'Е','19920617',3),
(N'Заболотная',N'Н',N'Г','19920618',4),
(N'Шарапо',N'Н',Null,'19920814',4);
 
INSERT INTO SUBJECTS
(subj_name, hours) values
(N'Физика',200),
(N'Математика',120),
(N'Основы алгоритмизации',120),
(N'Проектирование БД',130),
(N'Ср-ва визуального програм-я',90),
(N'Объектно-ориентированное программирование',70);
 
INSERT INTO PLANS
(id_group, id_subj) values
(1,1),
(2,1),
(1,2),
(2,2),
(3,3),
(3,4),
(4,5),
(4,6);

select * from STUDENTS
join GROUPS on STUDENTS.id_group = GROUPS.id_group;


select * from SUBJECTS
join PLANS on SUBJECTS.id_subj = plans.id_subj
join GROUPS on PLANS.id_group  = GROUPS.id_group ;


UPDATE STUDENTS
SET id_group = 2
WHERE id_group = 1;


DELETE FROM PLANS
WHERE id_group = 1;

DELETE FROM GROUPS
WHERE id_group = 1;

UPDATE SUBJECTS SET hours = hours + 30 WHERE subj_name = 'Ср-ва визуального програм-я';
UPDATE SUBJECTS SET hours = hours + 30 WHERE subj_name = 'Объектно-ориентированное программирование';

ALTER TABLE SUBJECTS
ADD control nvarchar(25) not NULL DEFAULT 'Экзамен';
 
UPDATE SUBJECTS
SET control = 'Зачет'
WHERE subj_name = 'Основы алгоритмизации';

ALTER TABLE STUDENTS DROP COLUMN  surname