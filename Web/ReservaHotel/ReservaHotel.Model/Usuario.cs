// =============================================================================================================== 
// <summary> 
// Definición de la clase Usuario
// </summary> 
// =============================================================================================================== 

using System.ComponentModel.DataAnnotations;

namespace ReservaHotel.Model
{
    public class Usuario
    {
        /// <summary>
        /// Identificador único de usuario
        /// </summary>
        [Key]
        public int IdUsuario { get; set; }
        /// <summary>
        /// Nombre del usuario
        /// </summary>
        public string Nombres { get; set; }
        /// <summary>
        /// Apellido de usuario
        /// </summary>
        public string Apellidos { get; set; }
        /// <summary>
        /// Correo del usuario
        /// </summary>
        [EmailAddress]
        public string Correo { get; set; }
        /// <summary>
        /// Dirección del usuario
        /// </summary>
        public string Direccion { get; set; }
    }
}
