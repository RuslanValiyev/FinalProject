/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.4001)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [master]
GO
/****** Object:  Database [FruitDb]    Script Date: 8/26/2018 4:00:02 PM ******/
CREATE DATABASE [FruitDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FruitDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\FruitDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FruitDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\FruitDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [FruitDb] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FruitDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FruitDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FruitDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FruitDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FruitDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FruitDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [FruitDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FruitDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FruitDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FruitDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FruitDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FruitDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FruitDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FruitDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FruitDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FruitDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FruitDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FruitDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FruitDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FruitDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FruitDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FruitDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FruitDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FruitDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FruitDb] SET  MULTI_USER 
GO
ALTER DATABASE [FruitDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FruitDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FruitDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FruitDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FruitDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FruitDb] SET QUERY_STORE = OFF
GO
USE [FruitDb]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [FruitDb]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 8/26/2018 4:00:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](250) NOT NULL,
	[About] [nvarchar](max) NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BoxContains]    Script Date: 8/26/2018 4:00:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BoxContains](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Image] [nvarchar](50) NOT NULL,
	[Size] [decimal](18, 2) NOT NULL,
	[ProductID] [int] NULL,
 CONSTRAINT [PK_BoxContains] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 8/26/2018 4:00:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 8/26/2018 4:00:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BlogId] [int] NOT NULL,
	[BlogContent] [nvarchar](250) NULL,
	[BlogDate] [datetime] NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 8/26/2018 4:00:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](90) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fermer]    Script Date: 8/26/2018 4:00:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fermer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[About] [nvarchar](150) NULL,
	[Image] [nvarchar](250) NULL,
 CONSTRAINT [PK_Fermer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[History]    Script Date: 8/26/2018 4:00:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[About] [nvarchar](250) NULL,
	[Image] [nvarchar](250) NULL,
 CONSTRAINT [PK_History] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 8/26/2018 4:00:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[About] [nvarchar](150) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[BoxOrNot] [bit] NULL,
	[Image] [nvarchar](250) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subscribe]    Script Date: 8/26/2018 4:00:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subscribe](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Subscribe] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 8/26/2018 4:00:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NULL,
	[UserTypeId] [int] NOT NULL,
	[Email] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserType]    Script Date: 8/26/2018 4:00:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([Id], [Title], [Image], [About]) VALUES (8, N'Azərbaycana qarşı təxribat', N'56 PMavatar_2.jpg', N'proqramlarından biri olan ''''Maps.me'''' (məpsmi) mobil tətbiqi Azərbaycanın ərazi bütövlüyünə qarşı təxribata əl atıb. Bu mobil tətbiqetmədə Azərbaycan torpaqları müstəqil Dağlıq Qarabağ Respublikası kimi göstərilib. Ərazilərin adları isə sanki erməni torpaqlarıymış kimi ermənicə xəritəyə daxil edilib')
INSERT [dbo].[Blog] ([Id], [Title], [Image], [About]) VALUES (9, N'Uşağın dırnağı necə kəsilməlidir?', N'26 PMavatar_4.jpg', N'gər uşağın dırnaqlarını o, oyaq ikən kəsmək istəyirsinizsə, yarana biləcək ağrıların qarşısını almaq üçün onun kiçik barmaqlarını möhkəm tutmaq lazımdır. Uşaqlar əllərini davamlı olaraq bağlayıb açmaq istəyirlər. Bu vəziyyətdə dırnaq kəsmək əvəzinə körpənin barmaq uclarını yaralaya bilərsiniz')
INSERT [dbo].[Blog] ([Id], [Title], [Image], [About]) VALUES (10, N'Rusiya ilə sərhəddə sıxlığın səbəbi açıqlandı', N'50 PMavatar_3.jpg', N'məktəblərində dərs prosesinin sentyabrın 1-də başlaması ilə əlaqədar kütləvi şəkildə geri qayıtmasıdır. Belə ki, Rusiya tərəfdəki gömrük-sərhəd keçid məntəqəsinin buraxılış potensialından dəfələrlə artıq insanın kütləvi şəkildə sərhədi keçmək istəməsi qarşı tərəfdə problemlərin yaranmasına səbəb olur.')
SET IDENTITY_INSERT [dbo].[Blog] OFF
SET IDENTITY_INSERT [dbo].[BoxContains] ON 

INSERT [dbo].[BoxContains] ([id], [Name], [Image], [Size], [ProductID]) VALUES (4, N'Alma Armud', N'12 PMdownload.jpg', CAST(12.00 AS Decimal(18, 2)), 8)
SET IDENTITY_INSERT [dbo].[BoxContains] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name]) VALUES (5, N'Quru')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (6, N'Yay ')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (7, N'Subtropik')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (8, N'Umumi')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([Id], [BlogId], [BlogContent], [BlogDate]) VALUES (9, 9, N'zcxzczxczxcz', CAST(N'2018-08-26T15:48:40.077' AS DateTime))
SET IDENTITY_INSERT [dbo].[Comment] OFF
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([Id], [Email], [Address], [Phone]) VALUES (1, N'ruslankv@code.edu.az', N'Azerbaycan Sumqayit', N'+994 50 705 00 05')
SET IDENTITY_INSERT [dbo].[Contact] OFF
SET IDENTITY_INSERT [dbo].[Fermer] ON 

INSERT [dbo].[Fermer] ([Id], [Name], [Surname], [About], [Image]) VALUES (5, N'Rusic', N'Valiyev', N' qarşı tərəfin əlaqədar qurumları ilə aparılan intensiv danışıqlar nəticəsində qısa zaman kəsiyində aradan qaldırılır', N'34 PMavatar_1.jpg')
INSERT [dbo].[Fermer] ([Id], [Name], [Surname], [About], [Image]) VALUES (6, N'Racab', N'Qarayev', N' qarşı tərəfin əlaqədar qurumları ilə aparılan intensiv danışıqlar nəticəsində qısa zaman kəsiyində aradan qaldırılır', N'45 PMavatar_2.jpg')
INSERT [dbo].[Fermer] ([Id], [Name], [Surname], [About], [Image]) VALUES (7, N'Aydin', N'Aydinli', N' qarşı tərəfin əlaqədar qurumları ilə aparılan intensiv danışıqlar nəticəsində qısa zaman kəsiyində aradan qaldırılır', N'01 PMavatar_4.jpg')
SET IDENTITY_INSERT [dbo].[Fermer] OFF
SET IDENTITY_INSERT [dbo].[History] ON 

INSERT [dbo].[History] ([Id], [Name], [About], [Image]) VALUES (1, N'Our History', N' qarşı tərəfin əlaqədar qurumları ilə aparılan intensiv danışıqlar nəticəsində qısa zaman kəsiyində aradan qaldırılır', N'27 PMbakery_shape1.png')
SET IDENTITY_INSERT [dbo].[History] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [About], [Price], [Description], [BoxOrNot], [Image]) VALUES (8, N'Adi', 8, N'tonluk üretim potansiyelinden bahsetmek ..', CAST(23.00 AS Decimal(18, 2)), N'text', 1, N'37 PMdownload.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [About], [Price], [Description], [BoxOrNot], [Image]) VALUES (9, N'Uzum', 6, N'Yaprağını dökmeyen bu yeni meyve türü ticari yetiştiricilikle kapama bahçeler yanında amatörce .', CAST(23.00 AS Decimal(18, 2)), N'Yaprağını dökmeyen bu yeni meyve türü ticari yetiştiricilikle kapama bahçeler yanında amatörce .', 0, N'24 PMimages (3).jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [About], [Price], [Description], [BoxOrNot], [Image]) VALUES (10, N'Alma', 5, N'Yaprağını dökmeyen bu yeni meyve türü ticari yetiştiricilikle kapama bahçeler yanında amatörce .', CAST(1.00 AS Decimal(18, 2)), N'Yaprağını dökmeyen bu yeni meyve türü ticari yetiştiricilikle kapama bahçeler yanında amatörce .', 0, N'07 PMdownload (1).jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [About], [Price], [Description], [BoxOrNot], [Image]) VALUES (11, N'Portagal', 8, N'Yaprağını dökmeyen bu yeni meyve türü ticari yetiştiricilikle kapama bahçeler yanında amatörce .', CAST(5.00 AS Decimal(18, 2)), N'Yaprağını dökmeyen bu yeni meyve türü ticari yetiştiricilikle kapama bahçeler yanında amatörce .', 0, N'45 PMimages.jpg')
INSERT [dbo].[Products] ([Id], [Name], [CategoryId], [About], [Price], [Description], [BoxOrNot], [Image]) VALUES (12, N'Findiq', 5, N'Yaprağını dökmeyen bu yeni meyve türü ticari yetiştiricilikle kapama bahçeler yanında amatörce .', CAST(56.00 AS Decimal(18, 2)), N'Yaprağını dökmeyen bu yeni meyve türü ticari yetiştiricilikle kapama bahçeler yanında amatörce .', 0, N'23 PMdownload (2).jpg')
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[Subscribe] ON 

INSERT [dbo].[Subscribe] ([Id], [Email]) VALUES (8, N'vzdvxvcxvcx@dsdsfsdf')
SET IDENTITY_INSERT [dbo].[Subscribe] OFF
INSERT [dbo].[User] ([Id], [Name], [Surname], [UserTypeId], [Email], [Password]) VALUES (3, N'Ruslan', N'Veliyev', 3, N'ruslankv@code.edu.az', N'123')
SET IDENTITY_INSERT [dbo].[UserType] ON 

INSERT [dbo].[UserType] ([Id], [Name]) VALUES (3, N'Admin')
SET IDENTITY_INSERT [dbo].[UserType] OFF
ALTER TABLE [dbo].[BoxContains]  WITH CHECK ADD  CONSTRAINT [FK_BoxContains_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BoxContains] CHECK CONSTRAINT [FK_BoxContains_Products]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Blog] FOREIGN KEY([BlogId])
REFERENCES [dbo].[Blog] ([Id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Blog]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Category]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_UserType] FOREIGN KEY([UserTypeId])
REFERENCES [dbo].[UserType] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_UserType]
GO
USE [master]
GO
ALTER DATABASE [FruitDb] SET  READ_WRITE 
GO
