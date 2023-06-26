IF OBJECT_ID(N'dbo.Usuarios', N'U') IS NOT NULL  
   DROP TABLE [dbo].[Usuarios];  
GO
IF OBJECT_ID(N'dbo.StockInventarioBitacora', N'U') IS NOT NULL  
   DROP TABLE [dbo].[StockInventarioBitacora];  
GO
IF OBJECT_ID(N'dbo.StockVentaBitacora', N'U') IS NOT NULL  
   DROP TABLE [dbo].[StockVentaBitacora];  
GO
IF OBJECT_ID(N'dbo.StockInventario', N'U') IS NOT NULL  
   DROP TABLE [dbo].[StockInventario];  
GO
IF OBJECT_ID(N'dbo.StockVenta', N'U') IS NOT NULL  
   DROP TABLE [dbo].[StockVenta];  
GO
IF OBJECT_ID(N'dbo.Ventas', N'U') IS NOT NULL  
   DROP TABLE [dbo].[Ventas];  
GO
IF OBJECT_ID(N'dbo.Productos', N'U') IS NOT NULL  
   DROP TABLE [dbo].[Productos];  
GO


CREATE TABLE Usuarios (
    Id INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Usuario VARCHAR(50),
    Contraseña VARCHAR(50)
);
go

CREATE TABLE Productos (
  Id INT PRIMARY KEY IDENTITY(1,1),
  CodigoBarra VARCHAR(255),
  UnidadMedida VARCHAR(255),
  Precio DECIMAL(10, 2),
  PrecioOferta DECIMAL(10, 2) NULL,
  McaOferta BIT,
  Nombre VARCHAR(255),
  Cantidad INT,
  Unidad VARCHAR(255),
  Marca VARCHAR(255),
  Tamano VARCHAR(255),
  Imagen VARCHAR(255),
  CodTipo VARCHAR(255)
);

go

CREATE TABLE StockInventario (
    Id INT PRIMARY KEY IDENTITY(1,1),
    ProductoId INT,
    Cantidad INT,
    FOREIGN KEY (ProductoId) REFERENCES Productos(Id)
);
go

CREATE TABLE StockVenta (
    Id INT PRIMARY KEY IDENTITY(1,1),
    ProductoId INT,
    Cantidad INT,
    FOREIGN KEY (ProductoId) REFERENCES Productos(Id)
);
go

CREATE TABLE StockInventarioBitacora (
    Id INT PRIMARY KEY IDENTITY(1,1),
    StockInventarioId INT,
    Cantidad INT,
    Detalle VARCHAR(64)
    FOREIGN KEY (StockInventarioId) REFERENCES StockInventario(Id)
);
go

CREATE TABLE StockVentaBitacora (
    Id INT PRIMARY KEY IDENTITY(1,1),
    StockVentaId INT,
    Cantidad INT,
    Detalle VARCHAR(64)
    FOREIGN KEY (StockVentaId) REFERENCES StockVenta(Id)
);
go

CREATE TABLE Ventas (
    Id INT PRIMARY KEY IDENTITY(1,1),
    FechaVenta DATETIME
);

go
