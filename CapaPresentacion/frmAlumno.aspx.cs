using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using CapaEntidad;
using CapaNegocio;

namespace CapaPresentacion
{
    public partial class frmAlumno : System.Web.UI.Page
    {
        AlumnoBL alumnoBL = new AlumnoBL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ListarAlumnos();
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            string contrasena = txtContrasena.Text.Trim();
            string confirmacion = txtConfirmarContrasena.Text.Trim();

            if (contrasena != confirmacion)
            {
                // Aquí puedes mostrar un mensaje de error en tu interfaz si las contraseñas no coinciden
                lblMensaje.Text = "Las contraseñas no coinciden. Por favor, verifique.";
                return;
            }


            Alumno alumno = new Alumno
            {
                CodAlumno = txtCodAlumno.Text.Trim(),
                APaterno = txtAPaterno.Text.Trim(),
                AMaterno = txtAMaterno.Text.Trim(),
                Nombres = txtNombres.Text.Trim(),
                CodUsuario = txtCodUsuario.Text.Trim(),
                Contrasena = txtContrasena.Text.Trim(),
                CodEscuela = txtCodEscuela.Text.Trim()
            };

            bool resultado = alumnoBL.Agregar(alumno);
            lblMensaje.Text = alumnoBL.Mensaje;
            if (resultado)
                ListarAlumnos();
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            bool resultado = alumnoBL.Eliminar(txtCodAlumno.Text);
            lblMensaje.Text = alumnoBL.Mensaje;
            if (resultado)
                ListarAlumnos();
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            Alumno alumno = new Alumno
            {
                CodAlumno = txtCodAlumno.Text.Trim(),
                APaterno = txtAPaterno.Text.Trim(),
                AMaterno = txtAMaterno.Text.Trim(),
                Nombres = txtNombres.Text.Trim(),
                CodUsuario = txtCodUsuario.Text.Trim(),
                Contrasena = txtContrasena.Text.Trim(),
                CodEscuela = txtCodEscuela.Text.Trim()
            };

            bool resultado = alumnoBL.Actualizar(alumno);
            lblMensaje.Text = alumnoBL.Mensaje;
            if (resultado)
                ListarAlumnos();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            DataTable dt = alumnoBL.Buscar(txtCodAlumno.Text);
            if (dt.Rows.Count > 0)
            {
                DataRow row = dt.Rows[0];
                txtAPaterno.Text = row["APaterno"].ToString();
                txtAMaterno.Text = row["AMaterno"].ToString();
                txtNombres.Text = row["Nombres"].ToString();
                txtCodUsuario.Text = row["CodUsuario"].ToString();
                txtCodEscuela.Text = row["CodEscuela"].ToString();
            }
            else
            {
                lblMensaje.Text = "Alumno no encontrado.";
            }
        }

        private void ListarAlumnos()
        {
            gvAlumno.DataSource = alumnoBL.Listar();
            gvAlumno.DataBind();
        }
    }
}