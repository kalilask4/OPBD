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


