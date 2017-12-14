/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2012                    */
/* Created on:     10/06/2017 19:06:54                          */
/*==============================================================*/

create database ventasEcuavinos
use ventasEcuavinos
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CABECERAFACTURA') and o.name = 'FK_CABECERA_CLIENTE_C_CLIENTE')
alter table CABECERAFACTURA
   drop constraint FK_CABECERA_CLIENTE_C_CLIENTE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DETALLEFACTURA') and o.name = 'FK_DETALLEF_CABECERA__CABECERA')
alter table DETALLEFACTURA
   drop constraint FK_DETALLEF_CABECERA__CABECERA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DETALLEFACTURA') and o.name = 'FK_DETALLEF_DETALLE_P_PRODUCTO')
alter table DETALLEFACTURA
   drop constraint FK_DETALLEF_DETALLE_P_PRODUCTO
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CABECERAFACTURA')
            and   name  = 'CLIENTE_CABECERA_FK'
            and   indid > 0
            and   indid < 255)
   drop index CABECERAFACTURA.CLIENTE_CABECERA_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CABECERAFACTURA')
            and   type = 'U')
   drop table CABECERAFACTURA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CLIENTE')
            and   type = 'U')
   drop table CLIENTE
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DETALLEFACTURA')
            and   name  = 'CABECERA_DETALLE_FK'
            and   indid > 0
            and   indid < 255)
   drop index DETALLEFACTURA.CABECERA_DETALLE_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DETALLEFACTURA')
            and   type = 'U')
   drop table DETALLEFACTURA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PRODUCTO')
            and   type = 'U')
   drop table PRODUCTO
go

/*==============================================================*/
/* Table: CABECERAFACTURA                                       */
/*==============================================================*/
create table CABECERAFACTURA (
   ORDENCOMPRA          varchar(10)          not null,
   CLIENTEID            varchar(10)          null,
   FECHACOMPRA          datetime             not null,
   constraint PK_CABECERAFACTURA primary key nonclustered (ORDENCOMPRA)
)
go

/*==============================================================*/
/* Index: CLIENTE_CABECERA_FK                                   */
/*==============================================================*/
create index CLIENTE_CABECERA_FK on CABECERAFACTURA (
CLIENTEID ASC
)
go

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   CLIENTEID            varchar(10)          not null,
   NOMBRECLIENTE        varchar(50)          not null,
   DIRECCION            varchar(50)          null,
   ESTADO               varchar(50)          not null,
   CIUDAD               varchar(50)          not null,
   CODIGOPOSTAL         varchar(10)          null,
   TIPO                 varchar(30)          not null,
   constraint PK_CLIENTE primary key nonclustered (CLIENTEID)
)
go

/*==============================================================*/
/* Table: DETALLEFACTURA                                        */
/*==============================================================*/
create table DETALLEFACTURA (
   DETALLEID            int                  not null,
   IDPRODUCTO           int                  null,
   ORDENCOMPRA          varchar(10)          null,
   CANTIDAD             char(10)             not null,
   PRECIO               money                not null,
   VALORTOTAL           char(10)             null,
   constraint PK_DETALLEFACTURA primary key nonclustered (DETALLEID)
)
go

/*==============================================================*/
/* Index: CABECERA_DETALLE_FK                                   */
/*==============================================================*/
create index CABECERA_DETALLE_FK on DETALLEFACTURA (
ORDENCOMPRA ASC
)
go

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
create table PRODUCTO (
   IDPRODUCTO           int                  not null,
   CODPRODUCTO          varchar(10)          not null,
   DESCRIPCION          varchar(50)          not null,
   PRECIO               money                not null,
   ANIO                 varchar(4)           not null,
   constraint PK_PRODUCTO primary key nonclustered (IDPRODUCTO)
)
go

alter table CABECERAFACTURA
   add constraint FK_CABECERA_CLIENTE_C_CLIENTE foreign key (CLIENTEID)
      references CLIENTE (CLIENTEID)
go

alter table DETALLEFACTURA
   add constraint FK_DETALLEF_CABECERA__CABECERA foreign key (ORDENCOMPRA)
      references CABECERAFACTURA (ORDENCOMPRA)
go

alter table DETALLEFACTURA
   add constraint FK_DETALLEF_DETALLE_P_PRODUCTO foreign key (IDPRODUCTO)
      references PRODUCTO (IDPRODUCTO)
go


------------------------------------------------------------------------------------------
--insertar datos a las tablas


INSERT INTO DimProduct (ProductCOD, ProductName, Brand, ProductYear, ProductPrice)VALUES('P12766','Mornington''s Pinot Noir', 'Mornington','2013',180);
INSERT INTO DimProduct (ProductCOD, ProductName, Brand, ProductYear, ProductPrice)VALUES('P12766','Mornington''s Pinot Noir', 'Mornington','2012',150);
INSERT INTO DimProduct (ProductCOD, ProductName, Brand, ProductYear, ProductPrice)VALUES('P14823','Mornington''s Pinot Grigio', 'Mornington','2013',140);
INSERT INTO DimProduct (ProductCOD, ProductName, Brand, ProductYear, ProductPrice)VALUES('P14823','Mornington''s Pinot Grigio', 'Mornington','2012',120);
INSERT INTO DimProduct (ProductCOD, ProductName, Brand, ProductYear, ProductPrice)VALUES('P12767','Downunder''s Pinot Noir', 'Downunder','2013',125);
INSERT INTO DimProduct (ProductCOD, ProductName, Brand, ProductYear, ProductPrice)VALUES('P12767','Downunder''s Pinot Noir', 'Downunder','2012',115);


INSERT INTO DimPointOfSale(PointOfSaleCOD, Territory, Country, City, [Address], PostalCode)VALUES('POS01','Americas', 'Ecuador','Quito','Eloy Alfaro y Granados', '170514');
INSERT INTO DimPointOfSale(PointOfSaleCOD, Territory, Country, City, [Address], PostalCode)VALUES('POS02','Americas', 'Ecuador','Guayaquil','09 de Octubre y Eloy Alfaro', '170515');
INSERT INTO DimPointOfSale(PointOfSaleCOD, Territory, Country, City, [Address], PostalCode)VALUES('POS03','Europe', 'United Kingdom','England','Main Street', 'EN10');
INSERT INTO DimPointOfSale(PointOfSaleCOD, Territory, Country, City, [Address], PostalCode)VALUES('POS03','Europe', 'United Kingdom','Aberdeen','5th Street', 'AB10');
INSERT INTO DimPointOfSale(PointOfSaleCOD, Territory, Country, City, [Address], PostalCode)VALUES('POS03','Americas', 'Ecuador','Cuenca','Gran Colombia y Luis Cordero', '010101');
INSERT INTO DimPointOfSale(PointOfSaleCOD, Territory, Country, City, [Address], PostalCode)VALUES('POS03','Europe', 'United Kingdom','Belfast','Main Street and 5th Street', 'BT1');


INSERT INTO DimClient (ClientCOD, ClientName, ClientLastName, ClientNumID, ClientCountry, ClientCity, PostalCode, ClientPhone, ClientAddress) VALUES ('CLI001','Andres','Salazar','1715670830','Ecuador','Quito','170768','3265175','De Los Guayacanes y N51');
INSERT INTO DimClient (ClientCOD, ClientName, ClientLastName, ClientNumID, ClientCountry, ClientCity, PostalCode, ClientPhone, ClientAddress) VALUES ('CLI002','Angela','Wales','925665416','United Kingdom','England','EN01','22038261','Croydon');
INSERT INTO DimClient (ClientCOD, ClientName, ClientLastName, ClientNumID, ClientCountry, ClientCity, PostalCode, ClientPhone, ClientAddress) VALUES ('CLI003','Eduardo','Jimenez','1787337890','Ecuador','Guayaquil','182738','2561475','Calle Libertadores y Simon Bolivar');


use ventasEcuavinos


INSERT INTO CABECERAFACTURA(ORDENCOMPRA, CLIENTEID, FECHACOMPRA) VALUES ('S135','C478W',2014-02-12);
INSERT INTO CABECERAFACTURA(ORDENCOMPRA, CLIENTEID, FECHACOMPRA) VALUES ('S140','C128R',2014-02-15);
INSERT INTO CABECERAFACTURA(ORDENCOMPRA, CLIENTEID, FECHACOMPRA) VALUES ('S168','C478W',2014-02-15);

select * from CABECERAFACTURA;

INSERT INTO CLIENTE(CLIENTEID, NOMBRECLIENTE,DIRECCION,ESTADO,CIUDAD,CODIGOPOSTAL,TIPO) VALUES ('C478W','Prestige Wines','Lygon St.','Carlton','Melb.','3053','wholesale');
INSERT INTO CLIENTE(CLIENTEID, NOMBRECLIENTE,DIRECCION,ESTADO,CIUDAD,CODIGOPOSTAL,TIPO) VALUES ('C567R','Acme Wine Imports','High St.','Fullham','London','SW6','retail');
INSERT INTO CLIENTE(CLIENTEID, NOMBRECLIENTE,DIRECCION,ESTADO,CIUDAD,CODIGOPOSTAL,TIPO) VALUES ('C121R','Oz Wines','Little St.','Richmond','Melb.','3121','retail');
INSERT INTO CLIENTE(CLIENTEID, NOMBRECLIENTE,DIRECCION,ESTADO,CIUDAD,CODIGOPOSTAL,TIPO) VALUES ('C578W','The Wine Club',NULL,'Nth. Melbourne','Melb.','3051','wholesale');
INSERT INTO CLIENTE(CLIENTEID, NOMBRECLIENTE,DIRECCION,ESTADO,CIUDAD,CODIGOPOSTAL,TIPO) VALUES ('C128R','London Wines',NULL,'The Strand','London','EC4','retail');
INSERT INTO CLIENTE(CLIENTEID, NOMBRECLIENTE,DIRECCION,ESTADO,CIUDAD,CODIGOPOSTAL,TIPO) VALUES ('C342W','International Wines',NULL,'Po Box 324','Paris','75008','wholesale');

select * from CLIENTE;

INSERT INTO DETALLEFACTURA(DETALLEID, IDPRODUCTO,ORDENCOMPRA,CANTIDAD,PRECIO,VALORTOTAL) VALUES (1,1,'S135',25,160,4000);
INSERT INTO DETALLEFACTURA(DETALLEID, IDPRODUCTO,ORDENCOMPRA,CANTIDAD,PRECIO,VALORTOTAL) VALUES (2,4,'S135',30,110,3300);
INSERT INTO DETALLEFACTURA(DETALLEID, IDPRODUCTO,ORDENCOMPRA,CANTIDAD,PRECIO,VALORTOTAL) VALUES (3,5,'S140',30,80,2400);
INSERT INTO DETALLEFACTURA(DETALLEID, IDPRODUCTO,ORDENCOMPRA,CANTIDAD,PRECIO,VALORTOTAL) VALUES (4,6,'S168',30,95,2850);
INSERT INTO DETALLEFACTURA(DETALLEID, IDPRODUCTO,ORDENCOMPRA,CANTIDAD,PRECIO,VALORTOTAL) VALUES (5,5,'S168',24,100,2400);

select * from DETALLEFACTURA;

INSERT INTO PRODUCTO(IDPRODUCTO, CODPRODUCTO,DESCRIPCION,PRECIO,ANIO) VALUES (1,'P12766','Mornington Pinot Noir',180,2013);
INSERT INTO PRODUCTO(IDPRODUCTO, CODPRODUCTO,DESCRIPCION,PRECIO,ANIO) VALUES (2,'P12766','Mornington Pinot Noir',150,2012);
INSERT INTO PRODUCTO(IDPRODUCTO, CODPRODUCTO,DESCRIPCION,PRECIO,ANIO) VALUES (3,'P14823','Mornington Pinot Grigio',140,2013);
INSERT INTO PRODUCTO(IDPRODUCTO, CODPRODUCTO,DESCRIPCION,PRECIO,ANIO) VALUES (4,'P14823','Mornington Pinot Grigio',120,2012);
INSERT INTO PRODUCTO(IDPRODUCTO, CODPRODUCTO,DESCRIPCION,PRECIO,ANIO) VALUES (5,'P12767','Downunder Pinot Noir',125,2013);
INSERT INTO PRODUCTO(IDPRODUCTO, CODPRODUCTO,DESCRIPCION,PRECIO,ANIO) VALUES (6,'P12767','Downunder Pinot Noir',115,2012);

select * from PRODUCTO
