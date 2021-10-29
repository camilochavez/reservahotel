// =============================================================================================================== 
// <summary> 
// Startup clase donde se configuran los servicios a usar en el API
// </summary> 
// =============================================================================================================== 

using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.OpenApi.Models;
using ReservaHotel.Api.Filters;
using ReservaHotel.Repository;
using ReservaHotel.Repository.Context;
using ReservaHotel.Repository.Interface;
using System;
using System.IO;
using System.Reflection;

namespace ReservaHotel.Api
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            //Agregando inyección de dependencias a controladores
            services.AddControllers();

            //Agregando el contexto de la base de datos a la inyección de dependencias
            services.AddDbContext<ReservaHotelDbContext>(options =>
                    options.UseLazyLoadingProxies()
                           .UseSqlServer(Configuration.GetConnectionString("ReservaHotelApiContext")));

            //Agregando servicios de repositorio  a la inyección de dependencias,
            //se usa scoped porque no necesitamos diferentes objetos para estas operaciones
            services.AddScoped<IReservaRepo, ReservaRepo>();

            //Agregando los filtros de validacion
            services.AddScoped<ValidationFilterAttribute>();
            services.AddScoped<ValidationDatesFilterAttribute>();

            //Inyectando el servicio de memoria
            services.AddMemoryCache();

            //Agregando los servicios de swagger para describir el API
            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo
                {
                    Version = "v1",
                    Title = "Reserva Hotel API",
                    Description = "Reserva Hotel ASP.NET Core API",
                    Contact = new OpenApiContact
                    {
                        Name = "Camilo Chavez",
                        Email = "darkcamil@hotmail.com" // To configure any email we need to be redirected
                    }
                });
                var xmlFile = $"{Assembly.GetExecutingAssembly().GetName().Name}.xml";
                var xmlPath = Path.Combine(AppContext.BaseDirectory, xmlFile);
                c.IncludeXmlComments(xmlPath);
            });
        }

        // configurando los diferentes pipeline middleware para los HTTP request.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseAuthorization();

            //Habilitando el middleware para generar el swagger json
            app.UseSwagger();

            // Habilitando middleware to serve swagger-ui (HTML, JS, CSS, etc.),
            // Agregando el pipeline para Swagger JSON endpoint.
            app.UseSwaggerUI(c =>
            {
                c.SwaggerEndpoint("v1/swagger.json", "Reserva Hotel API V1");
            });

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
