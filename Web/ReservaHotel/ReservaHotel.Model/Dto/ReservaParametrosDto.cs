// =============================================================================================================== 
// <summary> 
// DTO Definición de los parametros para crear una reserva
// </summary> 
// =============================================================================================================== 

using System;
using System.ComponentModel.DataAnnotations;

namespace ReservaHotel.Model.Dto
{
    public class ReservaParametrosDto
    {
        /// <summary>
        /// Identificador único del usuario
        /// </summary>
        [Range(1, int.MaxValue, ErrorMessage = "Id Usuario, debe ingresar un valor numérico mayor a cero.")]
        public int IdUsuario { get; set; }
        /// <summary>
        /// Identificador único del hotel
        /// </summary>
        [Range(1, int.MaxValue, ErrorMessage = "Id Hotel, debe ingresar un valor numérico mayor a cero.")]
        public int IdHotel { get; set; }
        /// <summary>
        /// Fecha de Entrada
        /// </summary>
        [Required(ErrorMessage = "Fecha Entrada es requerida")]
        public DateTime FechaEntrada { get; set; }
        /// <summary>
        /// Fecha de Salida
        /// </summary>
        [Required(ErrorMessage = "Fecha Salida es requerida")]
        public DateTime FechaSalida { get; set; }
    }
}
