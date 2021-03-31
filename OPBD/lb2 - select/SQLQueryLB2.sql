--�������� DML SELECT. ������� �������. ������� ������� � ������������. ���������� �������

--1. ������� ������� ���������, � ������� ������������ ����� "�" �/���   "�" � ����� ����������� � �������
select * from stud where last_name like '%�%' or last_name like '%�%'

--2. ������� �������� �  ���������, ������� ������� ���������� � ����� �, ��� ���� ��� �������� ������������ 
--(NULL � ���� ��������)
Select * from stud where last_name  like '�%' And s_name  is null

--3. ������� �������� �  ���������, ������� ������� �������� 8 �������� � ����� 
select * from stud where last_name like '________%'

--4. ������� �������� � ���������, ������� ������� �������� ��� ������, ��� ������ ���� �������� (�� �� ����� ���� ��������),
--��� ���� ���� �� ���� ������� 'a'
Select * from stud where last_name  like '%�%' AND last_name not like '_______'

--5. ����� ���� ��������� �������� �� ��� ����� 1 ��� 2 �����, ������������� ���������� �� ���� ��������
select * from stud where faculty='���' and form='�����' and (year = '1' or year = '2') order by s_name

--6. ����� ���� ��������� �������� �� ��� ������� �� ������� ����� ������������ ������ 6, ������������� ���������� �� ������
--� ��������� �������

Select * from stud where faculty='���' AND form = '�������' and exm>(select avg(exm) from stud)

--7. ������� ������ ���� ��������������, ������� �������� �� ��� (�� �������� �� ����� ��������) ������������� �� �������� 
--������� � �������� ������ ����� ��������
select last_name,form from teach where faculty='���' group by form,last_name order by form, last_name

--8. ������� ������ ���� ��������������, ������� �������� �� ���, ������ ����� � ������ ���������� ����� 100 �����.
Select * from teach where faculty='���' and year=1 and hours>100

--9. ������� ������ �������������� �����������, ���������� � ������������ ����� ���� ��� �� ������� ������
 select * from teach where s_name is null and (DATEDIFF (year,YEAR(GETDATE()),start_work_date) > 3)

 --10. ������� ���������� � �����������, �������� ��� ��������� �������� ����� ���
 Select subj from teach where faculty='���' and year=3

 --11. ������� ���������� � ����������� (����, ����� ��������, ��� �������������), �������� �� ���, 
 --����� ����� �� ������� ������ 100.
 select year, form,last_name from teach where faculty='���' and (hours > 100)

 --12. ������� ���������� � ����������� (���������, ����, ����� ��������, ��� �������������), ������� ����� 
 --������������� ����������.
 Select faculty, year, form, last_name, s_name, s_name from teach where s_name is null

--13. ������� ������ �������������� ������ 30 ��� �� ������ �������� ���� 
select DISTINCT last_name,br_date,(year(getdate()) - year(br_date)) as age  from teach 
where ((year(getdate()) - year(br_date)) > 30)

--14.	������� ������ ��������������, �� 35 �� 40 ��� �� ��������� ������, ������������� �� �� �������� �������.
select distinct last_name, br_date,  YEAR(getdate()) - YEAR(br_date)  as age from teach
where  YEAR(getdate()) - YEAR(br_date)  > 30
And YEAR(getdate()) - YEAR(br_date)  < 40 
order by last_name

--15.	 ������� ������ ��������������, ���� �������� � ������� � �������, ������� � ������� ����������� ���� ��������.
select DISTINCT last_name,br_date from teach where (MONTH(br_date) = 10) order by br_date asc

--16.	���������� ������� �������� ������� ������ (�� ��������, ������� � �������) �� �������� ��� ��������� ������� 
--����� �������� ������� ����������.
select  faculty, avg(exm) as avg_exm from stud where form='�������' group by faculty

--17.	����� �������� ������������ ������� ������ ��� ������� ���������� � ������ �����
select faculty,year, max(exm) from stud group by faculty, year order by faculty

--18.	���������� ������ �����������, ������� �������� ������� ������ ������������ �� ������� ������ 7
select faculty, avg(exm) as avg_exm from stud
group by faculty
Having avg(exm)>7

--19. ���������� ������ ������ � ��������� ���������� � ����� ��������, ������� ���� ������������ �� ������� ������ 7.5
select year,faculty,form,avg(exm) as exm  from stud group by year,faculty,form Having (avg(exm)>7.5)

--20. ���������� ����������� �������� ������� ������ ������������ �� ������ ���������� � ��������� � �����
select faculty,year, min(exm) as min_exm from stud
group by faculty , year

--21. ���������� �������� ����������� � ��������� � ����� ����������� �������� ������� ������ ������������ ��� 
--������� ������ 6 
select  faculty,form from stud group by faculty,form having min(exm) > 6  

--22. ����������, ����� ���������� ����� ���� ������� ��� 3-�� ����� ������� ����� �������� ������ 
--�� ��������������� ����������
select last_name, (all_h + inclass_h)/2 as avg_podg_h from stud where form like '�������' and faculty like '���'

--23. ������� ������ �����������, ������, ���� ��������, ����� �� ������� �������   ������  ����� 150 ����� �� ��������������� ����������
select faculty,year,form from stud where inclass_h > 150

--24. ������� ���������� ���������, �������� ������ ��������������
select last_name, COUNT(subj) from teach group by last_name

--25.	������� ������ ��������� � ��������� ����� ����� ���������� ������������ ��� ������� ��������
   select subj,max(hours) as hours from teach group by subj

--26. ������� ������ ��������������, �������� ����� ������ ��������.
select last_name, COUNT(subj) from teach  group by last_name having COUNT(subj)>1

--27.	������� ������ ������ � ��������� � ����������  � ��������� ����� ����� �� ���� ���������, ���������� �� ���
 select year,faculty, SUM(hours) as hours  from teach group by year,faculty  

 --28.	������� ����������  ���������, �������� �� ������ ���������� ��������������� ������������
Select faculty, count(subj) from teach where s_name is null group by faculty

--29.	������� ���������� ��������������, ���������� �� ������ ����������
select faculty, count(distinct (last_name )) as 'saze' from teach group by faculty

--30.	������� ���������� ���������, �������� �� ������ ���������� ��  ������ �����, ������������� �� ����������� � 
--��������� �������, �� ������ � ������������; 
������ ��������� ��: ������� ���������� ���������, �������� �� ������ ���������� ��  ������ �����
Select faculty, count(subj) from teach where year=2 group by faculty










