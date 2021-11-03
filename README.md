# Reserva Hotel
poc reserva hotel con net core

La solución contiene tres proyectos
### ReservaHotel.Api 
Es donde se desarrolló el api rest para crear, consultar y cancelar reservas.
Tambien se configuro Swagger para poder visualizar los endpoints que contiene el proyecto y consumirlos desde esa herramienta.
Se usaron las convenciones de OpenApi para crear el contrato presente en este proyecto.
Se usaron action filters para validar la información de entrada de algunos endpoints como por ejemplo las fecha de entrada no sea mayor a la de salida.

### ReservaHotel.Api.Test
Proyecto con los test del proyecto de API

### ReservaHotel.Model
Proyecto con los modelos que representas las entidades de la base de datos y los DTO que son usados en los controladores para los parámetros de entrada al servicio rest.

### ReservaHotel.Repository
Proyecto con la conexión a la base de datos con el que se crean, consultan o cancelan reservas.

### ReservaHotelDB
Proyecto con el schema de la base de datos

## Base de Datos
- Para validación de campos como que el correo del usuario sea único se creo un constrain que no permite tener valores duplicados en la tabla de usuario para ese campo
- Para que el hotel no tenga más habitaciones de las que tiene en el campo numero habitaciones se creo un trigger que valida el numero de habitaciones registradas en la tabla habitacion, si intentar ingresar más de la cuenta el trigger no dejará insertar esa habitación.

## Archivos adicionales
- ContratoAPIReservaHotel.json Archivo con el contrato de los endpoints del API, apartir de este contrato se genera el cliente y el server de la solucion
- CreacionBaseDeDatos.sql Archivo con la estructura de la base de datos