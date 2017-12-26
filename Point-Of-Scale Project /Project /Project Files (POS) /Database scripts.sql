USE [master]
GO
/****** Object:  Database [PSSupermarket]    Script Date: 12/16/2017 4:55:22 PM ******/
CREATE DATABASE [PSSupermarket]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PSSupermarket', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\PSSupermarket.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PSSupermarket_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\PSSupermarket_log.ldf' , SIZE = 3456KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PSSupermarket].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PSSupermarket] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PSSupermarket] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PSSupermarket] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PSSupermarket] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PSSupermarket] SET ARITHABORT OFF 
GO
ALTER DATABASE [PSSupermarket] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PSSupermarket] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [PSSupermarket] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PSSupermarket] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PSSupermarket] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PSSupermarket] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PSSupermarket] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PSSupermarket] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PSSupermarket] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PSSupermarket] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PSSupermarket] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PSSupermarket] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PSSupermarket] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PSSupermarket] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PSSupermarket] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PSSupermarket] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PSSupermarket] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PSSupermarket] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PSSupermarket] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PSSupermarket] SET  MULTI_USER 
GO
ALTER DATABASE [PSSupermarket] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PSSupermarket] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PSSupermarket] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PSSupermarket] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [PSSupermarket]
GO
/****** Object:  StoredProcedure [dbo].[ExpensesCategories]    Script Date: 12/16/2017 4:55:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[ExpensesCategories]
as
begin
select Category from Expenses
end


GO
/****** Object:  StoredProcedure [dbo].[GenerateExpenseID]    Script Date: 12/16/2017 4:55:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[GenerateExpenseID]
as
begin
select ID from Expenses where ID in (select max(ID) from Expenses)
end


GO
/****** Object:  Table [dbo].[BankInformation]    Script Date: 12/16/2017 4:55:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BankInformation](
	[ID] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[BankName] [varchar](50) NULL,
	[AccountNo] [varchar](50) NULL,
 CONSTRAINT [PK_BankInformation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BankTransactions]    Script Date: 12/16/2017 4:55:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BankTransactions](
	[ID] [int] NOT NULL,
	[BankID] [int] NULL,
	[Amount] [numeric](18, 2) NULL,
	[Date] [date] NULL,
	[Operator] [varchar](50) NULL,
	[Description] [text] NULL,
	[Type] [varchar](50) NULL,
 CONSTRAINT [PK_BankTransactions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Billing]    Script Date: 12/16/2017 4:55:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Billing](
	[ID] [int] NOT NULL,
	[InvoiceNo] [int] NULL,
	[ItemID] [int] NULL,
	[Quantity] [numeric](18, 2) NULL,
	[SellPrice] [numeric](18, 2) NULL,
	[Date] [date] NULL,
	[Discount] [numeric](18, 2) NULL,
	[Operator] [varchar](50) NULL,
	[Paid] [numeric](18, 2) NULL,
	[SubTotal] [numeric](18, 2) NULL,
	[CustomerID] [int] NULL,
	[Type] [varchar](50) NULL,
 CONSTRAINT [PK_Billing] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BillingTransport]    Script Date: 12/16/2017 4:55:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillingTransport](
	[InvoiceNo] [int] NOT NULL,
	[Amount] [numeric](18, 2) NULL,
 CONSTRAINT [PK_BillingTransport] PRIMARY KEY CLUSTERED 
(
	[InvoiceNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomerInformation]    Script Date: 12/16/2017 4:55:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomerInformation](
	[ID] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Contact] [varchar](50) NULL,
 CONSTRAINT [PK_CustomerInformation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Expenses]    Script Date: 12/16/2017 4:55:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Expenses](
	[ID] [int] NOT NULL,
	[Category] [varchar](50) NULL,
	[Amount] [numeric](18, 2) NULL,
	[Description] [text] NULL,
	[Date] [date] NULL,
	[Operator] [varchar](50) NULL,
 CONSTRAINT [PK_ExpensesInformation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 12/16/2017 4:55:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Inventory](
	[ID] [int] NOT NULL,
	[ItemCode] [varchar](50) NULL,
	[Quantity] [numeric](18, 2) NULL,
	[Cost] [numeric](18, 2) NULL,
	[SellPrice] [numeric](18, 2) NULL,
	[Alert] [int] NULL,
	[Category] [varchar](50) NULL,
	[Barcode] [image] NULL,
	[BarcodeText] [varchar](50) NULL,
 CONSTRAINT [PK_StockInformation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InvoiceInformation]    Script Date: 12/16/2017 4:55:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InvoiceInformation](
	[ID] [int] NOT NULL,
	[InvoiceNo] [int] NULL,
	[ItemID] [int] NULL,
	[Quantity] [int] NULL,
	[SellPrice] [numeric](18, 2) NULL,
	[Date] [date] NULL,
	[Discount] [numeric](18, 2) NULL,
	[Operator] [varchar](50) NULL,
	[Paid] [numeric](18, 2) NULL,
	[SubTotal] [numeric](18, 2) NULL,
	[CustomerID] [int] NULL,
	[Type] [varchar](50) NULL,
 CONSTRAINT [PK_BillingInformation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ItemInformation]    Script Date: 12/16/2017 4:55:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ItemInformation](
	[ItemCode] [varchar](50) NOT NULL,
	[Description] [varchar](50) NULL,
 CONSTRAINT [PK_ItemCodeDescription] PRIMARY KEY CLUSTERED 
(
	[ItemCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Login]    Script Date: 12/16/2017 4:55:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Login](
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[Role] [varchar](250) NULL,
	[Active] [varchar](50) NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Purchasing]    Script Date: 12/16/2017 4:55:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Purchasing](
	[ID] [int] NOT NULL,
	[PurchaseID] [int] NULL,
	[StockID] [int] NULL,
	[Quantity] [int] NULL,
	[Date] [date] NULL,
	[SupplierID] [int] NULL,
	[Operator] [varchar](50) NULL,
	[Type] [varchar](50) NULL,
	[SubTotal] [numeric](18, 2) NULL,
 CONSTRAINT [PK_PurchasingInformation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Shift]    Script Date: 12/16/2017 4:55:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Shift](
	[Date] [date] NOT NULL,
	[Start] [numeric](18, 2) NULL,
	[End] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
 CONSTRAINT [PK_Shift] PRIMARY KEY CLUSTERED 
(
	[Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SupplierInformation]    Script Date: 12/16/2017 4:55:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SupplierInformation](
	[ID] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Address] [varchar](250) NULL,
	[ContactNo] [varchar](50) NULL,
 CONSTRAINT [PK_SupplierInformation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TempBarcodePrint]    Script Date: 12/16/2017 4:55:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TempBarcodePrint](
	[ItemCode] [varchar](50) NULL,
	[Description] [varchar](50) NULL,
	[Sellprice] [numeric](18, 2) NULL,
	[Barcode] [image] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TempChart]    Script Date: 12/16/2017 4:55:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TempChart](
	[Month] [int] NULL,
	[Total] [numeric](18, 2) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TempSalesChart]    Script Date: 12/16/2017 4:55:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TempSalesChart](
	[Year] [varchar](50) NULL,
	[Month] [int] NULL,
	[Total] [numeric](18, 2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[BankTransactions]  WITH CHECK ADD  CONSTRAINT [FK_BankTransactions_BankInformation] FOREIGN KEY([BankID])
REFERENCES [dbo].[BankInformation] ([ID])
GO
ALTER TABLE [dbo].[BankTransactions] CHECK CONSTRAINT [FK_BankTransactions_BankInformation]
GO
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_ItemInformation] FOREIGN KEY([ItemCode])
REFERENCES [dbo].[ItemInformation] ([ItemCode])
GO
ALTER TABLE [dbo].[Inventory] CHECK CONSTRAINT [FK_Inventory_ItemInformation]
GO
ALTER TABLE [dbo].[InvoiceInformation]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceInformation_CustomerInformation] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[CustomerInformation] ([ID])
GO
ALTER TABLE [dbo].[InvoiceInformation] CHECK CONSTRAINT [FK_InvoiceInformation_CustomerInformation]
GO
ALTER TABLE [dbo].[InvoiceInformation]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceInformation_Inventory] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Inventory] ([ID])
GO
ALTER TABLE [dbo].[InvoiceInformation] CHECK CONSTRAINT [FK_InvoiceInformation_Inventory]
GO
ALTER TABLE [dbo].[Purchasing]  WITH CHECK ADD  CONSTRAINT [FK_Purchasing_Inventory] FOREIGN KEY([StockID])
REFERENCES [dbo].[Inventory] ([ID])
GO
ALTER TABLE [dbo].[Purchasing] CHECK CONSTRAINT [FK_Purchasing_Inventory]
GO
ALTER TABLE [dbo].[Purchasing]  WITH CHECK ADD  CONSTRAINT [FK_Purchasing_SupplierInformation] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[SupplierInformation] ([ID])
GO
ALTER TABLE [dbo].[Purchasing] CHECK CONSTRAINT [FK_Purchasing_SupplierInformation]
GO
USE [master]
GO
ALTER DATABASE [PSSupermarket] SET  READ_WRITE 
GO
