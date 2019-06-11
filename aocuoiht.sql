USE [AoCuoiHT]
GO
/****** Object:  Table [dbo].[Album]    Script Date: 06/11/2019 6:59:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Album](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](50) NULL,
	[Path] [varchar](100) NULL,
	[Pathimg] [varchar](100) NULL,
 CONSTRAINT [PK_Album] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CTAlbum]    Script Date: 06/11/2019 6:59:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CTAlbum](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDAlbum] [int] NOT NULL,
	[Path] [varchar](100) NULL,
 CONSTRAINT [PK_CTAlbum] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Video]    Script Date: 06/11/2019 6:59:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Video](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](100) NULL,
	[Img] [varchar](100) NULL,
	[Path] [varchar](100) NULL,
 CONSTRAINT [PK_Video] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[capnhatalbum]    Script Date: 06/11/2019 6:59:36 PM ******/
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
/****** Object:  StoredProcedure [dbo].[capnhatctalbum]    Script Date: 06/11/2019 6:59:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[capnhatctalbum]
@IDalbum int,
@Path varchar(100)
as
begin
insert CTAlbum(IDAlbum,Path)
values (@IDalbum,@Path)
end
GO
/****** Object:  StoredProcedure [dbo].[getcurrid]    Script Date: 06/11/2019 6:59:36 PM ******/
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
/****** Object:  StoredProcedure [dbo].[getImgvideo]    Script Date: 06/11/2019 6:59:36 PM ******/
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
/****** Object:  StoredProcedure [dbo].[getPath]    Script Date: 06/11/2019 6:59:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getPath]
@ID int
as
begin
select Path from Album
where ID=@ID
end
GO
/****** Object:  StoredProcedure [dbo].[getPathall]    Script Date: 06/11/2019 6:59:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getPathall]
@ID int
as
begin
select Path from CTAlbum
where @ID=IDAlbum
end
GO
/****** Object:  StoredProcedure [dbo].[getPathct]    Script Date: 06/11/2019 6:59:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getPathct]
@ID int
as
begin
select Path from CTAlbum
where @ID = ID
end
GO
/****** Object:  StoredProcedure [dbo].[getPathimg]    Script Date: 06/11/2019 6:59:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getPathimg]
@ID int
as
begin
if((select Top 1 Path from CTAlbum where @ID=IDAlbum) IS NULL)
begin
select MAX(ID) from CTAlbum
end
else
begin
select Top 1 Path from CTAlbum where @ID=IDAlbum
end
end
GO
/****** Object:  StoredProcedure [dbo].[getPathvideo]    Script Date: 06/11/2019 6:59:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getPathvideo]
@ID int
as
begin
select Path from Video
where ID=@ID
end
GO
/****** Object:  StoredProcedure [dbo].[getTenAlbum]    Script Date: 06/11/2019 6:59:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getTenAlbum]
@ID int
as
begin
select Ten from Album
where ID=@ID
end
GO
/****** Object:  StoredProcedure [dbo].[getTenvideo]    Script Date: 06/11/2019 6:59:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getTenvideo]
@ID int
as
begin
select Ten from Video
where ID=@ID
end
GO
/****** Object:  StoredProcedure [dbo].[maxID]    Script Date: 06/11/2019 6:59:36 PM ******/
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
/****** Object:  StoredProcedure [dbo].[themalbum]    Script Date: 06/11/2019 6:59:36 PM ******/
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
insert Album(Ten,Path,Pathimg)
values (@Ten,@Path,@Pathimg)
end
GO
/****** Object:  StoredProcedure [dbo].[themhoaccapnhatctalubm]    Script Date: 06/11/2019 6:59:36 PM ******/
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
insert CTAlbum(IDAlbum,Path)
values (@IDalbum,@Path)
else
Update CTAlbum
set
IDAlbum=@IDalbum,
Path=@Path
end
GO
/****** Object:  StoredProcedure [dbo].[themhoaccapnhatvideo]    Script Date: 06/11/2019 6:59:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[themhoaccapnhatvideo]
@ID int,
@Name nvarchar(100),
@img varchar(100),
@Path varchar(100)
As
Begin
if(@ID=0)
Begin
Insert into Video(Ten,Img,Path)
Values (@Name,@img,@Path)
end
else
begin
update Video
set
Ten=@Name,
Img=@img,
Path=@Path
where
ID=@ID
end
end
GO
/****** Object:  StoredProcedure [dbo].[viewallalbum]    Script Date: 06/11/2019 6:59:36 PM ******/
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
/****** Object:  StoredProcedure [dbo].[viewallvideo]    Script Date: 06/11/2019 6:59:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[viewallvideo]
as
begin
select * from Video
end
GO
/****** Object:  StoredProcedure [dbo].[viewctalbumid]    Script Date: 06/11/2019 6:59:36 PM ******/
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
/****** Object:  StoredProcedure [dbo].[xoaalbum]    Script Date: 06/11/2019 6:59:36 PM ******/
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
/****** Object:  StoredProcedure [dbo].[xoactalbum]    Script Date: 06/11/2019 6:59:36 PM ******/
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
/****** Object:  StoredProcedure [dbo].[xoactalbumid]    Script Date: 06/11/2019 6:59:36 PM ******/
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
/****** Object:  StoredProcedure [dbo].[xoavideo]    Script Date: 06/11/2019 6:59:36 PM ******/
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
