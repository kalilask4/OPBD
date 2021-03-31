--1. ������� ���������� ��������� (���������, ����) ������� ����� �������� ������ 37 ���

select stud.last_name, (YEAR(getdate()) - YEAR(stud.br_date)) as age, faculty.faculty_name,form.form_name, hours.course from stud
inner JOIN process on stud.id=process.stud_id 
inner JOIN hours on hours.id=process.hours_id
inner JOIN form on hours.form_id=form.id 
inner JOIN faculty on hours.faculty_id=faculty.id
where (YEAR(getdate()) - YEAR(stud.br_date))  < 37 
and form.form_name = '������'

--2. ���������� ���������� ��������� �� ������ ����������
SELECT faculty.faculty_name, count(stud.id) AS count_stud
FROM stud
inner JOIN process ON stud.id=process.stud_id 
inner JOIN hours ON hours.id=process.hours_id
inner JOIN form ON hours.form_id=form.id 
inner JOIN faculty ON hours.faculty_id=faculty.id
GROUP BY faculty.faculty_name

--3. ���������� ���������� ���������, �������� �� ������ ����� ��������
SELECT form.form_name, COUNT(stud.id) AS count_stud 
FROM stud
inner JOIN process ON stud.id=process.stud_id 
inner JOIN hours ON hours.id=process.hours_id
inner JOIN form ON hours.form_id=form.id 
inner JOIN faculty ON hours.faculty_id=faculty.id
GROUP BY form.form_name

-- 4. ���������� ������� ������� ��������� ��� ������� ���������� �� ����� ���� (���)
SELECT faculty.faculty_name, AVG(YEAR('2021-12-31') - YEAR(stud.br_date)) AS avg_age
FROM faculty
INNER JOIN hours ON hours.faculty_id = faculty.id
INNER JOIN process ON process.hours_id = hours.id
INNER JOIN stud ON stud.id = process.stud_id
GROUP BY faculty.faculty_name

--6 ����������, �� ����� ��������� ��������� ���������� ���������� ������� � 2015 ���

select top 1 faculty_name, count(stud.id) as stud_count from faculty
inner JOIN hours on hours.faculty_id=faculty.id
inner JOIN process on hours.id=process.hours_id
inner JOIN stud on stud.id=process.stud_id
where YEAR(stud.in_date)=2015
group by faculty_name
order by stud_count desc

--7.	���������� ����� ���������, ����������� �� ������ ��������� � ����� �������� � 2014 ���� 

select faculty_name, form.form_name, 
count(stud.id) as stud_count from faculty
inner JOIN hours on hours.faculty_id=faculty.id
inner JOIN process on hours.id=process.hours_id
inner JOIN stud on stud.id=process.stud_id
inner JOIN form on hours.form_id=form.id
where YEAR(stud.in_date)=2014

--8.	������� ������ ���� �����������, �� ������� �������� ������� ����� ��������. 

select DISTINCT faculty.faculty_name from hours
inner JOIN faculty on hours.faculty_id = faculty.id
inner JOIN form on hours.form_id = form.id and form_name = '������'
 
--9.	������� ������ �����������, ��� ������� ���������� ������� ������ ���� �������� � ������ ������, (*) 

select distinct faculty_name,  form.form_name, hours.course
from faculty
inner JOIN hours on hours.faculty_id=faculty.id
inner JOIN process on hours.id=process.hours_id
inner JOIN stud on stud.id=process.stud_id
inner JOIN form on hours.form_id=form.id

--10.	������� ������ �����������, � ��������� ����� ��������� ����������� �� ������ ����� ��������

select faculty.faculty_name, form.form_name, count(stud.last_name) as col from stud
inner JOIN process on stud.id = process.stud_id
inner JOIN hours on hours.id = process.hours_id
inner JOIN faculty on faculty.id = hours.faculty_id
inner JOIN form on form.id = hours.form_id
GROUP BY faculty.faculty_name,form.form_name

--11.	������� ����� ���� ��������� ������� � �������� ������ ��� ���� ����������� � ����

select distinct faculty_name,  form.form_name, hours.course
from faculty
inner JOIN hours on hours.faculty_id=faculty.id
inner JOIN process on hours.id=process.hours_id
inner JOIN stud on stud.id=process.stud_id
inner JOIN form on hours.form_id=form.id

--12.	��� ���� ����������� � ������ ����� ����� �����������, ������� �� ��� ������(*)

select faculty.faculty_name,hours.course, count(stud.last_name) as col from stud
left JOIN process on stud.id = process.stud_id and stud.s_name is null
right JOIN hours on hours.id = process.hours_id
right JOIN faculty on faculty.id = hours.faculty_id
GROUP BY faculty.faculty_name, hours.course
 
--13.	��� ������� ����� � ������ ���������� ����� ���������� ���������, ������� ���� ������� ������ 7,5(*)

	select hours.course, faculty.faculty_name, count(stud.id) as stud_count from stud
	left JOIN process on stud.id = process.stud_id and stud.s_name is null
	right JOIN hours on hours.id = process.hours_id
	right JOIN faculty on faculty.id = hours.faculty_id
	GROUP BY hours.course, faculty.faculty_name

--14.	������� ������ ���� ����������� � ������ ����� � ��������� �����  ��������� ������ 45(*)

select faculty.faculty_name, form.form_name, count(stud.last_name) as col from stud
left  JOIN process on stud.id = process.stud_id and (year(getdate()) - year(stud.br_date ) > 45)
RIGHT JOIN hours on hours.id = process.hours_id
right JOIN faculty on faculty.id = hours.faculty_id
right JOIN form on form.id = hours.form_id
GROUP BY faculty.faculty_name,form.form_name

--15.	������� ���������� ��� ������� ����������, �����, ����� � ���������� ��������� ������ 27(*)

select faculty.faculty_name, form.form_name, hours.course, count(stud.last_name) as stud_count from stud
left JOIN process on stud.id = process.stud_id and DATEDIFF(YEAR,stud.br_date,GETDATE())<27
right JOIN hours on hours.id = process.hours_id
right JOIN faculty on faculty.id = hours.faculty_id
right JOIN form on hours.form_id=form.id
GROUP BY faculty.faculty_name, form.form_name,hours.course

--16.	���������� ������� ��������� � ��������� �� C �� ������ ���������� (*)
* - left/right
select faculty.faculty_name, count(stud.last_name) as col from stud
left JOIN process on stud.id = process.stud_id and stud.last_name  like '�%'
left JOIN hours on hours.id = process.hours_id
right JOIN faculty on faculty.id = hours.faculty_id
GROUP BY faculty.faculty_name