// =============================================================================================================== 
// <summary> 
// Reserva Hotel Context
// </summary> 
// =============================================================================================================== 

using Microsoft.EntityFrameworkCore;
using ReservaHotel.Model;

namespace ReservaHotel.Repository.Context
{
    public class ReservaHotelDbContext : DbContext
    {
        public ReservaHotelDbContext(DbContextOptions<ReservaHotelDbContext> options)
            : base(options)
        {

        }

        /// <summary>
        /// Agregando relaciones entre tablas al modelo del contexto
        /// </summary>
        /// <param name="modelBuilder"></param>
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Reserva>().ToTable(nameof(Reserva));
            modelBuilder.Entity<Habitacion>().ToTable(nameof(Habitacion));
            modelBuilder.Entity<Hotel>().ToTable(nameof(Hotel));
            modelBuilder.Entity<Usuario>().ToTable(nameof(Usuario));
            modelBuilder.Entity<Estado>().ToTable(nameof(Estado));
        }

        /// <summary>
        /// Data set de Reservas
        /// </summary>
        public DbSet<Reserva> Reservas { get; set; }
        /// <summary>
        /// Data set de Usuarios
        /// </summary>
        public DbSet<Usuario> Usuarios { get; set; }
        /// <summary>
        /// Data Set de Estado de la reserva
        /// </summary>
        public DbSet<Estado> Estado { get; set; }
        /// <summary>
        /// Data Set de Habitaciones
        /// </summary>
        public DbSet<Habitacion> Habitaciones { get; set; }
        /// <summary>
        /// Data Set de Hoteles
        /// </summary>
        public DbSet<Hotel> Hoteles { get; set; }
    }
}
