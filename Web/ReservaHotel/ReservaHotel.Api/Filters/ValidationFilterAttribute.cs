// =============================================================================================================== 
// <summary> 
// Filtro para validar información antes de llamar el controlador
// </summary> 
// =============================================================================================================== 
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using ReservaHotel.Model.Dto;
using System.Linq;

namespace ReservaHotel.Api.Filters
{
    public class ValidationFilterAttribute : IActionFilter
    {
        public void OnActionExecuted(ActionExecutedContext context)
        {
            //Sin implementación
        }

        /// <summary>
        /// Validar el modelo de datos durante la ejecución
        /// </summary>
        /// <param name="context">contexto de la ejecución</param>
        public void OnActionExecuting(ActionExecutingContext context)
        {
            var param = context.ActionArguments.SingleOrDefault(p => p.Value is ReservaParametrosDto);
            if (param.Value == null)
            {
                context.Result = new BadRequestObjectResult("No hay parametros para la operacion");
                return;
            }
            if (((ReservaParametrosDto)param.Value).FechaSalida < ((ReservaParametrosDto)param.Value).FechaEntrada)
            {
                context.Result = new BadRequestObjectResult("La Fecha de entrada debe ser mayor a la de salida");
                return;
            }
            if (!context.ModelState.IsValid)
            {
                context.Result = new BadRequestObjectResult(context.ModelState);
            }
        }
    }
}
