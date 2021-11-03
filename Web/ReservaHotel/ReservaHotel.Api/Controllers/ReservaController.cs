// =============================================================================================================== 
// <summary> 
// Controlador para la entidad de reserva
// </summary> 
// =============================================================================================================== 

using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using ReservaHotel.Api.Filters;
using ReservaHotel.Model.Dto;
using ReservaHotel.Repository.Interface;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ReservaHotel.Api.Controllers
{
    [Route("api/reserva")]
    [ApiController]
    public class ReservaController : ControllerBase
    {
        private readonly IReservaRepo reservaRepo;
        private readonly ILogger logger;

        public ReservaController(IReservaRepo reservaRepo, ILogger<ReservaController> logger)
        {
            this.reservaRepo = reservaRepo;
            this.logger = logger;
        }

        /// <summary>
        /// Crear una reserva basada en los datos de usuario, habitación y fechas
        /// </summary>
        /// <param name="reservaData">Datos de la reserva</param>
        /// <returns>Estado de la creación de la reserva</returns>
        // POST api/Reserva
        [HttpPost]
        [ServiceFilter(typeof(ValidationFilterAttribute))]
        public async Task<bool> Post([FromBody] ReservaParametrosDto reservaData)
        {
            try
            {
                return await reservaRepo.Create(reservaData);
            }
            catch (Exception ex)
            {
                string errorMessage = $"Error Creando la reserva {ex.Message}";
                logger.LogError(ex, errorMessage, null);
                return false;
            }
        }

        /// <summary>
        /// Cancelar una reserva
        /// </summary>
        /// <param name="idReserva">Id de la reserva</param>
        /// <returns>Estdo de la cancelación de la reserva</returns>
        //PUT api/Reserva
        [HttpDelete]
        public async Task<bool> Delete([FromQuery] int idReserva)
        {
            try
            {
                return await reservaRepo.Cancel(idReserva);
            }
            catch (Exception ex)
            {
                string errorMessage = $"Error cancelando la reserva {ex.Message}";
                logger.LogError(ex, errorMessage, null);
                return false;
            }
        }


        /// <summary>
        /// Obtener las reservas activas dada una fecha de inicio y fin
        /// </summary>
        /// <param name="fechaInicio">Fecha Inicio yyyy-MM-dd</param>
        /// <param name="fechaFin">Fecha Fin yyyy-MM-dd</param>
        /// <returns>Reservas</returns>
        // GET: api/Reserva?fechaInicio=01/01/1900&fechaFin=01/01/1900        
        [HttpGet()]
        [ServiceFilter(typeof(ValidationDatesFilterAttribute))]
        public async Task<List<ReservaDto>> GetByDates([FromQuery] string fechaInicio, [FromQuery] string fechaFin)
        {
            try
            {
                return await reservaRepo.GetReservaByDate(DateTime.Parse(fechaInicio), DateTime.Parse(fechaFin));
            }
            catch (Exception ex)
            {
                string errorMessage = $"Error consultando reservas {ex.Message}";
                logger.LogError(ex, errorMessage, null);
                return null;
            }
        }
    }
}
