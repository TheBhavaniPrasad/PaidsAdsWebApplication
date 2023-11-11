<%@ Page Title="" Language="C#" MasterPageFile="~/Mains.Master" AutoEventWireup="true" CodeBehind="CustomerReport.aspx.cs" Inherits="PAWA.Reports.CustomerReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../css/Cs.css" rel="stylesheet" />
    <h1 class="h1">Customer Report</h1>
    <br />
    <table align="center">
    <tr>
    <td>
    <asp:Label ID="LblCustomerId" runat="server" CssClass="Label" Text="CustomerId"></asp:Label>
    <asp:TextBox ID="txtCustomerId" runat="server" AutoPostBack="True" OnTextChanged="txtCustomerId_TextChanged" ></asp:TextBox>
    </td>
    </tr>
    <tr>
    <td>
    <asp:Button ID="BtnGenerate" CssClass="Button" runat="server" Text="GenerateReport" OnClick="BtnGenerate_Click" />
    </td>
    </tr>
     <tr>
     <td>
     <asp:GridView ID="GvCustomer" CssClass="Gridview"  runat="server"></asp:GridView>
     </td>
     </tr>
  </table>
</asp:Content>
