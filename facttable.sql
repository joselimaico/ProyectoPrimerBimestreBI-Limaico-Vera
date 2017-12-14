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
          -- ('S135',20140212,'CPV002','C478W','P12765',25,4000,600)
		   --('S140',20140215,'CPV005','C128R','P12767',30,3750,690)
		   ('S172',20140325,'CPV004','C39G','P14823',30,3600,250)
GO

SELECT * FROM FactVentas