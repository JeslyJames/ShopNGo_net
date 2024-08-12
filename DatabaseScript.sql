USE [master]
GO
/****** Object:  Database [ShopNGo]    Script Date: 8/11/2024 6:32:35 PM ******/
CREATE DATABASE [ShopNGo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShopNgo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ShopNgo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShopNgo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ShopNgo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ShopNGo] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopNGo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopNGo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopNGo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopNGo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopNGo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopNGo] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopNGo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShopNGo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopNGo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopNGo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopNGo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopNGo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopNGo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopNGo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopNGo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopNGo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ShopNGo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopNGo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopNGo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopNGo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopNGo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopNGo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopNGo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopNGo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShopNGo] SET  MULTI_USER 
GO
ALTER DATABASE [ShopNGo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopNGo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopNGo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopNGo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShopNGo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShopNGo] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ShopNGo] SET QUERY_STORE = ON
GO
ALTER DATABASE [ShopNGo] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ShopNGo]
GO
/** Object:  Table [dbo].[Addresses]    Script Date: 8/11/2024 6:32:35 PM **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[address_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[street] [varchar](255) NOT NULL,
	[city] [varchar](255) NOT NULL,
	[state] [varchar](255) NOT NULL,
	[postal_code] [varchar](20) NOT NULL,
	[country] [varchar](255) NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/** Object:  Table [dbo].[Cart]    Script Date: 8/11/2024 6:32:35 PM **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[cart_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cart_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/** Object:  Table [dbo].[CartItems]    Script Date: 8/11/2024 6:32:35 PM **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItems](
	[cart_item_id] [int] IDENTITY(1,1) NOT NULL,
	[cart_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [decimal](10, 2) NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[cart_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/** Object:  Table [dbo].[Carts]    Script Date: 8/11/2024 6:32:35 PM **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[cart_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[cart_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/** Object:  Table [dbo].[Categories]    Script Date: 8/11/2024 6:32:35 PM **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [varchar](255) NOT NULL,
	[description] [text] NULL,
	[image_url] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/** Object:  Table [dbo].[News]    Script Date: 8/11/2024 6:32:35 PM **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[news_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[date] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[news_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/** Object:  Table [dbo].[OrderItems]    Script Date: 8/11/2024 6:32:35 PM **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[order_item_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [decimal](10, 2) NOT NULL,
	[created_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/** Object:  Table [dbo].[Orders]    Script Date: 8/11/2024 6:32:35 PM **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[total_price] [decimal](10, 2) NOT NULL,
	[status] [varchar](50) NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/** Object:  Table [dbo].[Products]    Script Date: 8/11/2024 6:32:35 PM **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[description] [text] NULL,
	[price] [decimal](10, 2) NOT NULL,
	[stock_quantity] [int] NOT NULL,
	[category_id] [int] NULL,
	[image_url] [varchar](255) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[original_price] [decimal](10, 2) NULL,
	[sale_price] [decimal](10, 2) NULL,
	[stock] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/** Object:  Table [dbo].[Users]    Script Date: 8/11/2024 6:32:35 PM **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](255) NOT NULL,
	[password_hash] [varchar](255) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[first_name] [varchar](255) NULL,
	[last_name] [varchar](255) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Addresses] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Addresses] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[CartItems] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[CartItems] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[Carts] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Carts] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[OrderItems] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
-- Add foreign key constraints with ON DELETE CASCADE
ALTER TABLE [dbo].[Cart] ADD CONSTRAINT FK_Cart_product_id FOREIGN KEY([product_id]) REFERENCES [dbo].[Products]([product_id]) ON DELETE CASCADE;
ALTER TABLE [dbo].[CartItems] ADD CONSTRAINT FK_CartItems_cart_id FOREIGN KEY([cart_id]) REFERENCES [dbo].[Carts]([cart_id]) ON DELETE CASCADE;
ALTER TABLE [dbo].[CartItems] ADD CONSTRAINT FK_CartItems_product_id FOREIGN KEY([product_id]) REFERENCES [dbo].[Products]([product_id]) ON DELETE CASCADE;
ALTER TABLE [dbo].[OrderItems] ADD CONSTRAINT FK_OrderItems_order_id FOREIGN KEY([order_id]) REFERENCES [dbo].[Orders]([order_id]) ON DELETE CASCADE;
ALTER TABLE [dbo].[OrderItems] ADD CONSTRAINT FK_OrderItems_product_id FOREIGN KEY([product_id]) REFERENCES [dbo].[Products]([product_id]) ON DELETE CASCADE;
ALTER TABLE [dbo].[Products] ADD CONSTRAINT FK_Products_category_id FOREIGN KEY([category_id]) REFERENCES [dbo].[Categories]([category_id]) ON DELETE CASCADE;

-- Foreign key constraints that don't need modification
ALTER TABLE [dbo].[Cart] ADD CONSTRAINT FK_Cart_user_id FOREIGN KEY([user_id]) REFERENCES [dbo].[Users]([user_id]);
ALTER TABLE [dbo].[Addresses] ADD CONSTRAINT FK_Addresses_user_id FOREIGN KEY([user_id]) REFERENCES [dbo].[Users]([user_id]);
ALTER TABLE [dbo].[Carts] ADD CONSTRAINT FK_Carts_user_id FOREIGN KEY([user_id]) REFERENCES [dbo].[Users]([user_id]);
ALTER TABLE [dbo].[Orders] ADD CONSTRAINT FK_Orders_user_id FOREIGN KEY([user_id]) REFERENCES [dbo].[Users]([user_id]);

GO
USE [master]
GO
ALTER DATABASE [ShopNGo] SET  READ_WRITE 
GO