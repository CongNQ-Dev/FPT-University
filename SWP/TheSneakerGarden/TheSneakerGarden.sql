USE [TSG_A]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 6/17/2022 8:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 6/17/2022 8:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NOT NULL,
	[Account] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](30) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[Age] [smallint] NOT NULL,
	[Phone] [varchar](10) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Customer_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 6/17/2022 8:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[Quantity] [smallint] NOT NULL,
 CONSTRAINT [PK_Order_Details] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 6/17/2022 8:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[ShipVia] [varchar](20) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[ShippedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 6/17/2022 8:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[TypeID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[Amount] [money] NOT NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentType]    Script Date: 6/17/2022 8:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentType](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Payment_Type] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 6/17/2022 8:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[SizeID] [int] NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[Price] [float] NOT NULL,
	[ImageLink] [varchar](200) NULL,
	[Status] [bit] NOT NULL,
	[Description] [varchar](400) NULL,
	[Color] [varchar](20) NULL,
	[Rate] [tinyint] NULL,
	[ImportDate] [smalldatetime] NOT NULL,
	[Inventory] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 6/17/2022 8:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[ReviewID] [int] IDENTITY(1,1) NOT NULL,
	[ReviewContent] [nvarchar](200) NULL,
	[ProductID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
 CONSTRAINT [PK_Review] PRIMARY KEY CLUSTERED 
(
	[ReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 6/17/2022 8:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](60) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sizes]    Script Date: 6/17/2022 8:21:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sizes](
	[SizeID] [int] IDENTITY(1,1) NOT NULL,
	[SizeNumber] [int] NOT NULL,
	[quantity] [int] NULL,
	[productid] [int] NULL,
 CONSTRAINT [PK_Sizes] PRIMARY KEY CLUSTERED 
(
	[SizeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (1, N'Adidas')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (2, N'Nike')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerID], [RoleID], [Account], [Password], [Name], [Age], [Phone], [Email], [Address], [Status]) VALUES (1, 1, N'admin', N'admin', N'Cong', 20, N'0123456789', N'congttse', N'TP.HCM, Quan 9, Le Van Viet Street', 1)
INSERT [dbo].[Customer] ([CustomerID], [RoleID], [Account], [Password], [Name], [Age], [Phone], [Email], [Address], [Status]) VALUES (2, 1, N'admin1', N'admin1', N'Phai', 20, N'0123456788', N'phailvse', N'TP.HCM, Quan 9, Le Van Viet Street', 1)
INSERT [dbo].[Customer] ([CustomerID], [RoleID], [Account], [Password], [Name], [Age], [Phone], [Email], [Address], [Status]) VALUES (3, 2, N'customer', N'customer', N'Linh', 20, N'0123456787', N'linhltqse', N'TP.HCM, Quan 9, Vo Chi Cong Street', 1)
INSERT [dbo].[Customer] ([CustomerID], [RoleID], [Account], [Password], [Name], [Age], [Phone], [Email], [Address], [Status]) VALUES (4, 2, N'customer1', N'customer1', N'Khanh', 20, N'0123456786', N'khanhndbse', N'TP.HCM, Quan 12, Mai Chi Tho Street', 1)
INSERT [dbo].[Customer] ([CustomerID], [RoleID], [Account], [Password], [Name], [Age], [Phone], [Email], [Address], [Status]) VALUES (5, 2, N'customer299', N'customer2', N'Cong', 20, N'0123456785', N'congnqse@gmail.com', N'TP.Thu Duc, Quan 9, Man Thien Street', 1)
INSERT [dbo].[Customer] ([CustomerID], [RoleID], [Account], [Password], [Name], [Age], [Phone], [Email], [Address], [Status]) VALUES (8, 2, N'hao nguyen', N'12345', N'hao nguyen', 21, N'0337470726', N'haonguyenc4@gmail.com', N'Ben Tre', 0)
INSERT [dbo].[Customer] ([CustomerID], [RoleID], [Account], [Password], [Name], [Age], [Phone], [Email], [Address], [Status]) VALUES (9, 2, N'hao nguyen', N'12345', N'hao nguyen', 21, N'0337470726', N'haonguyenc4@gmail.com', N'Ben Tre', 0)
INSERT [dbo].[Customer] ([CustomerID], [RoleID], [Account], [Password], [Name], [Age], [Phone], [Email], [Address], [Status]) VALUES (10, 2, N'hao nguyen', N'12345', N'hao nguyen', 21, N'0337470726', N'haonguyenc4@gmail.com', N'Ben Tre', 0)
INSERT [dbo].[Customer] ([CustomerID], [RoleID], [Account], [Password], [Name], [Age], [Phone], [Email], [Address], [Status]) VALUES (11, 2, N'hao nguyen', N'12345', N'hao nguyen', 21, N'0337470726', N'haonguyenc4@gmail.com', N'Ben Tre', 0)
INSERT [dbo].[Customer] ([CustomerID], [RoleID], [Account], [Password], [Name], [Age], [Phone], [Email], [Address], [Status]) VALUES (12, 2, N'hao nguyen', N'12345', N'hao nguyen', 21, N'0337470726', N'haonguyenc4@gmail.com', N'Ben Tre', 0)
INSERT [dbo].[Customer] ([CustomerID], [RoleID], [Account], [Password], [Name], [Age], [Phone], [Email], [Address], [Status]) VALUES (13, 2, N'hao nguyen', N'12345', N'hao nguyen', 21, N'0337470726', N'haonguyenc4@gmail.com', N'Ben Tre', 0)
INSERT [dbo].[Customer] ([CustomerID], [RoleID], [Account], [Password], [Name], [Age], [Phone], [Email], [Address], [Status]) VALUES (14, 2, N'hao nguyen', N'12345', N'hao nguyen', 21, N'0337470726', N'haonguyenc4@gmail.com', N'Ben Tre', 0)
INSERT [dbo].[Customer] ([CustomerID], [RoleID], [Account], [Password], [Name], [Age], [Phone], [Email], [Address], [Status]) VALUES (15, 2, N'hao nguyen', N'12345', N'hao nguyen', 21, N'0337470726', N'haonguyenc4@gmail.com', N'Ben Tre', 0)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (1, 1, 500.0000, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (1, 5, 400.0000, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (1, 15, 700.0000, 2)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (2, 4, 800.0000, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (2, 14, 400.0000, 3)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (3, 8, 900.0000, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (4, 10, 400.0000, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (4, 12, 650.0000, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (5, 5, 400.0000, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (5, 16, 800.0000, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (15, 1, 500000.0000, 1)
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [UnitPrice], [Quantity]) VALUES (16, 2, 700000.0000, 1)
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [CustomerID], [ShipVia], [OrderDate], [ShippedDate]) VALUES (1, 3, N'Speedy Express', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2022-07-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [ShipVia], [OrderDate], [ShippedDate]) VALUES (2, 4, N'United Package', CAST(N'2022-03-06T00:00:00.000' AS DateTime), CAST(N'2022-10-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [ShipVia], [OrderDate], [ShippedDate]) VALUES (3, 5, N'Federal Shipping', CAST(N'2022-11-05T00:00:00.000' AS DateTime), CAST(N'2022-03-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [ShipVia], [OrderDate], [ShippedDate]) VALUES (4, 5, N'Federal Shipping', CAST(N'2022-02-22T00:00:00.000' AS DateTime), CAST(N'2022-05-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [ShipVia], [OrderDate], [ShippedDate]) VALUES (5, 3, N'United Package', CAST(N'2022-12-03T00:00:00.000' AS DateTime), CAST(N'2022-12-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [ShipVia], [OrderDate], [ShippedDate]) VALUES (9, -1, N'Speedy Express', CAST(N'2022-06-14T00:00:00.000' AS DateTime), CAST(N'2022-06-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [ShipVia], [OrderDate], [ShippedDate]) VALUES (10, -1, N'Speedy Express', CAST(N'2022-06-14T00:00:00.000' AS DateTime), CAST(N'2022-06-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [ShipVia], [OrderDate], [ShippedDate]) VALUES (11, -1, N'Speedy Express', CAST(N'2022-06-14T00:00:00.000' AS DateTime), CAST(N'2022-06-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [ShipVia], [OrderDate], [ShippedDate]) VALUES (12, -1, N'Speedy Express', CAST(N'2022-06-14T00:00:00.000' AS DateTime), CAST(N'2022-06-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [ShipVia], [OrderDate], [ShippedDate]) VALUES (13, -1, N'Speedy Express', CAST(N'2022-06-14T00:00:00.000' AS DateTime), CAST(N'2022-06-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [ShipVia], [OrderDate], [ShippedDate]) VALUES (14, -1, N'Speedy Express', CAST(N'2022-06-14T00:00:00.000' AS DateTime), CAST(N'2022-06-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [ShipVia], [OrderDate], [ShippedDate]) VALUES (15, -1, N'Speedy Express', CAST(N'2022-06-14T00:00:00.000' AS DateTime), CAST(N'2022-06-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [ShipVia], [OrderDate], [ShippedDate]) VALUES (16, -1, N'Speedy Express', CAST(N'2022-06-16T00:00:00.000' AS DateTime), CAST(N'2022-06-16T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Payment] ON 

INSERT [dbo].[Payment] ([PaymentID], [CustomerID], [TypeID], [OrderID], [Amount]) VALUES (1, 3, 1, 1, 5000.0000)
INSERT [dbo].[Payment] ([PaymentID], [CustomerID], [TypeID], [OrderID], [Amount]) VALUES (2, 4, 3, 2, 3000.0000)
INSERT [dbo].[Payment] ([PaymentID], [CustomerID], [TypeID], [OrderID], [Amount]) VALUES (3, 5, 1, 3, 1500.0000)
INSERT [dbo].[Payment] ([PaymentID], [CustomerID], [TypeID], [OrderID], [Amount]) VALUES (4, 5, 1, 4, 2000.0000)
INSERT [dbo].[Payment] ([PaymentID], [CustomerID], [TypeID], [OrderID], [Amount]) VALUES (5, 3, 4, 5, 1000.0000)
SET IDENTITY_INSERT [dbo].[Payment] OFF
GO
SET IDENTITY_INSERT [dbo].[PaymentType] ON 

INSERT [dbo].[PaymentType] ([TypeID], [TypeName]) VALUES (1, N'Momo')
INSERT [dbo].[PaymentType] ([TypeID], [TypeName]) VALUES (2, N'Viettelpay')
INSERT [dbo].[PaymentType] ([TypeID], [TypeName]) VALUES (3, N'Credit card')
INSERT [dbo].[PaymentType] ([TypeID], [TypeName]) VALUES (4, N'Visa')
SET IDENTITY_INSERT [dbo].[PaymentType] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [CategoryID], [SizeID], [ProductName], [Price], [ImageLink], [Status], [Description], [Color], [Rate], [ImportDate], [Inventory]) VALUES (1, 1, 1, N'ULTRABOOST 22 SHOES', 500000, N'https://assets.adidas.com/images/w_383,h_383,f_auto,q_auto,fl_lossy,c_fill,g_auto/5ae921bb08034aa2803fad7800abdd7f_9366/ultraboost-22-shoes.jpg', 1, N'The Ultraboost running shoes serve up comfort and responsiveness at every pace and distance. The adidas PRIMEKNIT upper includes foam around the heel to prevent blisters. Y A Continental™ Rubber outsole grips in wet and dry conditions so you can stride confidently.', N'Black', 4, CAST(N'2022-06-01T00:00:00' AS SmallDateTime), 20)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [SizeID], [ProductName], [Price], [ImageLink], [Status], [Description], [Color], [Rate], [ImportDate], [Inventory]) VALUES (2, 1, 2, N'FLUIDFLOW 2.0 SHOES', 700000, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/170aeeeea80b4b538da8ac1d010f4a69_9366/Fluidflow_2.0_Shoes_Black_FZ1985_01_standard.jpg', 1, N'It does not really matter whether or not a run is in the cards for the day. An ultra-breathable feel and cushy midsole that energises give these adidas shoes an edge. Hit the pavement or hit the town. You have got the kicks for whatever unfolds.', N'Black', 3, CAST(N'2022-06-01T00:00:00' AS SmallDateTime), 15)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [SizeID], [ProductName], [Price], [ImageLink], [Status], [Description], [Color], [Rate], [ImportDate], [Inventory]) VALUES (3, 1, 3, N'ULTRABOOST WEB DNA SHOES', 650000, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/8c3a0cd0d4524c68abf2ad430109ca79_9366/Ultraboost_Web_DNA_Shoes_White_GY4167_01_standard.jpg', 1, N'Comfort that is rooted in running meets effortless style in these adidas Ultraboost Web DNA Shoes. A lattice design on the midsole and outsole reveals the energy-returning Boost cushioning underneath. The adidas Primeknit upper is stretchy and supportive.', N'White', 3, CAST(N'2022-06-01T00:00:00' AS SmallDateTime), 18)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [SizeID], [ProductName], [Price], [ImageLink], [Status], [Description], [Color], [Rate], [ImportDate], [Inventory]) VALUES (4, 1, 4, N'RESPONSE SUPER 2.0 SHOES', 800000, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/28392f623ffc41089e1ead7100d3a94e_9366/Response_Super_2.0_Shoes_White_GX8264_01_standard.jpg', 1, N'Move through your day feeling comfortable and ready for anything with these adidas running shoes. A mesh upper is breathable, keeping your feet fresh even on warm days. Energised cushioning puts a spring in every step you take.', N'Red White', 5, CAST(N'2022-06-01T00:00:00' AS SmallDateTime), 0)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [SizeID], [ProductName], [Price], [ImageLink], [Status], [Description], [Color], [Rate], [ImportDate], [Inventory]) VALUES (5, 1, 5, N'RETROPY F2 SHOES', 400000, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/6c6ab76673b44ce3a868adf9012dde3b_9366/Retropy_F2_Shoes_Green_GW0506_01_standard.jpg', 1, N'You like to be one step ahead. Blending retro vibes with modern design, these adidas Retropy F2 Shoes are right there with you. Rooted in 80s running style, they show off a layered material-mix upper. The sleek shape and thick EVA midsole make them ideal for today.', N'Gray Green', 4, CAST(N'2022-06-01T00:00:00' AS SmallDateTime), 20)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [SizeID], [ProductName], [Price], [ImageLink], [Status], [Description], [Color], [Rate], [ImportDate], [Inventory]) VALUES (6, 1, 6, N'QUESTAR SHOES', 600000, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/982b0d4744d249be8d37ade900fd2ef6_9366/Questar_Shoes_Black_GZ0621_01_standard.jpg', 1, N'Every day is a good day for a run when you lace up in these adidas shoes. A padded collar gives you a snug and secure fit, while lightweight cushioning underfoot delivers enhanced flexibility for a comfortable step from heel-strike to toe-off.', N'Black White', 4, CAST(N'2022-06-01T00:00:00' AS SmallDateTime), 0)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [SizeID], [ProductName], [Price], [ImageLink], [Status], [Description], [Color], [Rate], [ImportDate], [Inventory]) VALUES (7, 1, 7, N'EQ21 RUN SHOES', 600000, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/04fa4c9f8da348389770ae14008ac808_9366/EQ21_Run_Shoes_Orange_GZ6869_01_standard.jpg', 1, N'Lace up in comfort with these adidas running shoes. Breathable mesh keeps your feet feeling cool and fresh as you move through your day. A lightweight midsole cushions every step from the first of the day to the last.', N'Black Orange', 4, CAST(N'2022-06-01T00:00:00' AS SmallDateTime), 17)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [SizeID], [ProductName], [Price], [ImageLink], [Status], [Description], [Color], [Rate], [ImportDate], [Inventory]) VALUES (8, 1, 8, N'GALAXY 5 SHOES', 900000, N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/47631b05c092437ba433ae0d00f57c6d_9366/Galaxy_5_Shoes_White_GW0763_01_standard.jpg', 1, N'Make the most out of your runs. No matter how far you go, these adidas shoes cushion every take-off and landing to make each step feel like a good one. Another block. Another lap. Another mile. Get after it.', N'Gray White', 4, CAST(N'2022-06-01T00:00:00' AS SmallDateTime), 25)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [SizeID], [ProductName], [Price], [ImageLink], [Status], [Description], [Color], [Rate], [ImportDate], [Inventory]) VALUES (9, 2, 9, N'Nike Dunk High By You', 700000, N'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5,q_80/f57965b5-9331-4452-8437-cccb22de3ac2/custom-nike-dunk-high-by-you.png', 1, N'Leather, suede and woven material in rave colours and metallics bring a whole new life to this staple of sport, with a special edition font to add a little extra personality.', N'Gray Blue', 4, CAST(N'2022-06-01T00:00:00' AS SmallDateTime), 20)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [SizeID], [ProductName], [Price], [ImageLink], [Status], [Description], [Color], [Rate], [ImportDate], [Inventory]) VALUES (10, 2, 10, N'Nike Air Max 90 G', 400000, N'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/160ac08e-9b45-4f74-a9cc-c8502b58658b/air-max-90-g-golf-shoes-P2Wfz8.png', 1, N'Get your kicks, inspired by Route 66. The Nike Air Max 90 G stays true to the original icon, with a Max Air unit in the heel, and adds integrated traction for exceptional grip. A Swoosh logo paired with a Route 66 logo on the tongue pays tribute to 1 of America is original highways. The outsole is made with at least 13% Nike Grind material.', N'Orange White', 4, CAST(N'2022-06-03T00:00:00' AS SmallDateTime), 20)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [SizeID], [ProductName], [Price], [ImageLink], [Status], [Description], [Color], [Rate], [ImportDate], [Inventory]) VALUES (11, 2, 11, N'Nike Air Zoom G.T. Jump', 500000, N'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/aeeecdd0-3a5a-4f8b-8c16-d4c8e9256231/air-zoom-gt-jump-basketball-shoes-22QS5F.png', 1, N'The double-stacked Zoom Air works in sync with an outer jumper frame made from lightweight, resilient, and sturdy PEBAX®. The woven exoskeleton-like upper helps you feel fully connected', N'White', 4, CAST(N'2022-06-03T00:00:00' AS SmallDateTime), 15)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [SizeID], [ProductName], [Price], [ImageLink], [Status], [Description], [Color], [Rate], [ImportDate], [Inventory]) VALUES (12, 2, 12, N'Nike ZoomX Invincible Run Flyknit 2', 650000, N'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/76e6dd8d-5a2e-435c-bd9b-294b2e929d95/zoomx-invincible-run-flyknit-2-road-running-shoes-0lCQ5S.png', 1, N'The Nike ZoomX Invincible Run Flyknit 2 keeps you going with the same super-soft feel that lets you feel your potential when your foot hits the pavement. We have crafted shoes with our highest level of spring responsiveness and support to keep you feeling secure and competitive.', N'Black Blue', 4, CAST(N'2022-06-03T00:00:00' AS SmallDateTime), 0)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [SizeID], [ProductName], [Price], [ImageLink], [Status], [Description], [Color], [Rate], [ImportDate], [Inventory]) VALUES (13, 2, 13, N'Nike Air Force 1 07 LV8', 600000, N'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/6f3f5d83-0770-45da-97ec-280233fd949f/air-force-1-07-lv8-shoes-g8VPMF.png', 1, N'In sneaker history, few styles last. Only one transcends every era—the Nike Air Force 1 07 LV8. Celebrate perfection with the b-ball original that delivers what you know best: bold details and some extra flash to keep you shining.', N'Red White', 5, CAST(N'2022-06-03T00:00:00' AS SmallDateTime), 0)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [SizeID], [ProductName], [Price], [ImageLink], [Status], [Description], [Color], [Rate], [ImportDate], [Inventory]) VALUES (14, 2, 14, N'Nike Blazer Mid 77 Jumbo', 400000, N'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/1c7ee386-246a-4b75-bbe9-7771333bc8f9/blazer-mid-77-jumbo-shoes-jfX5HT.png', 1, N'Harnessing the classic look you love, it now features an elastic heel with velvet-like texture and large drawstrings for easy on and off. Oversized details like logos and laces add interest while plush foam tongues and thicker stitching celebrate the iconic look that has been hailed on the streets since 777.', N'Red White', 4, CAST(N'2022-06-03T00:00:00' AS SmallDateTime), 17)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [SizeID], [ProductName], [Price], [ImageLink], [Status], [Description], [Color], [Rate], [ImportDate], [Inventory]) VALUES (15, 2, 15, N'Nike Dunk Low Retro SE', 700000, N'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/1027ea63-1476-4006-82b0-f83ad0c7169c/dunk-low-retro-se-shoes-chsffk.png', 1, N'Faded side panels and classic red, white and blue piping celebrates trusted barbers to help you look good. The padded, low-cut collar lets you take your signature style anywhere — in comfort.', N'Black Light Blue', 4, CAST(N'2022-06-03T00:00:00' AS SmallDateTime), 20)
INSERT [dbo].[Products] ([ProductID], [CategoryID], [SizeID], [ProductName], [Price], [ImageLink], [Status], [Description], [Color], [Rate], [ImportDate], [Inventory]) VALUES (16, 2, 16, N'Nike Air Force 1 07 SE', 800000, N'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/8ebf647b-f49b-4a42-b0b4-3177fb2d9c2b/air-force-1-07-se-shoes-J2qs7m.png', 1, N'The radiance lives on with the b-ball original. Crossing hardwood comfort with off-court flair, it puts a fresh spin on what you know best: era-echoing, 80s construction, bold details and nothin-but-net style.', N'White', 4, CAST(N'2022-06-03T00:00:00' AS SmallDateTime), 11)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Review] ON 

INSERT [dbo].[Review] ([ReviewID], [ReviewContent], [ProductID], [CustomerID]) VALUES (1, N'Great quality, super comfortable. The price is really great for all the nice features the shoe offers.', 1, 3)
INSERT [dbo].[Review] ([ReviewID], [ReviewContent], [ProductID], [CustomerID]) VALUES (2, N'Honestly beat my expectations, as comfy as the yeezy 350s imo', 1, 4)
INSERT [dbo].[Review] ([ReviewID], [ReviewContent], [ProductID], [CustomerID]) VALUES (3, N'Pretty good purchase. Really comfortable to wear for long hours.', 5, 3)
INSERT [dbo].[Review] ([ReviewID], [ReviewContent], [ProductID], [CustomerID]) VALUES (4, N'Great shoe. Usually wear a 12 but I could have went for an 11.5. Might try to return them for a better size', 8, 5)
INSERT [dbo].[Review] ([ReviewID], [ReviewContent], [ProductID], [CustomerID]) VALUES (5, N'Very comfortable and they look good! I would size down a half size from usual Nike size', 10, 3)
INSERT [dbo].[Review] ([ReviewID], [ReviewContent], [ProductID], [CustomerID]) VALUES (6, N'Obsessed with these shoes, got them a couple days ago and have been wearing them ever since. The flower/butterfly patches are super cute', 13, 4)
INSERT [dbo].[Review] ([ReviewID], [ReviewContent], [ProductID], [CustomerID]) VALUES (7, N'Got these as a gift for my boyfriend and he loves them. Great for a general wear trainer and they are easy to clean and look after.', 16, 5)
INSERT [dbo].[Review] ([ReviewID], [ReviewContent], [ProductID], [CustomerID]) VALUES (8, N'So happy with these - They look great and super comfy even from the first wear', 16, 3)
SET IDENTITY_INSERT [dbo].[Review] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'admin')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'customer')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Sizes] ON 

INSERT [dbo].[Sizes] ([SizeID], [SizeNumber], [quantity], [productid]) VALUES (1, 35, 23, 1)
INSERT [dbo].[Sizes] ([SizeID], [SizeNumber], [quantity], [productid]) VALUES (2, 36, 1, 2)
INSERT [dbo].[Sizes] ([SizeID], [SizeNumber], [quantity], [productid]) VALUES (3, 37, 2, 3)
INSERT [dbo].[Sizes] ([SizeID], [SizeNumber], [quantity], [productid]) VALUES (4, 38, 2, 4)
INSERT [dbo].[Sizes] ([SizeID], [SizeNumber], [quantity], [productid]) VALUES (5, 39, 2, 5)
INSERT [dbo].[Sizes] ([SizeID], [SizeNumber], [quantity], [productid]) VALUES (6, 40, 2, 6)
INSERT [dbo].[Sizes] ([SizeID], [SizeNumber], [quantity], [productid]) VALUES (7, 41, 2, 7)
INSERT [dbo].[Sizes] ([SizeID], [SizeNumber], [quantity], [productid]) VALUES (8, 42, 2, 8)
INSERT [dbo].[Sizes] ([SizeID], [SizeNumber], [quantity], [productid]) VALUES (9, 43, 2, 9)
INSERT [dbo].[Sizes] ([SizeID], [SizeNumber], [quantity], [productid]) VALUES (10, 44, 2, 10)
INSERT [dbo].[Sizes] ([SizeID], [SizeNumber], [quantity], [productid]) VALUES (11, 45, 2, 11)
INSERT [dbo].[Sizes] ([SizeID], [SizeNumber], [quantity], [productid]) VALUES (12, 46, 2, 12)
INSERT [dbo].[Sizes] ([SizeID], [SizeNumber], [quantity], [productid]) VALUES (13, 47, 2, 13)
INSERT [dbo].[Sizes] ([SizeID], [SizeNumber], [quantity], [productid]) VALUES (14, 48, 2, 14)
INSERT [dbo].[Sizes] ([SizeID], [SizeNumber], [quantity], [productid]) VALUES (15, 49, 2, 15)
INSERT [dbo].[Sizes] ([SizeID], [SizeNumber], [quantity], [productid]) VALUES (16, 50, 2, 16)
INSERT [dbo].[Sizes] ([SizeID], [SizeNumber], [quantity], [productid]) VALUES (17, 35, 15, 2)
INSERT [dbo].[Sizes] ([SizeID], [SizeNumber], [quantity], [productid]) VALUES (19, 37, 12, 1)
INSERT [dbo].[Sizes] ([SizeID], [SizeNumber], [quantity], [productid]) VALUES (20, 38, 123, 1)
INSERT [dbo].[Sizes] ([SizeID], [SizeNumber], [quantity], [productid]) VALUES (21, 42, 2, 1)
INSERT [dbo].[Sizes] ([SizeID], [SizeNumber], [quantity], [productid]) VALUES (22, 45, 123, 1)
INSERT [dbo].[Sizes] ([SizeID], [SizeNumber], [quantity], [productid]) VALUES (23, 43, 34, 1)
SET IDENTITY_INSERT [dbo].[Sizes] OFF
GO
ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [DF_Order_Details_UnitPrice]  DEFAULT ((0)) FOR [UnitPrice]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [DF_Order_Details_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_Order_Details_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_Order_Details_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_Order_Details_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_Order_Details_Products]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Orders]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Type] FOREIGN KEY([TypeID])
REFERENCES [dbo].[PaymentType] ([TypeID])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Type]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Sizes] FOREIGN KEY([SizeID])
REFERENCES [dbo].[Sizes] ([SizeID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Sizes]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_Customer]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [CK_Quantity] CHECK  (([Quantity]>(0)))
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [CK_Quantity]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [CK_UnitPrice] CHECK  (([UnitPrice]>=(0)))
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [CK_UnitPrice]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [CHK_products] CHECK  (([Inventory]>=(0)))
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [CHK_products]
GO
