// =============================================================================================================== 
// <summary> 
// Definición de la clase Habitacion
// </summary> 
// =============================================================================================================== 

using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ReservaHotel.Model
{
    public class Habitacion
    {
        /// <summary>
        /// Identificador único de la habitación
        /// </summary>
        [Key]
        public int IdHabitacion { get; set; }
        /// <summary>
        /// Identificador único del hotel
        /// </summary>
        [ForeignKey("IdHotel")]
        public virtual Hotel Hotel { get; set; }
        /// <summary>
        /// Precio de la habitación
        /// </summary>
        public int Precio { get; set; }
        /// <summary>
        /// Descripción de la habitación
        /// </summary>
        public string Descripcion { get; set; }

        public virtual List<Reserva> Reservas { get; set; }
    }
}
