using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using CapaEntidad;
using CapaNegocio;

namespace CapaPresentacion
{
    public partial class frmLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            Usuario usuario = new Usuario();
            usuario.CodUsuario = Login1.UserName;
            usuario.Contrasena = Login1.Password;
            UsuarioBL usuarioBL = new UsuarioBL();
            if (usuarioBL.Login(usuario))
            {
                //Verificar si el usuairo es docente o alumno
                Session["TipoUsuario"] = usuarioBL.Mensaje;
                Session["CodUsuario"] = Login1.UserName;
                if(usuarioBL.Mensaje == "Alumno")
                {
                    Response.Redirect("frmSistemaALumno.aspx");
                }
                else if(usuarioBL.Mensaje == "Docente")
                {
                    Response.Redirect("frmSistemaDocente.aspx");
                }
                else if (usuarioBL.Mensaje == "Admin")
                {
                    Response.Redirect("frmAdmin.aspx");
                }
            }
            else
            {
                Login1.FailureText = usuarioBL.Mensaje;
            }
        }
    }
}