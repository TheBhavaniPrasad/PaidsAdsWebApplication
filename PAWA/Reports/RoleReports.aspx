<%@ Page Title="" Language="C#" MasterPageFile="~/Mains.Master" AutoEventWireup="true" CodeBehind="RoleReports.aspx.cs" Inherits="PAWA.Reports.ClientReports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../css/Cs.css" rel="stylesheet" />
    <h1 class="h1">Roles Report</h1>
    <br />
    <table align="center">
    <tr>
    <td>
    <asp:Label ID="LblRoleId" runat="server" CssClass="Label" Text="RoleId"></asp:Label>
    <asp:TextBox ID="txtRoleId" runat="server" OnTextChanged="txtRoleId_TextChanged" AutoPostBack="True" ></asp:TextBox>
     </td>
     </tr>
      <tr>
      <td>
      <asp:Button ID="BtnGenerate" CssClass="Button" runat="server" Text="GenerateReport" OnClick="BtnGenerate_Click" />
      </td>
       <tr>  
       <td>
       <asp:GridView ID="GvReport" CssClass="Gridview"  runat="server"></asp:GridView>
       </td>
       </tr>
       </table>
</asp:Content>
