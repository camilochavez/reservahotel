CREATE TABLE [dbo].[Hotel] (
    [IdHotel]            INT            IDENTITY (1, 1) NOT NULL,
    [Nombre]             NVARCHAR (250) NOT NULL,
    [IdPais]             TINYINT        NOT NULL,
    [Latitud]            DECIMAL (18)   NOT NULL,
    [Longitud]           DECIMAL (18)   NOT NULL,
    [Descripcion]        NVARCHAR (250) NOT NULL,
    [Activo]             BIT            NOT NULL,
    [NumeroHabitaciones] SMALLINT       NOT NULL,
    CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED ([IdHotel] ASC),
    CONSTRAINT [FK_Hotel_Pais] FOREIGN KEY ([IdPais]) REFERENCES [dbo].[Pais] ([IdPais])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identificador unico del hotel', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hotel', @level2type = N'COLUMN', @level2name = N'IdHotel';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nombre del hotel', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hotel', @level2type = N'COLUMN', @level2name = N'Nombre';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identificador de la tabla Pais', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hotel', @level2type = N'COLUMN', @level2name = N'IdPais';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'cordenada de latitud del hotel', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hotel', @level2type = N'COLUMN', @level2name = N'Latitud';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Cordenada de longitud del hotel', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hotel', @level2type = N'COLUMN', @level2name = N'Longitud';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Descripcion del hotel', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hotel', @level2type = N'COLUMN', @level2name = N'Descripcion';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Es un hotel activo o inactivo', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Hotel', @level2type = N'COLUMN', @level2name = N'Activo';

