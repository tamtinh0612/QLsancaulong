USE [master]
GO
/****** Object:  Database [ql_sancaulong]    Script Date: 8/10/2021 11:16:34 PM ******/
CREATE DATABASE [ql_sancaulong]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ql_sancaulong', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ql_sancaulong.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ql_sancaulong_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ql_sancaulong_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ql_sancaulong] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ql_sancaulong].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ql_sancaulong] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ql_sancaulong] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ql_sancaulong] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ql_sancaulong] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ql_sancaulong] SET ARITHABORT OFF 
GO
ALTER DATABASE [ql_sancaulong] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ql_sancaulong] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ql_sancaulong] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ql_sancaulong] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ql_sancaulong] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ql_sancaulong] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ql_sancaulong] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ql_sancaulong] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ql_sancaulong] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ql_sancaulong] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ql_sancaulong] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ql_sancaulong] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ql_sancaulong] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ql_sancaulong] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ql_sancaulong] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ql_sancaulong] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ql_sancaulong] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ql_sancaulong] SET RECOVERY FULL 
GO
ALTER DATABASE [ql_sancaulong] SET  MULTI_USER 
GO
ALTER DATABASE [ql_sancaulong] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ql_sancaulong] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ql_sancaulong] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ql_sancaulong] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ql_sancaulong] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ql_sancaulong] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ql_sancaulong] SET QUERY_STORE = OFF
GO
USE [ql_sancaulong]
GO
/****** Object:  Table [dbo].[Khachhang]    Script Date: 8/10/2021 11:16:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Khachhang](
	[Hovaten] [nvarchar](50) NULL,
	[cmnd] [varchar](20) NOT NULL,
	[sdt] [varchar](20) NULL,
 CONSTRAINT [PK_Khachhang] PRIMARY KEY CLUSTERED 
(
	[cmnd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThongTinDatSan]    Script Date: 8/10/2021 11:16:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongTinDatSan](
	[cmndKhach] [varchar](20) NOT NULL,
	[trangthai] [nvarchar](50) NULL,
	[tgbatdau] [time](7) NULL,
	[tgketthuc] [time](7) NULL,
	[dattu] [varchar](10) NOT NULL,
	[dattoi] [varchar](10) NOT NULL,
	[ngaydat] [date] NOT NULL,
	[sosan] [int] NOT NULL,
	[thanhtoan] [float] NULL,
 CONSTRAINT [PK_ThongTinDatSan] PRIMARY KEY CLUSTERED 
(
	[cmndKhach] ASC,
	[dattu] ASC,
	[dattoi] ASC,
	[ngaydat] ASC,
	[sosan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_report]    Script Date: 8/10/2021 11:16:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_report]
AS
SELECT dbo.Khachhang.Hovaten, dbo.Khachhang.cmnd, dbo.Khachhang.sdt, dbo.ThongTinDatSan.tgbatdau, dbo.ThongTinDatSan.tgketthuc, dbo.ThongTinDatSan.ngaydat, dbo.ThongTinDatSan.dattu, dbo.ThongTinDatSan.dattoi, 
                  dbo.ThongTinDatSan.sosan, dbo.ThongTinDatSan.thanhtoan
FROM     dbo.Khachhang INNER JOIN
                  dbo.ThongTinDatSan ON dbo.Khachhang.cmnd = dbo.ThongTinDatSan.cmndKhach
GO
/****** Object:  Table [dbo].[HOADONDATSAN]    Script Date: 8/10/2021 11:16:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOADONDATSAN](
	[mahd] [varchar](10) NOT NULL,
	[hovanten] [nvarchar](50) NULL,
	[sanso] [varchar](10) NULL,
	[ngaydat] [varchar](20) NULL,
	[tgbatdau] [varchar](20) NULL,
	[tgketthuc] [varchar](20) NULL,
	[thanhtien] [varchar](20) NULL,
 CONSTRAINT [PK_HOADONDATSAN] PRIMARY KEY CLUSTERED 
(
	[mahd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_3]    Script Date: 8/10/2021 11:16:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_3]
AS
SELECT dbo.HOADONDATSAN.*
FROM     dbo.HOADONDATSAN
GO
/****** Object:  View [dbo].[View_1]    Script Date: 8/10/2021 11:16:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_1]
AS
SELECT Hoten, sdt
FROM     dbo.ThongTin
GO
/****** Object:  View [dbo].[View_2]    Script Date: 8/10/2021 11:16:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_2]
AS
SELECT mahd, hovanten, sanso, ngaydat, tgbatdau, tgketthuc, thanhtien
FROM     dbo.HOADON
GO
/****** Object:  Table [dbo].[BANGHOADON]    Script Date: 8/10/2021 11:16:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BANGHOADON](
	[MAHD] [varchar](20) NOT NULL,
	[MADATSAN] [varchar](20) NULL,
	[CMND] [varchar](20) NULL,
 CONSTRAINT [PK_BANGHOADON] PRIMARY KEY CLUSTERED 
(
	[MAHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BANGKHACHHANG]    Script Date: 8/10/2021 11:16:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BANGKHACHHANG](
	[CMND] [varchar](20) NOT NULL,
	[HOVATEN] [nvarchar](20) NULL,
	[SDT] [varchar](20) NULL,
 CONSTRAINT [PK_BANGKHACHHANG] PRIMARY KEY CLUSTERED 
(
	[CMND] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BANGTTDATSAN]    Script Date: 8/10/2021 11:16:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BANGTTDATSAN](
	[CMND] [varchar](20) NULL,
	[TRANGTHAI] [nvarchar](20) NULL,
	[TGBATDAU] [time](7) NULL,
	[TGKETTHUC] [time](7) NULL,
	[DATTU] [varchar](20) NULL,
	[DATTOI] [varchar](20) NULL,
	[NGAYDAT] [date] NULL,
	[SOSAN] [int] NULL,
	[THANHTOAN] [money] NULL,
	[MADATSAN] [varchar](20) NOT NULL,
 CONSTRAINT [PK_BANGTTDATSAN] PRIMARY KEY CLUSTERED 
(
	[MADATSAN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[HOADONDATSAN] ([mahd], [hovanten], [sanso], [ngaydat], [tgbatdau], [tgketthuc], [thanhtien]) VALUES (N'0', N'Nguyen Van A', N'1', N'2/3/2021 12:00:00 AM', N'18:38:23.8417785', N'23:03:08.2074990', N'264739.428675')
GO
INSERT [dbo].[HOADONDATSAN] ([mahd], [hovanten], [sanso], [ngaydat], [tgbatdau], [tgketthuc], [thanhtien]) VALUES (N'1', N'Nguyen Van A', N'1', N'2/3/2021 12:00:00 AM', N'18:38:23.8417785', N'23:03:08.2074990', N'264739.428675')
GO
INSERT [dbo].[HOADONDATSAN] ([mahd], [hovanten], [sanso], [ngaydat], [tgbatdau], [tgketthuc], [thanhtien]) VALUES (N'10', N'Nguyen Van A', N'1', N'4/24/2021 3:00:55 PM', N'14:57:44.9883593', N'14:57:48.1873510', N'53.3165283333333')
GO
INSERT [dbo].[HOADONDATSAN] ([mahd], [hovanten], [sanso], [ngaydat], [tgbatdau], [tgketthuc], [thanhtien]) VALUES (N'11', N'Nguyen Van B', N'3', N'4/5/2021 12:00:00 AM', N'12:57:30.9688080', N'12:56:56.6354931', N'111.691606666667')
GO
INSERT [dbo].[HOADONDATSAN] ([mahd], [hovanten], [sanso], [ngaydat], [tgbatdau], [tgketthuc], [thanhtien]) VALUES (N'12', N'Nguyen Van B', N'3', N'4/5/2021 12:00:00 AM', N'12:57:30.9688080', N'12:56:56.6354931', N'111.691606666667')
GO
INSERT [dbo].[HOADONDATSAN] ([mahd], [hovanten], [sanso], [ngaydat], [tgbatdau], [tgketthuc], [thanhtien]) VALUES (N'13', N'Nguyen aaaaaaaaaaaaaaaaaa', N'2', N'29/04/2021', N'15:13:53.3378013', N'15:13:55.5259583', N'913925.432638333')
GO
INSERT [dbo].[HOADONDATSAN] ([mahd], [hovanten], [sanso], [ngaydat], [tgbatdau], [tgketthuc], [thanhtien]) VALUES (N'14', N'Nguyen Van A', N'3', N'28/04/2021', N'', N'', N'0')
GO
INSERT [dbo].[HOADONDATSAN] ([mahd], [hovanten], [sanso], [ngaydat], [tgbatdau], [tgketthuc], [thanhtien]) VALUES (N'15', N'LAST', N'3', N'28/04/2021', N'15:25:31.8718745', N'15:25:34.1485201', N'925569.142001667')
GO
INSERT [dbo].[HOADONDATSAN] ([mahd], [hovanten], [sanso], [ngaydat], [tgbatdau], [tgketthuc], [thanhtien]) VALUES (N'16', N'LAST', N'3', N'28/04/2021', N'15:25:31.8718745', N'15:25:34.1485201', N'925569.142001667')
GO
INSERT [dbo].[HOADONDATSAN] ([mahd], [hovanten], [sanso], [ngaydat], [tgbatdau], [tgketthuc], [thanhtien]) VALUES (N'17', N'nGUYEN pHAM MINHTRIET', N'1', N'19/05/2021', N'15:39:19.2867865', N'15:39:26.0637413', N'112.949246666667')
GO
INSERT [dbo].[HOADONDATSAN] ([mahd], [hovanten], [sanso], [ngaydat], [tgbatdau], [tgketthuc], [thanhtien]) VALUES (N'18', N'Nguyen Van A', N'1', N'23/04/2021', N'14:57:44.9883593', N'14:57:48.1873510', N'53.3165283333333')
GO
INSERT [dbo].[HOADONDATSAN] ([mahd], [hovanten], [sanso], [ngaydat], [tgbatdau], [tgketthuc], [thanhtien]) VALUES (N'19', N'nGUYEN pHAM MINHTRIET', N'1', N'19/05/2021', N'15:39:19.2867865', N'15:39:26.0637413', N'112.949246666667')
GO
INSERT [dbo].[HOADONDATSAN] ([mahd], [hovanten], [sanso], [ngaydat], [tgbatdau], [tgketthuc], [thanhtien]) VALUES (N'2', N'Nguyen Van A', N'1', N'4/22/2021 9:34:31 AM', N'18:38:23.8417785', N'23:03:08.2074990', N'264739.428675')
GO
INSERT [dbo].[HOADONDATSAN] ([mahd], [hovanten], [sanso], [ngaydat], [tgbatdau], [tgketthuc], [thanhtien]) VALUES (N'3', N'Nguyen Van A', N'1', N'4/22/2021 9:34:51 AM', N'18:38:23.8417785', N'23:03:08.2074990', N'264739.428675')
GO
INSERT [dbo].[HOADONDATSAN] ([mahd], [hovanten], [sanso], [ngaydat], [tgbatdau], [tgketthuc], [thanhtien]) VALUES (N'4', N'Nguyen Van A', N'1', N'4/22/2021 9:37:37 AM', N'18:38:23.8417785', N'23:03:08.2074990', N'264739.428675')
GO
INSERT [dbo].[HOADONDATSAN] ([mahd], [hovanten], [sanso], [ngaydat], [tgbatdau], [tgketthuc], [thanhtien]) VALUES (N'5', N'Nguyen Van A', N'3', N'4/5/2021 12:00:00 AM', N'18:38:23.8417785', N'23:03:08.2074990', N'264739.428675')
GO
INSERT [dbo].[HOADONDATSAN] ([mahd], [hovanten], [sanso], [ngaydat], [tgbatdau], [tgketthuc], [thanhtien]) VALUES (N'6', N'Nguyen Van A', N'1', N'5/4/2021 12:00:00 AM', N'18:38:23.8417785', N'23:03:08.2074990', N'264739.428675')
GO
INSERT [dbo].[HOADONDATSAN] ([mahd], [hovanten], [sanso], [ngaydat], [tgbatdau], [tgketthuc], [thanhtien]) VALUES (N'7', N'Nguyen Van B', N'3', N'4/5/2021 12:00:00 AM', N'12:57:30.9688080', N'12:56:56.6354931', N'111.691606666667')
GO
INSERT [dbo].[HOADONDATSAN] ([mahd], [hovanten], [sanso], [ngaydat], [tgbatdau], [tgketthuc], [thanhtien]) VALUES (N'8', N'Nguyen Van A', N'2', N'4/5/2021 12:00:00 AM', N'11:01:13.2167726', N'11:01:17.2861733', N'67.823345')
GO
INSERT [dbo].[HOADONDATSAN] ([mahd], [hovanten], [sanso], [ngaydat], [tgbatdau], [tgketthuc], [thanhtien]) VALUES (N'9', N'Nguyen Van A', N'1', N'4/24/2021 2:29:09 PM', N'18:38:23.8417785', N'23:03:08.2074990', N'264739.428675')
GO
INSERT [dbo].[Khachhang] ([Hovaten], [cmnd], [sdt]) VALUES (N'Nguyen Thi C', N'', N'')
GO
INSERT [dbo].[Khachhang] ([Hovaten], [cmnd], [sdt]) VALUES (N'Nguyen Van A', N'123', N'123')
GO
INSERT [dbo].[Khachhang] ([Hovaten], [cmnd], [sdt]) VALUES (N'nGUYEN pHAM MINHTRIET', N'177', N'41412412')
GO
INSERT [dbo].[Khachhang] ([Hovaten], [cmnd], [sdt]) VALUES (N'LAST', N'222', N'34324')
GO
INSERT [dbo].[Khachhang] ([Hovaten], [cmnd], [sdt]) VALUES (N'Nguyen Van B', N'234', N'234')
GO
INSERT [dbo].[Khachhang] ([Hovaten], [cmnd], [sdt]) VALUES (N'Nguyen aaaaaaaaaaaaaaaaaa', N'271', N'0387932')
GO
INSERT [dbo].[Khachhang] ([Hovaten], [cmnd], [sdt]) VALUES (N'Nguyen Pham Minh Triet', N'2738271', N'0193838')
GO
INSERT [dbo].[Khachhang] ([Hovaten], [cmnd], [sdt]) VALUES (N'Nguyen Van Trrrr', N'281', N'0828733')
GO
INSERT [dbo].[Khachhang] ([Hovaten], [cmnd], [sdt]) VALUES (N'Nguyen Van C', N'345', N'567')
GO
INSERT [dbo].[Khachhang] ([Hovaten], [cmnd], [sdt]) VALUES (N'Nguyen', N'6577', N'23')
GO
INSERT [dbo].[ThongTinDatSan] ([cmndKhach], [trangthai], [tgbatdau], [tgketthuc], [dattu], [dattoi], [ngaydat], [sosan], [thanhtoan]) VALUES (N'123', N'đã đặt', NULL, NULL, N'14', N'16', CAST(N'2021-04-30' AS Date), 2, 0)
GO
INSERT [dbo].[ThongTinDatSan] ([cmndKhach], [trangthai], [tgbatdau], [tgketthuc], [dattu], [dattoi], [ngaydat], [sosan], [thanhtoan]) VALUES (N'123', N'Đã thanh toán', CAST(N'18:38:23.8417785' AS Time), CAST(N'23:03:08.2074990' AS Time), N'1600', N'1700', CAST(N'2021-02-03' AS Date), 1, 264739.428675)
GO
INSERT [dbo].[ThongTinDatSan] ([cmndKhach], [trangthai], [tgbatdau], [tgketthuc], [dattu], [dattoi], [ngaydat], [sosan], [thanhtoan]) VALUES (N'123', N'Đã thanh toán', CAST(N'14:57:44.9883593' AS Time), CAST(N'14:57:48.1873510' AS Time), N'1600', N'1700', CAST(N'2021-04-23' AS Date), 1, 53.3165283333333)
GO
INSERT [dbo].[ThongTinDatSan] ([cmndKhach], [trangthai], [tgbatdau], [tgketthuc], [dattu], [dattoi], [ngaydat], [sosan], [thanhtoan]) VALUES (N'123', N'Đã thanh toán', CAST(N'11:01:13.2167726' AS Time), CAST(N'11:01:17.2861733' AS Time), N'1630', N'1730', CAST(N'2021-04-05' AS Date), 2, 67.823345)
GO
INSERT [dbo].[ThongTinDatSan] ([cmndKhach], [trangthai], [tgbatdau], [tgketthuc], [dattu], [dattoi], [ngaydat], [sosan], [thanhtoan]) VALUES (N'123', N'Đã thanh toán', CAST(N'15:07:55.0519949' AS Time), CAST(N'15:07:58.7614512' AS Time), N'22', N'24', CAST(N'2021-04-24' AS Date), 3, 61.8242716666667)
GO
INSERT [dbo].[ThongTinDatSan] ([cmndKhach], [trangthai], [tgbatdau], [tgketthuc], [dattu], [dattoi], [ngaydat], [sosan], [thanhtoan]) VALUES (N'123', N'đã đặt', NULL, NULL, N'23', N'3233', CAST(N'2021-04-22' AS Date), 3, 0)
GO
INSERT [dbo].[ThongTinDatSan] ([cmndKhach], [trangthai], [tgbatdau], [tgketthuc], [dattu], [dattoi], [ngaydat], [sosan], [thanhtoan]) VALUES (N'123', N'đã đặt', NULL, NULL, N'32', N'222', CAST(N'2021-04-28' AS Date), 1, 0)
GO
INSERT [dbo].[ThongTinDatSan] ([cmndKhach], [trangthai], [tgbatdau], [tgketthuc], [dattu], [dattoi], [ngaydat], [sosan], [thanhtoan]) VALUES (N'177', N'Đã thanh toán', CAST(N'15:39:19.2867865' AS Time), CAST(N'15:39:26.0637413' AS Time), N'17', N'19', CAST(N'2021-05-19' AS Date), 1, 112.949246666667)
GO
INSERT [dbo].[ThongTinDatSan] ([cmndKhach], [trangthai], [tgbatdau], [tgketthuc], [dattu], [dattoi], [ngaydat], [sosan], [thanhtoan]) VALUES (N'222', N'Đã thanh toán', CAST(N'15:25:31.8718745' AS Time), CAST(N'15:25:34.1485201' AS Time), N'15', N'16', CAST(N'2021-04-28' AS Date), 3, 925569.142001667)
GO
INSERT [dbo].[ThongTinDatSan] ([cmndKhach], [trangthai], [tgbatdau], [tgketthuc], [dattu], [dattoi], [ngaydat], [sosan], [thanhtoan]) VALUES (N'222', N'đã đặt', NULL, NULL, N'15', N'17', CAST(N'2021-04-24' AS Date), 1, 0)
GO
INSERT [dbo].[ThongTinDatSan] ([cmndKhach], [trangthai], [tgbatdau], [tgketthuc], [dattu], [dattoi], [ngaydat], [sosan], [thanhtoan]) VALUES (N'234', N'Đã thanh toán', CAST(N'12:57:30.9688080' AS Time), CAST(N'12:56:56.6354931' AS Time), N'1600', N'1700', CAST(N'2021-04-05' AS Date), 3, 111.691606666667)
GO
INSERT [dbo].[ThongTinDatSan] ([cmndKhach], [trangthai], [tgbatdau], [tgketthuc], [dattu], [dattoi], [ngaydat], [sosan], [thanhtoan]) VALUES (N'271', N'Đã thanh toán', CAST(N'15:20:29.5490959' AS Time), CAST(N'15:20:36.7132597' AS Time), N'13', N'14', CAST(N'2021-04-22' AS Date), 1, 119.40273)
GO
INSERT [dbo].[ThongTinDatSan] ([cmndKhach], [trangthai], [tgbatdau], [tgketthuc], [dattu], [dattoi], [ngaydat], [sosan], [thanhtoan]) VALUES (N'271', N'Đã thanh toán', CAST(N'15:15:13.5444353' AS Time), CAST(N'15:15:16.0041875' AS Time), N'14', N'15', CAST(N'2021-04-24' AS Date), 3, 915266.736458333)
GO
INSERT [dbo].[ThongTinDatSan] ([cmndKhach], [trangthai], [tgbatdau], [tgketthuc], [dattu], [dattoi], [ngaydat], [sosan], [thanhtoan]) VALUES (N'271', N'Đã thanh toán', CAST(N'15:13:53.3378013' AS Time), CAST(N'15:13:55.5259583' AS Time), N'14', N'16', CAST(N'2021-04-29' AS Date), 2, 913925.432638333)
GO
INSERT [dbo].[ThongTinDatSan] ([cmndKhach], [trangthai], [tgbatdau], [tgketthuc], [dattu], [dattoi], [ngaydat], [sosan], [thanhtoan]) VALUES (N'281', N'Đã thanh toán', CAST(N'15:09:54.0107148' AS Time), CAST(N'15:09:57.2010805' AS Time), N'15', N'17', CAST(N'2021-04-28' AS Date), 3, 53.1727616666667)
GO
INSERT [dbo].[ThongTinDatSan] ([cmndKhach], [trangthai], [tgbatdau], [tgketthuc], [dattu], [dattoi], [ngaydat], [sosan], [thanhtoan]) VALUES (N'345', N'Đã thanh toán', CAST(N'12:57:38.7211304' AS Time), CAST(N'12:57:52.8222905' AS Time), N'1700', N'1800', CAST(N'2021-05-04' AS Date), 1, 235.019335)
GO
ALTER TABLE [dbo].[ThongTinDatSan] ADD  CONSTRAINT [DF_ThongTinDatSan_trangthai]  DEFAULT (N'đã đặt') FOR [trangthai]
GO
ALTER TABLE [dbo].[ThongTinDatSan] ADD  CONSTRAINT [DF_ThongTinDatSan_thanhtoan]  DEFAULT ((0)) FOR [thanhtoan]
GO
ALTER TABLE [dbo].[BANGHOADON]  WITH CHECK ADD  CONSTRAINT [FK_BANGHOADON_BANGKHACHHANG] FOREIGN KEY([CMND])
REFERENCES [dbo].[BANGKHACHHANG] ([CMND])
GO
ALTER TABLE [dbo].[BANGHOADON] CHECK CONSTRAINT [FK_BANGHOADON_BANGKHACHHANG]
GO
ALTER TABLE [dbo].[BANGHOADON]  WITH CHECK ADD  CONSTRAINT [FK_BANGHOADON_BANGTTDATSAN] FOREIGN KEY([MADATSAN])
REFERENCES [dbo].[BANGTTDATSAN] ([MADATSAN])
GO
ALTER TABLE [dbo].[BANGHOADON] CHECK CONSTRAINT [FK_BANGHOADON_BANGTTDATSAN]
GO
ALTER TABLE [dbo].[BANGTTDATSAN]  WITH CHECK ADD  CONSTRAINT [FK_BANGTTDATSAN_BANGKHACHHANG] FOREIGN KEY([CMND])
REFERENCES [dbo].[BANGKHACHHANG] ([CMND])
GO
ALTER TABLE [dbo].[BANGTTDATSAN] CHECK CONSTRAINT [FK_BANGTTDATSAN_BANGKHACHHANG]
GO
ALTER TABLE [dbo].[ThongTinDatSan]  WITH CHECK ADD  CONSTRAINT [FK_ThongTinDatSan_Khachhang] FOREIGN KEY([cmndKhach])
REFERENCES [dbo].[Khachhang] ([cmnd])
GO
ALTER TABLE [dbo].[ThongTinDatSan] CHECK CONSTRAINT [FK_ThongTinDatSan_Khachhang]
GO
/****** Object:  StoredProcedure [dbo].[get_all_data]    Script Date: 8/10/2021 11:16:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[get_all_data] 
AS
BEGIN
	select N'Họ và tên' = Hovaten, N'Số sân' =sosan, N'Ngày đặt' =ngaydat, N'Đặt từ' =dattu, N'Đặt tới' =dattoi,N'Trạng thái'= trangthai 
	from ThongTinDatSan INFOR, Khachhang KH
	where INFOR.cmndKhach = KH.cmnd
END
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_datsan]    Script Date: 8/10/2021 11:16:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_delete_datsan] @cmnd varchar(20), @sanso int, 
@ngaydat date, @dattu varchar(10), @datoi varchar(10)
AS
BEGIN
	delete from ThongTinDatSan
	where ngaydat = @ngaydat and dattu = @dattu and dattoi = @datoi
	and sosan = @sanso and cmndKhach = @cmnd
END
GO
/****** Object:  StoredProcedure [dbo].[sp_find_khachhang]    Script Date: 8/10/2021 11:16:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_find_khachhang] @cmnd varchar(20)
AS
BEGIN
	select *
	from Khachhang KH
	where kh.cmnd = @cmnd
END
GO
/****** Object:  StoredProcedure [dbo].[sp_find_thongtin]    Script Date: 8/10/2021 11:16:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_find_thongtin] 
AS
BEGIN
	select N'Họ và tên' = KH.Hovaten, N'Số sân' =Thongtin.sosan,
			N'Bắt đầu' =Thongtin.tgbatdau, N'Kết thúc' =Thongtin.tgketthuc,N'Trạng thái'= trangthai ,
			sdt, cmnd, dattu, dattoi, ngaydat, thanhtoan
	from Khachhang KH, ThongTinDatSan Thongtin
	where KH.cmnd = Thongtin.cmndKhach
END
GO
/****** Object:  StoredProcedure [dbo].[sp_find_thongtintheosdt]    Script Date: 8/10/2021 11:16:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_find_thongtintheosdt] @sdt varchar(20) 
AS
BEGIN
	select N'Họ và tên' = KH.Hovaten, N'Số sân' =Thongtin.sosan,
			N'Bắt đầu' =Thongtin.tgbatdau, N'Kết thúc' =Thongtin.tgketthuc,N'Trạng thái'= trangthai ,
			sdt, cmnd, dattu, dattoi, ngaydat
	from Khachhang KH, ThongTinDatSan Thongtin
	where KH.sdt = @sdt
	and kh.cmnd = Thongtin.cmndKhach
END
GO
/****** Object:  StoredProcedure [dbo].[sp_find_thongtintheoten]    Script Date: 8/10/2021 11:16:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_find_thongtintheoten] @ten nvarchar(50) 
AS
BEGIN
	select N'Họ và tên' = KH.Hovaten, N'Số sân' =Thongtin.sosan,
			N'Bắt đầu' =Thongtin.tgbatdau, N'Kết thúc' =Thongtin.tgketthuc,N'Trạng thái'= trangthai ,
			sdt, cmnd, dattu, dattoi, ngaydat
	from Khachhang KH, ThongTinDatSan Thongtin
	where KH.Hovaten = @ten
	and kh.cmnd = Thongtin.cmndKhach
END
GO
/****** Object:  StoredProcedure [dbo].[sp_getallHOADON]    Script Date: 8/10/2021 11:16:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_getallHOADON]
AS
BEGIN
	select *
	from HOADONDATSAN
END
GO
/****** Object:  StoredProcedure [dbo].[sp_getthongtin]    Script Date: 8/10/2021 11:16:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_getthongtin] @cmnd varchar(20), @sanso int, 
@ngaydat date, @dattu varchar(10), @dattoi varchar(10)
AS
BEGIN
	select * 
	from ThongTinDatSan, Khachhang
	where ngaydat = @ngaydat and dattu = @dattu and dattoi = @dattoi
	and sosan = @sanso and cmndKhach = @cmnd and Khachhang.cmnd = ThongTinDatSan.cmndKhach
END
GO
/****** Object:  StoredProcedure [dbo].[sp_getthongtinbaocaofull]    Script Date: 8/10/2021 11:16:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_getthongtinbaocaofull] @ngay int, @thang int, @nam int
AS
BEGIN
	select *
	from ThongTinDatSan, Khachhang
	where Khachhang.cmnd = ThongTinDatSan.cmndKhach
	and day(ngaydat) = @ngay
	and month(ngaydat) = @thang
	and year(ngaydat) = @nam
END
GO
/****** Object:  StoredProcedure [dbo].[sp_getthongtinbaocaonam]    Script Date: 8/10/2021 11:16:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_getthongtinbaocaonam] @nam int
AS
BEGIN
	select *
	from ThongTinDatSan, Khachhang
	where Khachhang.cmnd = ThongTinDatSan.cmndKhach
	and year(ngaydat) = @nam
END
GO
/****** Object:  StoredProcedure [dbo].[sp_getthongtinbaocaothang]    Script Date: 8/10/2021 11:16:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_getthongtinbaocaothang] @thang int, @nam int
AS
BEGIN
	select *
	from ThongTinDatSan, Khachhang
	where Khachhang.cmnd = ThongTinDatSan.cmndKhach
	and month(ngaydat) = @thang
	and year(ngaydat) = @nam
END
GO
/****** Object:  StoredProcedure [dbo].[sp_getthongtinwithcmnd]    Script Date: 8/10/2021 11:16:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_getthongtinwithcmnd] @cmnd varchar(20)
AS
BEGIN
	select N'Họ và tên' = Hovaten, N'Số sân' =sosan,
			N'Bắt đầu' =tgbatdau, N'Kết thúc' =tgketthuc,N'Trạng thái'= trangthai ,
			sdt, cmnd, dattu, dattoi, ngaydat 
	from ThongTinDatSan, Khachhang
	where cmndKhach = @cmnd and Khachhang.cmnd = ThongTinDatSan.cmndKhach
END
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_datsan]    Script Date: 8/10/2021 11:16:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insert_datsan] @cmnd varchar(20), @sanso int, @ngaydat date, @dattu varchar(10), @datoi varchar(10)
AS
BEGIN
	insert into ThongTinDatSan(cmndKhach, sosan, ngaydat, dattu, dattoi) values (@cmnd, @sanso, @ngaydat, @dattu, @datoi)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_khachhang]    Script Date: 8/10/2021 11:16:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insert_khachhang] @cmnd varchar(20), @hovaten nvarchar(50), @sdt varchar(20)
AS
BEGIN
	insert into Khachhang(Hovaten, cmnd, sdt) values (@hovaten, @cmnd, @sdt)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_thanhtoan]    Script Date: 8/10/2021 11:16:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_thanhtoan] @tgkt time, @cmndKhach varchar(20), @ngaydat date, 
@sosan int,@dattu varchar(10), @dattoi varchar(10), @tongtien float
AS
BEGIN
	update ThongTinDatSan
	set tgketthuc = @tgkt, trangthai = N'Đã thanh toán', thanhtoan = @tongtien
	where cmndKhach = @cmndKhach
	and ngaydat = @ngaydat
	and dattu = @dattu
	and dattoi = @dattoi
	and sosan = @sosan
END
GO
/****** Object:  StoredProcedure [dbo].[sp_update_tgbatdau]    Script Date: 8/10/2021 11:16:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_update_tgbatdau] @tgbd time, @cmndKhach varchar(20), @ngaydat date, 
@sosan int,@dattu varchar(10), @dattoi varchar(10)
AS
BEGIN
	update ThongTinDatSan
	set tgbatdau = @tgbd
	where cmndKhach = @cmndKhach
	and ngaydat = @ngaydat
	and dattu = @dattu
	and dattoi = @dattoi
	and sosan = @sosan
END
GO
/****** Object:  StoredProcedure [dbo].[sp_update_tgketthuc]    Script Date: 8/10/2021 11:16:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_update_tgketthuc] @tgkt time, @cmndKhach varchar(20), @ngaydat date, 
@sosan int,@dattu varchar(10), @dattoi varchar(10)
AS
BEGIN
	update ThongTinDatSan
	set tgketthuc = @tgkt
	where cmndKhach = @cmndKhach
	and ngaydat = @ngaydat
	and dattu = @dattu
	and dattoi = @dattoi
	and sosan = @sosan
END
GO
/****** Object:  StoredProcedure [dbo].[sp_update_thongtin]    Script Date: 8/10/2021 11:16:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_update_thongtin] @cmnd varchar(20), @sanso int, 
@ngaydat date, @dattu varchar(10), @datoi varchar(10)
AS
BEGIN
	update ThongTinDatSan
	set ngaydat = @ngaydat , dattu = @dattu, dattoi = @datoi, sosan = @sanso
	where cmndKhach = @cmnd
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ThongTin"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "HOADON"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 3
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "HOADONDATSAN"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Khachhang"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 148
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ThongTinDatSan"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 170
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 5
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_report'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_report'
GO
USE [master]
GO
ALTER DATABASE [ql_sancaulong] SET  READ_WRITE 
GO
