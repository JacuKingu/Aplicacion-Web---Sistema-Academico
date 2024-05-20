using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using CapaDato;
using CapaEntidad;

namespace CapaNegocio
{
    public class AlumnoBL : Interface.IAlumno
    {
        //Llamar  a la CapaDato
        private Datos datos = new DatosSQL();

        //MEnsaje del procedmiento almacenado
        public string Mensaje { get; set; }

        public DataTable Listar()
        {
            return datos.TraerDataTable("spListarAlumno");
        }

        public bool Agregar(Alumno alumno)
        {
            DataRow fila = datos.TraerDataRow("spAgregarAlumno", alumno.CodAlumno, alumno.APaterno, alumno.AMaterno, alumno.Nombres, alumno.CodUsuario, alumno.Contrasena, alumno.CodEscuela);
            // Traer el mensaje del procedimiento almacenado para llevar al formulario
            Mensaje = fila["Mensaje"].ToString();
            byte codError = Convert.ToByte(fila["CodError"]);
            if (codError == 0) return true;
            else return false;
        }

        public bool Eliminar(string codAlumno)
        {
            DataRow fila = datos.TraerDataRow("spEliminarAlumno", codAlumno);
            // Traer el mensaje del procedimiento almacenado para llevar al formulario
            Mensaje = fila["Mensaje"].ToString();
            byte codError = Convert.ToByte(fila["CodError"]);
            if (codError == 0) return true;
            else return false;
        }


        public bool Actualizar(Alumno alumno)
        {
            DataRow fila = datos.TraerDataRow("spActualizarAlumno", alumno.CodAlumno, alumno.APaterno, alumno.AMaterno, alumno.Nombres, alumno.CodUsuario, alumno.Contrasena, alumno.CodEscuela);
            Mensaje = fila["Mensaje"].ToString();
            byte codError = Convert.ToByte(fila["CodError"]);
            if (codError == 0) return true;
            else return false;
        }

        

        public DataTable Buscar(string codAlumno)
        {
            return datos.TraerDataTable("spBuscarAlumno", codAlumno);
        }

        

        
    }
}
