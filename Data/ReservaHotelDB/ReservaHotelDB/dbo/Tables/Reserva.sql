CREATE TABLE [dbo].[Reserva] (
    [IdReserva]    INT      IDENTITY (1, 1) NOT NULL,
    [IdUsuario]    INT      NOT NULL,
    [IdHabitacion] INT      NOT NULL,
    [FechaEntrada] DATETIME NOT NULL,
    [FechaSalida]  DATETIME NOT NULL,
    [FechaReserva] DATE     NOT NULL,
    [Estado]       BIT      NOT NULL,
    CONSTRAINT [PK_Reserva] PRIMARY KEY CLUSTERED ([IdReserva] ASC),
    CONSTRAINT [FK_Reserva_Habitacion] FOREIGN KEY ([IdHabitacion]) REFERENCES [dbo].[Habitacion] ([IdHabitacion]),
    CONSTRAINT [FK_Reserva_Usuario] FOREIGN KEY ([IdReserva]) REFERENCES [dbo].[Usuario] ([IdUsuario])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Fecha entrada a  la habitación checkin', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Reserva', @level2type = N'COLUMN', @level2name = N'FechaEntrada';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Fecha Salida habitacion checkout', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Reserva', @level2type = N'COLUMN', @level2name = N'FechaSalida';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Estado Reservado/Cancelado', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Reserva', @level2type = N'COLUMN', @level2name = N'Estado';

