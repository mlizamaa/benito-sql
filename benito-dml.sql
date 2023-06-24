drop procedure if exists Usuario_Agregar
go
CREATE PROCEDURE Usuario_Agregar
    @Nombre VARCHAR(100),
    @Usuario VARCHAR(50),
    @Contrasena VARCHAR(50)
AS
BEGIN
    INSERT INTO Usuarios (Nombre, Usuario, Contraseña)
    VALUES (@Nombre, @Usuario, @Contrasena)
END
go

drop procedure if exists Producto_Agregar
go
CREATE PROCEDURE Producto_Agregar(
  @CodigoBarra VARCHAR(255),
  @UnidadMedida VARCHAR(255),
  @Precio DECIMAL(10, 2),
  @PrecioOferta DECIMAL(10, 2) = NULL,
  @McaOferta BIT,
  @Nombre VARCHAR(255),
  @Cantidad INT,
  @Unidad VARCHAR(255),
  @Marca VARCHAR(255),
  @Tamano VARCHAR(255),
  @Imagen VARCHAR(255),
  @CodTipo VARCHAR(255)
)
AS
BEGIN
  INSERT INTO Producto (CodigoBarra, UnidadMedida, Precio, PrecioOferta, Oferta, Nombre, Cantidad, Unidad, Marca, Tamano, Imagen, CodTipo)
  VALUES (@CodigoBarra, @UnidadMedida, @Precio, @PrecioOferta, @McaOferta, @Nombre, @Cantidad, @Unidad, @Marca, @Tamano, @Imagen, @CodTipo);
END;

GO 
drop procedure if exists Producto_Listar
go
create procedure Producto_Listar 
AS
BEGIN 
	select  Id,
    		CodigoBarra, 
    		UnidadMedida, 
    		Precio, 
    		PrecioOferta, 
    		McaOferta, 
    		Nombre, 
    		Cantidad, 
    		Unidad, 
    		Marca, 
    		Tamano, 
    		Imagen, 
    		CodTipo
    from Productos p 
END
go


-- Procedimiento para listar todos los inventarios
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'Inventario_Listar')
   DROP PROCEDURE Inventario_Listar;
GO

CREATE PROCEDURE Inventario_Listar
AS
BEGIN
    SELECT * FROM Inventario;
END;
GO

-- Procedimiento para obtener un inventario por ID
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'Inventario_Obtener')
   DROP PROCEDURE Inventario_Obtener;
GO

CREATE PROCEDURE Inventario_Obtener
    @Id INT,
    @tipo int
AS
BEGIN
	if (@tipo = 1)
	begin
    	SELECT *, 1  as tipo FROM StockInventario WHERE Id = @Id;
    end
    else if(@tipo= 2)
    begin
    	SELECT *, 2 as tipo FROM SockVenta WHERE Id = @Id;
    end
END;
GO

-- Procedimiento para agregar un inventario
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'Inventario_Agregar')
   DROP PROCEDURE Inventario_Agregar;
GO

CREATE PROCEDURE Inventario_Agregar
    @ProductoId INT,
    @Cantidad INT,
    @Tipo INT -- Asegúrate de que el tipo de dato coincide con el tipo de tu columna Tipo
AS
BEGIN
	if (@tipo = 1)
	begin
       INSERT INTO StockInventario (ProductoId, Cantidad)
	    VALUES (@ProductoId, @Cantidad);
    end
    else if(@tipo= 2) 
    begin
    	INSERT INTO StockVenta(ProductoId, Cantidad)
	    VALUES (@ProductoId, @Cantidad);
    end
    
END;
GO

-- Procedimiento para actualizar un inventario
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'Inventario_Actualizar')
   DROP PROCEDURE Inventario_Actualizar;
GO

CREATE PROCEDURE Inventario_Actualizar
    @Id INT,
    @Cantidad INT
AS
BEGIN
    UPDATE Inventario
    SET Cantidad = @Cantidad
    WHERE Id = @Id;
END;
GO

-- Procedimiento para eliminar un inventario
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'Inventario_Eliminar')
   DROP PROCEDURE Inventario_Eliminar;
GO

CREATE PROCEDURE Inventario_Eliminar
    @Id INT
AS
BEGIN
    DELETE FROM Inventario WHERE Id = @Id;
END;
GO
/*
select * from Productos p  sv  
select * from StockInventario si 
select * from StockVenta sv 
*/