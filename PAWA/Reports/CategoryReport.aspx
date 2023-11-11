<%@ Page Title="" Language="C#" MasterPageFile="~/Mains.Master" AutoEventWireup="true" CodeBehind="CategoryReport.aspx.cs" Inherits="PAWA.Reports.CategoryReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../css/Cs.css" rel="stylesheet" />
    <h1 class="h1">Category Report</h1>
    <br />
    <table align="center">
    <tr>
    <td>
    <asp:Label ID="LblCategoryId" runat="server" CssClass="Label" Text="CategoryName"></asp:Label>
    <asp:TextBox ID="txtCategoryId" runat="server" AutoPostBack="True" OnTextChanged="txtCategoryId_TextChanged" ></asp:TextBox>
     </td>
     </tr>
     <tr>
     <td>
     <asp:Button ID="BtnGenerate" CssClass="Button" runat="server" Text="GenerateReport" OnClick="BtnGenerate_Click" />
     </td>
     </tr>
      <tr align="center">
      <td>
      <asp:GridView ID="GvCategory" CssClass="Gridview"  runat="server"></asp:GridView>
      </td>
      </tr>
      </table>
</asp:Content>
