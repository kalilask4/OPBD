--������ ������������� �������� �� ������ ������ ���������� (�� univer2)
--��� �������� �������� ������� �������, � �������� ������� ����� ���������� �� ����, ������ ��������� ������ ������ ��������� ��� ����� ������ �������� �� ������

--1)���������� �� ����� ��������� ��������� ���������� ���������� ������� � 2015 ����
CREATE NONCLUSTERED
INDEX idex_indate
ON stud(in_date DESC)
 
select TOP 1 faculty.faculty_name, count(stud.id) as count_stud  from stud 
join process on process.stud_id = stud.id and YEAR(stud.in_date) = 2015
join hours on process.hours_id = hours.id
join faculty on faculty.id = hours.faculty_id
GROUP BY faculty.faculty_name
ORDER BY count_stud desc

--2)������� ������ ��������� � �������� �� '�'
CREATE NONCLUSTERED
INDEX idex_Last_name
ON stud(last_name DESC)
 
SELECT stud.last_name from stud
where last_name like '�%'

--3) ������� ������ ���������, ������� ���� ������� ������  7
CREATE NONCLUSTERED
INDEX idex_exm
ON stud(last_name DESC)
select last_name, exm from stud 
where exm < 7

--4) ������� ������ ���������, ������� ���� ������� ������ ��� ������� �� ���������
SELECT last_name, exm from stud 
where exm < (select AVG(exm) from stud)

--5) ����������, ��� �� ��������� �������� � 2014 ����
SELECT last_name,in_date from stud
where YEAR(stud.in_date) = 2014

--6)���������� � ���� �� ���������, ��� �������� � 2015 ����, ��������� ������
SELECT top 1 last_name,exm from stud
where YEAR(stud.in_date) = 2015
ORDER BY exm desc

--7) ���������� ���������� ��������� �� ������ ����������
CREATE NONCLUSTERED
INDEX faculti_name
ON faculty(faculty_name DESC)
 
SELECT faculty.faculty_name, count(stud.id) as count_stud  from stud 
join process on process.stud_id = stud.id 
join hours on process.hours_id = hours.id
join faculty on faculty.id = hours.faculty_id
GROUP BY faculty.faculty_name

--8)���������� ���������� ��������� ����������� �� ������ ����������
CREATE NONCLUSTERED
INDEX faculti_name
ON faculty(faculty_name DESC)
 
SELECT faculty.faculty_name, count(stud.id) as count_stud  from stud 
join process on process.stud_id = stud.id 
join hours on process.hours_id = hours.id
join faculty on faculty.id = hours.faculty_id
GROUP BY faculty.faculty_name

