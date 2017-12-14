
create database produccionEcuavinos
go

use produccionEcuavinos
go

USE [produccionEcuavinos]
GO

/****** Object:  Table [dbo].[Producto]    Script Date: 09/12/2017 14:08:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Producto](
	[CodigoProducto] [int] NOT NULL,
	[DescripcionProducto] [varchar](50) NOT NULL,
	[GrupoProducto] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[CodigoProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


USE [produccionEcuavinos]
GO

/****** Object:  Table [dbo].[HistProduccion]    Script Date: 09/12/2017 14:08:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[HistProduccion](
	[CodigoHistProduccion] [int] NOT NULL,
	[CodigoProducto] [int] NOT NULL,
	[AnioHistProduccion] [int] NOT NULL,
	[VolumenProduccionHistProduccion] [int] NOT NULL,
	[CostoDocenaHistProduccion] [money] NOT NULL,
 CONSTRAINT [PK_HistProduccion] PRIMARY KEY CLUSTERED 
(
	[CodigoHistProduccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[HistProduccion]  WITH CHECK ADD  CONSTRAINT [FK_CodProducto] FOREIGN KEY([CodigoProducto])
REFERENCES [dbo].[Producto] ([CodigoProducto])
GO

ALTER TABLE [dbo].[HistProduccion] CHECK CONSTRAINT [FK_CodProducto]
GO








INSERT INTO Producto(CodigoProducto, DescripcionProducto, GrupoProducto) 
VALUES 
(12765,'McDonell Pinot Noir','Red'),
(12766,'Mornington Pinot Noir','Red'),
(12767,'Downunder Pinot Noir','Red'),
(12821,'Mornington Merlot','Red'),
(14821,'Downunder Merlot','Red'),
(14823,'Mornington Pinot Grigio','White'),
(14827,'Downunder Pinot Grigio','White')
go



select * from Producto;

INSERT INTO [dbo].[HistProduccion]
           ([CodigoHistProduccion]
           ,[CodigoProducto]
           ,[AnioHistProduccion]
           ,[VolumenProduccionHistProduccion]
           ,[CostoDocenaHistProduccion])
     
          

		   VALUES 
		   (1,12765,2013,600,120),
		   (2,12765,2012,580,110),
		   (3,12765,2011,510,90),
		   (4,14823,2013,400,70),
		   (5,14823,2012,250,65),
		   (6,14821,2013,550,100),
		   (7,14821,2012,400,100),
		   (8,12767,2013,780,80),
		   (9,12767,2012,690,85),
		   (10,14827,2013,440,70)



select * from HistProduccion;




