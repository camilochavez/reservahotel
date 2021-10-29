CREATE TABLE [dbo].[Pais] (
    [IdPais]     TINYINT        NOT NULL,
    [NombrePais] NVARCHAR (250) NOT NULL,
    CONSTRAINT [PK_Pais] PRIMARY KEY CLUSTERED ([IdPais] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identificador Unico del Pais', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Pais', @level2type = N'COLUMN', @level2name = N'IdPais';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nombre del pais', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Pais', @level2type = N'COLUMN', @level2name = N'NombrePais';

