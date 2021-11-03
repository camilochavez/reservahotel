// =============================================================================================================== 
// <summary> 
// DTO Definición de una reserva
// </summary> 
// =============================================================================================================== 

using System;

namespace ReservaHotel.Model.Dto
{
    public class ReservaDto
    {
        /// <summary>
        /// Nombre del hotel de la reserva
        /// </summary>
        public string NombreHotel { get; set; }
        /// <summary>
        /// Correo del usuario que reservó
        /// </summary>
        public string CorreoUsuario { get; set; }
        /// <summary>
        /// Nombre Completo Usuario
        /// </summary>
        public string NombreCompletoUsuario { get; set; }
        /// <summary>
        /// Descripcion de la habitación reservada
        /// </summary>
        public string DescricionHabitacion { get; set; }
        /// <summary>
        /// Fecha de Entrada yyyy-MM-dd
        /// </summary>
        public DateTime FechaEntrada { get; set; }
        /// <summary>
        /// Fecha de Salida yyyy-MM-dd
        /// </summary>
        public DateTime FechaSalida { get; set; }
        /// <summary>
        /// Fecha de Reserva yyyy-MM-dd
        /// </summary>
        public DateTime FechaReserva { get; set; }
        /// <summary>
        /// Estado de la reserva, se declara virtual para hacer un lazy load de los datos
        /// </summary>        
        public string Estado { get; set; }
    }
}
