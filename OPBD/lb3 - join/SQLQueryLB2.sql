--1. Вывести информацию студентах (факультет, курс) заочной формы обучения младше 37 лет

select stud.last_name, (YEAR(getdate()) - YEAR(stud.br_date)) as age, faculty.faculty_name,form.form_name, hours.course from stud
inner JOIN process on stud.id=process.stud_id 
inner JOIN hours on hours.id=process.hours_id
inner JOIN form on hours.form_id=form.id 
inner JOIN faculty on hours.faculty_id=faculty.id
where (YEAR(getdate()) - YEAR(stud.br_date))  < 37 
and form.form_name = 'заочно'

--2. Определить количество студентов на каждом факультете
SELECT faculty.faculty_name, count(stud.id) AS count_stud
FROM stud
inner JOIN process ON stud.id=process.stud_id 
inner JOIN hours ON hours.id=process.hours_id
inner JOIN form ON hours.form_id=form.id 
inner JOIN faculty ON hours.faculty_id=faculty.id
GROUP BY faculty.faculty_name

--3. Определить количество студентов, учащихся на каждой форме обучения
SELECT form.form_name, COUNT(stud.id) AS count_stud 
FROM stud
inner JOIN process ON stud.id=process.stud_id 
inner JOIN hours ON hours.id=process.hours_id
inner JOIN form ON hours.form_id=form.id 
inner JOIN faculty ON hours.faculty_id=faculty.id
GROUP BY form.form_name

-- 4. Определить средний возраст студентов для каждого факультета на конец года (лет)
SELECT faculty.faculty_name, AVG(YEAR('2021-12-31') - YEAR(stud.br_date)) AS avg_age
FROM faculty
INNER JOIN hours ON hours.faculty_id = faculty.id
INNER JOIN process ON process.hours_id = hours.id
INNER JOIN stud ON stud.id = process.stud_id
GROUP BY faculty.faculty_name

--6 Определить, на какой факультет поступило наибольшее количество человек в 2015 год

select top 1 faculty_name, count(stud.id) as stud_count from faculty
inner JOIN hours on hours.faculty_id=faculty.id
inner JOIN process on hours.id=process.hours_id
inner JOIN stud on stud.id=process.stud_id
where YEAR(stud.in_date)=2015
group by faculty_name
order by stud_count desc

--7.	Определить число студентов, поступивших на каждый факультет и форму обучения в 2014 году 

select faculty_name, form.form_name, 
count(stud.id) as stud_count from faculty
inner JOIN hours on hours.faculty_id=faculty.id
inner JOIN process on hours.id=process.hours_id
inner JOIN stud on stud.id=process.stud_id
inner JOIN form on hours.form_id=form.id
where YEAR(stud.in_date)=2014

--8.	Вывести список всех факультетов, на которых доступна заочная форма обучения. 

select DISTINCT faculty.faculty_name from hours
inner JOIN faculty on hours.faculty_id = faculty.id
inner JOIN form on hours.form_id = form.id and form_name = 'заочно'
 
--9.	Вывести список факультетов, для каждого факультета вывести список форм обучения и номера курсов, (*) 

select distinct faculty_name,  form.form_name, hours.course
from faculty
inner JOIN hours on hours.faculty_id=faculty.id
inner JOIN process on hours.id=process.hours_id
inner JOIN stud on stud.id=process.stud_id
inner JOIN form on hours.form_id=form.id

--10.	Вывести список факультетов, с указанием числа студентов обучающихся на каждой форме обучения

select faculty.faculty_name, form.form_name, count(stud.last_name) as col from stud
inner JOIN process on stud.id = process.stud_id
inner JOIN hours on hours.id = process.hours_id
inner JOIN faculty on faculty.id = hours.faculty_id
inner JOIN form on form.id = hours.form_id
GROUP BY faculty.faculty_name,form.form_name

--11.	Вывести число всех студентов первого и третьего курсов для всех факультетов и форм

select distinct faculty_name,  form.form_name, hours.course
from faculty
inner JOIN hours on hours.faculty_id=faculty.id
inner JOIN process on hours.id=process.hours_id
inner JOIN stud on stud.id=process.stud_id
inner JOIN form on hours.form_id=form.id

--12.	Для всех факультетов и курсов найти число иностранцев, которое на них учится(*)

select faculty.faculty_name,hours.course, count(stud.last_name) as col from stud
left JOIN process on stud.id = process.stud_id and stud.s_name is null
right JOIN hours on hours.id = process.hours_id
right JOIN faculty on faculty.id = hours.faculty_id
GROUP BY faculty.faculty_name, hours.course
 
--13.	Для каждого курса с учетом факультета найти количество студентов, средний балл которых больше 7,5(*)

	select hours.course, faculty.faculty_name, count(stud.id) as stud_count from stud
	left JOIN process on stud.id = process.stud_id and stud.s_name is null
	right JOIN hours on hours.id = process.hours_id
	right JOIN faculty on faculty.id = hours.faculty_id
	GROUP BY hours.course, faculty.faculty_name

--14.	Вывести список всех факультетов с учетом формы с указанием числа  студентов старше 45(*)

select faculty.faculty_name, form.form_name, count(stud.last_name) as col from stud
left  JOIN process on stud.id = process.stud_id and (year(getdate()) - year(stud.br_date ) > 45)
RIGHT JOIN hours on hours.id = process.hours_id
right JOIN faculty on faculty.id = hours.faculty_id
right JOIN form on form.id = hours.form_id
GROUP BY faculty.faculty_name,form.form_name

--15.	Вывести информацию для каждого факультета, формы, курса о количестве студентов младше 27(*)

select faculty.faculty_name, form.form_name, hours.course, count(stud.last_name) as stud_count from stud
left JOIN process on stud.id = process.stud_id and DATEDIFF(YEAR,stud.br_date,GETDATE())<27
right JOIN hours on hours.id = process.hours_id
right JOIN faculty on faculty.id = hours.faculty_id
right JOIN form on hours.form_id=form.id
GROUP BY faculty.faculty_name, form.form_name,hours.course

--16.	Определить сколько студентов с фамилиями на C на каждом факультете (*)
* - left/right
select faculty.faculty_name, count(stud.last_name) as col from stud
left JOIN process on stud.id = process.stud_id and stud.last_name  like 'С%'
left JOIN hours on hours.id = process.hours_id
right JOIN faculty on faculty.id = hours.faculty_id
GROUP BY faculty.faculty_name