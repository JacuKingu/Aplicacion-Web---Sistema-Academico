using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using CapaEntidad;
using CapaNegocio;

namespace CapaPresentacion
{
    public partial class frmDocente : System.Web.UI.Page
    {
        DocenteBL docenteBL = new DocenteBL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ListarDocentes();
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


            Docente docente = new Docente
            {
                CodDocente = txtCodDocente.Text.Trim(),
                APaterno = txtAPaterno.Text.Trim(),
                AMaterno = txtAMaterno.Text.Trim(),
                Nombres = txtNombres.Text.Trim(),
                CodUsuario = txtCodUsuario.Text.Trim(),
                Contrasena = contrasena
            };

            bool resultado = docenteBL.Agregar(docente);
            lblMensaje.Text = docenteBL.Mensaje;
            if (resultado)
                ListarDocentes();
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            bool resultado = docenteBL.Eliminar(txtCodDocente.Text);
            lblMensaje.Text = docenteBL.Mensaje;
            if (resultado)
                ListarDocentes();
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            Docente docente = new Docente
            {
                CodDocente = txtCodDocente.Text.Trim(),
                APaterno = txtAPaterno.Text.Trim(),
                AMaterno = txtAMaterno.Text.Trim(),
                Nombres = txtNombres.Text.Trim(),
                CodUsuario = txtCodUsuario.Text.Trim(),
                Contrasena = txtContrasena.Text.Trim()
            };

            bool resultado = docenteBL.Actualizar(docente);
            lblMensaje.Text = docenteBL.Mensaje;
            if (resultado)
                ListarDocentes();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            DataTable dt = docenteBL.Buscar(txtCodDocente.Text);
            if (dt.Rows.Count > 0)
            {
                DataRow row = dt.Rows[0];
                txtAPaterno.Text = row["APaterno"].ToString();
                txtAMaterno.Text = row["AMaterno"].ToString();
                txtNombres.Text = row["Nombres"].ToString();
                txtCodUsuario.Text = row["CodUsuario"].ToString();
            }
            else
            {
                lblMensaje.Text = "Docente no encontrado.";
            }
        }

        private void ListarDocentes()
        {
            gvDocente.DataSource = docenteBL.Listar();
            gvDocente.DataBind();
        }
    }
}