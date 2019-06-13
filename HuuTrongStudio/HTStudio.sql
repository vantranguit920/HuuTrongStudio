USE [HTStudio]
GO
/****** Object:  StoredProcedure [dbo].[capnhatalbum]    Script Date: 6/13/2019 7:25:29 PM ******/
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
/****** Object:  StoredProcedure [dbo].[capnhatctalbum]    Script Date: 6/13/2019 7:25:29 PM ******/
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
/****** Object:  StoredProcedure [dbo].[getcurrid]    Script Date: 6/13/2019 7:25:29 PM ******/
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
/****** Object:  StoredProcedure [dbo].[getImgvideo]    Script Date: 6/13/2019 7:25:29 PM ******/
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
/****** Object:  StoredProcedure [dbo].[getPath]    Script Date: 6/13/2019 7:25:29 PM ******/
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
/****** Object:  StoredProcedure [dbo].[getPathall]    Script Date: 6/13/2019 7:25:29 PM ******/
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
/****** Object:  StoredProcedure [dbo].[getPathct]    Script Date: 6/13/2019 7:25:29 PM ******/
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
/****** Object:  StoredProcedure [dbo].[getPathimg]    Script Date: 6/13/2019 7:25:29 PM ******/
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
/****** Object:  StoredProcedure [dbo].[getTenAlbum]    Script Date: 6/13/2019 7:25:29 PM ******/
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
/****** Object:  StoredProcedure [dbo].[maxID]    Script Date: 6/13/2019 7:25:29 PM ******/
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
/****** Object:  StoredProcedure [dbo].[themalbum]    Script Date: 6/13/2019 7:25:29 PM ******/
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
/****** Object:  StoredProcedure [dbo].[themhoaccapnhatctalubm]    Script Date: 6/13/2019 7:25:29 PM ******/
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
/****** Object:  StoredProcedure [dbo].[uploadAlbum]    Script Date: 6/13/2019 7:25:29 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ups_insertCTalbum]    Script Date: 6/13/2019 7:25:29 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ups_insertCTalbumbyid]    Script Date: 6/13/2019 7:25:29 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_insertBG]    Script Date: 6/13/2019 7:25:29 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_insertblog]    Script Date: 6/13/2019 7:25:29 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_InsertDonhang]    Script Date: 6/13/2019 7:25:29 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_insertVideo]    Script Date: 6/13/2019 7:25:29 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_updateAlbum]    Script Date: 6/13/2019 7:25:29 PM ******/
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
/****** Object:  StoredProcedure [dbo].[usp_updateBG]    Script Date: 6/13/2019 7:25:29 PM ******/
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
/****** Object:  StoredProcedure [dbo].[viewallalbum]    Script Date: 6/13/2019 7:25:29 PM ******/
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
/****** Object:  StoredProcedure [dbo].[viewctalbumid]    Script Date: 6/13/2019 7:25:29 PM ******/
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
/****** Object:  StoredProcedure [dbo].[xoaalbum]    Script Date: 6/13/2019 7:25:29 PM ******/
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
/****** Object:  StoredProcedure [dbo].[xoactalbum]    Script Date: 6/13/2019 7:25:29 PM ******/
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
/****** Object:  StoredProcedure [dbo].[xoactalbumid]    Script Date: 6/13/2019 7:25:29 PM ******/
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
/****** Object:  StoredProcedure [dbo].[xoavideo]    Script Date: 6/13/2019 7:25:29 PM ******/
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
/****** Object:  Table [dbo].[Album]    Script Date: 6/13/2019 7:25:29 PM ******/
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
/****** Object:  Table [dbo].[Banggia]    Script Date: 6/13/2019 7:25:29 PM ******/
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
/****** Object:  Table [dbo].[Blog]    Script Date: 6/13/2019 7:25:29 PM ******/
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
/****** Object:  Table [dbo].[CTAlbum]    Script Date: 6/13/2019 7:25:29 PM ******/
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
/****** Object:  Table [dbo].[Donhang]    Script Date: 6/13/2019 7:25:29 PM ******/
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
/****** Object:  Table [dbo].[video]    Script Date: 6/13/2019 7:25:29 PM ******/
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
ALTER TABLE [dbo].[CTAlbum]  WITH CHECK ADD FOREIGN KEY([IDALBUM])
REFERENCES [dbo].[Album] ([ID])
GO
