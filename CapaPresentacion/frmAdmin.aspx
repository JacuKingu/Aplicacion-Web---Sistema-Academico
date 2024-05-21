<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmAdmin.aspx.cs" Inherits="CapaPresentacion.frmAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>BIENVENIDO ANONYMOUS - ADMIN</h1>
    <asp:Label ID="lblAdmin" runat="server"></asp:Label>
    <asp:Button runat="server"  ID="btnCerrar" Text="Cerrar Sesion" OnClick="btnCerrar_Click"/>
</asp:Content>
