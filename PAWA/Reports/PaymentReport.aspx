<%@ Page Title="" Language="C#" MasterPageFile="~/Mains.Master" AutoEventWireup="true" CodeBehind="PaymentReport.aspx.cs" Inherits="PAWA.Reports.PaymentReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../css/Cs.css" rel="stylesheet" />
    <h1 class="h1">Payment Report</h1>
    <br />
    <table align="center">
      <tr>
      <td>
      <asp:Label ID="LblPaymentId" runat="server" CssClass="Label" Text="PaymentId"></asp:Label>
      <asp:TextBox ID="TxtPaymentId" runat="server" AutoPostBack="True" OnTextChanged="TxtPaymentId_TextChanged" ></asp:TextBox>
      </td>
      </tr>
      <tr>
       <td>
       <asp:Button ID="BtnGenerate" CssClass="Button" runat="server" Text="GenerateReport" OnClick="BtnGenerate_Click"  />
       </td>
       </tr>
        <tr>
        <td>
        <asp:GridView ID="GvPayment" CssClass="Gridview"  runat="server"></asp:GridView>
        </td>
        </tr>
       </table>
</asp:Content>
