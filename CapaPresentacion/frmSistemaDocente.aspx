<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmSistemaDocente.aspx.cs" Inherits="CapaPresentacion.frmSistemaDocente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Bienvenido Docente al Sistema</h1>
    <asp:Label ID="lblDocente" runat="server"></asp:Label>
    <asp:Button runat="server"  ID="btnCerrar" Text="Cerrar Sesion" OnClick="btnCerrar_Click"/>
</asp:Content>
