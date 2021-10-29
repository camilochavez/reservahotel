// =============================================================================================================== 
// <summary> 
// Definición para el estado de la reserva
// </summary> 
// =============================================================================================================== 

using System.ComponentModel.DataAnnotations;

namespace ReservaHotel.Model
{
    public class Estado
    {
        /// <summary>
        /// Identificador único de Estado de la reserva
        /// </summary>
        [Key]
        public int IdEstado { get; set; }
        /// <summary>
        /// Descripción del estado
        /// </summary>
        public string Descripcion { get; set; }
    }
}
