<%@ Page Title="" Language="C#" MasterPageFile="~/Mains.Master" AutoEventWireup="true" CodeBehind="ItemReport.aspx.cs" Inherits="PAWA.Reports.ItemReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <link href="../css/Cs.css" rel="stylesheet" />
    <h1 class="h1">Item Report</h1>
    <br />
    <table align="center">
    <tr>
    <td>
    <asp:Label ID="LblItemId" runat="server" CssClass="Label" Text="ItemId"></asp:Label>
    <asp:TextBox ID="TxtItemId" runat="server" AutoPostBack="True" OnTextChanged="TxtItemId_TextChanged"  ></asp:TextBox>
    </td>
    </tr>
     <tr>
     <td>
      <asp:Button ID="BtnGenerate" CssClass="Button" runat="server" Text="GenerateReport" OnClick="BtnGenerate_Click"/>
      <asp:GridView ID="GvItem" CssClass="Gridview"  runat="server">
      <Columns><asp:ImageField DataAlternateTextField="FileName" DataImageUrlField="FileName" DataImageUrlFormatString="~/Files/{0}" HeaderText="Image Field"><ControlStyle Height="100px" Width="100px" /></asp:ImageField></Columns>
      </asp:GridView>
      </td>
      </tr>
     </table>
</asp:Content>
