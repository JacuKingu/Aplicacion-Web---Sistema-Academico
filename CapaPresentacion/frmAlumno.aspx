<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmAlumno.aspx.cs" Inherits="CapaPresentacion.frmAlumno" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <h1 class="mt-5">Mantenimiento de la tabla Alumno</h1>
        <div class="mb-3">
            <label class="form-label">CodAlumno</label>
            <asp:TextBox runat="server" ID="txtCodAlumno" CssClass="form-control w-50" />
            <asp:RequiredFieldValidator ID="rfvCodAlumnoEliminar" runat="server" ErrorMessage="CodAlumno Obligatorio Eliminar" ValidationGroup="Eliminar" ControlToValidate="txtCodAlumno"></asp:RequiredFieldValidator> 
            <asp:RequiredFieldValidator ID="rfvCodAlumno" runat="server" ErrorMessage="CodAlumno Obligatorio" ValidationGroup="Agregar" ControlToValidate="txtCodAlumno"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="rfvCodAlumnoBuscar" runat="server" ControlToValidate="txtCodAlumno" ErrorMessage="CodAlumno obligatorio para buscar" ValidationGroup="Buscar"></asp:RequiredFieldValidator>
        </div>
        <div class="mb-3">
            <label class="form-label">APaterno</label>
            <asp:TextBox runat="server" ID="txtAPaterno" CssClass="form-control w-50" />
            <asp:RequiredFieldValidator ID="rfvAPaterno" runat="server" ErrorMessage="APaterno Obligatorio" ControlToValidate="txtAPaterno" ValidationGroup="Agregar"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="rfvAPaternoActualizar" runat="server" ErrorMessage="APaterno Obligatorio" ControlToValidate="txtAPaterno" ValidationGroup="Actualizar"></asp:RequiredFieldValidator>
        </div>
        <div class="mb-3">
            <label class="form-label">AMaterno</label>
            <asp:TextBox runat="server" ID="txtAMaterno" CssClass="form-control w-50" />
            <asp:RequiredFieldValidator ID="rfvAMaterno" runat="server" ErrorMessage="AMaterno Obligatorio" ControlToValidate="txtAMaterno" ValidationGroup="Agregar"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="rfvAMaternoActualizar" runat="server" ErrorMessage="AMaterno Obligatorio" ControlToValidate="txtAMaterno" ValidationGroup="Actualizar"></asp:RequiredFieldValidator>
        </div>
        <div class="mb-3">
            <label class="form-label">Nombres</label>
            <asp:TextBox runat="server" ID="txtNombres" CssClass="form-control w-50" />
            <asp:RequiredFieldValidator ID="rfvNombres" runat="server" ControlToValidate="txtNombres" ErrorMessage="Nombre Obligatorio" ValidationGroup="Agregar"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="rfvNombresActualizar" runat="server" ControlToValidate="txtNombres" ErrorMessage="Nombre Obligatorio" ValidationGroup="Actualizar"></asp:RequiredFieldValidator>
        </div>
        <div class="mb-3">
            <label class="form-label">CodUsuario</label>
            <asp:TextBox runat="server" ID="txtCodUsuario" CssClass="form-control w-50" />
            <asp:RequiredFieldValidator ID="rfvCodUsuario" runat="server" ControlToValidate="txtCodUsuario" ErrorMessage="CodUsuario Obligatorio" ValidationGroup="Agregar"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="rfvCodUsuarioActaulizar" runat="server" ControlToValidate="txtCodUsuario" ErrorMessage="CodUsuario Obligatorio" ValidationGroup="Actualizar"></asp:RequiredFieldValidator>
        </div>
        </div>
        <div class="mb-3">
            <label class="form-label">Contraseña</label>
            <asp:TextBox runat="server" ID="txtContrasena" TextMode="Password" CssClass="form-control w-50" />
            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtContrasena" ErrorMessage="Password Obligatorio" ValidationGroup="Agregar"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="rfvPasswordActualizar" runat="server" ControlToValidate="txtContrasena" ErrorMessage="Password Obligatorio" ValidationGroup="Actualizar"></asp:RequiredFieldValidator>
        </div>
        <div class="mb-3">
            <label class="form-label">Confirmar Contraseña</label>
            <asp:TextBox runat="server" ID="txtConfirmarContrasena" TextMode="Password" CssClass="form-control w-50" />
            <asp:RequiredFieldValidator ID="rfvConfPassword" runat="server" ControlToValidate="txtConfirmarContrasena" ErrorMessage="Confirmar Password Obligatorio" ValidationGroup="Agregar"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="rfvConfPasswordActualizar" runat="server" ControlToValidate="txtConfirmarContrasena" ErrorMessage="Confirmar Password Obligatorio" ValidationGroup="Actualizar"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cvPassword" runat="server" ControlToCompare="txtContrasena" ControlToValidate="txtConfirmarContrasena" ErrorMessage="Se debe repetir la misma contraseña" ValidationGroup="Agregar"></asp:CompareValidator>
        </div>
        
        <div class="mb-3">
            <label class="form-label">CodEscuela</label>
            <asp:TextBox runat="server" ID="txtCodEscuela" CssClass="form-control w-50" />
            <asp:RequiredFieldValidator ID="rfvCodEscuela" runat="server" ControlToValidate="txtCodEscuela" ErrorMessage="CodEscuela Obligatorio" ValidationGroup="Agregar"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="rfvCodEscuelaActualizar" runat="server" ControlToValidate="txtCodEscuela" ErrorMessage="CodEscuela Obligatorio" ValidationGroup="Actualizar"></asp:RequiredFieldValidator>
        </div>
        <div class="mb-3">
            <asp:Button Text="Agregar" runat="server" Id="btnAgregar" CssClass="btn btn-primary" OnClick="btnAgregar_Click" OnClientClick="return confirmarGuardar();" ValidationGroup="Agregar" />
            <asp:Button Text="Eliminar" runat="server" Id="btnEliminar" CssClass="btn btn-warning" OnClick="btnEliminar_Click" OnClientClick="return confirm('¿Está seguro de que desea eliminar este alumno?');" ValidationGroup="Eliminar"/>
            <asp:Button Text="Actualizar" runat="server" Id="btnActualizar" CssClass="btn btn-success" OnClick="btnActualizar_Click" ValidationGroup="Actualizar"/>
            <asp:Button Text="Buscar" runat="server" Id="btnBuscar" CssClass="btn btn-info" OnClick="btnBuscar_Click"/>
            <asp:ValidationSummary ID="vsAgregar" runat="server" ValidationGroup="Agregar" ForeColor="Red" />
            <asp:ValidationSummary ID="vsBuscar" runat="server" ValidationGroup="Buscar" ForeColor="Red" />
            <asp:ValidationSummary ID="vsEliminar" runat="server" ValidationGroup="Eliminar" ForeColor="Red" />
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="Actualizar" ForeColor="Red" />
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
            var contrasena = document.getElementById('<%= txtContrasena.ClientID%>').value;
        var confirmacion = document.getElementById('<%= txtConfirmarContrasena.ClientID %>').value;
            if (contrasena !== confirmacion) {
                alert('Las contraseñas no coinciden. Por favor, verifique.');
                return false; // Evita que se envíe el formulario si las contraseñas no coinciden
            }
            return confirm('¿Está seguro de que desea guardar?');
        }
    </script>
</asp:Content>
