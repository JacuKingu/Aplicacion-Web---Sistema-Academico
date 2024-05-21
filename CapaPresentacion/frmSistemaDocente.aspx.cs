using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CapaPresentacion
{
    public partial class frmSistemaDocente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["TipoUsuario"] == null)
            {
                Response.Redirect("frmLogin");
            }
            else
            {
                lblDocente.Text = "Bienvenido docente: " + Session["CodUsuario"];
            }
        }

        protected void btnCerrar_Click(object sender, EventArgs e)
        {
            Session.Remove("CodUsuario");
            Session.Remove("TipoUsuario");
            Response.Redirect("frmLogin.aspx");
        }
    }
}