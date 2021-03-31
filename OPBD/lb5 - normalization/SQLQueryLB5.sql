--1. Создайтe БД motocars и в ней таблицу  all_sales (все в скрипте )
--2. Выполните нормализацию БД
--3. создайте необходимые таблицы и связи между ними
--4. заполните созданные таблицы на основании данных all_sales

CREATE TABLE client(
client_id int not null identity primary key,
client_name nvarchar(50) NOT NULL
);
 
CREATE TABLE car(
car_name nvarchar(50) NOT NULL primary key,
car_price int NOT NULL
);
 
CREATE TABLE shop(
shop_name nvarchar(50) NOT NULL primary key,
shop_address nvarchar(50) NOT NULL,
);
 
CREATE TABLE bill(
bill_id int not null identity primary key,
client_id int not null,
car_name nvarchar(50) NOT NULL,
shop_name nvarchar(50) NOT NULL,
sale_date date NOT NULL,
CONSTRAINT FK1 foreign key (shop_name) references shop(shop_name),
CONSTRAINT FK2 foreign key (car_name) references car(car_name),
CONSTRAINT FK3 foreign key (client_id) references client(client_id),
);
 
INSERT INTO client (client_name) SELECT DISTINCT client_name FROM all_sales;
SELECT * FROM client;
 
INSERT INTO car (car_name,car_price) SELECT DISTINCT car,price FROM all_sales;
SELECT * FROM car;
 
INSERT INTO shop (shop_name, shop_address) SELECT DISTINCT shop_name, shop_address FROM all_sales;
SELECT * FROM shop;
 
INSERT INTO bill (shop_name, car_name, sale_date, client_id) SELECT shop_name, car, sale_date,
client.client_id from all_sales JOIN client ON all_sales.client_name = client.client_name;
SELECT * FROM bill;
 
SELECT client.client_name, bill.client_id, shop_name, car_name, sale_date from bill
JOIN client ON bill.client_id = client.client_id
ORDER BY client_name;


--5 используя созданные таблицы, создайте представления на основе следующих запросов

--a.	Определите, в каком из автосалонов Петров приобрел машину 2018-01-05
create view pred_a as
SELECT distinct shop.shop_name FROM shop
join bill on shop.shop_name = bill.shop_name and bill.sale_date = '2018-01-05'
join client on bill.client_id = (select client_id from client where client.client_name = 'Петров');
 
select * from pred_a


--b.	Вывести перечень автомобилей, даты и места их приобретения клиентов Лебедева и Егорова, отсортируйте по имени клиента
create view pred_b as
SELECT client.client_name, car.car_name, bill.sale_date, shop.shop_address FROM client
join bill on bill.client_id = client.client_id
join car on  bill.car_name = car.car_name
join shop on bill.shop_name = shop.shop_name
where client_name = 'Лебедев' OR client_name = 'Егоров'
 
select * from pred_b
ORDER BY client_name;
 
 
--c.	Вывести суммы продаж в феврале всех автосалонов

create view pred_c as
 SELECT shop.shop_name, car.car_price from shop
 join bill on bill.shop_name = shop.shop_name and MONTH(bill.sale_date) = 2
 join car on car.car_name = bill.car_name
 
 select shop_name, sum (car_price) from pred_c
 group by shop_name
 
 
--d.	Определить салон(салоны), выполнивший наибольшее число продаж за весь период

create view pred_d as
 SELECT * FROM bill
 
 select  TOP 1 WITH TIES shop_name, COUNT(bill_id) as top_list  from pred_d
 GROUP BY shop_name
 order by top_list desc;
 
 
--e.	Определить, каких автомобилей (названия) было продано больше всего в автосалоне Иномарка
create view pred_e as
 SELECT car.car_name FROM bill
 join car on car.car_name = bill.car_name
 where bill.shop_name = 'Иномарка'
 
select  TOP 1 WITH TIES  car_name, COUNT(car_name) as top_list  from pred_e
GROUP BY car_name
order by top_list desc;
 

--f.	Определите число уникальных клиентов салона Automall

create view pred_f as
 SELECT distinct client_id FROM bill
 join car on car.car_name = bill.car_name
 where bill.shop_name = 'Automall'
 
 SELECT COUNT(client_id) from pred_f
 

 --g.	Сколько продаж (количество) было сделано в салоне "4 колеса" в марте 
 create view pred_g as
SELECT * FROM bill
where MONTH(bill.sale_date) = 3 and bill.shop_name = '4 колеса'
 
 select  COUNT(bill_id) as top_list  from pred_g
 
