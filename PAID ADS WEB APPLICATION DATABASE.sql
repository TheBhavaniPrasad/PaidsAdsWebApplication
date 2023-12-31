USE [master]
GO
/****** Object:  Database [PAWA]    Script Date: 03-08-2023 18:51:41 ******/
CREATE DATABASE [PAWA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PAWA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.BHAVANI\MSSQL\DATA\PAWA.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PAWA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.BHAVANI\MSSQL\DATA\PAWA_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PAWA] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PAWA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PAWA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PAWA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PAWA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PAWA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PAWA] SET ARITHABORT OFF 
GO
ALTER DATABASE [PAWA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PAWA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PAWA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PAWA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PAWA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PAWA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PAWA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PAWA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PAWA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PAWA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PAWA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PAWA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PAWA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PAWA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PAWA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PAWA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PAWA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PAWA] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PAWA] SET  MULTI_USER 
GO
ALTER DATABASE [PAWA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PAWA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PAWA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PAWA] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PAWA] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PAWA] SET QUERY_STORE = OFF
GO
USE [PAWA]
GO
/****** Object:  Table [dbo].[AdBooking]    Script Date: 03-08-2023 18:51:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdBooking](
	[BookingId] [int] IDENTITY(1,1) NOT NULL,
	[AdType] [varchar](50) NOT NULL,
	[ItemId] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[ItemDescription] [varchar](max) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[Location] [varchar](50) NOT NULL,
	[Amount] [float] NOT NULL,
	[IsActive] [int] NOT NULL,
 CONSTRAINT [PK_AdBooking] PRIMARY KEY CLUSTERED 
(
	[BookingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdItem]    Script Date: 03-08-2023 18:51:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdItem](
	[ItemNo] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[SubCategoryId] [int] NOT NULL,
	[ItemName] [varchar](50) NOT NULL,
	[ItemPrice] [float] NOT NULL,
	[FileName] [varchar](50) NOT NULL,
	[IsActive] [int] NOT NULL,
 CONSTRAINT [PK_AdItem] PRIMARY KEY CLUSTERED 
(
	[ItemNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerDetails]    Script Date: 03-08-2023 18:51:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerDetails](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](50) NOT NULL,
	[ContactNo] [nchar](10) NOT NULL,
	[EmailId] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_CustomerDetails] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentDetails]    Script Date: 03-08-2023 18:51:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentDetails](
	[PaymentId] [int] IDENTITY(1,1) NOT NULL,
	[BookingId] [int] NOT NULL,
	[RecievedPrice] [float] NOT NULL,
	[TotalAmount] [float] NOT NULL,
	[Balance] [float] NOT NULL,
	[Reason] [nvarchar](max) NOT NULL,
	[IsActive] [int] NOT NULL,
 CONSTRAINT [PK_PaymentDetails] PRIMARY KEY CLUSTERED 
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Register]    Script Date: 03-08-2023 18:51:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Register](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UName] [varchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[MNumber] [nchar](10) NOT NULL,
	[EmailId] [varchar](50) NOT NULL,
	[Role] [varchar](50) NOT NULL,
	[IsActive] [int] NOT NULL,
 CONSTRAINT [PK_Register] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roleform]    Script Date: 03-08-2023 18:51:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roleform](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[Role] [varchar](50) NOT NULL,
	[IsActive] [int] NOT NULL,
 CONSTRAINT [PK_Roleform] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 03-08-2023 18:51:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategory](
	[CategoryId] [int] NOT NULL,
	[SubCategoryId] [int] NOT NULL,
	[SubCategoryName] [varchar](50) NOT NULL,
	[IsActive] [int] NOT NULL,
 CONSTRAINT [PK_SubCategory] PRIMARY KEY CLUSTERED 
(
	[SubCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 03-08-2023 18:51:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
	[IsActive] [int] NOT NULL,
 CONSTRAINT [PK_Ctgry] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AdBooking] ON 

INSERT [dbo].[AdBooking] ([BookingId], [AdType], [ItemId], [Price], [ItemDescription], [CreatedDate], [ModifiedDate], [Location], [Amount], [IsActive]) VALUES (1, N'Education', 1003, 1003, N'Join your Children in our schools for their Better Future', CAST(N'2023-07-24T00:00:00.000' AS DateTime), NULL, N'(NewsPaper,Page,Middle)', 500, 1)
INSERT [dbo].[AdBooking] ([BookingId], [AdType], [ItemId], [Price], [ItemDescription], [CreatedDate], [ModifiedDate], [Location], [Amount], [IsActive]) VALUES (2, N'Movie Promotion', 1004, 1004, N'Watch this movie in your nearest theatres', CAST(N'2023-07-24T00:00:00.000' AS DateTime), NULL, N'Website', 100, 1)
INSERT [dbo].[AdBooking] ([BookingId], [AdType], [ItemId], [Price], [ItemDescription], [CreatedDate], [ModifiedDate], [Location], [Amount], [IsActive]) VALUES (4, N'jewellery sales', 1005, 1005, N'Buy Jewllery in our shop', CAST(N'2023-07-31T00:00:00.000' AS DateTime), NULL, N'(NewsPaper,Page,End)', 2000, 1)
SET IDENTITY_INSERT [dbo].[AdBooking] OFF
GO
SET IDENTITY_INSERT [dbo].[AdItem] ON 

INSERT [dbo].[AdItem] ([ItemNo], [CategoryId], [SubCategoryId], [ItemName], [ItemPrice], [FileName], [IsActive]) VALUES (1003, 12, 14, N'Narayana Schools', 500, N'Narayana.jpg', 1)
INSERT [dbo].[AdItem] ([ItemNo], [CategoryId], [SubCategoryId], [ItemName], [ItemPrice], [FileName], [IsActive]) VALUES (1004, 13, 9, N'MoviePosterAd', 100, N'spiderman.jpg', 1)
INSERT [dbo].[AdItem] ([ItemNo], [CategoryId], [SubCategoryId], [ItemName], [ItemPrice], [FileName], [IsActive]) VALUES (1005, 14, 11, N'Lalitha jewellery Ad', 2000, N'Lalitha jewellers.jpg', 1)
INSERT [dbo].[AdItem] ([ItemNo], [CategoryId], [SubCategoryId], [ItemName], [ItemPrice], [FileName], [IsActive]) VALUES (1006, 15, 12, N'Aparna Constructions', 1500, N'Aparna.png', 1)
SET IDENTITY_INSERT [dbo].[AdItem] OFF
GO
SET IDENTITY_INSERT [dbo].[CustomerDetails] ON 

INSERT [dbo].[CustomerDetails] ([CustomerId], [CustomerName], [ContactNo], [EmailId], [Address], [CreatedDate], [ModifiedDate]) VALUES (1, N'Sakshi Tv', N'4023256000', N'Info@sakshi.com', N'6-3-249/1,Sakshi Towers,Road No 1,
Banjara Hills,Hyderabad-500034', CAST(N'2023-06-17T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[CustomerDetails] ([CustomerId], [CustomerName], [ContactNo], [EmailId], [Address], [CreatedDate], [ModifiedDate]) VALUES (2, N'Netflix', N'8009191694', N'info@members.netflix.com', N'Los Gatos,121,AlbrightWy,UnitedStates', CAST(N'2023-06-30T00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[CustomerDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[PaymentDetails] ON 

INSERT [dbo].[PaymentDetails] ([PaymentId], [BookingId], [RecievedPrice], [TotalAmount], [Balance], [Reason], [IsActive]) VALUES (1, 1, 1, 400, 100, N'Balance will be paid at the earliest', 1)
INSERT [dbo].[PaymentDetails] ([PaymentId], [BookingId], [RecievedPrice], [TotalAmount], [Balance], [Reason], [IsActive]) VALUES (2, 2, 2, 100, 0, N'Balance is Cleared', 1)
INSERT [dbo].[PaymentDetails] ([PaymentId], [BookingId], [RecievedPrice], [TotalAmount], [Balance], [Reason], [IsActive]) VALUES (3, 4, 4, 1500, 500, N'Balance will be paid', 1)
SET IDENTITY_INSERT [dbo].[PaymentDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Register] ON 

INSERT [dbo].[Register] ([UserId], [UName], [Password], [MNumber], [EmailId], [Role], [IsActive]) VALUES (8, N'BHAVANI', N'b1234', N'7569667814', N'BhavaniP@gmail.com', N'4', 1)
INSERT [dbo].[Register] ([UserId], [UName], [Password], [MNumber], [EmailId], [Role], [IsActive]) VALUES (1008, N'Arvind', N'a123', N'8074451271', N'Arvind@gmail.com', N'5', 1)
INSERT [dbo].[Register] ([UserId], [UName], [Password], [MNumber], [EmailId], [Role], [IsActive]) VALUES (1009, N'Rashid', N'r123', N'8978812475', N'rashidK@gmail.com', N'6', 1)
INSERT [dbo].[Register] ([UserId], [UName], [Password], [MNumber], [EmailId], [Role], [IsActive]) VALUES (1010, N'Shirisha', N's123', N'9396478457', N'Shirisha@gmail.com', N'7', 1)
INSERT [dbo].[Register] ([UserId], [UName], [Password], [MNumber], [EmailId], [Role], [IsActive]) VALUES (1011, N'pranith', N'p123', N'9876543219', N'pranith@gmail.com', N'5', 1)
INSERT [dbo].[Register] ([UserId], [UName], [Password], [MNumber], [EmailId], [Role], [IsActive]) VALUES (1014, N'Saketh', N's231', N'8976546723', N'saketh@gmail.com', N'6', 1)
INSERT [dbo].[Register] ([UserId], [UName], [Password], [MNumber], [EmailId], [Role], [IsActive]) VALUES (1015, N'sameer', N's432', N'8899007766', N'sameer@gmail.com', N'6', 1)
SET IDENTITY_INSERT [dbo].[Register] OFF
GO
SET IDENTITY_INSERT [dbo].[Roleform] ON 

INSERT [dbo].[Roleform] ([RoleId], [Role], [IsActive]) VALUES (4, N'Admin', 1)
INSERT [dbo].[Roleform] ([RoleId], [Role], [IsActive]) VALUES (5, N'Customer', 1)
INSERT [dbo].[Roleform] ([RoleId], [Role], [IsActive]) VALUES (6, N'Viewer', 1)
INSERT [dbo].[Roleform] ([RoleId], [Role], [IsActive]) VALUES (7, N'Reader', 1)
SET IDENTITY_INSERT [dbo].[Roleform] OFF
GO
INSERT [dbo].[SubCategory] ([CategoryId], [SubCategoryId], [SubCategoryName], [IsActive]) VALUES (12, 7, N'Admission', 1)
INSERT [dbo].[SubCategory] ([CategoryId], [SubCategoryId], [SubCategoryName], [IsActive]) VALUES (11, 8, N'Social Media', 1)
INSERT [dbo].[SubCategory] ([CategoryId], [SubCategoryId], [SubCategoryName], [IsActive]) VALUES (13, 9, N'Movies', 1)
INSERT [dbo].[SubCategory] ([CategoryId], [SubCategoryId], [SubCategoryName], [IsActive]) VALUES (14, 11, N'Sale', 1)
INSERT [dbo].[SubCategory] ([CategoryId], [SubCategoryId], [SubCategoryName], [IsActive]) VALUES (15, 12, N'Planners', 1)
INSERT [dbo].[SubCategory] ([CategoryId], [SubCategoryId], [SubCategoryName], [IsActive]) VALUES (11, 13, N'Influencers', 1)
INSERT [dbo].[SubCategory] ([CategoryId], [SubCategoryId], [SubCategoryName], [IsActive]) VALUES (12, 14, N'Results', 1)
GO
SET IDENTITY_INSERT [dbo].[tblCategory] ON 

INSERT [dbo].[tblCategory] ([CategoryId], [CategoryName], [IsActive]) VALUES (11, N'Information', 1)
INSERT [dbo].[tblCategory] ([CategoryId], [CategoryName], [IsActive]) VALUES (12, N'Education', 1)
INSERT [dbo].[tblCategory] ([CategoryId], [CategoryName], [IsActive]) VALUES (13, N'Entertainment', 1)
INSERT [dbo].[tblCategory] ([CategoryId], [CategoryName], [IsActive]) VALUES (14, N'Jewellery', 1)
INSERT [dbo].[tblCategory] ([CategoryId], [CategoryName], [IsActive]) VALUES (15, N'Construction', 1)
SET IDENTITY_INSERT [dbo].[tblCategory] OFF
GO
ALTER TABLE [dbo].[Roleform]  WITH CHECK ADD  CONSTRAINT [FK_Roleform_Roleform] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roleform] ([RoleId])
GO
ALTER TABLE [dbo].[Roleform] CHECK CONSTRAINT [FK_Roleform_Roleform]
GO
/****** Object:  StoredProcedure [dbo].[GenCtgry]    Script Date: 03-08-2023 18:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GenCtgry]
@CategoryId int=0,
@CategoryName varchar(50)=null,
@SubCategoryName varchar(50)=null,
@IsActive int=0,
@option int=0
AS
BEGIN
    if(@option=1)
	BEGIN
	insert into tblCategory(CategoryName,IsActive)values(@CategoryName,@IsActive)
	END
	if(@option=2)
	BEGIN
	Update tblCategory set CategoryName=@CategoryName Where CategoryId=@CategoryId 
	END
	if(@option=3)
	BEGIN
	delete tblCategory Where CategoryId=@CategoryId 
	END
	if(@option=4)
	BEGIN
	select * from tblCategory
	END
END
GO
/****** Object:  StoredProcedure [dbo].[GenCustomerDetails]    Script Date: 03-08-2023 18:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GenCustomerDetails]
@CustomerId int=0,
@CustomerName varchar(50)=null,
@ContactNo nchar(10)=null,
@EmailId nvarchar(50)=null,
@Address nvarchar(MAX)=null,
@CreatedDate datetime=null,
@ModifiedDate datetime=null,
@option int=0
AS
BEGIN
    if(@option=1)
	BEGIN
	insert into CustomerDetails(CustomerName,ContactNo,EmailId,Address,CreatedDate)values(@CustomerName,@ContactNo,@EmailId,@Address,@CreatedDate)
	END
	if(@option=2)
	BEGIN
	Update CustomerDetails set ContactNo=@ContactNo,EmailId=@EmailId,Address=@Address,ModifiedDate=@ModifiedDate Where CustomerId=@CustomerId
	END
	if(@option=3)
	BEGIN
	delete CustomerDetails Where CustomerId=@CustomerId
	END
	if(@option=4)
	BEGIN
	select * from CustomerDetails
	END
END
GO
/****** Object:  StoredProcedure [dbo].[GenPayment]    Script Date: 03-08-2023 18:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GenPayment]
@PaymentId int=0,
@BookingId int=0,
@RecievedPrice float=0,
@TotalAmount float=0,
@Balance float=0,
@Reason nvarchar(MAX)=null,
@IsActive int=0,
@option int=0
AS
BEGIN
    if(@option=1)
	BEGIN
	insert into PaymentDetails(BookingId,RecievedPrice,TotalAmount,Balance,Reason,IsActive)values(@BookingId,@RecievedPrice,@TotalAmount,@Balance,@Reason,@IsActive)
	END
	if(@option=2)
	BEGIN
	select PaymentId,a.Adtype,a.Amount,TotalAmount,Balance,Reason,Pd.IsActive from PaymentDetails Pd 
	inner join AdBooking a on a.BookingId=Pd.RecievedPrice where Pd.IsActive=1
	END
END
GO
/****** Object:  StoredProcedure [dbo].[GenRole]    Script Date: 03-08-2023 18:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[GenRole]
    @RoleId int=0,
	@Role varchar(50)=null,
	@IsActive int=0,
	@option int=0
AS
BEGIN
    if(@option=1)
	BEGIN
	insert into Roleform(Role,IsActive)values(@Role,@IsActive)
	END
	if(@option=2)
	BEGIN
	Update Roleform set Role=@Role Where RoleId=@RoleId
	END
	if(@option=3)
	BEGIN
	delete Roleform Where RoleId=@RoleId
	END
	if(@option=4)
	BEGIN
	select * from Roleform
	END
END
GO
/****** Object:  StoredProcedure [dbo].[Use_Booking]    Script Date: 03-08-2023 18:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Use_Booking]
@BookingId int=0,
@Adtype Varchar(50)=null,
@ItemId int=0,
@ItemDescription varchar(MAX)=null,
@Price varchar(50)=null,
@CreatedDate datetime=null,
@ModifiedDate datetime=null,
@Location varchar(50)=null,
@Amount float=0,
@IsActive int=0,
@option int=0
AS
BEGIN
    if(@option=1)
	BEGIN
	insert into AdBooking(Adtype,ItemId,Price,ItemDescription,CreatedDate,Location,Amount,IsActive)values(@Adtype,@ItemId,@Price,@ItemDescription,@CreatedDate,@Location,@Amount,@IsActive)
	END
	if(@option=2)
	BEGIN
	Update AdBooking set ItemDescription=@ItemDescription, ModifiedDate=@ModifiedDate,Location=@Location,Amount=@Amount Where BookingId=@BookingId
	END
	if(@option=3)
	BEGIN
	delete AdBooking Where BookingId=@BookingId
	END
	if(@option=4)
	BEGIN
	select BookingId,AdType,a.ItemName,a.ItemPrice,ItemDescription,CreatedDate,ModifiedDate,Location,Amount,ab.IsActive from AdBooking ab
	inner join AdItem a on a.ItemNo=ab.ItemId where ab.IsActive=1
	END
END


GO
/****** Object:  StoredProcedure [dbo].[Use_Register]    Script Date: 03-08-2023 18:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Use_Register]
@UserId int=0,
@UName varchar(50)=null,
@Password nvarchar(50)=null,
@MNumber nchar(10)=null,
@EmailId nvarchar(50)=null,
@Role Varchar(50)=null,
@IsActive int=0,
@option int=0
AS
BEGIN
    if(@option=1)
	BEGIN
	insert into Register(UName,Password,MNumber,EmailId,Role,IsActive)values(@UName,@Password,@MNumber,@EmailId,@Role,@IsActive)
    END
    if(@option=2)
    BEGIN
	update Register set UName=@UName,Password=@Password,Role=@Role Where UserId=@UserId
    END
	if(@option=3)
	BEGIN
	delete Register Where UserId=@UserId
	END
	if(@option=4)
	BEGIN
	select UserId,UName,Password,MNumber,EmailId,r.Role,u.IsActive from Register u inner join Roleform r on r.RoleId=u.Role where u.IsActive=1
    END 
	if(@option=5)
	BEGIN
	SELECT  COUNT(1) from  Register where EmailId=@EmailId AND Password=@Password
	END
END
GO
/****** Object:  StoredProcedure [dbo].[Use_SubCategory]    Script Date: 03-08-2023 18:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Use_SubCategory]
@CategoryId int=0,
@SubCategoryId int=0,
@SubCategoryName varchar(50)=null,
@IsActive int=0,
@option int=0
AS
BEGIN
    if(@option=1)
	BEGIN
	insert into SubCategory(CategoryId,SubCategoryId,SubCategoryName,IsActive)values(@CategoryId,@SubCategoryId,@SubCategoryName,@IsActive)
    END
    if(@option=2)
    BEGIN
	update SubCategory set SubCategoryName=@SubCategoryName Where SubCategoryId=@SubCategoryId
    END
	if(@option=3)
	BEGIN
	delete SubCategory Where SubCategoryId=@SubCategoryId
	END
	if(@option=4)
	BEGIN
	select tc.CategoryName,SubCategoryId,SubCategoryName,s.IsActive from SubCategory s inner join tblCategory tc on tc.CategoryId=s.CategoryId where s.IsActive=1
    END
END
GO
USE [master]
GO
ALTER DATABASE [PAWA] SET  READ_WRITE 
GO
