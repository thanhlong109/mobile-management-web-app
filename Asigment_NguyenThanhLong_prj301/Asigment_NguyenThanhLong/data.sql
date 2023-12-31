USE [master]
GO
/****** Object:  Database [SE161734DB]    Script Date: 3/23/2023 12:32:55 PM ******/
CREATE DATABASE [SE161734DB]
 
ALTER DATABASE [SE161734DB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SE161734DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SE161734DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SE161734DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SE161734DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SE161734DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SE161734DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SE161734DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SE161734DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SE161734DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SE161734DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SE161734DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SE161734DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SE161734DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SE161734DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SE161734DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SE161734DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SE161734DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SE161734DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SE161734DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SE161734DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SE161734DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SE161734DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SE161734DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SE161734DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SE161734DB] SET  MULTI_USER 
GO
ALTER DATABASE [SE161734DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SE161734DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SE161734DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SE161734DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SE161734DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SE161734DB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SE161734DB] SET QUERY_STORE = OFF
GO
USE [SE161734DB]
GO
/****** Object:  Table [dbo].[tblChiTietHoaDon]    Script Date: 3/23/2023 12:32:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblChiTietHoaDon](
	[mahd] [nvarchar](50) NOT NULL,
	[masp] [nvarchar](5) NOT NULL,
	[soluong] [int] NULL,
	[dongia] [float] NULL,
	[khuyenmai] [float] NULL,
	[giatri] [float] NULL,
 CONSTRAINT [PK_tblChiTietHoaDon] PRIMARY KEY CLUSTERED 
(
	[mahd] ASC,
	[masp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDanhMuc]    Script Date: 3/23/2023 12:32:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDanhMuc](
	[madm] [nvarchar](5) NOT NULL,
	[tendm] [nvarchar](50) NULL,
	[trangthai] [bit] NULL,
 CONSTRAINT [PK_tblDanhMuc] PRIMARY KEY CLUSTERED 
(
	[madm] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHoaDon]    Script Date: 3/23/2023 12:32:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHoaDon](
	[mahd] [nvarchar](50) NOT NULL,
	[ngaydh] [datetime] NULL,
	[trangthaixuly] [int] NULL,
	[makh] [nvarchar](20) NULL,
 CONSTRAINT [PK_tblHoaDon] PRIMARY KEY CLUSTERED 
(
	[mahd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblNhaCungCap]    Script Date: 3/23/2023 12:32:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNhaCungCap](
	[mancc] [nvarchar](5) NOT NULL,
	[tenncc] [nvarchar](50) NULL,
	[diachi] [nvarchar](100) NULL,
	[trangthai] [bit] NULL,
 CONSTRAINT [PK_tblNhaCungCap] PRIMARY KEY CLUSTERED 
(
	[mancc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblNhomTaiKhoan]    Script Date: 3/23/2023 12:32:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNhomTaiKhoan](
	[nhomtk] [nvarchar](5) NOT NULL,
	[mota] [nvarchar](50) NULL,
	[trangthai] [bit] NULL,
 CONSTRAINT [PK_tblNhomTaiKhoan] PRIMARY KEY CLUSTERED 
(
	[nhomtk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSanPham]    Script Date: 3/23/2023 12:32:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSanPham](
	[masp] [nvarchar](5) NOT NULL,
	[tensp] [nvarchar](50) NULL,
	[mota] [nvarchar](250) NULL,
	[soluong] [int] NULL,
	[dongia] [float] NULL,
	[hinhanh] [nvarchar](100) NULL,
	[trangthai] [bit] NULL,
	[madm] [nvarchar](5) NULL,
	[mancc] [nvarchar](5) NULL,
	[khuyenmai] [float] NULL,
 CONSTRAINT [PK_tblSanPham] PRIMARY KEY CLUSTERED 
(
	[masp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTaiKhoan]    Script Date: 3/23/2023 12:32:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTaiKhoan](
	[tentk] [nvarchar](20) NOT NULL,
	[matkhau] [nvarchar](50) NULL,
	[trangthai] [bit] NULL,
	[email] [nvarchar](50) NULL,
	[nhomtk] [nvarchar](5) NULL,
 CONSTRAINT [PK_tblTaiKhoan] PRIMARY KEY CLUSTERED 
(
	[tentk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblChiTietHoaDon] ([mahd], [masp], [soluong], [dongia], [khuyenmai], [giatri]) VALUES (N'hd-21-2023-03-12', N'ap001', 1, 32900000, 0.17000000178813934, 27307000)
INSERT [dbo].[tblChiTietHoaDon] ([mahd], [masp], [soluong], [dongia], [khuyenmai], [giatri]) VALUES (N'hd-21-2023-03-12', N'ap002', 1, 28900000, 0.31999999284744263, 19652000)
INSERT [dbo].[tblChiTietHoaDon] ([mahd], [masp], [soluong], [dongia], [khuyenmai], [giatri]) VALUES (N'hd-21-2023-03-12', N'ip1', 2, 34990000, 0.10000000149011612, 62982000)
INSERT [dbo].[tblChiTietHoaDon] ([mahd], [masp], [soluong], [dongia], [khuyenmai], [giatri]) VALUES (N'hd-275-2023-03-21', N'sp04', 1, 10900000, 0.34000000357627869, 7194000)
INSERT [dbo].[tblChiTietHoaDon] ([mahd], [masp], [soluong], [dongia], [khuyenmai], [giatri]) VALUES (N'hd-275-2023-03-21', N'sp15', 1, 8990000, 0.2199999988079071, 7012200)
INSERT [dbo].[tblChiTietHoaDon] ([mahd], [masp], [soluong], [dongia], [khuyenmai], [giatri]) VALUES (N'hd-275-2023-03-21', N'sp24', 2, 12590000, 0.12999999523162842, 21906600)
INSERT [dbo].[tblChiTietHoaDon] ([mahd], [masp], [soluong], [dongia], [khuyenmai], [giatri]) VALUES (N'hd-477-2023-03-14', N'xx001', 1, 8490000, 0.10000000149011612, 7641000)
INSERT [dbo].[tblChiTietHoaDon] ([mahd], [masp], [soluong], [dongia], [khuyenmai], [giatri]) VALUES (N'hd-477-2023-03-14', N'xx002', 1, 9990000, 0.10000000149011612, 8991000)
INSERT [dbo].[tblChiTietHoaDon] ([mahd], [masp], [soluong], [dongia], [khuyenmai], [giatri]) VALUES (N'hd-506-2023-03-14', N'xm12t', 2, 12490000, 0.039999999105930328, 23980800)
INSERT [dbo].[tblChiTietHoaDon] ([mahd], [masp], [soluong], [dongia], [khuyenmai], [giatri]) VALUES (N'hd-506-2023-03-14', N'xrm11', 1, 4990000, 0.15000000596046448, 4241500)
INSERT [dbo].[tblChiTietHoaDon] ([mahd], [masp], [soluong], [dongia], [khuyenmai], [giatri]) VALUES (N'hd-571-2023-03-21', N'ip7', 2, 31990000, 0, 63980000)
INSERT [dbo].[tblChiTietHoaDon] ([mahd], [masp], [soluong], [dongia], [khuyenmai], [giatri]) VALUES (N'hd-571-2023-03-21', N'sp06', 2, 16590000, 0.31000000238418579, 22894200)
INSERT [dbo].[tblChiTietHoaDon] ([mahd], [masp], [soluong], [dongia], [khuyenmai], [giatri]) VALUES (N'hd-571-2023-03-21', N'sp11', 1, 19890000, 0.10999999940395355, 17702100)
INSERT [dbo].[tblChiTietHoaDon] ([mahd], [masp], [soluong], [dongia], [khuyenmai], [giatri]) VALUES (N'hd-618-2023-03-10', N'ap001', 1, 32900000, 0.17000000178813934, 27307000)
INSERT [dbo].[tblChiTietHoaDon] ([mahd], [masp], [soluong], [dongia], [khuyenmai], [giatri]) VALUES (N'hd-618-2023-03-10', N'ap002', 1, 28900000, 0.31999999284744263, 19652000)
INSERT [dbo].[tblChiTietHoaDon] ([mahd], [masp], [soluong], [dongia], [khuyenmai], [giatri]) VALUES (N'hd-67-2023-03-12', N'xx002', 1, 9990000, 0.10000000149011612, 8991000)
GO
INSERT [dbo].[tblDanhMuc] ([madm], [tendm], [trangthai]) VALUES (N'dt', N'Điện thoại', 1)
INSERT [dbo].[tblDanhMuc] ([madm], [tendm], [trangthai]) VALUES (N'mt', N'Máy Tính', 1)
INSERT [dbo].[tblDanhMuc] ([madm], [tendm], [trangthai]) VALUES (N'mtb', N'Máy Tính Bảng', 1)
INSERT [dbo].[tblDanhMuc] ([madm], [tendm], [trangthai]) VALUES (N'pk', N'Phụ Kiện', 1)
GO
INSERT [dbo].[tblHoaDon] ([mahd], [ngaydh], [trangthaixuly], [makh]) VALUES (N'hd-21-2023-03-12', CAST(N'2023-02-12T00:00:00.000' AS DateTime), 1, N'admlong1')
INSERT [dbo].[tblHoaDon] ([mahd], [ngaydh], [trangthaixuly], [makh]) VALUES (N'hd-275-2023-03-21', CAST(N'2023-03-21T00:00:00.000' AS DateTime), 1, N'customer')
INSERT [dbo].[tblHoaDon] ([mahd], [ngaydh], [trangthaixuly], [makh]) VALUES (N'hd-477-2023-03-14', CAST(N'2023-01-14T00:00:00.000' AS DateTime), 1, N'cuslong')
INSERT [dbo].[tblHoaDon] ([mahd], [ngaydh], [trangthaixuly], [makh]) VALUES (N'hd-506-2023-03-14', CAST(N'2023-03-14T00:00:00.000' AS DateTime), 1, N'tampro4545')
INSERT [dbo].[tblHoaDon] ([mahd], [ngaydh], [trangthaixuly], [makh]) VALUES (N'hd-571-2023-03-21', CAST(N'2023-03-21T00:00:00.000' AS DateTime), 1, N'customer')
INSERT [dbo].[tblHoaDon] ([mahd], [ngaydh], [trangthaixuly], [makh]) VALUES (N'hd-618-2023-03-10', CAST(N'2023-03-10T00:00:00.000' AS DateTime), 1, N'admlong1')
INSERT [dbo].[tblHoaDon] ([mahd], [ngaydh], [trangthaixuly], [makh]) VALUES (N'hd-67-2023-03-12', CAST(N'2023-03-12T00:00:00.000' AS DateTime), 1, N'admlong1')
GO
INSERT [dbo].[tblNhaCungCap] ([mancc], [tenncc], [diachi], [trangthai]) VALUES (N'as', N'Asus', N' Đài Loan ', 1)
INSERT [dbo].[tblNhaCungCap] ([mancc], [tenncc], [diachi], [trangthai]) VALUES (N'dell', N'Dell', N' Round Rock, Texas, Hoa Kỳ', 1)
INSERT [dbo].[tblNhaCungCap] ([mancc], [tenncc], [diachi], [trangthai]) VALUES (N'ip', N'Apple', N'California, Mỹ', 1)
INSERT [dbo].[tblNhaCungCap] ([mancc], [tenncc], [diachi], [trangthai]) VALUES (N'lenov', N'Lenovo', N'Bắc Kinh, Trung Quốc', 1)
INSERT [dbo].[tblNhaCungCap] ([mancc], [tenncc], [diachi], [trangthai]) VALUES (N'msha', N'Marshall', N'Đức', 1)
INSERT [dbo].[tblNhaCungCap] ([mancc], [tenncc], [diachi], [trangthai]) VALUES (N'nk', N'Nokia', N' Espoo , Phần Lan', 1)
INSERT [dbo].[tblNhaCungCap] ([mancc], [tenncc], [diachi], [trangthai]) VALUES (N'onep', N'OnePlus', N' Thâm Quyến. Trung Quốc', 1)
INSERT [dbo].[tblNhaCungCap] ([mancc], [tenncc], [diachi], [trangthai]) VALUES (N'op', N'Oppo', N'Đông Hoản, Quảng Đông,Trung Quốc', 1)
INSERT [dbo].[tblNhaCungCap] ([mancc], [tenncc], [diachi], [trangthai]) VALUES (N'rm', N'Realme', N' Thâm Quyến. Trung Quốc', 1)
INSERT [dbo].[tblNhaCungCap] ([mancc], [tenncc], [diachi], [trangthai]) VALUES (N'ss', N'Samsung', N' Samsung Town, Seocho, Seoul, Hàn Quốc', 1)
INSERT [dbo].[tblNhaCungCap] ([mancc], [tenncc], [diachi], [trangthai]) VALUES (N'vv', N'Vivo', N' Đông Quan , Quảng Đông, Trung Quốc', 1)
INSERT [dbo].[tblNhaCungCap] ([mancc], [tenncc], [diachi], [trangthai]) VALUES (N'xm', N'Xiaomi', N'Thâm Quyến, Trung Quốc', 1)
GO
INSERT [dbo].[tblNhomTaiKhoan] ([nhomtk], [mota], [trangthai]) VALUES (N'adm', N'có quyền thêm sủa xóa sản phẩm', 1)
INSERT [dbo].[tblNhomTaiKhoan] ([nhomtk], [mota], [trangthai]) VALUES (N'cus', N'dành cho khác hàng', 1)
GO
INSERT [dbo].[tblSanPham] ([masp], [tensp], [mota], [soluong], [dongia], [hinhanh], [trangthai], [madm], [mancc], [khuyenmai]) VALUES (N'ap001', N'Apple Macbook Air M2 2022 8GB 256GB', N'Thiết kế sang trọng, lịch lãm - siêu mỏng 11.3mm, chỉ 1.24kg > Hiệu năng hàng đầu - Chip Apple m2, 8 nhân GPU, hỗ trợ tốt các phần mềm như Word, Axel, Adoble Premier', 6, 32900000, N'macbook_air_m2.webp', 1, N'mt', N'ip', 0.17000000178813934)
INSERT [dbo].[tblSanPham] ([masp], [tensp], [mota], [soluong], [dongia], [hinhanh], [trangthai], [madm], [mancc], [khuyenmai]) VALUES (N'ap002', N'Apple MacBook Air M1 256GB 2020', N'Phù hợp cho lập trình viên, thiết kế đồ họa 2D, dân văn phòng Hiệu năng vượt trội - Cân mọi tác vụ từ word, exel đến chỉnh sửa ảnh trên các phần mềm như AI, PTS', 12, 28900000, N'macbook_air_22.webp', 1, N'mt', N'ip', 0.31999999284744263)
INSERT [dbo].[tblSanPham] ([masp], [tensp], [mota], [soluong], [dongia], [hinhanh], [trangthai], [madm], [mancc], [khuyenmai]) VALUES (N'ip1', N'Iphone 14 Pro Max 128GB', N'Cấu hình iPhone 14 Pro Max mạnh mẽ, hiệu năng cực khủng từ chipset A16, Làm chủ công nghệ nhiếp ảnh – Camera sau 48MP, cảm biến TOF sống động', 18, 34990000, N'ip14-promax-128gb.webp', 1, N'dt', N'ip', 0.10000000149011612)
INSERT [dbo].[tblSanPham] ([masp], [tensp], [mota], [soluong], [dongia], [hinhanh], [trangthai], [madm], [mancc], [khuyenmai]) VALUES (N'ip2', N'Iphone 14 Pro 128GB', N'Hiệu năng hàng đầu thế giới - Apple A16 Bionic xử lí nhanh, ổn định mọi tác vụ, Camera chuẩn nhiếp ảnh chuyên nghiệp – Camera sau', 25, 30990000, N'ip14-pro-128gb.webp', 1, N'dt', N'ip', 0.54000002145767212)
INSERT [dbo].[tblSanPham] ([masp], [tensp], [mota], [soluong], [dongia], [hinhanh], [trangthai], [madm], [mancc], [khuyenmai]) VALUES (N'ip3', N'Iphone 13 128GB', N'Hiệu năng vượt trội - Chip Apple A15 Bionic mạnh mẽ, hỗ trợ mạng 5G tốc độ cao Không gian hiển thị sống động - Màn hình 6.1" Super Retina XDR độ sáng cao, sắc nét', 20, 24990000, N'ip13-128gb.webp', 1, N'dt', N'ip', 0.40999999642372131)
INSERT [dbo].[tblSanPham] ([masp], [tensp], [mota], [soluong], [dongia], [hinhanh], [trangthai], [madm], [mancc], [khuyenmai]) VALUES (N'ip4', N'Iphone 11 64GB', N'Màu sắc phù hợp cá tính - 6 màu sắc bắt mắt để lựa chọn. , Hiệu năng mượt mà, ổn định – Chip A13, RAM 4GB', 15, 11390000, N'ip11-64gb.webp', 1, N'dt', N'ip', 0)
INSERT [dbo].[tblSanPham] ([masp], [tensp], [mota], [soluong], [dongia], [hinhanh], [trangthai], [madm], [mancc], [khuyenmai]) VALUES (N'ip5', N'Iphone 14 128GB', N'Tuyệt đỉnh thiết kế, tỉ mỉ từng đường nét - Nâng cấp toàn diện với kiểu dáng mới, nhiều lựa chọn màu sắc trẻ trung', 10, 19790000, N'ip14-128gb.webp', 1, N'dt', N'ip', 0)
INSERT [dbo].[tblSanPham] ([masp], [tensp], [mota], [soluong], [dongia], [hinhanh], [trangthai], [madm], [mancc], [khuyenmai]) VALUES (N'ip6', N'Iphone 14 Pro Max 256GB', N'Cấu hình iPhone 14 Pro Max mạnh mẽ, hiệu năng cực khủng từ chipset A16 Bionic, Làm chủ công nghệ nhiếp ảnh - Camera sau 48MP, cảm biến TOF sống động', 10, 37990000, N'ip14-promax-256gb.webp', 1, N'dt', N'ip', 0)
INSERT [dbo].[tblSanPham] ([masp], [tensp], [mota], [soluong], [dongia], [hinhanh], [trangthai], [madm], [mancc], [khuyenmai]) VALUES (N'ip7', N'Iphone 13 Pro 128GB', N'Hiệu năng vượt trội – Chip Apple A15 Bionic mạnh mẽ, hỗ> trợ mạng 5G tốc độ cao Không gian hiển thị sống động - Màn hình 6.1" Super Retina XDR độ sáng cao, sắc nét', 5, 31990000, N'ip13-promax-128gb.webp', 1, N'dt', N'ip', 0)
INSERT [dbo].[tblSanPham] ([masp], [tensp], [mota], [soluong], [dongia], [hinhanh], [trangthai], [madm], [mancc], [khuyenmai]) VALUES (N'sp04', N'iPad 10.2 2021 WiFi 64GB', N'Hiệu năng ổn định - Apple A13 Bionic 6 nhân mạnh mē Trải nghiệm hiễn thị chất lượng - Màn hình Retina 10.2 inch, hỗ trợ True Tone', 22, 10900000, N'x_mmas.webp', 1, N'mtb', N'ip', 0.34000000357627869)
INSERT [dbo].[tblSanPham] ([masp], [tensp], [mota], [soluong], [dongia], [hinhanh], [trangthai], [madm], [mancc], [khuyenmai]) VALUES (N'sp05', N'Laptop Asus Gaming Rog Strix G15 G513IH HN015W', N'Chip R7-4800H cùng card đồ họa rời Geforce GTX 1650 cho khả năng chiến các tựa game nặng, chỉnh sửa hình ảnh trên PTS, Render video ngắn mượt mà = Ram 8GB + 1 khe, nâng cấp tối đa 32GB cùng ổ cứng SSD có không gian lưu trữ lên tới 512GB', 20, 23990000, N'4h43.webp', 1, N'mt', N'as', 0.23000000417232513)
INSERT [dbo].[tblSanPham] ([masp], [tensp], [mota], [soluong], [dongia], [hinhanh], [trangthai], [madm], [mancc], [khuyenmai]) VALUES (N'sp06', N'Laptop Asus Vivobook Flip 14 TP470EA EC346W', N'Intel Core i3–1115G4 xử lý mượt mà các tác vụ văn phòng) hay chỉnh sửa ảnh cơ bản trên PTS. Ổ cứng SSD 512GB mang đến tốc độ xử lý nhanh cùng đa nhiệm mượt mà, mở nhiều trang cùng lúc không bị giật, lag.', 32, 16590000, N'9.1.webp', 1, N'mt', N'as', 0.31000000238418579)
INSERT [dbo].[tblSanPham] ([masp], [tensp], [mota], [soluong], [dongia], [hinhanh], [trangthai], [madm], [mancc], [khuyenmai]) VALUES (N'sp07', N'Laptop Asus ExpertBook B5302FEA LF0749W', N'Chip Core i5-1135G7 tiết kiệm pin, hiệu năng ổn định thích hợp làm văn phòng, học tập. Ổ cứng SSD 5126GB mang lại tốc độ khởi động nhanh hơn bao giờ hết', 25, 26990000, N'text_ng_n_10_.webp', 1, N'mt', N'as', 0.33000001311302185)
INSERT [dbo].[tblSanPham] ([masp], [tensp], [mota], [soluong], [dongia], [hinhanh], [trangthai], [madm], [mancc], [khuyenmai]) VALUES (N'sp08', N'Laptop Lenovo Ideapad Gaming 3 15ARH7', N'Cấu hình chơi game và đồ họa đỉnh cao, cân mọi tựa game - R7 6800H cùng card rời RTX 3050. Có khả năng chỉnh sửa hình ảnh trên PTS, Render video ngắn mượt mà.', 16, 27490000, N'1h47.webp', 1, N'mt', N'lenov', 0.12999999523162842)
INSERT [dbo].[tblSanPham] ([masp], [tensp], [mota], [soluong], [dongia], [hinhanh], [trangthai], [madm], [mancc], [khuyenmai]) VALUES (N'sp09', N'Laptop Lenovo Ideapad 5 Pro 16ARH7', N'Chip R5-6600HS cùng card rời GTX 1650 xử lý tốt các phần mềm đồ hoạ, các tựa game AAA ở mức setting trung bình,', 18, 27990000, N'2h08.webp', 1, N'mt', N'lenov', 0.070000000298023224)
INSERT [dbo].[tblSanPham] ([masp], [tensp], [mota], [soluong], [dongia], [hinhanh], [trangthai], [madm], [mancc], [khuyenmai]) VALUES (N'sp10', N'Laptop Dell Vostro 5620 70282719', N'Hiệu năng vượt trội, xử lý tốt các tác vụ hằng ngày - Intel Core i5 thế hệ 12 16GB ram cho phép mở cùng lúc nhiều tab trình duyệt', 32, 25490000, N'dell_2.webp', 1, N'mt', N'dell', 0.10000000149011612)
INSERT [dbo].[tblSanPham] ([masp], [tensp], [mota], [soluong], [dongia], [hinhanh], [trangthai], [madm], [mancc], [khuyenmai]) VALUES (N'sp11', N'Laptop Dell Latitude 3520 70251592', N'Thiết kế mỏng nhẹ, vỏ ngoài cứng cáp với các cạnh được bo tròn mềm mại. Màn hình 15.6 inch cho góc nhìn rộng hơn cùng công nghệ chống chói, lóa ở nơi có ánh sáng mạnh.', 18, 19890000, N'10_9_123.webp', 1, N'mt', N'dell', 0.10999999940395355)
INSERT [dbo].[tblSanPham] ([masp], [tensp], [mota], [soluong], [dongia], [hinhanh], [trangthai], [madm], [mancc], [khuyenmai]) VALUES (N'sp12', N'Laptop Dell Gaming G15 Ryzen Edition 5515', N'Chip AMD Ryzen 7 5800H cùng card rời RTX 3050, thoả sức trải nghiệm game AAA ở mức đồ hoạ cao Ram 8GB + 1 khe trống cho phép nâng cấp tối đa đến 32GB, load game nhanh chóng', 35, 30990000, N'16_2_133.webp', 1, N'mt', N'dell', 0.15000000596046448)
INSERT [dbo].[tblSanPham] ([masp], [tensp], [mota], [soluong], [dongia], [hinhanh], [trangthai], [madm], [mancc], [khuyenmai]) VALUES (N'sp13', N'Laptop Asus Vivobook 14X M1403QA-LY024W', N'Màn hình 14 inch (1920 x 1200) rõ nét mọi chi tiết cùng công nghệ chống chói mang đến trải nghiệm hình ảnh hoàn toàn mới', 24, 17990000, N'gaming_5_3.webp', 1, N'mt', N'as', 0.15000000596046448)
INSERT [dbo].[tblSanPham] ([masp], [tensp], [mota], [soluong], [dongia], [hinhanh], [trangthai], [madm], [mancc], [khuyenmai]) VALUES (N'sp14', N'Laptop ASUS TUF DASH Gaming F15', N'Chip I5-12450H cùng card rời GeForce RTX 3050 chiến Y mọi tựa game ở mức đồ hoạ trung bình trở lên, chỉnh sửa hình ảnh trên PTS, edit Video trên Premier', 32, 28990000, N'10h45_2.webp', 1, N'mt', N'as', 0.20000000298023224)
INSERT [dbo].[tblSanPham] ([masp], [tensp], [mota], [soluong], [dongia], [hinhanh], [trangthai], [madm], [mancc], [khuyenmai]) VALUES (N'sp15', N'OPPO Reno8', N'Chuyên gia chân dung, bừng sáng khoảnh khắc đêm - Cụm camera 64MP + 2MP + 2MP hiện đại Dẫn đầu xu hướng nhờ thiết kế tinh xảo, cao cấp và mỏng nhẹ', 21, 8990000, N'combo_product_-_reno8_4g_-_gold.webp', 1, N'dt', N'op', 0.2199999988079071)
INSERT [dbo].[tblSanPham] ([masp], [tensp], [mota], [soluong], [dongia], [hinhanh], [trangthai], [madm], [mancc], [khuyenmai]) VALUES (N'sp16', N'OPPO A57', N'Không gian hiển thị chất lượng - Màn hình IPS LCD 6.56 inches sắc nét Cấu hình ổn định, thách thức mọi tác vụ - MediaTek Helio G35', 22, 4490000, N'combo_a57_-_black.webp', 1, N'dt', N'op', 0.05000000074505806)
INSERT [dbo].[tblSanPham] ([masp], [tensp], [mota], [soluong], [dongia], [hinhanh], [trangthai], [madm], [mancc], [khuyenmai]) VALUES (N'sp17', N'OPPO A17', N'Thiết kế hoàn hảo, màn hình giọt nước quen thuộc - Màn > hình 6.5 inch, HD+ trên tấm nền LCD đáp ứng tốt nhu cầu giải trí', 23, 3990000, N'b1ppr0nazrpqahyt.webp', 1, N'dt', N'op', 0)
INSERT [dbo].[tblSanPham] ([masp], [tensp], [mota], [soluong], [dongia], [hinhanh], [trangthai], [madm], [mancc], [khuyenmai]) VALUES (N'sp18', N'Nokia T20', N'Màn hình 2K siêu rộng 10.4” Âm thanh nổi OZO 360 độ cho âm thanh to và rõ nét. thỏa sức làm việc và giải trí với dung lượng pin bền bỉ 8.200 mAh', 32, 6290000, N'nokia-t20-1-600x600.webp', 1, N'mtb', N'nk', 0.30000001192092896)
INSERT [dbo].[tblSanPham] ([masp], [tensp], [mota], [soluong], [dongia], [hinhanh], [trangthai], [madm], [mancc], [khuyenmai]) VALUES (N'sp19', N'iPad mini 6 WiFi 64GB', N'Mạnh mẽ bứt phá - Chip xử lý Apple A15 Bionic 6 nhân Hiển thị sắc nét, mượt mà hơn - Màn hình IPS LCD 8,3 inch hỗ trợ True Tone', 23, 14990000, N'3_229.webp', 1, N'mtb', N'ip', 0.25999999046325684)
INSERT [dbo].[tblSanPham] ([masp], [tensp], [mota], [soluong], [dongia], [hinhanh], [trangthai], [madm], [mancc], [khuyenmai]) VALUES (N'sp20', N'iPad Air 5 (2022) 5G 256GB', N'Thiết kế sang trọng - Thiết kế phẳng ở 4 cạnh, màu sắc tươi trẻ Màn hình cho trải nghiệm chân thực - Tấm nền Retina IPS LCD 10.9 inches, chân thực và sắc nét', 26, 24990000, N'1_253_8.webp', 1, N'mtb', N'ip', 0.20999999344348908)
INSERT [dbo].[tblSanPham] ([masp], [tensp], [mota], [soluong], [dongia], [hinhanh], [trangthai], [madm], [mancc], [khuyenmai]) VALUES (N'sp21', N'Xiaomi Pad 5 (6GB/256GB)', N'Thiết kế mỏng nhẹ, tinh tế - Thiết kế vuông vức, chỉ dày khoảng 7mm và nặng 500g Trải nghiệm không gian không giới hạn - Màn hình 11" IPS', 26, 10490000, N'o1cn01ijop4f1slqk1fdzto_-2201438992231_1628774717_2.webp', 1, N'mtb', N'xm', 0.14000000059604645)
INSERT [dbo].[tblSanPham] ([masp], [tensp], [mota], [soluong], [dongia], [hinhanh], [trangthai], [madm], [mancc], [khuyenmai]) VALUES (N'sp22', N'Loa Bluetooth Marshall Acton III', N'Tổng công suất lên đến 60W cùng ông nghệ loa kép giúp 2 khuếch đại âm thanh Đa dạng phương thức kết nối giúp dễ dàng ghép nối với đa dạng thiết bị khác', 23, 7990000, N'group_246_2_1.webp', 1, N'pk', N'msha', 0.10999999940395355)
INSERT [dbo].[tblSanPham] ([masp], [tensp], [mota], [soluong], [dongia], [hinhanh], [trangthai], [madm], [mancc], [khuyenmai]) VALUES (N'sp23', N'Loa Bluetooth Marshall Emberton', N'Kiểu dáng nhỏ gọn, chất liệu bền bỉ, trọng lượng nhẹ giúp) thoải mái mang theo bên cạnh Trải nghiệm âm thanh đầy sống động âm thanh 360 độ và công nghệ True Stereophonic', 22, 4690000, N'frame_12_1.webp', 1, N'pk', N'msha', 0.15999999642372131)
INSERT [dbo].[tblSanPham] ([masp], [tensp], [mota], [soluong], [dongia], [hinhanh], [trangthai], [madm], [mancc], [khuyenmai]) VALUES (N'sp24', N'Loa Bluetooth Marshall Tufton', N'Thiết kế đậm chất sáng tạo khi lấy cảm hứng từ những chiếc amply guitar Tổng công suất lên đến 80W cho chất lượng âm thanh sống động, hài hoà', 15, 12590000, N'frame_12_1_.webp', 1, N'pk', N'msha', 0.12999999523162842)
INSERT [dbo].[tblSanPham] ([masp], [tensp], [mota], [soluong], [dongia], [hinhanh], [trangthai], [madm], [mancc], [khuyenmai]) VALUES (N'xm003', N'Redmi A1', N'Thiết kế thời thượng với khả năng chống bám bụi hiệu quả - Mặt lưng giả da chống trầy xước và bám) bắn Trải nghiệm giải trí tuyệt vời với màn hình kích thước lớn – Màn hình IPS LCD 6.52 inches, tần số quét 60Hz', 15, 2190000, N'w1q1111c_.webp', 1, N'dt', N'xm', 0.10999999940395355)
INSERT [dbo].[tblSanPham] ([masp], [tensp], [mota], [soluong], [dongia], [hinhanh], [trangthai], [madm], [mancc], [khuyenmai]) VALUES (N'xm12t', N'Xiaomi 12T', N'Kiến tạo khoảnh khắc hoàn hảo – Camera chuyên nghiệp 108MP + 8MP + 2MP, chống rung quang họa OIS Làm chủ tốc độ, bứt phả hiệu năng - MediaTek Dimensity 8100-Ultra, RAM 8GB', 20, 12490000, N'xm12T.webp', 1, N'dt', N'xm', 0.039999999105930328)
INSERT [dbo].[tblSanPham] ([masp], [tensp], [mota], [soluong], [dongia], [hinhanh], [trangthai], [madm], [mancc], [khuyenmai]) VALUES (N'xrm11', N'Xiaomi Redmi Note 11 128GB', N'Nâng cao trải nghiệm thị giác - Màn hình AMOLED 6.43" Full HD+, công nghệ DotDisplay Hiệu năng ấn tượng - Snapdragon 680 8 nhân cùng RAM 4GB, bộ nhớ 128GB', 12, 4990000, N'xiaomi-redmi-note-11-128gb.webp', 1, N'dt', N'xm', 0.15000000596046448)
INSERT [dbo].[tblSanPham] ([masp], [tensp], [mota], [soluong], [dongia], [hinhanh], [trangthai], [madm], [mancc], [khuyenmai]) VALUES (N'xx001', N'POCO X4 GT', N'Thiết kế đơn giản nhưng vẫn thanh lịch và trẻ trung, phù hợp với các bạn trẻ cá tính Xử lý tác vụ nặng, cùng khả năng đa nhiệm ấn tượng - Chip MediaTek Dimensity 8100', 16, 8490000, N'pms_1655902420.18254534_1.webp', 1, N'dt', N'xm', 0.10000000149011612)
INSERT [dbo].[tblSanPham] ([masp], [tensp], [mota], [soluong], [dongia], [hinhanh], [trangthai], [madm], [mancc], [khuyenmai]) VALUES (N'xx002', N'Xiaomi Redmi Note 11 Pro Plus 5G', N'Đón đầu thử tháchbứt phá mọi tựa game - Chip > MediaTek Dimensity 920 5G 8 nhân siêu mạnh mẽ Không gian giải trí đỉnh cao – Màn hình AMOLED 6.67 inch sắc nét, tần số quét 120Hz mượt mà', 32, 9990000, N'11-pro-plus-blue.webp', 1, N'dt', N'xm', 0.10000000149011612)
GO
INSERT [dbo].[tblTaiKhoan] ([tentk], [matkhau], [trangthai], [email], [nhomtk]) VALUES (N'admlong', N'123', 1, N'longntse161734@fpt.edu.vn', N'adm')
INSERT [dbo].[tblTaiKhoan] ([tentk], [matkhau], [trangthai], [email], [nhomtk]) VALUES (N'admlong1', N'123', 1, N'thinghiemminiworld@gmail.com', N'cus')
INSERT [dbo].[tblTaiKhoan] ([tentk], [matkhau], [trangthai], [email], [nhomtk]) VALUES (N'cuslong', N'123', 1, N'longdeptrai123@gmail.com', N'cus')
INSERT [dbo].[tblTaiKhoan] ([tentk], [matkhau], [trangthai], [email], [nhomtk]) VALUES (N'customer', N'123', 1, N'customer@gmail.com', N'cus')
INSERT [dbo].[tblTaiKhoan] ([tentk], [matkhau], [trangthai], [email], [nhomtk]) VALUES (N'long999', N'123', 1, N'longntse161734@fpt.edu.vn', N'cus')
INSERT [dbo].[tblTaiKhoan] ([tentk], [matkhau], [trangthai], [email], [nhomtk]) VALUES (N'tampro4545', N'minhtam4545', 1, N'minhtampro4545@gmail.com', N'cus')
GO
ALTER TABLE [dbo].[tblChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_tblChiTietHoaDon_tblHoaDon] FOREIGN KEY([mahd])
REFERENCES [dbo].[tblHoaDon] ([mahd])
GO
ALTER TABLE [dbo].[tblChiTietHoaDon] CHECK CONSTRAINT [FK_tblChiTietHoaDon_tblHoaDon]
GO
ALTER TABLE [dbo].[tblChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_tblChiTietHoaDon_tblSanPham] FOREIGN KEY([masp])
REFERENCES [dbo].[tblSanPham] ([masp])
GO
ALTER TABLE [dbo].[tblChiTietHoaDon] CHECK CONSTRAINT [FK_tblChiTietHoaDon_tblSanPham]
GO
ALTER TABLE [dbo].[tblHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_tblHoaDon_tblTaiKhoan] FOREIGN KEY([makh])
REFERENCES [dbo].[tblTaiKhoan] ([tentk])
GO
ALTER TABLE [dbo].[tblHoaDon] CHECK CONSTRAINT [FK_tblHoaDon_tblTaiKhoan]
GO
ALTER TABLE [dbo].[tblSanPham]  WITH CHECK ADD  CONSTRAINT [FK_tblSanPham_tblDanhMuc] FOREIGN KEY([madm])
REFERENCES [dbo].[tblDanhMuc] ([madm])
GO
ALTER TABLE [dbo].[tblSanPham] CHECK CONSTRAINT [FK_tblSanPham_tblDanhMuc]
GO
ALTER TABLE [dbo].[tblSanPham]  WITH CHECK ADD  CONSTRAINT [FK_tblSanPham_tblNhaCungCap] FOREIGN KEY([mancc])
REFERENCES [dbo].[tblNhaCungCap] ([mancc])
GO
ALTER TABLE [dbo].[tblSanPham] CHECK CONSTRAINT [FK_tblSanPham_tblNhaCungCap]
GO
ALTER TABLE [dbo].[tblTaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_tblTaiKhoan_tblNhomTaiKhoan] FOREIGN KEY([nhomtk])
REFERENCES [dbo].[tblNhomTaiKhoan] ([nhomtk])
GO
ALTER TABLE [dbo].[tblTaiKhoan] CHECK CONSTRAINT [FK_tblTaiKhoan_tblNhomTaiKhoan]
GO
USE [master]
GO
ALTER DATABASE [SE161734DB] SET  READ_WRITE 
GO
