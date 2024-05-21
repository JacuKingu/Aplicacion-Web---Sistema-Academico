<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmSistemaAlumno.aspx.cs" Inherits="CapaPresentacion.frmSistemaAlumno" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Bienvenido Alumno al Sistema</h1>
    <asp:Label ID="lblAlumno" runat="server"></asp:Label>
    <asp:Button runat="server"  ID="btnCerrar" Text="Cerrar Sesion" OnClick="btnCerrar_Click"/>
</asp:Content>
