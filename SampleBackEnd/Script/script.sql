USE [master]
GO
/****** Object:  Database [StokDb]    Script Date: 11/8/2016 9:20:05 AM ******/
CREATE DATABASE [StokDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StokDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\StokDb.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'StokDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\StokDb_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [StokDb] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StokDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StokDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StokDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StokDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StokDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StokDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [StokDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StokDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StokDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StokDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StokDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StokDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StokDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StokDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StokDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StokDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StokDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StokDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StokDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StokDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StokDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StokDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StokDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StokDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StokDb] SET  MULTI_USER 
GO
ALTER DATABASE [StokDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StokDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StokDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StokDb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [StokDb] SET DELAYED_DURABILITY = DISABLED 
GO
USE [StokDb]
GO
/****** Object:  Table [dbo].[Barang]    Script Date: 11/8/2016 9:20:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Barang](
	[KodeBarang] [varchar](50) NOT NULL,
	[IdJenisMotor] [int] NOT NULL,
	[KategoriId] [int] NOT NULL,
	[Nama] [varchar](100) NOT NULL,
	[Stok] [int] NOT NULL,
	[HargaBeli] [money] NOT NULL,
	[HargaJual] [money] NOT NULL,
	[TanggalBeli] [date] NOT NULL,
 CONSTRAINT [PK_Barang] PRIMARY KEY CLUSTERED 
(
	[KodeBarang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[JenisMotor]    Script Date: 11/8/2016 9:20:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[JenisMotor](
	[IdJenisMotor] [int] IDENTITY(1,1) NOT NULL,
	[NamaMerk] [varchar](50) NOT NULL,
	[NamaJenisMotor] [varchar](100) NOT NULL,
 CONSTRAINT [PK_JenisMotor] PRIMARY KEY CLUSTERED 
(
	[IdJenisMotor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Kategori]    Script Date: 11/8/2016 9:20:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategori](
	[KategoriId] [int] IDENTITY(1,1) NOT NULL,
	[NamaKategori] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Kategori] PRIMARY KEY CLUSTERED 
(
	[KategoriId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[JenisMotor] ON 

INSERT [dbo].[JenisMotor] ([IdJenisMotor], [NamaMerk], [NamaJenisMotor]) VALUES (1, N'Honda', N'Honda Beat')
INSERT [dbo].[JenisMotor] ([IdJenisMotor], [NamaMerk], [NamaJenisMotor]) VALUES (2, N'Honda', N'Supra X')
INSERT [dbo].[JenisMotor] ([IdJenisMotor], [NamaMerk], [NamaJenisMotor]) VALUES (3, N'Yamaha', N'Mio')
SET IDENTITY_INSERT [dbo].[JenisMotor] OFF
ALTER TABLE [dbo].[Barang] ADD  CONSTRAINT [DF_Barang_Stok]  DEFAULT ((0)) FOR [Stok]
GO
ALTER TABLE [dbo].[Barang] ADD  CONSTRAINT [DF_Barang_HargaBeli]  DEFAULT ((0)) FOR [HargaBeli]
GO
ALTER TABLE [dbo].[Barang] ADD  CONSTRAINT [DF_Barang_HargaJual]  DEFAULT ((0)) FOR [HargaJual]
GO
ALTER TABLE [dbo].[Barang] ADD  CONSTRAINT [DF_Barang_TanggalBeli]  DEFAULT (getdate()) FOR [TanggalBeli]
GO
ALTER TABLE [dbo].[Barang]  WITH CHECK ADD  CONSTRAINT [FK_Barang_Kategori] FOREIGN KEY([IdJenisMotor])
REFERENCES [dbo].[JenisMotor] ([IdJenisMotor])
GO
ALTER TABLE [dbo].[Barang] CHECK CONSTRAINT [FK_Barang_Kategori]
GO
ALTER TABLE [dbo].[Barang]  WITH CHECK ADD  CONSTRAINT [FK_Barang_Kategori1] FOREIGN KEY([KategoriId])
REFERENCES [dbo].[Kategori] ([KategoriId])
GO
ALTER TABLE [dbo].[Barang] CHECK CONSTRAINT [FK_Barang_Kategori1]
GO
USE [master]
GO
ALTER DATABASE [StokDb] SET  READ_WRITE 
GO
