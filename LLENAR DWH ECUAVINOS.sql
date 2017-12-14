------------------------------------------------------------------------------------------
--insertar datos a las tablas






USE [Ecuavinos_DW]
GO

INSERT INTO [dbo].[DimProducto]
           ([CodigoProducto]
           ,[CodigoProduccionProducto]
           ,[DescripcionProducto]
           ,[GrupoProudcto]
           ,[MarcaProducto]
           ,[AnioProducto]
           ,[PrecioActualProducto]
           ,[PrecioVentaProducto]
           ,[VolumenProduccionProducto])
     VALUES
           --('P12766',12766,'Mornington Pinot Noir','Pinot Noir','MOrnington','2013',100,180,400)
		   --('P12765',12765,'McDonell Pinot Noir','Pinot Noir','McDonell','2013',120,160,600)
		   --('P14821',14821,'Downunder Merlot','Merlot','Downunder','2013',100,150,550)
		   ('P12767',12767,'Downunder Pinot Noir','Pinot Noir','Downunder','2013',80,125,690)
GO

select * from DimProducto



USE [Ecuavinos_DW]
GO

INSERT INTO [dbo].[DimCliente]
           ([CodigoCliente]
           ,[NombreCliente]
           ,[ApellidoCliente]
           ,[NumIDCliente]
           ,[PaisCliente]
           ,[CiudadCliente]
           ,[DireccionCliente]
           ,[CodPostalCliente]
           ,[TelefonoCliente]
		   ,[TipoCliente])
     VALUES
           --('C478W','Prestige Wines',null,'1925342001','Ecuador','Quito','Av. 12 Oct, UIO, EC ','3053','2222999','Wholesale')
		   --('C567R','Acme Wine Imports ',null,'19055555','Reino Unido','Londres','High St, Fullham, London','SW6','5559999','Retail')
		   --('C342W','International Wines',null,'190555555','Francia','Paris','PO Box 324, Paris ','75008','6559999','Wholesale')
		   --('C39G','Guayas Wines',null,'1852427001','Ecuador','Guayaquil','Km 35 via a Daule ','4053','045599991','Retail')
		   ('C128R','London Wines',null,'19055555','Reino Unido','Londres','The Strand, London','SW4','55558888','Retail')



GO


USE [Ecuavinos_DW]
GO

INSERT INTO [dbo].[DimPuntodeVenta]
           ([CodigoPuntoVenta]
           ,[GrupoPuntoVenta]
           ,[PaisPuntoVenta]
           ,[CiudadPuntoVenta]
           ,[DirecciónPuntoVenta]
           ,[CodigoPostalPuntoVenta])
     VALUES
           --('CPV001','Americas','Ecuador','Quito','Av. 12 Oct, UIO, EC','3053'),
		   --('CPV002','Europa','Reino Unido','Londres','High St, Fullham, London','SW6'),
		   --('CPV003','Europa','Francia','Paris','PO Box 324, Paris','75008'),
		   --('CPV004','Americas','Ecuador','Guayaquil','Km 35 via a Daule ','4053')
		   ('CPV005','Europa','Reino Unido','Londres','The Strand, London','SW4')

GO


select * from DimPuntodeVenta
----------------------------------------------------------------------------------------

USE [Ecuavinos_DW]
GO



USE [Ecuavinos_DW]
GO

INSERT INTO [dbo].[FactVentas]
           ([CodigoFactura]
           ,[DateKey]
           ,[CodigoPuntoVenta]
           ,[CodigoCliente]
           ,[CodigoProducto]
           ,[Cantidad]
           ,[CostoTotalVenta]
           ,[CostoProduccion])
     VALUES
           (1,'S135',20140212,'CPV002','C478W','P12765',25,4000,)
GO

SELECT * FROM DimProducto