using Microsoft.Extensions.Logging;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Moq;
using ReservaHotel.Api.Controllers;
using ReservaHotel.Model.Dto;
using ReservaHotel.Repository.Interface;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ReservaHotel.Api.Test.Controllers
{
    [TestClass]
    public class ReservaControllerTest
    {
        private ReservaController reservaController;
        // Se Crean objetos tipo mock para realizar un simil de los servicios a consultar de manera simulada
        private Mock<IReservaRepo> reservaRepoMock;
        private Mock<ILogger<ReservaController>> loggerMock;

        //Iniciando los test
        [TestInitialize]
        public void IniciarTest()
        {
            reservaRepoMock = new Mock<IReservaRepo>();
            loggerMock = new Mock<ILogger<ReservaController>>();
            reservaController = new ReservaController(reservaRepoMock.Object, loggerMock.Object);
        }

        [TestMethod]
        public void Post_Create_Success()
        {
            //Dado
            ReservaParametrosDto reservaData = new ReservaParametrosDto
            {
                FechaEntrada = DateTime.Now.ToString(),
                FechaSalida = DateTime.Now.AddDays(3).ToString(),
                IdHotel = 1,
                IdUsuario = 1
            };
            reservaRepoMock.Setup(rm => rm.Create(reservaData)).Returns(Task.FromResult(true));

            //Cuando
            var result = reservaController.Post(reservaData);

            //Entonces
            Assert.IsTrue(result.Result);
            reservaRepoMock.Verify();
        }

        [TestMethod]
        public void Post_Create_NoSuccess()
        {
            //Dado
            ReservaParametrosDto reservaData = new ReservaParametrosDto
            {
                FechaEntrada = DateTime.Now.ToString(),
                FechaSalida = DateTime.Now.AddDays(3).ToString(),
                IdHotel = 0,
                IdUsuario = 1
            };
            reservaRepoMock.Setup(rm => rm.Create(reservaData)).Throws(new Exception("Error Test"));

            //Cuando 
            var result = reservaController.Post(reservaData);

            //entonces
            Assert.IsFalse(result.Result);
            reservaRepoMock.Verify();
            loggerMock.Verify();
        }

        [TestMethod]
        public void Post_Cancel_Success()
        {
            //Dado
            const int idResreva = 1;
            reservaRepoMock.Setup(rm => rm.Cancel(idResreva)).Returns(Task.FromResult(true));

            //Cuando
            var result = reservaController.Delete(idResreva);

            //Entonces
            Assert.IsTrue(result.Result);
            reservaRepoMock.Verify();
        }

        [TestMethod]
        public void Post_Cancel_NoSuccess()
        {
            //Dado
            const int idReserva = 1;
            reservaRepoMock.Setup(rm => rm.Cancel(idReserva)).Throws(new Exception("Error Test"));

            //Cuando 
            var result = reservaController.Delete(idReserva);

            //entonces
            Assert.IsFalse(result.Result);
            reservaRepoMock.Verify();
            loggerMock.Verify();
        }


        [TestMethod]
        public void Post_Get_Success()
        {
            //Dado
            DateTime fechaInicio = DateTime.Now;
            DateTime fechaFin = DateTime.Now.AddDays(1);
            List<ReservaDto> reservaResult = new List<ReservaDto> {
                new ReservaDto{
                    CorreoUsuario="test@test.com",
                    DescricionHabitacion="Test habitacion",
                    Estado="Reservado",
                    FechaEntrada = DateTime.Now,
                    FechaReserva = DateTime.Now.AddDays(-1),
                    FechaSalida = DateTime.Now.AddDays(3),
                    NombreCompletoUsuario="Test Usuario Test",
                    NombreHotel="Test Hotel"
                }
            };
            reservaRepoMock.Setup(rm => rm.GetReservaByDate(fechaInicio, fechaFin)).Returns(Task.FromResult(reservaResult));

            //Cuando 
            var result = reservaController.GetByDates(fechaInicio.ToString(), fechaFin.ToString());

            //entonces
            Assert.IsNotNull(result.Result);
            reservaRepoMock.Verify();
        }

        [TestMethod]
        public void Post_Get_NoSuccess()
        {
            //Dado
            DateTime fechaInicio = DateTime.Now;
            DateTime fechaFin = DateTime.Now.AddDays(1);
            List<ReservaDto> reservaResult = new List<ReservaDto> {
                new ReservaDto{
                    CorreoUsuario="test@test.com",
                    DescricionHabitacion="Test habitacion",
                    Estado="Reservado",
                    FechaEntrada = DateTime.Now,
                    FechaReserva = DateTime.Now.AddDays(-1),
                    FechaSalida = DateTime.Now.AddDays(3),
                    NombreCompletoUsuario="Test Usuario Test",
                    NombreHotel="Test Hotel"
                }
            };
            reservaRepoMock.Setup(rm => rm.GetReservaByDate(fechaInicio, fechaFin)).Throws(new Exception());

            //Cuando 
            var result = reservaController.GetByDates(fechaInicio.ToString(), fechaFin.ToString());

            //entonces
            Assert.IsNull(result.Result);
            loggerMock.Verify();
            reservaRepoMock.Verify();
        }
    }
}
