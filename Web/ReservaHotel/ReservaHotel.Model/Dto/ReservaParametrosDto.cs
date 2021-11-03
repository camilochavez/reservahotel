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
        /// Fecha de Entrada yyyy-MM-dd
        /// </summary>
        [Required(ErrorMessage = "Fecha Entrada es requerida")]
        [DisplayFormat(DataFormatString = "yyyy-MM-dd")]
        public string FechaEntrada { get; set; }
        /// <summary>
        /// Fecha de Salida yyyy-MM-dd
        /// </summary>
        [DisplayFormat(DataFormatString = "yyyy-MM-dd")]
        [Required(ErrorMessage = "Fecha Salida es requerida")]
        public string FechaSalida { get; set; }
    }
}
