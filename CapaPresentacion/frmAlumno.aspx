<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmAlumno.aspx.cs" Inherits="CapaPresentacion.frmAlumno" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <h1 class="mt-5">Mantenimiento de la tabla Alumno</h1>
        <div class="mb-3">
            <label class="form-label">CodAlumno</label>
            <asp:TextBox runat="server" ID="txtCodAlumno" CssClass="form-control" />
        </div>
        <div class="mb-3">
            <label class="form-label">APaterno</label>
            <asp:TextBox runat="server" ID="txtAPaterno" CssClass="form-control" />
        </div>
        <div class="mb-3">
            <label class="form-label">AMaterno</label>
            <asp:TextBox runat="server" ID="txtAMaterno" CssClass="form-control" />
        </div>
        <div class="mb-3">
            <label class="form-label">Nombres</label>
            <asp:TextBox runat="server" ID="txtNombres" CssClass="form-control" />
        </div>
        <div class="mb-3">
            <label class="form-label">CodUsuario</label>
            <asp:TextBox runat="server" ID="txtCodUsuario" CssClass="form-control" />
        </div>
        <div class="mb-3">
            <label class="form-label">Contraseña</label>
            <asp:TextBox runat="server" ID="txtContrasena" TextMode="Password" CssClass="form-control" />
        </div>
        <div class="mb-3">
            <label class="form-label">Confirmar Contraseña</label>
            <asp:TextBox runat="server" ID="txtConfirmarContrasena" TextMode="Password" CssClass="form-control" />
        </div>
        
        <div class="mb-3">
            <label class="form-label">CodEscuela</label>
            <asp:TextBox runat="server" ID="txtCodEscuela" CssClass="form-control" />
        </div>
        <div class="mb-3">
            <asp:Button Text="Agregar" runat="server" Id="btnAgregar" CssClass="btn btn-primary" OnClick="btnAgregar_Click" OnClientClick="return confirmarGuardar();" />
            <asp:Button Text="Eliminar" runat="server" Id="btnEliminar" CssClass="btn btn-warning" OnClick="btnEliminar_Click" OnClientClick="return confirm('¿Está seguro de que desea eliminar este alumno?');"/>
            <asp:Button Text="Actualizar" runat="server" Id="btnActualizar" CssClass="btn btn-success" OnClick="btnActualizar_Click"/>
            <asp:Button Text="Buscar" runat="server" Id="btnBuscar" CssClass="btn btn-info" OnClick="btnBuscar_Click"/>
        </div>
        <div class="mb-3">
            <asp:GridView runat="server" ID="gvAlumno" CssClass="table table-striped table-bordered"></asp:GridView>
        </div>
        <div class="mb-3">
            <asp:Label Text="Mensaje" runat="server" ID="lblMensaje" CssClass="text-info"/>
        </div>
    </div>
    <script type="text/javascript">
        function confirmarGuardar() {
            var contrasena = document.getElementById('<%= txtContrasena.ClientID %>').value;
        var confirmacion = document.getElementById('<%= txtConfirmarContrasena.ClientID %>').value;
            if (contrasena !== confirmacion) {
                alert('Las contraseñas no coinciden. Por favor, verifique.');
                return false; // Evita que se envíe el formulario si las contraseñas no coinciden
            }
            return confirm('¿Está seguro de que desea guardar?');
        }
    </script>
</asp:Content>
