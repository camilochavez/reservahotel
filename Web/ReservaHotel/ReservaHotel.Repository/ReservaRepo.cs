// =============================================================================================================== 
// <summary> 
// Reserva Repository Context
// </summary> 
// =============================================================================================================== 


using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Caching.Memory;
using ReservaHotel.Model;
using ReservaHotel.Model.Dto;
using ReservaHotel.Repository.Context;
using ReservaHotel.Repository.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ReservaHotel.Repository
{
    public class ReservaRepo : IReservaRepo
    {
        /// <summary>
        /// Data context
        /// </summary>
        private readonly ReservaHotelDbContext dataContext;

        /// <summary>
        /// memory Cache objeto
        /// </summary>
        private readonly IMemoryCache memoryCache;
        public ReservaRepo(ReservaHotelDbContext dataContext, IMemoryCache memoryCache)
        {
            this.dataContext = dataContext;
            this.memoryCache = memoryCache;
        }

        /// <summary>
        /// Cancelar una reserva basada en un Id
        /// </summary>
        /// <param name="IdReserva">Reserva Id</param>
        /// <returns>Verdadeto o falso según el resultado de la operación</returns>
        public async Task<bool> Cancel(int idReserva)
        {
            //Obtener el objeto de la reserva a ser actualizado
            var reserva = await dataContext.Reservas.SingleAsync(r => r.IdReserva == idReserva);
            //Actualizando el estado de la reserva en memoria
            reserva.Estado = await dataContext.Estado.SingleAsync(e => e.IdEstado == 0);
            //Actualizando en memoria el objeto
            dataContext.Update(reserva);
            //Persistiendo los cambios en la bd
            var result = await dataContext.SaveChangesAsync();
            //Retornando el resultado
            return result > 0;
        }

        /// <summary>
        /// Registrar una reserva basada en los datos del usuario, habitación y fechas
        /// </summary>
        /// <param name="reservaData">Párametros con datos de la reserva</param>
        /// <returns>Verdadeto o falso según el resultado de la operación</returns>
        public async Task<bool> Create(ReservaParametrosDto reservaData)
        {
            // Se valida que no haya una reserva activa para esa fecha y esa habitación
            List<Habitacion> habitaciones = dataContext.Habitaciones.Include(r => r.Reservas).Where(h => h.Hotel.IdHotel == reservaData.IdHotel).ToList();
            var habitacion = habitaciones.FirstOrDefault(h => !h.Reservas.Any(r => ValidarReservaActiva(reservaData.FechaEntrada, reservaData.FechaSalida.AddDays(-1), r)));

            // Si no hay habitaciones disponibles se retorna falso
            if (habitacion == null)
                return false;

            //Creando un objeto del tipo reserva
            Reserva reserva = new Reserva
            {
                //Obteniendo el estado de la bd
                Estado = await dataContext.Estado.SingleAsync(e => e.IdEstado == 1),
                FechaEntrada = reservaData.FechaEntrada,
                FechaReserva = DateTime.Now,
                FechaSalida = reservaData.FechaSalida,
                //Obteniendo la habitación de la base de datos
                Habitacion = habitacion,
                //Obteniendo los usarios de la base de datos
                Usuario = await dataContext.Usuarios.SingleAsync(u => u.IdUsuario == reservaData.IdUsuario)
            };

            //agregando el objeto al contexto
            dataContext.Reservas.Add(reserva);
            //Agregando el registro a la base de datos
            var result = await dataContext.SaveChangesAsync();
            //Retornando el resultado
            return result > 0;
        }

        /// <summary>
        /// Obtener todas las reservas de la base de datos
        /// </summary>
        /// <returns>Reservas</returns>
        public async Task<List<Reserva>> GetAll()
        {
            //Nombre de la llave en memoria 
            string cacheKey = "Reservas_InMemory";
            //Tratando de obtenr las reservas en memoria
            memoryCache.TryGetValue(cacheKey, out IEnumerable<Reserva> reservas);

            if (reservas == null)
            {
                //Obteniendo todas las reservas desde la base de datos si no esta en memoria
                reservas = await dataContext.Reservas.Include(r => r.Usuario).Include(r => r.Estado).ToListAsync();
                memoryCache.Set(cacheKey, reservas);
            }
            return reservas.ToList();
        }

        public async Task<List<ReservaDto>> GetReservaByDate(DateTime FechaInicio, DateTime FechaFin)
        {
            //Obteniendo solo las reservas que esten activas y que cumplan con el rango de fechas dada por el usuario
            //Se resta un día a la fecha de salida para no tenerlo en cuenta como día de reserva ya que el usuario sale en la mañana
            var reservas = await dataContext.Reservas.Where(r => ValidarReservaActiva(FechaInicio, FechaFin, r))
                                            .Include(r => r.Usuario).Include(r => r.Estado).ToListAsync();

            List<ReservaDto> reservaListado = reservas.Select(r => new ReservaDto
            {
                CorreoUsuario = r.Usuario.Correo,
                DescricionHabitacion = r.Habitacion.Descripcion,
                Estado = r.Estado.Descripcion,
                FechaEntrada = r.FechaEntrada,
                FechaReserva = r.FechaReserva,
                FechaSalida = r.FechaSalida,
                NombreCompletoUsuario = $"{r.Usuario.Nombres} {r.Usuario.Apellidos}",
                NombreHotel = r.Habitacion.Hotel.Nombre
            }).ToList();
            return reservaListado;
        }

        /// <summary>
        /// Valida si una reserva esta disponible en esas fechas
        /// </summary>
        /// <param name="FechaInicio">Rango inicial de la busqueda por fecha</param>
        /// <param name="FechaFin">Rango fnial de la busqueda por fecha</param>
        /// <param name="reserva">Reserva</param>
        /// <returns>Falso o Verdadero</returns>
        private static bool ValidarReservaActiva(DateTime FechaInicio, DateTime FechaFin, Reserva reserva)
        {
            return reserva.Estado.IdEstado == 1 &&
                                                   ((FechaInicio <= reserva.FechaEntrada && FechaFin >= reserva.FechaSalida.AddDays(-1))
                                                     || (FechaInicio >= reserva.FechaEntrada && FechaFin <= reserva.FechaSalida.AddDays(-1))
                                                     || (FechaInicio <= reserva.FechaEntrada && FechaFin <= reserva.FechaSalida.AddDays(-1) && reserva.FechaEntrada <= FechaFin)
                                                     || (FechaInicio >= reserva.FechaEntrada && FechaFin >= reserva.FechaSalida.AddDays(-1) && reserva.FechaSalida.AddDays(-1) >= FechaInicio));
        }
    }
}
