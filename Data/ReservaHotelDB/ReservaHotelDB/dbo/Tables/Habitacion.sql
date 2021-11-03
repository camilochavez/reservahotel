CREATE TABLE [dbo].[Habitacion] (
    [IdHabitacion] INT            IDENTITY (1, 1) NOT NULL,
    [IdHotel]      INT            NOT NULL,
    [Precio]       INT            NOT NULL,
    [Descripcion]  NVARCHAR (250) NOT NULL,
    CONSTRAINT [PK_Habitacion] PRIMARY KEY CLUSTERED ([IdHabitacion] ASC),
    CONSTRAINT [FK_Habitacion_Hotel] FOREIGN KEY ([IdHotel]) REFERENCES [dbo].[Hotel] ([IdHotel])
);






GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identificador Unico de la habitacion', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Habitacion', @level2type = N'COLUMN', @level2name = N'IdHabitacion';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identificador unico del hotel ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Habitacion', @level2type = N'COLUMN', @level2name = N'IdHotel';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Descripcion de la habitacion', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Habitacion', @level2type = N'COLUMN', @level2name = N'Descripcion';


GO




CREATE TRIGGER [dbo].[NoOverRooms]  
ON [dbo].[Habitacion]
FOR INSERT
AS 
Declare @numberOfRooms int;
Declare @numberofHotelRooms int;
declare @hotelId int;

Select @numberOfRooms =count(1), @numberofHotelRooms = ho.NumeroHabitaciones
from inserted i
inner Join Habitacion h on i.IdHotel=h.IdHotel
inner Join Hotel ho on ho.IdHotel = h.IdHotel
Group by h.IdHotel, ho.NumeroHabitaciones

IF(ISNULL(@numberOfRooms,0) > ISNULL(@numberofHotelRooms,1))
BEGIN
	RAISERROR ('Numero de habitaciones excedidas para el hotel', 16, 10);  
END