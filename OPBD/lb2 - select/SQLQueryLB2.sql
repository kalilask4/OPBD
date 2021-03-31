--Оператор DML SELECT. Простые запросы. Простые запросы с группировкой. Агрегатные функции

--1. Вывести фамилии студентов, в которых присутствуют буквы "б" и/или   "о" в любых комбинациях и порядке
select * from stud where last_name like '%б%' or last_name like '%о%'

--2. Вывести сведения о  студентах, фамилии которых начинаются с буквы К, при этом они являются иностранцами 
--(NULL в поле отчества)
Select * from stud where last_name  like 'К%' And s_name  is null

--3. Вывести сведения о  студентах, фамилии которых содержат 8 символов и более 
select * from stud where last_name like '________%'

--4. Вывести сведения о студентах, фамилии которых содержат или больше, или меньше семи символов (но не ровно семь символов),
--при этом одна из букв фамилии 'a'
Select * from stud where last_name  like '%а%' AND last_name not like '_______'

--5. Найти всех студентов учащихся на ФПМ очном 1 или 2 курсе, отсортировать результаты по полю отчества
select * from stud where faculty='ФПМ' and form='очная' and (year = '1' or year = '2') order by s_name

--6. Найти всех студентов учащихся на ФПК заочном со средним балом успеваемости больше 6, отсортировать результаты по оценки
--в убывающем порядке

Select * from stud where faculty='ФПК' AND form = 'заочная' and exm>(select avg(exm) from stud)

--7. Вывести список всех преподавателей, которые работают на ФПК (не зависимо от формы обучения) отсортировать по алфавиту 
--фамилии в пределах каждой формы обучения
select last_name,form from teach where faculty='ФПК' group by form,last_name order by form, last_name

--8. Вывести список всех преподавателей, которые работают на ФПМ, первом курсе и читают дисциплины более 100 часов.
Select * from teach where faculty='ФПМ' and year=1 and hours>100

--9. Вывести список преподавателей иностранцев, работающих в университете более трех лет на текущий момент
 select * from teach where s_name is null and (DATEDIFF (year,YEAR(GETDATE()),start_work_date) > 3)

 --10. Вывести информацию о дисциплинах, читаемых для студентов третьего курса ФПМ
 Select subj from teach where faculty='ФПМ' and year=3

 --11. Вывести информацию о дисциплинах (курс, форма обучения, Фио преподавателя), читаемых на ФПК, 
 --число часов по которым больше 100.
 select year, form,last_name from teach where faculty='ФПК' and (hours > 100)

 --12. Вывести информацию о дисциплинах (факультет, курс, форма обучения, Фио преподавателя), которые ведут 
 --преподаватели иностранцы.
 Select faculty, year, form, last_name, s_name, s_name from teach where s_name is null

--13. Вывести список преподавателей старше 30 лет на начало текущего года 
select DISTINCT last_name,br_date,(year(getdate()) - year(br_date)) as age  from teach 
where ((year(getdate()) - year(br_date)) > 30)

--14.	Вывести список преподавателей, от 35 до 40 лет на настоящий момент, отсортировать их по алфавиту фамилии.
select distinct last_name, br_date,  YEAR(getdate()) - YEAR(br_date)  as age from teach
where  YEAR(getdate()) - YEAR(br_date)  > 30
And YEAR(getdate()) - YEAR(br_date)  < 40 
order by last_name

--15.	 Вывести список преподавателей, день рождения у которых в октябре, Вывести в порядке возрастания даты рождения.
select DISTINCT last_name,br_date from teach where (MONTH(br_date) = 10) order by br_date asc

--16.	Определить среднее значение средних баллов (то значение, которое в таблице) за экзамены для студентов заочной 
--форме обучения каждого факультета.
select  faculty, avg(exm) as avg_exm from stud where form='заочная' group by faculty

--17.	Найти значения максимальных средних баллов для каждого факультета с учетом курса
select faculty,year, max(exm) from stud group by faculty, year order by faculty

--18.	Определить список факультетов, среднее значение средних баллов успеваемости на которых больше 7
select faculty, avg(exm) as avg_exm from stud
group by faculty
Having avg(exm)>7

--19. Определить список курсов с указанием факультета и формы обучения, средний балл успеваемости на которых больше 7.5
select year,faculty,form,avg(exm) as exm  from stud group by year,faculty,form Having (avg(exm)>7.5)

--20. Определить минимальное значение средних баллов успеваемости на каждом факультете с привязкой к курсу
select faculty,year, min(exm) as min_exm from stud
group by faculty , year

--21. Определить перечень факультетов с привязкой к форме минимальное значение средних баллов успеваемости для 
--которых больше 6 
select  faculty,form from stud group by faculty,form having min(exm) > 6  

--22. Определить, какое количество часов один студент ФПК 3-го курса заочной формы обучения тратит 
--на самостоятельную подготовку
select last_name, (all_h + inclass_h)/2 as avg_podg_h from stud where form like 'заочная' and faculty like 'ФПК'

--23. Вывести список факультетов, курсов, форм обучения, учась на которых студент   тратит  более 150 часов на самостоятельную подготовку
select faculty,year,form from stud where inclass_h > 150

--24. Вывести количество предметов, читаемых каждым преподавателем
select last_name, COUNT(subj) from teach group by last_name

--25.	Вывести список предметов с указанием числа часов являющихся максимальным для данного предмета
   select subj,max(hours) as hours from teach group by subj

--26. Вывести список преподавателей, читающих более одного предмета.
select last_name, COUNT(subj) from teach  group by last_name having COUNT(subj)>1

--27.	Вывести номера курсов с привязкой к факультету  и указанием суммы часов по всем предметам, проводимых на них
 select year,faculty, SUM(hours) as hours  from teach group by year,faculty  

 --28.	Вывести количество  предметов, читаемых на каждом факультете преподавателями иностранцами
Select faculty, count(subj) from teach where s_name is null group by faculty

--29.	Вывести количество преподавателей, работающих на каждом факультете
select faculty, count(distinct (last_name )) as 'saze' from teach group by faculty

--30.	Вывести количество предметов, читаемых на каждом факультете на  втором курсе, отсортировать по факультетам в 
--убывающем порядке, по курсам в возрастающем; 
Вопрос исправлен на: Вывести количество предметов, читаемых на каждом факультете на  втором курсе
Select faculty, count(subj) from teach where year=2 group by faculty










