// =============================================================================================================== 
// <summary> 
// Definición de la clase Reserva
// </summary> 
// =============================================================================================================== 

using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ReservaHotel.Model
{
    public class Reserva
    {
        /// <summary>
        /// Identificador único de la reserva
        /// </summary>
        [Key]
        public int IdReserva { get; set; }
        /// <summary>
        /// Entidad del Usuario, se declara virtual para hacer un lazy load de los datos
        /// </summary>
        [ForeignKey("IdUsuario")]
        public virtual Usuario Usuario { get; set; }
        /// <summary>
        /// Entidad de habitación
        /// </summary>
        [ForeignKey("IdHabitacion")]
        public virtual Habitacion Habitacion { get; set; }
        /// <summary>
        /// Fecha de Entrada
        /// </summary>
        public DateTime FechaEntrada { get; set; }
        /// <summary>
        /// Fecha de Salida
        /// </summary>
        public DateTime FechaSalida { get; set; }
        /// <summary>
        /// Fecha de Reserva
        /// </summary>
        public DateTime FechaReserva { get; set; }
        /// <summary>
        /// Estado de la reserva, se declara virtual para hacer un lazy load de los datos
        /// </summary>
        [ForeignKey("IdEstado")]
        public virtual Estado Estado { get; set; }

    }
}
