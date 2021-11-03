USE [master]
GO

/****** Object:  Database [ReservaHotelDB]    Script Date: 11/3/2021 5:49:32 PM ******/
CREATE DATABASE [ReservaHotelDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ReservaHotelDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ReservaHotelDB_Primary.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ReservaHotelDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ReservaHotelDB_Primary.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ReservaHotelDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [ReservaHotelDB] SET ANSI_NULL_DEFAULT ON 
GO

ALTER DATABASE [ReservaHotelDB] SET ANSI_NULLS ON 
GO

ALTER DATABASE [ReservaHotelDB] SET ANSI_PADDING ON 
GO

ALTER DATABASE [ReservaHotelDB] SET ANSI_WARNINGS ON 
GO

ALTER DATABASE [ReservaHotelDB] SET ARITHABORT ON 
GO

ALTER DATABASE [ReservaHotelDB] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [ReservaHotelDB] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [ReservaHotelDB] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [ReservaHotelDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [ReservaHotelDB] SET CURSOR_DEFAULT  LOCAL 
GO

ALTER DATABASE [ReservaHotelDB] SET CONCAT_NULL_YIELDS_NULL ON 
GO

ALTER DATABASE [ReservaHotelDB] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [ReservaHotelDB] SET QUOTED_IDENTIFIER ON 
GO

ALTER DATABASE [ReservaHotelDB] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [ReservaHotelDB] SET  DISABLE_BROKER 
GO

ALTER DATABASE [ReservaHotelDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [ReservaHotelDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [ReservaHotelDB] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [ReservaHotelDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [ReservaHotelDB] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [ReservaHotelDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [ReservaHotelDB] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [ReservaHotelDB] SET RECOVERY FULL 
GO

ALTER DATABASE [ReservaHotelDB] SET  MULTI_USER 
GO

ALTER DATABASE [ReservaHotelDB] SET PAGE_VERIFY NONE  
GO

ALTER DATABASE [ReservaHotelDB] SET DB_CHAINING OFF 
GO

ALTER DATABASE [ReservaHotelDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [ReservaHotelDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO

ALTER DATABASE [ReservaHotelDB] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [ReservaHotelDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [ReservaHotelDB] SET QUERY_STORE = OFF
GO

ALTER DATABASE [ReservaHotelDB] SET  READ_WRITE 
GO

USE [ReservaHotelDB]
GO
/****** Object:  Table [dbo].[Estado]    Script Date: 11/3/2021 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estado](
	[IdEstado] [int] NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Habitacion]    Script Date: 11/3/2021 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Habitacion](
	[IdHabitacion] [int] IDENTITY(1,1) NOT NULL,
	[IdHotel] [int] NOT NULL,
	[Precio] [int] NOT NULL,
	[Descripcion] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Habitacion] PRIMARY KEY CLUSTERED 
(
	[IdHabitacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 11/3/2021 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[IdHotel] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](250) NOT NULL,
	[IdPais] [int] NOT NULL,
	[Latitud] [decimal](18, 0) NOT NULL,
	[Longitud] [decimal](18, 0) NOT NULL,
	[Descripcion] [nvarchar](250) NOT NULL,
	[Activo] [bit] NOT NULL,
	[NumeroHabitaciones] [smallint] NOT NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[IdHotel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 11/3/2021 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pais](
	[IdPais] [int] NOT NULL,
	[NombrePais] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Pais] PRIMARY KEY CLUSTERED 
(
	[IdPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reserva]    Script Date: 11/3/2021 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reserva](
	[IdReserva] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[IdHabitacion] [int] NOT NULL,
	[FechaEntrada] [datetime] NOT NULL,
	[FechaSalida] [datetime] NOT NULL,
	[FechaReserva] [date] NOT NULL,
	[IdEstado] [int] NOT NULL,
 CONSTRAINT [PK_Reserva] PRIMARY KEY CLUSTERED 
(
	[IdReserva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 11/3/2021 5:48:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [nvarchar](250) NOT NULL,
	[Apellidos] [nvarchar](250) NOT NULL,
	[Correo] [nvarchar](320) NOT NULL,
	[Direccion] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Estado] ([IdEstado], [Descripcion]) VALUES (0, N'Cancelado')
GO
INSERT [dbo].[Estado] ([IdEstado], [Descripcion]) VALUES (1, N'Reservado')
GO
SET IDENTITY_INSERT [dbo].[Habitacion] ON 
GO
INSERT [dbo].[Habitacion] ([IdHabitacion], [IdHotel], [Precio], [Descripcion]) VALUES (1, 1, 30000, N'Habitacion individual 1')
GO
INSERT [dbo].[Habitacion] ([IdHabitacion], [IdHotel], [Precio], [Descripcion]) VALUES (2, 1, 30000, N'habitacion individual 2')
GO
SET IDENTITY_INSERT [dbo].[Habitacion] OFF
GO
SET IDENTITY_INSERT [dbo].[Hotel] ON 
GO
INSERT [dbo].[Hotel] ([IdHotel], [Nombre], [IdPais], [Latitud], [Longitud], [Descripcion], [Activo], [NumeroHabitaciones]) VALUES (1, N'El Gran Hotel', 57, CAST(12 AS Decimal(18, 0)), CAST(21 AS Decimal(18, 0)), N'Gran Hotel con vista al mar', 1, 2)
GO
INSERT [dbo].[Hotel] ([IdHotel], [Nombre], [IdPais], [Latitud], [Longitud], [Descripcion], [Activo], [NumeroHabitaciones]) VALUES (2, N'El Pequeño Hotel', 57, CAST(11 AS Decimal(18, 0)), CAST(23 AS Decimal(18, 0)), N'Hotel Pequeño en pueblo', 1, 1)
GO
SET IDENTITY_INSERT [dbo].[Hotel] OFF
GO
INSERT [dbo].[Pais] ([IdPais], [NombrePais]) VALUES (57, N'Colombia')
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 
GO
INSERT [dbo].[Usuario] ([IdUsuario], [Nombres], [Apellidos], [Correo], [Direccion]) VALUES (1, N'Camilo Andres', N'Chavez ', N'darkcamil@hotmail.com', N'cr 1 rest w')
GO
INSERT [dbo].[Usuario] ([IdUsuario], [Nombres], [Apellidos], [Correo], [Direccion]) VALUES (2, N'Luis', N'Ariza', N'darkcamil2@hotmail.com', N'cr 3 23 s 2 ')
GO
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_Mail]    Script Date: 11/3/2021 5:48:51 PM ******/
ALTER TABLE [dbo].[Usuario] ADD  CONSTRAINT [UC_Mail] UNIQUE NONCLUSTERED 
(
	[Correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Habitacion]  WITH CHECK ADD  CONSTRAINT [FK_Habitacion_Hotel] FOREIGN KEY([IdHotel])
REFERENCES [dbo].[Hotel] ([IdHotel])
GO
ALTER TABLE [dbo].[Habitacion] CHECK CONSTRAINT [FK_Habitacion_Hotel]
GO
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD  CONSTRAINT [FK_Hotel_Pais] FOREIGN KEY([IdPais])
REFERENCES [dbo].[Pais] ([IdPais])
GO
ALTER TABLE [dbo].[Hotel] CHECK CONSTRAINT [FK_Hotel_Pais]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Estado] FOREIGN KEY([IdEstado])
REFERENCES [dbo].[Estado] ([IdEstado])
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [FK_Reserva_Estado]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Habitacion] FOREIGN KEY([IdHabitacion])
REFERENCES [dbo].[Habitacion] ([IdHabitacion])
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [FK_Reserva_Habitacion]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Reserva] FOREIGN KEY([IdReserva])
REFERENCES [dbo].[Reserva] ([IdReserva])
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [FK_Reserva_Reserva]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [FK_Reserva_Usuario]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador Unico de la habitacion' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Habitacion', @level2type=N'COLUMN',@level2name=N'IdHabitacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador unico del hotel ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Habitacion', @level2type=N'COLUMN',@level2name=N'IdHotel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripcion de la habitacion' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Habitacion', @level2type=N'COLUMN',@level2name=N'Descripcion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador unico del hotel' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hotel', @level2type=N'COLUMN',@level2name=N'IdHotel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre del hotel' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hotel', @level2type=N'COLUMN',@level2name=N'Nombre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador de la tabla Pais' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hotel', @level2type=N'COLUMN',@level2name=N'IdPais'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'cordenada de latitud del hotel' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hotel', @level2type=N'COLUMN',@level2name=N'Latitud'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cordenada de longitud del hotel' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hotel', @level2type=N'COLUMN',@level2name=N'Longitud'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripcion del hotel' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hotel', @level2type=N'COLUMN',@level2name=N'Descripcion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Es un hotel activo o inactivo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hotel', @level2type=N'COLUMN',@level2name=N'Activo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador Unico del Pais' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pais', @level2type=N'COLUMN',@level2name=N'IdPais'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre del pais' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pais', @level2type=N'COLUMN',@level2name=N'NombrePais'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha entrada a  la habitación checkin' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Reserva', @level2type=N'COLUMN',@level2name=N'FechaEntrada'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha Salida habitacion checkout' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Reserva', @level2type=N'COLUMN',@level2name=N'FechaSalida'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador unico de usuario' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Usuario', @level2type=N'COLUMN',@level2name=N'IdUsuario'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre de Usuario' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Usuario', @level2type=N'COLUMN',@level2name=N'Nombres'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Apellido del Usuario' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Usuario', @level2type=N'COLUMN',@level2name=N'Apellidos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mail del usuario' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Usuario', @level2type=N'COLUMN',@level2name=N'Correo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dirección del usuario' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Usuario', @level2type=N'COLUMN',@level2name=N'Direccion'
GO

CREATE TRIGGER [dbo].[NoOverRooms]  
ON [ReservaHotelDB].[dbo].[Habitacion]
FOR INSERT
AS 
Declare @numberOfRooms int;
Declare @numberofHotelRooms int;

Select @numberOfRooms =count(1), @numberofHotelRooms = ho.NumeroHabitaciones
from inserted i
inner Join Habitacion h on i.IdHotel=h.IdHotel
inner Join Hotel ho on ho.IdHotel = h.IdHotel
Group by h.IdHotel, ho.NumeroHabitaciones

IF(ISNULL(@numberOfRooms,0) > ISNULL(@numberofHotelRooms,1))
BEGIN
	RAISERROR ('Numero de habitaciones excedidas para el hotel', 16, 10);  
END

