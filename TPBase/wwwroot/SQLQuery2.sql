USE [WorldConcerts]


CREATE PROCEDURE sp_AgregarConcierto
    @Nombre NVARCHAR(MAX),
    @Descripcion NVARCHAR(MAX),
    @FechaConcierto DATETIME,
    @Imagen NVARCHAR(MAX),
    @Precio INT,
    @fkCategoria INT
AS
BEGIN
    INSERT INTO Conciertos (Nombre, Descripcion, FechaConcierto, Imagen, Precio, fkCategoria)
    VALUES (@Nombre, @Descripcion, @FechaConcierto, @Imagen, @Precio, @fkCategoria);
END;