
USE [BoatManagement9]
GO
/****** Object:  Table [dbo].[boats]    Script Date: 10/26/2022 4:57:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[boats](
	[bid] [int] NOT NULL,
	[bname] [varchar](50) NULL,
	[color] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[bid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reserves]    Script Date: 10/26/2022 4:57:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reserves](
	[sid] [int] NOT NULL,
	[bid] [int] NOT NULL,
	[day] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[sid] ASC,
	[bid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sailors]    Script Date: 10/26/2022 4:57:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sailors](
	[sid] [int] NOT NULL,
	[sname] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[rating] [int] NULL,
	[age] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[boats] ([bid], [bname], [color]) VALUES (1, N'boat1', N'red')
INSERT [dbo].[boats] ([bid], [bname], [color]) VALUES (2, N'boat2', N'green')
INSERT [dbo].[boats] ([bid], [bname], [color]) VALUES (3, N'boat3', N'orange')
INSERT [dbo].[boats] ([bid], [bname], [color]) VALUES (4, N'boat4', N'blue')
GO
INSERT [dbo].[sailors] ([sid], [sname], [password], [rating], [age]) VALUES (1, N'sailor1', N'1234', 3, 22)
INSERT [dbo].[sailors] ([sid], [sname], [password], [rating], [age]) VALUES (2, N'sailor2', N'1234', 4, 23)
INSERT [dbo].[sailors] ([sid], [sname], [password], [rating], [age]) VALUES (3, N'sailor3', N'1234', 5, 24)
INSERT [dbo].[sailors] ([sid], [sname], [password], [rating], [age]) VALUES (4, N'sailor4', N'1234', 5, 24)
GO
ALTER TABLE [dbo].[sailors] ADD  DEFAULT ((15)) FOR [age]
GO
ALTER TABLE [dbo].[reserves]  WITH CHECK ADD FOREIGN KEY([bid])
REFERENCES [dbo].[boats] ([bid])
GO
ALTER TABLE [dbo].[reserves]  WITH CHECK ADD FOREIGN KEY([sid])
REFERENCES [dbo].[sailors] ([sid])
GO
ALTER TABLE [dbo].[sailors]  WITH CHECK ADD CHECK  (([rating]>=(1) AND [rating]<=(10)))
GO
USE [master]
GO
ALTER DATABASE [BoatManagement9] SET  READ_WRITE 
GO
