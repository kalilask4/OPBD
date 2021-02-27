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

