// =============================================================================================================== 
// <summary> 
// Definición de la clase Hotel
// </summary> 
// =============================================================================================================== 

using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ReservaHotel.Model
{
    public class Hotel
    {
        /// <summary>
        /// Identificador único del Hotel
        /// </summary>
        [Key]
        public int IdHotel { get; set; }
        /// <summary>
        /// Nombre del Hotel
        /// </summary>
        public string Nombre { get; set; }  
        /// <summary>
        /// Entidad del Pais
        /// </summary>
        [ForeignKey("IdPais")]
        public virtual Pais Pais { get; set; }
        /// <summary>
        /// Ubicación Latitud del hotel
        /// </summary>
        public decimal Latitud { get; set; }
        /// <summary>
        /// Ubicación Longitud del hotel
        /// </summary>
        public decimal Longitud { get; set; }
        /// <summary>
        /// Descripción del hotel
        /// </summary>
        public string Descripcion { get; set; }
        /// <summary>
        /// Estado del hotel en el sistema
        /// </summary>
        public bool Activo { get; set; }
        /// <summary>
        /// Número de habitaciones
        /// </summary>
        public short NumeroHabitaciones { get; set; }

    }
}
