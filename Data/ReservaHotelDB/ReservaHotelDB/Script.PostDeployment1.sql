/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
USE [ReservaHotelDB]
GO
INSERT [dbo].[Estado] ([IdEstado], [Descripcion]) VALUES (0, N'Cancelado')
GO
INSERT [dbo].[Estado] ([IdEstado], [Descripcion]) VALUES (1, N'Reservado')
GO
INSERT [dbo].[Pais] ([IdPais], [NombrePais]) VALUES (57, N'Colombia')
GO
SET IDENTITY_INSERT [dbo].[Hotel] ON 
GO
INSERT [dbo].[Hotel] ([IdHotel], [Nombre], [IdPais], [Latitud], [Longitud], [Descripcion], [Activo], [NumeroHabitaciones]) VALUES (1, N'El Gran Hotel', 57, CAST(12 AS Decimal(18, 0)), CAST(21 AS Decimal(18, 0)), N'Gran Hotel con vista al mar', 1, 2)
GO
INSERT [dbo].[Hotel] ([IdHotel], [Nombre], [IdPais], [Latitud], [Longitud], [Descripcion], [Activo], [NumeroHabitaciones]) VALUES (2, N'El Pequeño Hotel', 57, CAST(11 AS Decimal(18, 0)), CAST(23 AS Decimal(18, 0)), N'Hotel Pequeño en pueblo', 1, 1)
GO
SET IDENTITY_INSERT [dbo].[Hotel] OFF
GO
SET IDENTITY_INSERT [dbo].[Habitacion] ON 
GO
INSERT [dbo].[Habitacion] ([IdHabitacion], [IdHotel], [Precio], [Descripcion]) VALUES (1, 1, 30000, N'Habitacion individual 1')
GO
INSERT [dbo].[Habitacion] ([IdHabitacion], [IdHotel], [Precio], [Descripcion]) VALUES (5, 1, 30000, N'habitacion individual 2')
GO
SET IDENTITY_INSERT [dbo].[Habitacion] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 
GO
INSERT [dbo].[Usuario] ([IdUsuario], [Nombres], [Apellidos], [Correo], [Direccion]) VALUES (1, N'Camilo Andres', N'Chavez ', N'darkcamil@hotmail.com', N'cr 1 rest w')
GO
INSERT [dbo].[Usuario] ([IdUsuario], [Nombres], [Apellidos], [Correo], [Direccion]) VALUES (4, N'Luis', N'Ariza', N'darkcamil2@hotmail.com', N'cr 3 23 s 2 ')
GO
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
