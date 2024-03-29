create database motocars;

USE [motocars]
GO
/****** Object:  Table [dbo].[all_sales]    Script Date: 14.02.2019 0:09:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[all_sales](
	[shop_name] [nvarchar](50) NOT NULL,
	[shop_address] [nvarchar](50) NOT NULL,
	[client_name] [nvarchar](50) NOT NULL,
	[car] [nvarchar](50) NOT NULL,
	[price] [int] NOT NULL,
	[sale_date] [date] NOT NULL
) ON [PRIMARY]




GO
INSERT [dbo].[all_sales] ([shop_name], [shop_address], [client_name], [car], [price], [sale_date]) VALUES (N'Рулевой', N'Куприевича, 46', N'Попов', N'Audi A5', 100, CAST(N'2018-01-02' AS Date))
GO
INSERT [dbo].[all_sales] ([shop_name], [shop_address], [client_name], [car], [price], [sale_date]) VALUES (N'Рулевой', N'Куприевича, 46', N'Васильев', N'Audi A6', 110, CAST(N'2018-01-02' AS Date))
GO
INSERT [dbo].[all_sales] ([shop_name], [shop_address], [client_name], [car], [price], [sale_date]) VALUES (N'Иномарка ', N' Звездная, 15', N'Петров', N'Audi A7', 120, CAST(N'2018-01-05' AS Date))
GO
INSERT [dbo].[all_sales] ([shop_name], [shop_address], [client_name], [car], [price], [sale_date]) VALUES (N'Automall', N' Космонавтов, 5', N'Соколов', N'BMW X1', 140, CAST(N'2018-01-10' AS Date))
GO
INSERT [dbo].[all_sales] ([shop_name], [shop_address], [client_name], [car], [price], [sale_date]) VALUES (N'4 колеса', N' Столыпина, 8', N'Попов', N'Cadillac SRX', 155, CAST(N'2018-01-20' AS Date))
GO
INSERT [dbo].[all_sales] ([shop_name], [shop_address], [client_name], [car], [price], [sale_date]) VALUES (N'Automall', N' Космонавтов, 5', N'Соловьев', N'Citroen C4', 85, CAST(N'2018-01-21' AS Date))
GO
INSERT [dbo].[all_sales] ([shop_name], [shop_address], [client_name], [car], [price], [sale_date]) VALUES (N'All Cars', N' Cсоветская, 43', N'Семенов', N'BMW X5', 100, CAST(N'2018-01-23' AS Date))
GO
INSERT [dbo].[all_sales] ([shop_name], [shop_address], [client_name], [car], [price], [sale_date]) VALUES (N'Рулевой', N'Куприевича, 46', N'Михайлов', N'Cadillac SRX', 155, CAST(N'2018-01-25' AS Date))
GO
INSERT [dbo].[all_sales] ([shop_name], [shop_address], [client_name], [car], [price], [sale_date]) VALUES (N'Иномарка ', N' Звездная, 15', N'Федоров', N'Citroen C4', 85, CAST(N'2018-01-26' AS Date))
GO
INSERT [dbo].[all_sales] ([shop_name], [shop_address], [client_name], [car], [price], [sale_date]) VALUES (N'Рулевой', N'Куприевича, 46', N'Алексеев', N'BMW X5', 100, CAST(N'2018-01-27' AS Date))
GO
INSERT [dbo].[all_sales] ([shop_name], [shop_address], [client_name], [car], [price], [sale_date]) VALUES (N'Рулевой', N'Куприевича, 46', N'Федоров', N'Audi A5', 100, CAST(N'2018-02-02' AS Date))
GO
INSERT [dbo].[all_sales] ([shop_name], [shop_address], [client_name], [car], [price], [sale_date]) VALUES (N'Рулевой', N'Куприевича, 46', N'Новиков', N'Audi A6', 110, CAST(N'2018-02-03' AS Date))
GO
INSERT [dbo].[all_sales] ([shop_name], [shop_address], [client_name], [car], [price], [sale_date]) VALUES (N'Иномарка ', N' Звездная, 15', N'Егоров', N'Audi A7', 120, CAST(N'2018-02-05' AS Date))
GO
INSERT [dbo].[all_sales] ([shop_name], [shop_address], [client_name], [car], [price], [sale_date]) VALUES (N'Automall', N' Космонавтов, 5', N'Михайлов', N'Citroen C4 Picasso', 100, CAST(N'2018-02-11' AS Date))
GO
INSERT [dbo].[all_sales] ([shop_name], [shop_address], [client_name], [car], [price], [sale_date]) VALUES (N'4 колеса', N' Столыпина, 8', N'Попов', N'Audi A5', 100, CAST(N'2018-02-20' AS Date))
GO
INSERT [dbo].[all_sales] ([shop_name], [shop_address], [client_name], [car], [price], [sale_date]) VALUES (N'Automall', N' Космонавтов, 5', N'Соловьев', N'Citroen C4', 85, CAST(N'2018-02-21' AS Date))
GO
INSERT [dbo].[all_sales] ([shop_name], [shop_address], [client_name], [car], [price], [sale_date]) VALUES (N'All Cars', N' Cсоветская, 43', N'Лебедев', N'Audi A8', 125, CAST(N'2018-02-21' AS Date))
GO
INSERT [dbo].[all_sales] ([shop_name], [shop_address], [client_name], [car], [price], [sale_date]) VALUES (N'Рулевой', N'Куприевича, 46', N'Семенов', N'Cadillac CTS', 150, CAST(N'2018-02-22' AS Date))
GO
INSERT [dbo].[all_sales] ([shop_name], [shop_address], [client_name], [car], [price], [sale_date]) VALUES (N'Иномарка ', N' Звездная, 15', N'Федоров', N'Audi A7', 120, CAST(N'2018-02-23' AS Date))
GO
INSERT [dbo].[all_sales] ([shop_name], [shop_address], [client_name], [car], [price], [sale_date]) VALUES (N'Рулевой', N'Куприевича, 46', N'Алексеев', N'BMW X3', 100, CAST(N'2018-02-24' AS Date))
GO
INSERT [dbo].[all_sales] ([shop_name], [shop_address], [client_name], [car], [price], [sale_date]) VALUES (N'Рулевой', N'Куприевича, 46', N'Николаев', N'Audi A5', 100, CAST(N'2018-03-02' AS Date))
GO
INSERT [dbo].[all_sales] ([shop_name], [shop_address], [client_name], [car], [price], [sale_date]) VALUES (N'Рулевой', N'Куприевича, 46', N'Степанов', N'Audi A6', 110, CAST(N'2018-03-03' AS Date))
GO
INSERT [dbo].[all_sales] ([shop_name], [shop_address], [client_name], [car], [price], [sale_date]) VALUES (N'Иномарка ', N' Звездная, 15', N'Егоров', N'Audi A8', 125, CAST(N'2018-03-05' AS Date))
GO
INSERT [dbo].[all_sales] ([shop_name], [shop_address], [client_name], [car], [price], [sale_date]) VALUES (N'Automall', N' Космонавтов, 5', N'Козлов', N'BMW X4', 150, CAST(N'2018-03-11' AS Date))
GO
INSERT [dbo].[all_sales] ([shop_name], [shop_address], [client_name], [car], [price], [sale_date]) VALUES (N'4 колеса', N' Столыпина, 8', N'Николаев', N'Cadillac SRX', 155, CAST(N'2018-03-20' AS Date))
GO
INSERT [dbo].[all_sales] ([shop_name], [shop_address], [client_name], [car], [price], [sale_date]) VALUES (N'Automall', N' Космонавтов, 5', N'Петров', N'BMW X5', 100, CAST(N'2018-03-21' AS Date))
GO
INSERT [dbo].[all_sales] ([shop_name], [shop_address], [client_name], [car], [price], [sale_date]) VALUES (N'All Cars', N' Cсоветская, 43', N'Лебедев', N'Citroen C4 Picasso', 100, CAST(N'2018-03-21' AS Date))
GO
INSERT [dbo].[all_sales] ([shop_name], [shop_address], [client_name], [car], [price], [sale_date]) VALUES (N'Automall', N' Космонавтов, 5', N'Михайлов', N'Cadillac CTS', 150, CAST(N'2018-03-22' AS Date))
GO
INSERT [dbo].[all_sales] ([shop_name], [shop_address], [client_name], [car], [price], [sale_date]) VALUES (N'4 колеса', N' Столыпина, 8', N'Васильев', N'Citroen C4', 85, CAST(N'2018-03-23' AS Date))
GO
INSERT [dbo].[all_sales] ([shop_name], [shop_address], [client_name], [car], [price], [sale_date]) VALUES (N'Рулевой', N'Куприевича, 46', N'Алексеев', N'Cadillac CTS', 150, CAST(N'2018-03-24' AS Date))
GO
INSERT [dbo].[all_sales] ([shop_name], [shop_address], [client_name], [car], [price], [sale_date]) VALUES (N'Рулевой', N'Куприевича, 46', N'Захаров', N'Audi A5', 100, CAST(N'2018-04-01' AS Date))
GO
INSERT [dbo].[all_sales] ([shop_name], [shop_address], [client_name], [car], [price], [sale_date]) VALUES (N'Рулевой', N'Куприевича, 46', N'Новиков', N'Audi A6', 110, CAST(N'2018-04-03' AS Date))
GO
INSERT [dbo].[all_sales] ([shop_name], [shop_address], [client_name], [car], [price], [sale_date]) VALUES (N'Иномарка ', N' Звездная, 15', N'Никитин', N'Audi A7', 120, CAST(N'2018-04-05' AS Date))
GO
INSERT [dbo].[all_sales] ([shop_name], [shop_address], [client_name], [car], [price], [sale_date]) VALUES (N'Automall', N' Космонавтов, 5', N'Михайлов', N'Citroen C4 Picasso', 100, CAST(N'2018-04-11' AS Date))
GO
INSERT [dbo].[all_sales] ([shop_name], [shop_address], [client_name], [car], [price], [sale_date]) VALUES (N'4 колеса', N' Столыпина, 8', N'Макаров', N'Cadillac SRX', 155, CAST(N'2018-04-20' AS Date))
GO
INSERT [dbo].[all_sales] ([shop_name], [shop_address], [client_name], [car], [price], [sale_date]) VALUES (N'Automall', N' Космонавтов, 5', N'Соловьев', N'Citroen C4', 85, CAST(N'2018-04-13' AS Date))
GO
INSERT [dbo].[all_sales] ([shop_name], [shop_address], [client_name], [car], [price], [sale_date]) VALUES (N'Рулевой', N'Куприевича, 46', N'Лебедев', N'Citroen C3', 70, CAST(N'2018-04-15' AS Date))
GO
INSERT [dbo].[all_sales] ([shop_name], [shop_address], [client_name], [car], [price], [sale_date]) VALUES (N'Рулевой', N'Куприевича, 46', N'Андреев', N'Citroen C4', 85, CAST(N'2018-04-16' AS Date))
GO
INSERT [dbo].[all_sales] ([shop_name], [shop_address], [client_name], [car], [price], [sale_date]) VALUES (N'Иномарка ', N' Звездная, 15', N'Федоров', N'Citroen C3 Picasso', 80, CAST(N'2018-04-23' AS Date))
GO
INSERT [dbo].[all_sales] ([shop_name], [shop_address], [client_name], [car], [price], [sale_date]) VALUES (N'Иномарка ', N' Звездная, 15', N'Зайцев', N'Citroen C4 Picasso', 100, CAST(N'2018-04-24' AS Date))
GO
INSERT [dbo].[all_sales] ([shop_name], [shop_address], [client_name], [car], [price], [sale_date]) VALUES (N'Рулевой', N'Куприевича, 46', N'Федоров', N'Audi A5', 100, CAST(N'2018-05-02' AS Date))
GO
INSERT [dbo].[all_sales] ([shop_name], [shop_address], [client_name], [car], [price], [sale_date]) VALUES (N'Иномарка ', N' Звездная, 15', N'Новиков', N'Audi A6', 110, CAST(N'2018-05-03' AS Date))
GO
INSERT [dbo].[all_sales] ([shop_name], [shop_address], [client_name], [car], [price], [sale_date]) VALUES (N'Иномарка ', N' Звездная, 15', N'Петров', N'Audi A7', 120, CAST(N'2018-05-05' AS Date))
GO
INSERT [dbo].[all_sales] ([shop_name], [shop_address], [client_name], [car], [price], [sale_date]) VALUES (N'Automall', N' Космонавтов, 5', N'Михайлов', N'Citroen C4 Picasso', 100, CAST(N'2018-02-11' AS Date))
GO
INSERT [dbo].[all_sales] ([shop_name], [shop_address], [client_name], [car], [price], [sale_date]) VALUES (N'4 колеса', N' Столыпина, 8', N'Попов', N'Audi A5', 100, CAST(N'2018-02-20' AS Date))
GO
INSERT [dbo].[all_sales] ([shop_name], [shop_address], [client_name], [car], [price], [sale_date]) VALUES (N'Automall', N' Космонавтов, 5', N'Соловьев', N'BMW X3', 100, CAST(N'2018-03-20' AS Date))
GO
INSERT [dbo].[all_sales] ([shop_name], [shop_address], [client_name], [car], [price], [sale_date]) VALUES (N'All Cars', N' Cсоветская, 43', N'Лебедев', N'Audi A8', 125, CAST(N'2018-03-17' AS Date))
GO
INSERT [dbo].[all_sales] ([shop_name], [shop_address], [client_name], [car], [price], [sale_date]) VALUES (N'Рулевой', N'Куприевича, 46', N'Михайлов', N'Cadillac CTS', 150, CAST(N'2018-01-22' AS Date))
GO
INSERT [dbo].[all_sales] ([shop_name], [shop_address], [client_name], [car], [price], [sale_date]) VALUES (N'Иномарка ', N' Звездная, 15', N'Федоров', N'Audi A7', 120, CAST(N'2018-01-23' AS Date))
GO
INSERT [dbo].[all_sales] ([shop_name], [shop_address], [client_name], [car], [price], [sale_date]) VALUES (N'Рулевой', N'Куприевича, 46', N'Алексеев', N'BMW X3', 100, CAST(N'2018-01-24' AS Date))
GO
