USE [HTStudio]
GO
/****** Object:  StoredProcedure [dbo].[capnhatalbum]    Script Date: 6/14/2019 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[capnhatalbum]
@ID int,
@Pathimg varchar(100)
as
begin
Update Album
set
Pathimg=@Pathimg
where ID=@ID
end

GO
/****** Object:  StoredProcedure [dbo].[capnhatctalbum]    Script Date: 6/14/2019 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[capnhatctalbum]
@IDalbum int,
@Path varchar(100)
as
begin
insert CTAlbum(IDAlbum,Pathimg)
values (@IDalbum,@Path)
end

GO
/****** Object:  StoredProcedure [dbo].[getcurrid]    Script Date: 6/14/2019 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getcurrid]
as
begin
SELECT IDENT_CURRENT('Album')
end

GO
/****** Object:  StoredProcedure [dbo].[getImgvideo]    Script Date: 6/14/2019 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getImgvideo]
@ID int
as
begin
select Img from Video
where ID=@ID
end

GO
/****** Object:  StoredProcedure [dbo].[getPath]    Script Date: 6/14/2019 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getPath]
@ID int
as
begin
select PathAl from Album
where ID=@ID
end

GO
/****** Object:  StoredProcedure [dbo].[getPathall]    Script Date: 6/14/2019 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getPathall]
@ID int
as
begin
select Pathimg from CTAlbum
where @ID=IDAlbum
end

GO
/****** Object:  StoredProcedure [dbo].[getPathct]    Script Date: 6/14/2019 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getPathct]
@ID int
as
begin
select Pathimg from CTAlbum
where @ID = ID
end

GO
/****** Object:  StoredProcedure [dbo].[getPathimg]    Script Date: 6/14/2019 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getPathimg]
@ID int
as
begin
if((select Top 1 Pathimg from CTAlbum where @ID=IDAlbum) IS NULL)
begin
select MAX(ID) from CTAlbum
end
else
begin
select Top 1 Pathimg from CTAlbum where @ID=IDAlbum
end
end

GO
/****** Object:  StoredProcedure [dbo].[getTenAlbum]    Script Date: 6/14/2019 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getTenAlbum]
@ID int
as
begin
select NAME from Album
where ID=@ID
end

GO
/****** Object:  StoredProcedure [dbo].[maxID]    Script Date: 6/14/2019 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[maxID]
as 
begin
if((select MAX(ID) from Album) IS NULL)
select 1
else
select MAX(ID) from Album
end

GO
/****** Object:  StoredProcedure [dbo].[themalbum]    Script Date: 6/14/2019 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[themalbum]
@ID int,
@Ten nvarchar(50),
@Path varchar(100),
@Pathimg varchar(100)
as
begin
if(@ID=0)
insert Album(NAME,PathAl,Pathimg)
values (@Ten,@Path,@Pathimg)
end

GO
/****** Object:  StoredProcedure [dbo].[themhoaccapnhatctalubm]    Script Date: 6/14/2019 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[themhoaccapnhatctalubm]
@ID int,
@IDalbum int,
@Path varchar(100)
as
begin
if(@ID=0)
insert CTAlbum(IDAlbum,Pathimg)
values (@IDalbum,@Path)
else
Update CTAlbum
set
IDAlbum=@IDalbum,
Pathimg=@Path
end

GO
/****** Object:  StoredProcedure [dbo].[uploadAlbum]    Script Date: 6/14/2019 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uploadAlbum]
@Name NVARCHAR(50),
@PathAl VARCHAR(100),
@PathImg VARCHAR(100)
AS
BEGIN
INSERT INTO dbo.Album
        ( NAME, PathAl, PathImg )
VALUES  ( @Name, -- NAME - nvarchar(50)
          @PathAl, -- PathAl - varchar(100)
          @PathImg  -- PathImg - varchar(100)
          )
END
GO
/****** Object:  StoredProcedure [dbo].[ups_insertCTalbum]    Script Date: 6/14/2019 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ups_insertCTalbum]
@pathimg VARCHAR(100)
AS
BEGIN
DECLARE @idalbum INT
SELECT @idalbum = IDENT_CURRENT('Album')
INSERT INTO dbo.CTAlbum
        ( IDALBUM, PathImg )
VALUES  ( @idalbum, -- IDALBUM - int
          @pathimg  -- PathImg - varchar(100)
          )
END
GO
/****** Object:  StoredProcedure [dbo].[ups_insertCTalbumbyid]    Script Date: 6/14/2019 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ups_insertCTalbumbyid]
@id INT,
@pathimg VARCHAR(100)
AS
BEGIN
INSERT INTO dbo.CTAlbum
        ( IDALBUM, PathImg )
VALUES  ( @id, -- IDALBUM - int
          @pathimg  -- PathImg - varchar(100)
          )
END
GO
/****** Object:  StoredProcedure [dbo].[usp_insertBG]    Script Date: 6/14/2019 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_insertBG]
@Name NCHAR(50),
@Gia INT,
@ND NVARCHAR(200),
@NDCT NVARCHAR(MAX)
AS
BEGIN
INSERT INTO dbo.Banggia
        ( Name, Gia, NoiDung, NDCT )
VALUES  ( @Name, -- Name - nchar(50)
          @Gia, -- Gia - int
          @ND, -- NoiDung - nvarchar(200)
          @NDCT  -- NDCT - nvarchar(2000)
          )
END
GO
/****** Object:  StoredProcedure [dbo].[usp_insertblog]    Script Date: 6/14/2019 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_insertblog]
@sub NVARCHAR(100),
@linkimg VARCHAR(200),
@content NVARCHAR(MAX),
@author NVARCHAR(50),
@date DATE
AS
BEGIN
INSERT INTO dbo.Blog
        ( img, sub, content, author, dateup )
VALUES  ( @linkimg, -- img - varchar(200)
          @sub, -- sub - nvarchar(100)
          @content, -- content - nvarchar(max)
          @author, -- author - nvarchar(50)
          @date  -- dateup - date
          )
END

GO
/****** Object:  StoredProcedure [dbo].[usp_InsertDonhang]    Script Date: 6/14/2019 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_InsertDonhang]
@Name NVARCHAR(50),
@Phone CHAR(20),
@Email CHAR(50),
@DV CHAR(20),
@Ghichu NVARCHAR(100)
AS
BEGIN
INSERT INTO dbo.Donhang
        ( 
          NameKH ,
          NPhone ,
          EmailKH ,
          GoiDV ,
          Ghichu
        )
VALUES  ( -- ID - int
          @Name , -- NameKH - varchar(50)
          @Phone , -- NPhone - char(20)
          @Email , -- EmailKH - char(50)
          @DV , -- GoiDV - char(20)
          @Ghichu  -- Ghichu - nvarchar(100)
        )
END
GO
/****** Object:  StoredProcedure [dbo].[usp_insertVideo]    Script Date: 6/14/2019 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_insertVideo]
@img VARCHAR(100),
@name NVARCHAR(100),
@link VARCHAR(100)
AS
BEGIN
INSERT INTO dbo.video
        ( Img, Name, Link )
VALUES  ( @img, -- Img - varchar(100)
          @name, -- Name - nvarchar(100)
          @link  -- Link - varchar(100)
          )
END


GO
/****** Object:  StoredProcedure [dbo].[usp_updateAlbum]    Script Date: 6/14/2019 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_updateAlbum]
@id INT,
@name NVARCHAR(50)
AS
BEGIN
DECLARE @path VARCHAR(100)
SELECT TOP 1 @path = PathImg FROM dbo.CTAlbum  WHERE IDALBUM = @id 
UPDATE dbo.Album SET NAME = @name,PathImg=@path WHERE ID =@id
END

GO
/****** Object:  StoredProcedure [dbo].[usp_updateBG]    Script Date: 6/14/2019 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_updateBG]
@ID INT,
@Name NCHAR(50),
@Gia INT,
@ND NVARCHAR(200),
@NDCT NVARCHAR(MAX)
AS
BEGIN
UPDATE dbo.Banggia SET Name =@Name,Gia=@Gia,NoiDung =@ND,NDCT=@NDCT WHERE ID=@ID
END
GO
/****** Object:  StoredProcedure [dbo].[viewallalbum]    Script Date: 6/14/2019 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[viewallalbum]
as
begin
select * from Album
end

GO
/****** Object:  StoredProcedure [dbo].[viewctalbumid]    Script Date: 6/14/2019 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[viewctalbumid]
@ID int
as
begin
select * from CTAlbum
where IDAlbum=@ID
end

GO
/****** Object:  StoredProcedure [dbo].[xoaalbum]    Script Date: 6/14/2019 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[xoaalbum]
@ID int
as
begin
delete from Album
where ID=@ID
end

GO
/****** Object:  StoredProcedure [dbo].[xoactalbum]    Script Date: 6/14/2019 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[xoactalbum]
@ID int
as
begin
delete from CTAlbum
where IDAlbum=@ID
end

GO
/****** Object:  StoredProcedure [dbo].[xoactalbumid]    Script Date: 6/14/2019 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[xoactalbumid]
@ID int
as
begin
delete from CTAlbum
where ID=@ID
end

GO
/****** Object:  StoredProcedure [dbo].[xoavideo]    Script Date: 6/14/2019 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[xoavideo]
@ID int
as
begin
delete from Album
where ID=@ID
end

GO
/****** Object:  Table [dbo].[Album]    Script Date: 6/14/2019 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Album](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [nvarchar](50) NOT NULL,
	[PathAl] [varchar](100) NOT NULL,
	[PathImg] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Banggia]    Script Date: 6/14/2019 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banggia](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](50) NULL,
	[Gia] [int] NULL,
	[NoiDung] [nvarchar](200) NULL,
	[NDCT] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Blog]    Script Date: 6/14/2019 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Blog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[img] [varchar](200) NULL,
	[sub] [nvarchar](100) NULL,
	[content] [nvarchar](max) NULL,
	[author] [nvarchar](50) NULL,
	[dateup] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CTAlbum]    Script Date: 6/14/2019 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CTAlbum](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDALBUM] [int] NULL,
	[PathImg] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Donhang]    Script Date: 6/14/2019 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Donhang](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NameKH] [varchar](50) NULL,
	[NPhone] [char](20) NULL,
	[EmailKH] [char](50) NULL,
	[GoiDV] [char](20) NULL,
	[Ghichu] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[video]    Script Date: 6/14/2019 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[video](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Img] [varchar](100) NULL,
	[Name] [nvarchar](100) NULL,
	[Link] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Album] ON 

INSERT [dbo].[Album] ([ID], [NAME], [PathAl], [PathImg]) VALUES (20, N'Nguyễn Văn Trạng VN', N'~/assets/Album/Nguyen', N'~/assets/Album/Nguyen/cabin_02.jpg')
INSERT [dbo].[Album] ([ID], [NAME], [PathAl], [PathImg]) VALUES (29, N'Album Cabin', N'~/assets/Album/Album Cabin', N'~/assets/Album/Album Cabin/cabin_01.jpg')
INSERT [dbo].[Album] ([ID], [NAME], [PathAl], [PathImg]) VALUES (30, N'Ảnh Cưới Đà Lạt', N'~/assets/Album/Anh Cuoi Da Lat', N'~/assets/Album/Anh Cuoi Da Lat/da_lat_01.png')
INSERT [dbo].[Album] ([ID], [NAME], [PathAl], [PathImg]) VALUES (31, N'Phố Mộng Mơ', N'~/assets/Album/Pho Mong Mo', N'~/assets/Album/Pho Mong Mo/en_de_20.jpg')
INSERT [dbo].[Album] ([ID], [NAME], [PathAl], [PathImg]) VALUES (32, N'Lệ Thu và Văn Đông', N'~/assets/Album/Le Thu va Van Dong', N'~/assets/Album/Le Thu va Van Dong/vila_q9_04.jpg')
INSERT [dbo].[Album] ([ID], [NAME], [PathAl], [PathImg]) VALUES (33, N'Đôi Trai Tài Gái Sắc', N'~/assets/Album/Doi Trai Tai Gai Sac', N'~/assets/Album/Doi Trai Tai Gai Sac/da_lat_02.jpg')
INSERT [dbo].[Album] ([ID], [NAME], [PathAl], [PathImg]) VALUES (34, N'Về Với Rừng Xanh', N'~/assets/Album/Ve Voi Rung Xanh', N'~/assets/Album/Ve Voi Rung Xanh/da_lat_01.png')
INSERT [dbo].[Album] ([ID], [NAME], [PathAl], [PathImg]) VALUES (35, N'Album Đẹp', N'~/assets/Album/Album Dep', N'~/assets/Album/Album Dep/en_de_18.jpg')
SET IDENTITY_INSERT [dbo].[Album] OFF
SET IDENTITY_INSERT [dbo].[Banggia] ON 

INSERT [dbo].[Banggia] ([ID], [Name], [Gia], [NoiDung], [NDCT]) VALUES (1, N'VIP 3                                             ', 3500000, N'Phim Trường Smiley.01 Album 20x30cm.02 Ảnh lớn 60x90cm.01 váy cưới.01 áo dài cô dâu', N'<p>Ai cũng muốn h&ocirc;n lễ của m&igrave;nh diễn ra thật ho&agrave;n hảo v&agrave; trọn vẹn. V&agrave; d&ugrave; c&oacute; tin tưởng nh&agrave; cung cấp dịch vụ thế n&agrave;o, cặp đ&ocirc;i n&agrave;o cũng muốn tự tay chăm ch&uacute;t, quan t&acirc;m, lưu &yacute; từng chi tiết trong ng&agrave;y cưới của m&igrave;nh. Tại&nbsp;<strong>Mimi Wedding</strong>, ch&uacute;ng t&ocirc;i lu&ocirc;n th&ocirc;ng cảm với những lo toan, mong muốn n&agrave;y v&agrave; lu&ocirc;n sẵn l&ograve;ng hỗ trợ c&aacute;c cặp đ&ocirc;i hết m&igrave;nh.</p>

<p>Lựa chọn&nbsp;<strong>Mimi Wedding</strong>&nbsp;l&agrave; studio thực hiện album cưới đồng nghĩa với việc bạn đ&atilde; c&oacute; những cam đoan chắc chắn cả về chất lượng lẫn gi&aacute; cả. Ch&uacute;ng t&ocirc;i cung cấp dịch vụ thực hiện&nbsp;<a href="http://mimi.com.vn/chup-anh-cuoi-gia-re-nhat-tai-tphcm-sbg">album ảnh cưới</a>&nbsp;tại mọi địa điểm, theo mọi phong c&aacute;ch v&agrave; với mọi &yacute; tưởng. Từ Bắc ch&iacute; Nam, từ Đ&ocirc;ng sang T&acirc;y, l&ecirc;n rừng xuống biển, &ecirc;kip&nbsp;<strong>Mimi Wedding</strong>&nbsp;lu&ocirc;n c&oacute; mặt khi bạn cần. Từ kh&acirc;u tiếp nhận y&ecirc;u cầu, tư vấn phong c&aacute;ch đến chuẩn bị đạo cụ, l&ecirc;n lịch tr&igrave;nh chụp, nh&acirc;n vi&ecirc;n Mimi đều hết sức &acirc;n cần, chuy&ecirc;n nghiệp. Đặc biệt, với tay nghề cao, nhiếp ảnh gia v&agrave; designer của ch&uacute;ng t&ocirc;i sẽ cho ra đời những mẫu album đẹp mắt, ấn tượng nhất với chất lượng in h&agrave;ng đầu. Chỉ cần cho ch&uacute;ng t&ocirc;i biết bạn muốn,&nbsp;<strong>Mimi Wedding</strong>&nbsp;sẽ biến ch&uacute;ng th&agrave;nh hiện thực.</p>

<p>Xem th&ecirc;m&nbsp;<a href="http://mimi.com.vn/dich-vu">dịch vụ của ch&uacute;ng t&ocirc;i</a>.</p>

<p>Bố cục s&aacute;ng tạo, nước m&agrave;u trong s&aacute;ng, chất lượng album đẳng cấp v&agrave; vượt trội, tin rằng Mimi Wedding sẽ l&agrave;m bạn h&agrave;i l&ograve;ng.</p>

<p><em>Tham khảo một số album ảnh cưới tuyệt đẹp tại&nbsp;</em><em><strong><a href="http://mimi.com.vn/">MiMi Wedding</a></strong></em><em><strong>&nbsp;</strong>nh&eacute;:</em></p>

<p>&nbsp;</p>

<p><img alt="Chỉ cần cho chúng tôi biết bạn muốn, Mimi Wedding sẽ biến chúng thành hiện thực" src="http://mimi.com.vn/newsmultidata/phim-truong-white-house-17-654.jpg" /></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p><img alt="Chỉ cần cho chúng tôi biết bạn muốn, Mimi Wedding sẽ biến chúng thành hiện thực" src="http://mimi.com.vn/newsmultidata/phim-truong-white-house-12-214.jpg" /></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p><img alt="Chỉ cần cho chúng tôi biết bạn muốn, Mimi Wedding sẽ biến chúng thành hiện thực" src="http://mimi.com.vn/newsmultidata/118.jpg" /></p>

<p><img alt="Chỉ cần cho chúng tôi biết bạn muốn, Mimi Wedding sẽ biến chúng thành hiện thực" src="http://mimi.com.vn/newsmultidata/128.jpg" /></p>
')
INSERT [dbo].[Banggia] ([ID], [Name], [Gia], [NoiDung], [NDCT]) VALUES (2, N'VIP 2                                             ', 4500000, N'Phim Trường Smiley.01 Album 20x30cm.02 Ảnh lớn 60x90cm.01 váy cưới.02 áo dài cô dâu', N'<ul>
	<li>
	<p dir="ltr"><strong><span style="font-size:16px">Tặng ngay 1 bộ ảnh khung k&iacute;nh cực đẹp trị gi&aacute; 990.000Đ</span></strong></p>
	</li>
	<li>
	<p dir="ltr"><strong><span style="font-size:16px">Tặng b&igrave;a Meka tr&agrave;n trang 700K</span></strong></p>
	</li>
	<li>
	<p dir="ltr"><strong><span style="font-size:16px">01 Album cỡ (30x30) Or (25x38) cm Cực đẹp</span></strong></p>
	</li>
	<li>
	<p dir="ltr"><strong><span style="font-size:16px">2 ảnh ph&oacute;ng to (60x90) Hoặc 03 Ảnh ph&oacute;ng (50x75) lamila cao cấp</span></strong></p>
	</li>
	<li>
	<p dir="ltr"><strong><span style="font-size:16px">01 Ảnh b&agrave;n {20x30} lamila cao cấp</span></strong></p>
	</li>
	<li>
	<p dir="ltr"><strong><span style="font-size:16px">01 T&uacute;i da cao cấp để Album cưới</span></strong></p>
	</li>
	<li>
	<p dir="ltr"><strong><span style="font-size:16px">01 v&aacute;y mặc ng&agrave;y cưới nhập khẩu t&ugrave;y chọn.(cam kết v&aacute;y nhập khẩu mượn từ 8 đến 10 ng&agrave;y).</span></strong></p>
	</li>
	<li>
	<p dir="ltr"><strong><span style="font-size:16px">01 &aacute;o d&agrave;i c&ocirc; d&acirc;u + 5,7,9 &aacute;o d&agrave;i đỡ lễ + 9 calavat / c&agrave; vạt ( Mượn Từ 5-10 ng&agrave;y)</span></strong></p>
	</li>
	<li>
	<p dir="ltr"><strong><span style="font-size:16px">01 Trang điểm miễn ph&iacute; ng&agrave;y cưới cửa h&agrave;ng</span></strong></p>
	</li>
	<li>
	<p dir="ltr"><strong><span style="font-size:16px">02 đĩa DVD ảnh động + to&agrave;n bộ File gốc + file thiết kế đ&atilde; chỉnh sửa</span></strong></p>

	<p>&nbsp;</p>
	</li>
	<li><span style="font-size:14px"><em>* kh&aacute;ch h&agrave;ng chụp 5 trang phục , 5 kiểu t&oacute;c ph&ugrave; hợp với trang phục&nbsp;</em></span></li>
	<li><span style="font-size:14px"><em>- C&ocirc; d&acirc;u :thay từ 3 - 5 v&aacute;y(V&aacute;y trắng+v&aacute;y m&agrave;u+v&aacute;y ngắn) +&nbsp;</em><em>1 &aacute;o d&agrave;i đ&ocirc;i c&ocirc; d&acirc;u v&agrave; ch&uacute; rể&nbsp;</em></span></li>
	<li><span style="font-size:14px">- Ch&uacute; rể : 2 vest nhập ( Vest đen + Vest trắng )</span></li>
	<li><span style="font-size:14px"><em>- Kh&aacute;ch h&agrave;ng chụp miễn ph&iacute; 5 điểm d&atilde; ngoại +&nbsp;<em>Phim Trường Golden</em></em></span></li>
	<li><span style="font-size:14px"><em><em><em>- Bờ Hồ+ Kh&aacute;ch sạn Metrophole +Vườn hoa con c&oacute;c &nbsp;+Phim trường Golden +</em><em>&nbsp;Chụp Tr&agrave;ng Tiền</em></em></em></span></li>
	<li><span style="font-size:14px"><em><em>-&nbsp; Vườn hoa nhật t&acirc;n + Vườn đ&agrave;o + Bờ Hồ+ Kh&aacute;ch sạn Metrophole +Vườn hoa con c&oacute;c +&nbsp;Chụp Tr&agrave;ng Tiền&nbsp;</em></em></span></li>
</ul>
')
INSERT [dbo].[Banggia] ([ID], [Name], [Gia], [NoiDung], [NDCT]) VALUES (3, N'VIP 1                                             ', 6000000, N'Phim Trường Smiley. Trang điểm tại nhà. 01 Album 25x38cm. 02 Ảnh lớn 60x90cm. 01 váy cưới', N'<p><span style="font-size:20px"><strong>Tặng Phiếu Mua Nhẫn Cưới 3 Triệu V&agrave; Tặng 2 Vi&ecirc;n kim Cương 0.2 Ly Tại Tr&agrave;ng Tiền Plaza</strong></span></p>

<p>- <span style="color:#c0392b"><span style="font-size:14px"><em><strong>Kh&aacute;ch h&agrave;ng trọn g&oacute;i VIP 2 trở l&ecirc;n được tặng 1 bộ vest cưới thương hiệu đẳng cấp tại Cường vest 273 phố huế (Trọn đồ tại phố huế)</strong></em></span></span></p>

<p>&nbsp;</p>

<ul>
	<li>
	<p dir="ltr"><strong><span style="font-size:16px"><span style="color:#000000"><span style="background-color:#ffffff">Tặng ngay 1 bộ ảnh khung k&iacute;nh cực đẹp trị gi&aacute; 990.000Đ</span></span></span></strong></p>
	</li>
	<li>
	<p dir="ltr"><strong><span style="font-size:16px"><span style="color:#000000"><span style="background-color:#ffffff">Tặng b&igrave;a meka tr&agrave;n trang 500K</span></span></span></strong></p>
	</li>
	<li>
	<p dir="ltr"><strong><span style="font-size:16px"><span style="color:#000000"><span style="background-color:#ffffff">Cam kết Kh&ocirc;ng chụp ghép đ&ocirc;i &ndash; Kh&ocirc;ng phát sinh chi phí</span></span></span></strong></p>
	</li>
	<li>
	<p dir="ltr"><strong><span style="font-size:16px"><span style="color:#000000"><span style="background-color:#ffffff">Miễn Ph&iacute; v&eacute; v&agrave;o phim trường Đẹp nhất HN v&agrave; 05 điểm ngo&agrave;i trời</span></span></span></strong></p>
	</li>
	<li>
	<p dir="ltr"><strong><span style="font-size:16px"><span style="color:#000000"><span style="background-color:#ffffff">01 Album cỡ (20x20) cm Đẹp v&agrave; Tự Nhi&ecirc;n</span></span></span></strong></p>
	</li>
	<li>
	<p dir="ltr"><strong><span style="font-size:16px"><span style="color:#000000"><span style="background-color:#ffffff">02 Ảnh ph&oacute;ng lớn (60x90) lamila cao cấp</span></span></span></strong></p>
	</li>
	<li>
	<p dir="ltr"><strong><span style="font-size:16px"><span style="color:#000000"><span style="background-color:#ffffff">01 Ảnh để b&agrave;n phấn (20x30) lamila cao cấp</span></span></span></strong></p>
	</li>
	<li>
	<p dir="ltr"><strong><span style="font-size:16px"><span style="color:#000000"><span style="background-color:#ffffff">01 T&uacute;i da cao cấp để Album cưới</span></span></span></strong></p>
	</li>
	<li>
	<p dir="ltr"><strong><span style="font-size:16px"><span style="color:#000000"><span style="background-color:#ffffff">01 v&aacute;y mặc ng&agrave;y cưới nhập khẩu t&ugrave;y chọn.(cam kết v&aacute;y nhập khẩu &nbsp;mượn từ 8 đến 10 ng&agrave;y).</span></span></span></strong></p>
	</li>
	<li>
	<p dir="ltr"><strong><span style="font-size:16px"><span style="color:#000000"><span style="background-color:#ffffff">01 &aacute;o d&agrave;i c&ocirc; d&acirc;u + 5,7,9 &aacute;o d&agrave;i đỡ lễ + 9 calavat / c&agrave; vạt (Mượn Từ 5-10 ng&agrave;y)</span></span></span></strong></p>

	<p>&nbsp;</p>
	</li>
	<li><strong><span style="font-size:16px"><span style="color:#000000"><em><span style="background-color:#ffffff">C&ocirc; d&acirc;u :thay từ 3 - 5 v&aacute;y(V&aacute;y trắng+v&aacute;y m&agrave;u+v&aacute;y ngắn) +&nbsp;1 &aacute;o d&agrave;i đ&ocirc;i c&ocirc; d&acirc;u v&agrave; ch&uacute; rể&nbsp;</span></em></span></span></strong></li>
	<li><strong><span style="font-size:16px"><span style="color:#000000"><span style="background-color:#ffffff">Ch&uacute; rể : 2 vest nhập ( Vest đen + Vest trắng )</span></span></span></strong></li>
	<li><strong><span style="font-size:16px"><span style="color:#000000"><em><span style="background-color:#ffffff">- Kh&aacute;ch h&agrave;ng chụp miễn ph&iacute; 5 điểm d&atilde; ngoại +&nbsp;</span><em><span style="background-color:#ffffff">Phim Trường Smile</span></em></em></span></span></strong></li>
	<li><strong><span style="font-size:16px"><span style="color:#000000"><em><span style="background-color:#ffffff">- Bờ Hồ+ Kh&aacute;ch sạn Metrophole +Vườn hoa con c&oacute;c &nbsp;+Phim trường Smile +&nbsp;Chụp Tr&agrave;ng Tiền</span></em></span></span></strong></li>
	<li><strong><span style="font-size:16px"><span style="color:#000000"><em><em><span style="background-color:#ffffff">-&nbsp; Vườn hoa nhật t&acirc;n + Vườn đ&agrave;o + Bờ Hồ+ Kh&aacute;ch sạn Metrophole +Vườn hoa con c&oacute;c +</span></em><em><span style="background-color:#ffffff">&nbsp;Chụp Tr&agrave;ng Tiền&nbsp;</span></em></em></span></span></strong></li>
	<li><strong><span style="font-size:16px"><span style="color:#000000"><em><span style="background-color:#ffffff">- Phim Trường Smiley Ville ( Miền Đ&ocirc;ng nước anh) + lavender nguyễn xiển &nbsp;+ vườn nh&atilde;n gia l&acirc;m + chụp Sen Hồ T&acirc;y &nbsp;+ B&atilde;i Đ&aacute; S&ocirc;ng Hồng , Love Garden lạc long qu&acirc;n , M&#39;s THAO an dương&nbsp;</span><em><span style="background-color:#ffffff">)</span></em><span style="background-color:#ffffff">&nbsp;</span></em></span></span></strong></li>
</ul>
')
INSERT [dbo].[Banggia] ([ID], [Name], [Gia], [NoiDung], [NDCT]) VALUES (5, N'QUAY PHIM - CHỤP HÌNH CƯỚI                        ', 9600000, N'Một video cưới 4k.Miễn phí trang điểm cô dâu, chú rễ.Có xe đưa rước tận nơi.Hỗ trợ ăn uống', N'<p>Người ta thường n&oacute;i, trong cuộc đời mỗi c&aacute; nh&acirc;n, c&oacute; ba lựa chọn quan trọng quyết định th&agrave;nh c&ocirc;ng v&agrave; hạnh ph&uacute;c của họ. Đ&oacute; l&agrave; chọn bạn, chọn nghề v&agrave; chọn vợ. Cũng theo quan điểm truyền thống &Aacute; Đ&ocirc;ng, h&ocirc;n nh&acirc;n c&oacute; một &yacute; nghĩa thi&ecirc;ng li&ecirc;ng v&agrave; h&ocirc;n lễ, v&igrave; thế cũng l&agrave; nghi thức kh&ocirc;ng thể thực hiện một c&aacute;ch t&ugrave;y tiện qua loa. Dẫu cuộc sống c&oacute; hiện đại h&oacute;a như thế n&agrave;o, dẫu c&aacute;c c&ocirc; d&acirc;u c&oacute; thể tha hồ chọn soire theo &yacute; m&igrave;nh, đặt tiệc kiểu &Acirc;u, Nhật t&ugrave;y th&iacute;ch, nhưng lễ đ&oacute;n d&acirc;u, lễ gia ti&ecirc;n trong ng&agrave;y cưới vẫn được giữ nguy&ecirc;n với đủ mọi tr&igrave;nh tự v&agrave; phong tục tốt đẹp.</p>

<p>Xem th&ecirc;m những nơi&nbsp;<a href="http://mimi.com.vn/di-cho-bang-het-6-diem-chup-hinh-cuoi-dep-ngat-ngay-o-tphcm-snw">chụp h&igrave;nh cưới đẹp ở Tp.HCM</a>.</p>

<p>&nbsp;</p>

<p><img alt="chup-hinh-cuoi-quay-phim-cuoi" src="http://mimi.com.vn/newsmultidata/130.jpg" />&nbsp;Chia sẻ</p>

<p>&nbsp;</p>

<p>Nếu c&ocirc; d&acirc;u ch&uacute; rể xem trọng&nbsp;<a href="http://mimi.com.vn/chup-anh-cuoi-gia-re-nhat-tai-tphcm-sbg"><strong>album cưới</strong></a>, th&igrave; hai b&ecirc;n gia đ&igrave;nh lại ch&uacute; &yacute; phần quay phim &ndash; chụp h&igrave;nh ng&agrave;y cưới. Trong đ&oacute;, quan trọng nhất l&agrave; đảm bảo nắm bắt được mọi diễn biến, kh&ocirc;ng bỏ lỡ bất cứ khoảnh khắc thi&ecirc;ng li&ecirc;ng n&agrave;o v&agrave; t&aacute;i hiện trọn vẹn niềm vui, sự ch&uacute;c ph&uacute;c của cả hai họ. V&agrave; đ&acirc;y l&agrave; điều m&agrave; chỉ những studio c&oacute; tầm v&agrave; c&oacute; t&acirc;m mới c&oacute; thể thực hiện.</p>

<p>&nbsp;</p>

<p><img alt="chup hinh cuoi" src="http://mimi.com.vn/newsmultidata/123.jpg" /></p>

<p>&nbsp;</p>

<p>L&agrave; studio chuy&ecirc;n nghiệp,&nbsp;<strong>Mimi Wedding</strong>&nbsp;sẽ gi&uacute;p bạn c&oacute; một album ng&agrave;y cưới cũng như video clip đẹp mắt, hấp dẫn với đầy đủ tất cả những khoảnh khắc quan trọng nhất. Đặc biệt, Mimi hỗ trợ mọi xu hướng theo y&ecirc;u cầu, từ phong c&aacute;ch truyền thống đến chụp h&igrave;nh ph&oacute;ng sự. C&oacute;&nbsp;<strong><a href="http://mimi.com.vn/">Mimi Wedding</a></strong>, ng&agrave;y vui của bạn sẽ c&agrave;ng &yacute; nghĩa!</p>

<p>Ngo&agrave;i ra,&nbsp;<strong>MiMi Wedding</strong>&nbsp;c&ograve;n c&oacute;&nbsp;<a href="http://mimi.com.vn/dich-vu">dịch vụ chụp h&igrave;nh</a>, quay phim tất cả c&aacute;c loại tiệc: tiệc sinh nhật, li&ecirc;n hoan, họp mặt...</p>
')
INSERT [dbo].[Banggia] ([ID], [Name], [Gia], [NoiDung], [NDCT]) VALUES (6, N'HOA CƯỚI                                          ', 6000000, N'Một hoa cưới cho cô dâu. Trang trí hoa cưới cho tiệc. Trang trí hoa cho xe rước cô dâu. Tặng các dụng cụ trang trí', N'<p>Đ&atilde; bao giờ bạn thắc mắc, v&igrave; sao c&ocirc; d&acirc;u phải cầm theo một b&oacute; hoa tươi trong ng&agrave;y cưới của m&igrave;nh. C&oacute; rất nhiều giả thiết kh&aacute;c nhau để l&yacute; giải điều n&agrave;y.</p>

<p>Ch&uacute;ng ta đều biết, hoa lu&ocirc;n l&agrave; biểu tượng của vẻ đẹp, của sự nữ t&iacute;nh, của tuổi trẻ v&agrave; thanh xu&acirc;n. Một số lo&agrave;i hoa mang những &yacute; nghĩa s&acirc;u sắc như hoa hồng tượng trưng cho t&igrave;nh y&ecirc;u, hoa ly đại diện cho đức hạnh&hellip; Bắt đầu từ phương T&acirc;y, theo t&iacute;n ngưỡng cổ xưa, trong ng&agrave;y cưới, c&ocirc; d&acirc;u mang theo một số loại thảo mộc hay hoa cỏ để thể hiện sự chung thủy, cầu mong một t&igrave;nh y&ecirc;u vĩnh hằng v&agrave; hạnh ph&uacute;c tr&agrave;n đầy. Tại một số v&ugrave;ng, b&oacute; hoa tr&ecirc;n tay c&ocirc; d&acirc;u được kết từ thảo mộc v&agrave; một số loại c&acirc;y gia vị c&ograve;n c&oacute; t&aacute;c dụng xua đuổi t&agrave; m&agrave;, tr&aacute;nh điềm gở. Trải qua nhiều thế kỷ, hoa cưới vẫn giữ vị tr&iacute; của n&oacute; nhưng dần d&agrave;, người ta thường nghĩ đ&acirc;y l&agrave; vật trang tr&iacute;, l&agrave;m c&ocirc; d&acirc;u th&ecirc;m lộng lẫy v&agrave; tươi tắn chứ kh&ocirc;ng c&ograve;n mang &yacute; nghĩa t&acirc;m linh hay chiều s&acirc;u văn h&oacute;a.</p>

<p>Nhưng một khi đ&atilde; hiểu &yacute; nghĩa v&agrave; nguồn gốc của tục cầm hoa tươi trong ng&agrave;y cưới, bạn ho&agrave;n to&agrave;n c&oacute; thể chủ động chọn một b&oacute; hoa cầm tay với m&agrave;u sắc, kiểu b&oacute; v&agrave; nhất l&agrave; với loại hoa m&agrave; m&igrave;nh y&ecirc;u th&iacute;ch. Tại&nbsp;<strong>Mimi Wedding</strong>, ch&uacute;ng t&ocirc;i sẽ gi&uacute;p bạn chọn hoa sao cho ph&ugrave; hợp cũng như b&oacute; hoa thật đẹp mắt, tinh tế v&agrave; s&aacute;ng tạo. D&ugrave; l&agrave; phong c&aacute;ch g&igrave;, xu hướng ra sao,&nbsp;<strong>Mimi Weddin</strong><strong>g</strong>&nbsp;sẽ cố gắng ho&agrave;n th&agrave;nh mong muốn của bạn, cho một ng&agrave;y cưới thật vẹn tr&ograve;n.</p>
')
SET IDENTITY_INSERT [dbo].[Banggia] OFF
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([ID], [img], [sub], [content], [author], [dateup]) VALUES (1, N'../assets/img/3.jpg', N'Chụp ảnh ngoại cảnh', N'Monogramming, to this day, remains a prominent service that vendors have been offering to provide their customers with a more personalized product, whether it be an article of clothing or an accessory. Now, with the emergence of eCommerce businesses, providing the option to monogram one''s products through online retailers has become a highly sought after function for store owners.

On the Shopify platform, there is no out-of-the-box manner of recording information from your customers for monogramming within your product settings. However there are several work-arounds - we would be happy to walk you through a quick method to enable this component on your store.', NULL, NULL)
INSERT [dbo].[Blog] ([ID], [img], [sub], [content], [author], [dateup]) VALUES (2, N'http://kenhcuoi.com.vn/wp-content/uploads/2016/02/tong-hop-studio-cho-thue-ao-cuoi-v%C3%A0-chup-anh-cuoi-dep-tai-tp-hcm-25-1024x635.jpg', N'Chọn áo cưới như thế nào', N'<p>L&agrave; c&ocirc;ng ty 100% vốn Nhật Bản c&oacute; hơn 20 năm hoạt động tr&ecirc;n thị trường cưới ở c&aacute;c nước ch&acirc;u &Aacute;, Orange Studio chuy&ecirc;n cung cấp&nbsp;<strong>&aacute;o cưới v&agrave; dịch vụ cưới</strong>&nbsp;chuy&ecirc;n nghiệp. Ngo&agrave;i đa dạng từ những thiết kế&nbsp;<strong>v&aacute;y cưới</strong>&nbsp;đơn giản, nhẹ nh&agrave;ng cho đến cầu kỳ, lộng lẫy, đ&aacute;p ứng những kiểu mẫu đ&uacute;ng &yacute; c&ocirc; d&acirc;u mong, Orange Studio c&ograve;n bắt kịp xu hướng&nbsp;<strong>chụp ảnh&nbsp;cưới</strong>&nbsp;phong c&aacute;ch H&agrave;n Quốc khi sở hữu phim trường rộng hơn 9.000m<sup>2&nbsp;</sup>&nbsp;với rất nhiều bối cảnh ri&ecirc;ng biệt l&agrave;m cho những&nbsp;<strong>album ảnh cưới</strong>&nbsp;trở n&ecirc;n sinh động v&agrave; c&aacute;c photographer dễ s&aacute;ng tạo, đa dạng c&aacute;c g&oacute;c chụp hơn.</p>

<p>&nbsp;</p>

<p><a href="http://kenhcuoi.com.vn/wp-content/uploads/2016/02/tong-hop-studio-cho-thue-ao-cuoi-v%C3%A0-chup-anh-cuoi-dep-tai-tp-hcm-24.jpg"><img alt="Tổng hợp studio cho thuê áo cưới và chụp ảnh cưới đẹp ở TP.HCM" height="683" sizes="(max-width: 1024px) 100vw, 1024px" src="http://kenhcuoi.com.vn/wp-content/uploads/2016/02/tong-hop-studio-cho-thue-ao-cuoi-v%C3%A0-chup-anh-cuoi-dep-tai-tp-hcm-24-1024x683.jpg" srcset="http://kenhcuoi.com.vn/wp-content/uploads/2016/02/tong-hop-studio-cho-thue-ao-cuoi-và-chup-anh-cuoi-dep-tai-tp-hcm-24-1024x683.jpg 1024w, http://kenhcuoi.com.vn/wp-content/uploads/2016/02/tong-hop-studio-cho-thue-ao-cuoi-và-chup-anh-cuoi-dep-tai-tp-hcm-24-245x163.jpg 245w, http://kenhcuoi.com.vn/wp-content/uploads/2016/02/tong-hop-studio-cho-thue-ao-cuoi-và-chup-anh-cuoi-dep-tai-tp-hcm-24.jpg 1050w" title="Tổng hợp studio cho thuê áo cưới và chụp ảnh cưới đẹp ở TP.HCM" width="1024" /></a></p>

<p><a href="http://kenhcuoi.com.vn/wp-content/uploads/2016/02/tong-hop-studio-cho-thue-ao-cuoi-v%C3%A0-chup-anh-cuoi-dep-tai-tp-hcm-25.jpg"><img alt="Tổng hợp studio cho thuê áo cưới và chụp ảnh cưới đẹp ở TP.HCM" height="635" sizes="(max-width: 1024px) 100vw, 1024px" src="http://kenhcuoi.com.vn/wp-content/uploads/2016/02/tong-hop-studio-cho-thue-ao-cuoi-v%C3%A0-chup-anh-cuoi-dep-tai-tp-hcm-25-1024x635.jpg" srcset="http://kenhcuoi.com.vn/wp-content/uploads/2016/02/tong-hop-studio-cho-thue-ao-cuoi-và-chup-anh-cuoi-dep-tai-tp-hcm-25-1024x635.jpg 1024w, http://kenhcuoi.com.vn/wp-content/uploads/2016/02/tong-hop-studio-cho-thue-ao-cuoi-và-chup-anh-cuoi-dep-tai-tp-hcm-25-245x152.jpg 245w, http://kenhcuoi.com.vn/wp-content/uploads/2016/02/tong-hop-studio-cho-thue-ao-cuoi-và-chup-anh-cuoi-dep-tai-tp-hcm-25.jpg 1050w" title="Tổng hợp studio cho thuê áo cưới và chụp ảnh cưới đẹp ở TP.HCM" width="1024" /></a></p>

<p><strong>Địa chỉ:</strong>&nbsp;115B Trần Đ&igrave;nh Xu, P.Nguyễn Cư Trinh, Q.1, TP.HCM</p>

<p><strong>Website</strong>: http://orangestudio.vn</p>

<h2>Ngọc Huy Studio</h2>

<p><strong>Ngọc Huy Studio</strong>&nbsp;l&agrave; một trong những studio lớn, c&oacute; thương hiệu l&acirc;u năm, chất lượng tốt v&agrave; t&aacute;c phong chuy&ecirc;n nghiệp v&agrave; đ&atilde; c&oacute; hơn 10 năm kinh nghiệm chụp h&igrave;nh cưới. Ch&iacute;nh v&igrave; thế, ti&ecirc;u ch&iacute; của&nbsp;<strong>Ngọc Huy Studio</strong>&nbsp;l&agrave; kh&ocirc;ng ngừng t&igrave;m t&ograve;i, s&aacute;ng tạo v&agrave; nghi&ecirc;n cứu để n&acirc;ng cao chất lượng sản phẩm cũng như chất lượng phục vụ, nhằm mang lại cho kh&aacute;ch h&agrave;ng lợi &iacute;ch tốt nhất.</p>

<p><img alt="Điểm danh studio cho thuê áo cưới và chụp ảnh cưới đẹp ở TP.HCM" height="600" src="http://kenhcuoi.com.vn/wp-content/uploads/2016/06/hinh-3-ngoc-huy-studio-giam-30-cho-tron-goi-ngay-cuoi-1.gif" title="Điểm danh studio cho thuê áo cưới và chụp ảnh cưới đẹp ở TP.HCM" width="900" /></p>
', N'Nguyễn Hữu Trọng', CAST(0xC33F0B00 AS Date))
SET IDENTITY_INSERT [dbo].[Blog] OFF
SET IDENTITY_INSERT [dbo].[CTAlbum] ON 

INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (42, 29, N'~/assets/Album/Album Cabin/cabin_01.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (43, 29, N'~/assets/Album/Album Cabin/cabin_02.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (44, 29, N'~/assets/Album/Album Cabin/cabin_07.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (45, 29, N'~/assets/Album/Album Cabin/cabin_07.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (46, 20, N'~/assets/Album/Nguyen/cabin_02.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (48, 20, N'~/assets/Album/Nguyen/cabin_01.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (49, 20, N'~/assets/Album/Nguyen/cabin_07.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (50, 29, N'~/assets/Album/Album Cabin/vila_q9_06.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (51, 29, N'~/assets/Album/Album Cabin/vila_q9_07.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (52, 29, N'~/assets/Album/Album Cabin/vila_q9_09.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (53, 29, N'~/assets/Album/Album Cabin/vila_q9_10.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (54, 29, N'~/assets/Album/Album Cabin/vila_q9_13.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (55, 20, N'~/assets/Album/Nguyen/da_lat_08.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (56, 20, N'~/assets/Album/Nguyen/da_lat_10.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (57, 20, N'~/assets/Album/Nguyen/en_de_10.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (58, 20, N'~/assets/Album/Nguyen/en_de_11.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (59, 30, N'~/assets/Album/Anh Cuoi Da Lat/da_lat_01.png')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (60, 30, N'~/assets/Album/Anh Cuoi Da Lat/da_lat_02.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (61, 30, N'~/assets/Album/Anh Cuoi Da Lat/da_lat_03.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (62, 30, N'~/assets/Album/Anh Cuoi Da Lat/da_lat_05.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (63, 30, N'~/assets/Album/Anh Cuoi Da Lat/da_lat_06.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (64, 30, N'~/assets/Album/Anh Cuoi Da Lat/da_lat_08.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (65, 30, N'~/assets/Album/Anh Cuoi Da Lat/da_lat_10.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (66, 30, N'~/assets/Album/Anh Cuoi Da Lat/da_lat_14.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (67, 30, N'~/assets/Album/Anh Cuoi Da Lat/da_lat_15.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (68, 30, N'~/assets/Album/Anh Cuoi Da Lat/da_lat_16.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (69, 31, N'~/assets/Album/Pho Mong Mo/en_de_20.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (70, 31, N'~/assets/Album/Pho Mong Mo/vila_q9_01jpg.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (71, 31, N'~/assets/Album/Pho Mong Mo/vila_q9_02.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (72, 31, N'~/assets/Album/Pho Mong Mo/vila_q9_03.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (73, 31, N'~/assets/Album/Pho Mong Mo/vila_q9_04.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (74, 31, N'~/assets/Album/Pho Mong Mo/vila_q9_05.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (75, 31, N'~/assets/Album/Pho Mong Mo/vila_q9_06.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (76, 31, N'~/assets/Album/Pho Mong Mo/vila_q9_07.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (77, 31, N'~/assets/Album/Pho Mong Mo/vila_q9_09.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (78, 31, N'~/assets/Album/Pho Mong Mo/vila_q9_10.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (79, 32, N'~/assets/Album/Le Thu va Van Dong/vila_q9_04.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (80, 32, N'~/assets/Album/Le Thu va Van Dong/vila_q9_06.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (81, 32, N'~/assets/Album/Le Thu va Van Dong/vila_q9_07.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (82, 32, N'~/assets/Album/Le Thu va Van Dong/vila_q9_09.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (83, 32, N'~/assets/Album/Le Thu va Van Dong/vila_q9_10.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (84, 32, N'~/assets/Album/Le Thu va Van Dong/vila_q9_13.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (85, 32, N'~/assets/Album/Le Thu va Van Dong/vila_q9_14.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (86, 33, N'~/assets/Album/Doi Trai Tai Gai Sac/da_lat_02.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (87, 33, N'~/assets/Album/Doi Trai Tai Gai Sac/da_lat_03.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (88, 33, N'~/assets/Album/Doi Trai Tai Gai Sac/da_lat_10.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (89, 33, N'~/assets/Album/Doi Trai Tai Gai Sac/da_lat_14.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (90, 33, N'~/assets/Album/Doi Trai Tai Gai Sac/en_de_11.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (91, 33, N'~/assets/Album/Doi Trai Tai Gai Sac/en_de_12-682.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (92, 33, N'~/assets/Album/Doi Trai Tai Gai Sac/en_de_13.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (93, 33, N'~/assets/Album/Doi Trai Tai Gai Sac/en_de_15.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (94, 33, N'~/assets/Album/Doi Trai Tai Gai Sac/vila_q9_03.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (95, 34, N'~/assets/Album/Ve Voi Rung Xanh/da_lat_01.png')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (96, 34, N'~/assets/Album/Ve Voi Rung Xanh/da_lat_02.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (97, 34, N'~/assets/Album/Ve Voi Rung Xanh/da_lat_05.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (98, 34, N'~/assets/Album/Ve Voi Rung Xanh/da_lat_08.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (99, 34, N'~/assets/Album/Ve Voi Rung Xanh/da_lat_14.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (100, 34, N'~/assets/Album/Ve Voi Rung Xanh/da_lat_15.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (101, 34, N'~/assets/Album/Ve Voi Rung Xanh/da_lat_16.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (102, 35, N'~/assets/Album/Album Dep/en_de_18.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (103, 35, N'~/assets/Album/Album Dep/en_de_19.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (104, 35, N'~/assets/Album/Album Dep/vila_q9_02.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (105, 35, N'~/assets/Album/Album Dep/vila_q9_03.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (106, 35, N'~/assets/Album/Album Dep/vila_q9_04.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (107, 35, N'~/assets/Album/Album Dep/vila_q9_05.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (108, 35, N'~/assets/Album/Album Dep/vila_q9_09.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (109, 35, N'~/assets/Album/Album Dep/vila_q9_10.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (110, 35, N'~/assets/Album/Album Dep/vila_q9_07 - Copy.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (111, 35, N'~/assets/Album/Album Dep/vila_q9_03 - Copy.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (112, 35, N'~/assets/Album/Album Dep/vila_q9_04 - Copy.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (113, 35, N'~/assets/Album/Album Dep/vila_q9_05 - Copy.jpg')
INSERT [dbo].[CTAlbum] ([ID], [IDALBUM], [PathImg]) VALUES (114, 35, N'~/assets/Album/Album Dep/vila_q9_06 - Copy.jpg')
SET IDENTITY_INSERT [dbo].[CTAlbum] OFF
SET IDENTITY_INSERT [dbo].[Donhang] ON 

INSERT [dbo].[Donhang] ([ID], [NameKH], [NPhone], [EmailKH], [GoiDV], [Ghichu]) VALUES (1, N'David Ngyen', N'0348308407          ', N'Nguyen@gmail.com                                  ', N'VIP 1               ', N'No.1')
SET IDENTITY_INSERT [dbo].[Donhang] OFF
SET IDENTITY_INSERT [dbo].[video] ON 

INSERT [dbo].[video] ([ID], [Img], [Name], [Link]) VALUES (1, N'../assets/img/banner.jpg', N'Phóng sự cươi Anh Duy & Thùy Linh - 2019 ', N'https://www.youtube.com/embed/Z-CSfnxHyjU')
INSERT [dbo].[video] ([ID], [Img], [Name], [Link]) VALUES (2, N'http://mimi.com.vn/resizemultidata/cabin_10.jpg', N'Phóng sự cưới Quân -Uyên ,Đà Lạt 2019', N'https://www.youtube.com/embed/N1cxcW9P3Vg')
INSERT [dbo].[video] ([ID], [Img], [Name], [Link]) VALUES (3, N'http://mimi.com.vn/resizemultidata/cabin_11.jpg', N'Phóng Sự Cưới Khi Chúng Ta Già ( Phạm Hồng Phước - Hương Giang ldol )', N'https://www.youtube.com/embed/zEmTWgdID94')
INSERT [dbo].[video] ([ID], [Img], [Name], [Link]) VALUES (4, N'http://mimi.com.vn/resizemultidata/vila_q9_13.jpg', N'[Wedding Media] phong su cuoi ,đám cưới quẩy cùng 500 ae', N'https://www.youtube.com/embed/MWuGE7JbNKc')
SET IDENTITY_INSERT [dbo].[video] OFF
ALTER TABLE [dbo].[CTAlbum]  WITH CHECK ADD FOREIGN KEY([IDALBUM])
REFERENCES [dbo].[Album] ([ID])
GO
