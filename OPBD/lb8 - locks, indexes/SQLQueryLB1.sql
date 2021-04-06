--Анализ эффективности индексов на основе планов выполнения (бд univer2)
--Для заданных запросов создать индексы, с которыми запросы будут выполнятся не хуже, каждый созданный индекс должен закрывать как можно больше запросов из списка

--1)Определить на какой факультет поступило наибольшее количество человек в 2015 году
CREATE NONCLUSTERED
INDEX idex_indate
ON stud(in_date DESC)
 
select TOP 1 faculty.faculty_name, count(stud.id) as count_stud  from stud 
join process on process.stud_id = stud.id and YEAR(stud.in_date) = 2015
join hours on process.hours_id = hours.id
join faculty on faculty.id = hours.faculty_id
GROUP BY faculty.faculty_name
ORDER BY count_stud desc

--2)Вывести список студентов с фамилией на 'З'
CREATE NONCLUSTERED
INDEX idex_Last_name
ON stud(last_name DESC)
 
SELECT stud.last_name from stud
where last_name like 'З%'

--3) Вывести список студентов, средний балл которых меньше  7
CREATE NONCLUSTERED
INDEX idex_exm
ON stud(last_name DESC)
select last_name, exm from stud 
where exm < 7

--4) Вывести список студентов, средний балл которых меньше чем средний по институту
SELECT last_name, exm from stud 
where exm < (select AVG(exm) from stud)

--5) Определить, кто из студентов поступил в 2014 году
SELECT last_name,in_date from stud
where YEAR(stud.in_date) = 2014

--6)Определить у кого из студентов, кто поступил в 2015 году, наивысшая оценка
SELECT top 1 last_name,exm from stud
where YEAR(stud.in_date) = 2015
ORDER BY exm desc

--7) Определить количество студентов на каждом факультете
CREATE NONCLUSTERED
INDEX faculti_name
ON faculty(faculty_name DESC)
 
SELECT faculty.faculty_name, count(stud.id) as count_stud  from stud 
join process on process.stud_id = stud.id 
join hours on process.hours_id = hours.id
join faculty on faculty.id = hours.faculty_id
GROUP BY faculty.faculty_name

--8)Определить количество студентов иностранцев на каждом факультете
CREATE NONCLUSTERED
INDEX faculti_name
ON faculty(faculty_name DESC)
 
SELECT faculty.faculty_name, count(stud.id) as count_stud  from stud 
join process on process.stud_id = stud.id 
join hours on process.hours_id = hours.id
join faculty on faculty.id = hours.faculty_id
GROUP BY faculty.faculty_name

