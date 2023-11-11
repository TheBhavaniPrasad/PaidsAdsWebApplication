<%@ Page Title="" Language="C#" MasterPageFile="~/Mains.Master" AutoEventWireup="true" CodeBehind="AdBookingReport.aspx.cs" Inherits="PAWA.Reports.AdBookingReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <link href="../css/Cs.css" rel="stylesheet" />
   <h1 class="h1">AdBooking Report</h1>
    <br />
    <table align="center">
     <tr>
     <td><asp:Label ID="LblBookingId" runat="server" CssClass="Label" Text="BookingId"></asp:Label>
     <asp:TextBox ID="TxtBookingId" runat="server" AutoPostBack="True" OnTextChanged="TxtBookingId_TextChanged" ></asp:TextBox></td>
     </tr>  
     <tr>
     <td><asp:Button ID="BtnGenerate" CssClass="Button" runat="server" Text="GenerateReport" OnClick="BtnGenerate_Click" /></td>
     </tr>
     <tr align="center">
     <td><asp:GridView ID="GvBooking" CssClass="Gridview" runat="server"></asp:GridView></td>
     </tr>
     </table>
</asp:Content>
