USE [master]
GO
ALTER DATABASE [BoatManagement9] set single_user with rollback immediate
GO
DROP DATABASE IF EXISTS [BoatManagement9]
GO
/****** Object:  Database [BoatManagement9]    Script Date: 10/24/2022 07:25:56 ******/
CREATE DATABASE [BoatManagement9] 
GO
USE [BoatManagement9]
GO
/****** Object:  Table [dbo].[boats]    Script Date: 10/24/2022 07:25:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[boats](
	[bid] [int] NOT NULL,
	[bname] [varchar](50) NULL,
	[color] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[bid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sailors]    Script Date: 10/24/2022 07:25:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sailors](
	[sid] [int] IDENTITY(1,1) NOT NULL,
	[sname] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[rating] [int] NULL,
	[age] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[reserves]    Script Date: 10/24/2022 07:25:57 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Default [DF__sailors__age__023D5A04]    Script Date: 10/24/2022 07:25:57 ******/
ALTER TABLE [dbo].[sailors] ADD  DEFAULT ((15)) FOR [age]
GO
/****** Object:  Check [CK__sailors__rating__014935CB]    Script Date: 10/24/2022 07:25:57 ******/
ALTER TABLE [dbo].[sailors]  WITH CHECK ADD CHECK  (([rating]>=(1) AND [rating]<=(10)))
GO
/****** Object:  ForeignKey [FK__reserves__bid__0BC6C43E]    Script Date: 10/24/2022 07:25:57 ******/
ALTER TABLE [dbo].[reserves]  WITH CHECK ADD FOREIGN KEY([bid])
REFERENCES [dbo].[boats] ([bid])
GO
/****** Object:  ForeignKey [FK__reserves__sid__0AD2A005]    Script Date: 10/24/2022 07:25:57 ******/
ALTER TABLE [dbo].[reserves]  WITH CHECK ADD FOREIGN KEY([sid])
REFERENCES [dbo].[sailors] ([sid])
GO
INSERT [dbo].[boats] ([bid], [bname], [color]) VALUES (1, N'boat1', N'red')
INSERT [dbo].[boats] ([bid], [bname], [color]) VALUES (2, N'boat2', N'green')
INSERT [dbo].[boats] ([bid], [bname], [color]) VALUES (3, N'boat3', N'orange')
INSERT [dbo].[boats] ([bid], [bname], [color]) VALUES (4, N'boat4', N'blue')
GO
INSERT [dbo].[sailors] ([sname], [password], [rating], [age]) VALUES (N'sailor1', N'1234', 3, 22)
INSERT [dbo].[sailors] ([sname], [password], [rating], [age]) VALUES (N'sailor2', N'1234', 4, 23)
INSERT [dbo].[sailors] ([sname], [password], [rating], [age]) VALUES (N'sailor3', N'1234', 5, 24)
INSERT [dbo].[sailors] ([sname], [password], [rating], [age]) VALUES (N'sailor4', N'1234', 5, 24)
GO