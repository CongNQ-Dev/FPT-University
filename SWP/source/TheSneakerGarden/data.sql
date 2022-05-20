USE [TSG]
GO
/****** Object:  Table [dbo].[tblCart]    Script Date: 3/24/2022 3:39:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCart](
	[cartId] [varchar](1) NOT NULL,
	[cartPrice] [varchar](1) NULL,
	[itemId] [int] NULL,
 CONSTRAINT [PK__tblCart__415B03B87965CB52] PRIMARY KEY CLUSTERED 
(
	[cartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 3/24/2022 3:39:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[cId] [varchar](50) NOT NULL,
	[cName] [varchar](20) NULL,
 CONSTRAINT [PK__tblCateg__D830D477284BB6F1] PRIMARY KEY CLUSTERED 
(
	[cId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblInventory]    Script Date: 3/24/2022 3:39:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblInventory](
	[inventoryId] [varchar](1) NOT NULL,
	[inventoryName] [varchar](1) NULL,
	[inventoryQuantity] [varchar](1) NULL,
	[itemId] [int] NULL,
 CONSTRAINT [PK__tblInven__C4B7BC023680D044] PRIMARY KEY CLUSTERED 
(
	[inventoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLogin]    Script Date: 3/24/2022 3:39:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLogin](
	[loginId] [int] IDENTITY(1,1) NOT NULL,
	[loginUsername] [nvarchar](50) NULL,
	[loginPassword] [nvarchar](50) NULL,
	[userId] [int] NULL,
	[roleId] [int] NULL,
 CONSTRAINT [PK__tblLogin__1F5EF4CF8B751046] PRIMARY KEY CLUSTERED 
(
	[loginId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 3/24/2022 3:39:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[orderId] [int] IDENTITY(1,1) NOT NULL,
	[orderDate] [date] NULL,
	[shipDate] [date] NULL,
	[totalPrice] [float] NULL,
	[userId] [int] NULL,
 CONSTRAINT [PK__tblOrder__0809335D18B51C6A] PRIMARY KEY CLUSTERED 
(
	[orderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrItem]    Script Date: 3/24/2022 3:39:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrItem](
	[orderItemId] [int] IDENTITY(1,1) NOT NULL,
	[orderId] [int] NOT NULL,
	[itemId] [int] NOT NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_tblOrItem] PRIMARY KEY CLUSTERED 
(
	[orderItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 3/24/2022 3:39:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[type] [varchar](50) NULL,
	[price] [money] NULL,
	[image] [varchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[status] [int] NULL,
	[cId] [varchar](50) NULL,
 CONSTRAINT [PK__tblItem__56A128AA3365D558] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 3/24/2022 3:39:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRole](
	[roleId] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [varchar](50) NULL,
	[roleDesc] [varchar](50) NULL,
 CONSTRAINT [PK__tblRole__CD98462AF71C5CC0] PRIMARY KEY CLUSTERED 
(
	[roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 3/24/2022 3:39:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[userId] [int] IDENTITY(1,1) NOT NULL,
	[userName] [nvarchar](50) NULL,
	[userEmail] [nvarchar](50) NULL,
	[userPhone] [nvarchar](50) NULL,
	[userAddress] [nvarchar](100) NULL,
	[roleId] [int] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK__tblUser__CB9A1CFF85F29DDF] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblCategory] ([cId], [cName]) VALUES (N'1', N'NIKE')
INSERT [dbo].[tblCategory] ([cId], [cName]) VALUES (N'2', N'ADIDAS')
GO
SET IDENTITY_INSERT [dbo].[tblLogin] ON 

INSERT [dbo].[tblLogin] ([loginId], [loginUsername], [loginPassword], [userId], [roleId]) VALUES (1, N'admin', N'123', 1, 1)
INSERT [dbo].[tblLogin] ([loginId], [loginUsername], [loginPassword], [userId], [roleId]) VALUES (2, N'user', N'123', 2, 2)
INSERT [dbo].[tblLogin] ([loginId], [loginUsername], [loginPassword], [userId], [roleId]) VALUES (3, N'null', N'123', 9, 2)
INSERT [dbo].[tblLogin] ([loginId], [loginUsername], [loginPassword], [userId], [roleId]) VALUES (4, N'dinh', N'123', 10, 2)
INSERT [dbo].[tblLogin] ([loginId], [loginUsername], [loginPassword], [userId], [roleId]) VALUES (5, N'dinhtran', N'123', 11, 2)
SET IDENTITY_INSERT [dbo].[tblLogin] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOrder] ON 

INSERT [dbo].[tblOrder] ([orderId], [orderDate], [shipDate], [totalPrice], [userId]) VALUES (1, CAST(N'2020-02-02' AS Date), CAST(N'2020-01-01' AS Date), 1, 1)
INSERT [dbo].[tblOrder] ([orderId], [orderDate], [shipDate], [totalPrice], [userId]) VALUES (2370, CAST(N'2022-03-23' AS Date), CAST(N'2022-03-23' AS Date), 480, 1)
INSERT [dbo].[tblOrder] ([orderId], [orderDate], [shipDate], [totalPrice], [userId]) VALUES (2371, CAST(N'2022-03-23' AS Date), CAST(N'2022-03-23' AS Date), 640, 1)
INSERT [dbo].[tblOrder] ([orderId], [orderDate], [shipDate], [totalPrice], [userId]) VALUES (2372, CAST(N'2022-03-23' AS Date), CAST(N'2022-03-23' AS Date), 2740, 1)
INSERT [dbo].[tblOrder] ([orderId], [orderDate], [shipDate], [totalPrice], [userId]) VALUES (2373, CAST(N'2022-03-24' AS Date), CAST(N'2022-03-24' AS Date), 540, 1)
INSERT [dbo].[tblOrder] ([orderId], [orderDate], [shipDate], [totalPrice], [userId]) VALUES (2374, CAST(N'2022-03-24' AS Date), CAST(N'2022-03-24' AS Date), 180, 1)
INSERT [dbo].[tblOrder] ([orderId], [orderDate], [shipDate], [totalPrice], [userId]) VALUES (2375, CAST(N'2022-03-24' AS Date), CAST(N'2022-03-24' AS Date), 180, 2)
INSERT [dbo].[tblOrder] ([orderId], [orderDate], [shipDate], [totalPrice], [userId]) VALUES (2376, CAST(N'2022-03-24' AS Date), CAST(N'2022-03-24' AS Date), 88988, 2)
INSERT [dbo].[tblOrder] ([orderId], [orderDate], [shipDate], [totalPrice], [userId]) VALUES (2377, CAST(N'2022-03-24' AS Date), CAST(N'2022-03-24' AS Date), 100099, 11)
SET IDENTITY_INSERT [dbo].[tblOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOrItem] ON 

INSERT [dbo].[tblOrItem] ([orderItemId], [orderId], [itemId], [quantity]) VALUES (1, 1, 1, 2)
INSERT [dbo].[tblOrItem] ([orderItemId], [orderId], [itemId], [quantity]) VALUES (2648, 2370, 0, 1)
INSERT [dbo].[tblOrItem] ([orderItemId], [orderId], [itemId], [quantity]) VALUES (2649, 2370, 3, 2)
INSERT [dbo].[tblOrItem] ([orderItemId], [orderId], [itemId], [quantity]) VALUES (2650, 2371, 0, 3)
INSERT [dbo].[tblOrItem] ([orderItemId], [orderId], [itemId], [quantity]) VALUES (2651, 2371, 1, 1)
INSERT [dbo].[tblOrItem] ([orderItemId], [orderId], [itemId], [quantity]) VALUES (2652, 2372, 0, 3)
INSERT [dbo].[tblOrItem] ([orderItemId], [orderId], [itemId], [quantity]) VALUES (2653, 2372, 1, 2)
INSERT [dbo].[tblOrItem] ([orderItemId], [orderId], [itemId], [quantity]) VALUES (2654, 2372, 4, 2)
INSERT [dbo].[tblOrItem] ([orderItemId], [orderId], [itemId], [quantity]) VALUES (2655, 2375, 0, 1)
INSERT [dbo].[tblOrItem] ([orderItemId], [orderId], [itemId], [quantity]) VALUES (2656, 2376, 0, 8)
INSERT [dbo].[tblOrItem] ([orderItemId], [orderId], [itemId], [quantity]) VALUES (2657, 2376, 1, 1)
INSERT [dbo].[tblOrItem] ([orderItemId], [orderId], [itemId], [quantity]) VALUES (2658, 2377, 0, 9)
INSERT [dbo].[tblOrItem] ([orderItemId], [orderId], [itemId], [quantity]) VALUES (2659, 2377, 1, 1)
SET IDENTITY_INSERT [dbo].[tblOrItem] OFF
GO
SET IDENTITY_INSERT [dbo].[tblProduct] ON 

INSERT [dbo].[tblProduct] ([id], [name], [type], [price], [image], [description], [status], [cId]) VALUES (0, N'Giay123', N'1', 11119.0000, N'nike_7.jpg', N'1231123', 0, N'1')
INSERT [dbo].[tblProduct] ([id], [name], [type], [price], [image], [description], [status], [cId]) VALUES (1, N'Nike Air Force 1', N'2', 100.0000, N'shop2.png', N'Giày thể thao nam Nike', 1, N'1')
INSERT [dbo].[tblProduct] ([id], [name], [type], [price], [image], [description], [status], [cId]) VALUES (2, N'Nike Blazer Mid 77', N'2', 120.0000, N'shop3.png', N'Giày thể thao nam Nike', 1, N'1')
INSERT [dbo].[tblProduct] ([id], [name], [type], [price], [image], [description], [status], [cId]) VALUES (3, N'Nike Air Max 97', N'2', 150.0000, N'shop4.png', N'Giày thể thao nam Nike', 1, N'1')
INSERT [dbo].[tblProduct] ([id], [name], [type], [price], [image], [description], [status], [cId]) VALUES (4, N'Nike Air Jordan 4 Retro Off White', N'2', 1000.0000, N'shop5.png', N'Giày thể thao nam Nike', 1, N'1')
INSERT [dbo].[tblProduct] ([id], [name], [type], [price], [image], [description], [status], [cId]) VALUES (5, N'Nike SB Dunk Low Retro White Black', N'2', 160.0000, N'shop6.png', N'Giày thể thao nam Nike', 1, N'1')
INSERT [dbo].[tblProduct] ([id], [name], [type], [price], [image], [description], [status], [cId]) VALUES (6, N'Nike Air Zoom Pegasus 38', N'2', 110.0000, N'shop1.png', N'Giày thể thao nam Nike', 1, N'1')
INSERT [dbo].[tblProduct] ([id], [name], [type], [price], [image], [description], [status], [cId]) VALUES (7, N'Adidas Superstar', N'1', 100.0000, N'shop3.png', N'Giày thể thao nam Adidas Enerergy Falcon EE9844', 0, N'2')
INSERT [dbo].[tblProduct] ([id], [name], [type], [price], [image], [description], [status], [cId]) VALUES (8, N'Adidas Stan Smith', N'1', 100.0000, N'shop6.png', N'Giày thể thao nam Adidas Enerergy Falcon EE9844', 1, N'2')
INSERT [dbo].[tblProduct] ([id], [name], [type], [price], [image], [description], [status], [cId]) VALUES (9, N'Adidas Ultraboost 4.0', N'1', 200.0000, N'shop5.png', N'Giày thể thao nam Adidas Enerergy Falcon EE9844', 1, N'2')
INSERT [dbo].[tblProduct] ([id], [name], [type], [price], [image], [description], [status], [cId]) VALUES (10, N'Giay 212', N'1', 11111.0000, N'nike_2.jpg', N'12312312', 0, N'1')
INSERT [dbo].[tblProduct] ([id], [name], [type], [price], [image], [description], [status], [cId]) VALUES (11, N'Giay Nike', N'1', 123123.0000, N'nike_6.jpg', N'1231123', 0, N'1')
INSERT [dbo].[tblProduct] ([id], [name], [type], [price], [image], [description], [status], [cId]) VALUES (12, N'Giay Nike', N'1', 123123.0000, N'nike_6.jpg', N'1231123', 0, N'1')
INSERT [dbo].[tblProduct] ([id], [name], [type], [price], [image], [description], [status], [cId]) VALUES (15, N'CanTho', N'1', 123.0000, N'nike_6.jpg', N'1231123', 0, N'1')
INSERT [dbo].[tblProduct] ([id], [name], [type], [price], [image], [description], [status], [cId]) VALUES (16, N'Giay Nike', N'2', 123.0000, N'nike_7.jpg', N'123', 0, N'2')
INSERT [dbo].[tblProduct] ([id], [name], [type], [price], [image], [description], [status], [cId]) VALUES (17, N'CanTho', N'1', 123123.0000, N'nike_7.jpg', N'123123', 1, N'1')
SET IDENTITY_INSERT [dbo].[tblProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[tblRole] ON 

INSERT [dbo].[tblRole] ([roleId], [roleName], [roleDesc]) VALUES (1, N'Admin', NULL)
INSERT [dbo].[tblRole] ([roleId], [roleName], [roleDesc]) VALUES (2, N'User', NULL)
SET IDENTITY_INSERT [dbo].[tblRole] OFF
GO
SET IDENTITY_INSERT [dbo].[tblUser] ON 

INSERT [dbo].[tblUser] ([userId], [userName], [userEmail], [userPhone], [userAddress], [roleId], [status]) VALUES (1, N'Nguyen Van A', N'admin@gmail.com', N'0987654321', N'CT', 1, 1)
INSERT [dbo].[tblUser] ([userId], [userName], [userEmail], [userPhone], [userAddress], [roleId], [status]) VALUES (2, N'Tran Van Bbbb', N'user@user.comm', N'01234567892', N'HCMM', 2, 1)
INSERT [dbo].[tblUser] ([userId], [userName], [userEmail], [userPhone], [userAddress], [roleId], [status]) VALUES (3, N'Nguyen Son Hao', N'haonsce140386@fpt.edu.vn', N'0337470726', N'Ben Tre', 1, 0)
INSERT [dbo].[tblUser] ([userId], [userName], [userEmail], [userPhone], [userAddress], [roleId], [status]) VALUES (4, N'Nguyen Son Hao', N'haonsce140386@fpt.edu.vn', N'0337470726', N'Ben Tre', 1, 0)
INSERT [dbo].[tblUser] ([userId], [userName], [userEmail], [userPhone], [userAddress], [roleId], [status]) VALUES (5, N'hao nguyen', N'haonguyenc4@gmail.com', N'0337470726', N'Ben Tre', 1, 0)
INSERT [dbo].[tblUser] ([userId], [userName], [userEmail], [userPhone], [userAddress], [roleId], [status]) VALUES (6, N'hao nguyen', N'haonguyenc4@gmail.com', N'0337470726', N'Ben Tre', 1, 0)
INSERT [dbo].[tblUser] ([userId], [userName], [userEmail], [userPhone], [userAddress], [roleId], [status]) VALUES (7, N'hao nguyen', N'haonguyenc4@gmail.com', N'0337470726', N'Ben Tre', 2, 0)
INSERT [dbo].[tblUser] ([userId], [userName], [userEmail], [userPhone], [userAddress], [roleId], [status]) VALUES (8, N'hao nguyen', N'haonguyenc4@gmail.com', N'0337470726', N'Ben Tre', 2, 0)
INSERT [dbo].[tblUser] ([userId], [userName], [userEmail], [userPhone], [userAddress], [roleId], [status]) VALUES (9, N'Tran Trung DInh', N'dinh@gmail.com', N'0987654321', N'CT', 2, 0)
INSERT [dbo].[tblUser] ([userId], [userName], [userEmail], [userPhone], [userAddress], [roleId], [status]) VALUES (10, N'Tran Trung Dinh', N'dinh@gmail.com', N'0987654321', N'CT', 2, 0)
INSERT [dbo].[tblUser] ([userId], [userName], [userEmail], [userPhone], [userAddress], [roleId], [status]) VALUES (11, N'Tran Trung Dinhhhh', N'dinh@gmail.commm', N'0987654321', N'CTTTTT', 2, 1)
INSERT [dbo].[tblUser] ([userId], [userName], [userEmail], [userPhone], [userAddress], [roleId], [status]) VALUES (12, N'Tran', N'trantrungdinh206@gmail.com', N'0329449553', N'CTTTTT', 2, 1)
SET IDENTITY_INSERT [dbo].[tblUser] OFF
GO
ALTER TABLE [dbo].[tblLogin]  WITH CHECK ADD  CONSTRAINT [login_role] FOREIGN KEY([roleId])
REFERENCES [dbo].[tblRole] ([roleId])
GO
ALTER TABLE [dbo].[tblLogin] CHECK CONSTRAINT [login_role]
GO
ALTER TABLE [dbo].[tblLogin]  WITH CHECK ADD  CONSTRAINT [login_user] FOREIGN KEY([userId])
REFERENCES [dbo].[tblUser] ([userId])
GO
ALTER TABLE [dbo].[tblLogin] CHECK CONSTRAINT [login_user]
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [user_role] FOREIGN KEY([roleId])
REFERENCES [dbo].[tblRole] ([roleId])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [user_role]
GO
