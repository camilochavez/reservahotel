CREATE TABLE [dbo].[Usuario] (
    [IdUsuario] INT            IDENTITY (1, 1) NOT NULL,
    [Nombres]   NVARCHAR (250) NOT NULL,
    [Apellidos] NVARCHAR (250) NOT NULL,
    [Correo]      NVARCHAR (320) NOT NULL,
    [Direccion] NVARCHAR (MAX) NOT NULL,
    CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED ([IdUsuario] ASC),
    CONSTRAINT [UC_Mail] UNIQUE NONCLUSTERED ([Correo] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identificador unico de usuario', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Usuario', @level2type = N'COLUMN', @level2name = 'IdUsuario';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nombre de Usuario', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Usuario', @level2type = N'COLUMN', @level2name = N'Nombres';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Apellido del Usuario', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Usuario', @level2type = N'COLUMN', @level2name = N'Apellidos';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Mail del usuario', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Usuario', @level2type = N'COLUMN', @level2name = 'Correo';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Dirección del usuario', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Usuario', @level2type = N'COLUMN', @level2name = N'Direccion';

