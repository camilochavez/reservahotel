// =============================================================================================================== 
// <summary> 
// Filtro para validar información antes de llamar el controlador
// </summary> 
// =============================================================================================================== 
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using System;

namespace ReservaHotel.Api.Filters
{
    public class ValidationDatesFilterAttribute : IActionFilter
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
            if (((DateTime)context.ActionArguments["fechaInicio"]) > ((DateTime)context.ActionArguments["fechaFin"]))
            {
                context.Result = new BadRequestObjectResult("La Fecha de inicio debe ser mayor a la de fin");
                return;
            }
        }
    }
}
