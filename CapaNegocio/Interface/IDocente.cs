using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using CapaEntidad; // llamar al mapeado objeto relacional
using System.Data; // llamar a los buffer de memoria: Tablas con registros

namespace CapaNegocio.Interface
{
    internal interface IDocente
    {
        //Declara los metodos de la clase Docente
        DataTable Listar();
        bool Agregar(Docente docente);
        bool Eliminar(string codDocente);
        bool Actualizar(Docente docente);
        DataTable Buscar(string codDocente);
    }
}
