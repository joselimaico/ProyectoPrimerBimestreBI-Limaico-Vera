USE [Ecuavinos_DW]
GO

/****** Object:  Table [dbo].[DimCliente]    Script Date: 14/12/2017 16:13:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimCliente](
	[CodigoCliente] [varchar](20) NOT NULL,
	[NombreCliente] [varchar](50) NOT NULL,
	[ApellidoCliente] [varchar](50) NULL,
	[NumIDCliente] [varchar](50) NOT NULL,
	[PaisCliente] [varchar](50) NOT NULL,
	[CiudadCliente] [varchar](50) NULL,
	[DireccionCliente] [varchar](50) NOT NULL,
	[CodPostalCliente] [varchar](10) NOT NULL,
	[TelefonoCliente] [varchar](20) NOT NULL,
	[TipoCliente] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DimCliente] PRIMARY KEY CLUSTERED 
(
	[CodigoCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


USE [Ecuavinos_DW]
GO

/****** Object:  Table [dbo].[DimProducto]    Script Date: 14/12/2017 16:13:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimProducto](
	[CodigoProducto] [varchar](20) NOT NULL,
	[CodigoProduccionProducto] [int] NOT NULL,
	[DescripcionProducto] [varchar](50) NOT NULL,
	[GrupoProudcto] [varchar](20) NOT NULL,
	[MarcaProducto] [varchar](50) NOT NULL,
	[AnioProducto] [varchar](10) NOT NULL,
	[PrecioActualProducto] [money] NOT NULL,
	[PrecioVentaProducto] [money] NOT NULL,
	[VolumenProduccionProducto] [int] NOT NULL,
 CONSTRAINT [PK_DimProducto] PRIMARY KEY CLUSTERED 
(
	[CodigoProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [Ecuavinos_DW]
GO

/****** Object:  Table [dbo].[DimPuntodeVenta]    Script Date: 14/12/2017 16:13:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimPuntodeVenta](
	[CodigoPuntoVenta] [varchar](20) NOT NULL,
	[GrupoPuntoVenta] [varchar](25) NOT NULL,
	[PaisPuntoVenta] [varchar](25) NOT NULL,
	[CiudadPuntoVenta] [varchar](50) NOT NULL,
	[DirecciónPuntoVenta] [varchar](50) NOT NULL,
	[CodigoPostalPuntoVenta] [varchar](10) NOT NULL,
 CONSTRAINT [PK_DimPuntodeVenta] PRIMARY KEY CLUSTERED 
(
	[CodigoPuntoVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [Ecuavinos_DW]
GO

/****** Object:  Table [dbo].[FactVentas]    Script Date: 14/12/2017 16:14:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FactVentas](
	[TransactionId] [int] IDENTITY(1,1) NOT NULL,
	[CodigoFactura] [varchar](30) NOT NULL,
	[DateKey] [int] NOT NULL,
	[CodigoPuntoVenta] [varchar](20) NOT NULL,
	[CodigoCliente] [varchar](20) NOT NULL,
	[CodigoProducto] [varchar](20) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[TotalVenta] [money] NOT NULL,
	[VolumenProduccion] [float] NOT NULL,
	[CostoProduccion] [money] NOT NULL,
	[UtilidadVenta] [money] NOT NULL,
 CONSTRAINT [PK__FactVent__55433A6B6B1DC18C] PRIMARY KEY CLUSTERED 
(
	[TransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[FactVentas]  WITH CHECK ADD  CONSTRAINT [FK_CodigoCliente] FOREIGN KEY([CodigoCliente])
REFERENCES [dbo].[DimCliente] ([CodigoCliente])
GO

ALTER TABLE [dbo].[FactVentas] CHECK CONSTRAINT [FK_CodigoCliente]
GO

ALTER TABLE [dbo].[FactVentas]  WITH CHECK ADD  CONSTRAINT [FK_CodigoProducto] FOREIGN KEY([CodigoProducto])
REFERENCES [dbo].[DimProducto] ([CodigoProducto])
GO

ALTER TABLE [dbo].[FactVentas] CHECK CONSTRAINT [FK_CodigoProducto]
GO

ALTER TABLE [dbo].[FactVentas]  WITH CHECK ADD  CONSTRAINT [FK_CodigoPuntoVenta] FOREIGN KEY([CodigoPuntoVenta])
REFERENCES [dbo].[DimPuntodeVenta] ([CodigoPuntoVenta])
GO

ALTER TABLE [dbo].[FactVentas] CHECK CONSTRAINT [FK_CodigoPuntoVenta]
GO

ALTER TABLE [dbo].[FactVentas]  WITH CHECK ADD  CONSTRAINT [FK_VentasDateKey] FOREIGN KEY([DateKey])
REFERENCES [dbo].[DimDate] ([DateKey])
GO

ALTER TABLE [dbo].[FactVentas] CHECK CONSTRAINT [FK_VentasDateKey]
GO

