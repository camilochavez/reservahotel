// =============================================================================================================== 
// <summary> 
// Interface de reserva contexto de repositorio
// </summary> 
// =============================================================================================================== 

using ReservaHotel.Model;
using ReservaHotel.Model.Dto;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ReservaHotel.Repository.Interface
{
    public interface IReservaRepo
    {
        /// <summary>
        /// Registrar una reserva basada en los datos del usuario, habitación y fechas
        /// </summary>
        /// <param name="reservaData">Párametros con datos de la reserva</param>
        /// <returns>Verdadeto o falso según el resultado de la operación</returns>
        public Task<bool> Create(ReservaParametrosDto reservaData);

        /// <summary>
        /// Cancelar una reserva basada en un Id
        /// </summary>
        /// <param name="IdReserva">Reserva Id</param>
        /// <returns>Verdadeto o falso según el resultado de la operación</returns>
        public Task<bool> Cancel(int idReserva);

        /// <summary>
        /// Obtiene todas la reservas en un rango de fechas
        /// </summary>
        /// <param name="FechaInicio">Fecha de Inicio</param>
        /// <param name="FechaFin">Fecha de Fin</param>
        /// <returns>Reservas en un rango de fechas</returns>
        public Task<List<ReservaDto>> GetReservaByDate(DateTime FechaInicio, DateTime FechaFin);
    }
}
