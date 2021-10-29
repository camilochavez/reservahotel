// =============================================================================================================== 
// <summary> 
// Definición de la clase Pais
// </summary> 
// =============================================================================================================== 


using System;
using System.ComponentModel.DataAnnotations;

namespace ReservaHotel.Model
{
    public class Pais
    {
        /// <summary>
        /// Identificador único del país
        /// </summary>
        [Key]
        public int IdPais { get; set; }
        /// <summary>
        /// Nombre del país
        /// </summary>
        public string NombrePais { get; set; }

    }
}
