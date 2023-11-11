<%@ Page Title="" Language="C#" MasterPageFile="~/Mains.Master" AutoEventWireup="true" CodeBehind="UserReport.aspx.cs" Inherits="PAWA.Reports.UserReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../css/Cs.css" rel="stylesheet" />
    <h1 class="h1">User Report</h1>
    <br />
    <table align="center">
    <tr>
    <td>
    <asp:Label ID="LblUserId" runat="server" CssClass="Label" Text="UserId"></asp:Label>
    <asp:TextBox ID="txtUserId" runat="server" AutoPostBack="True" OnTextChanged="txtUserId_TextChanged" ></asp:TextBox>
    </td>
    </tr>
     <tr>
     <td>
     <asp:Button ID="BtnGenerate" CssClass="Button" runat="server" Text="GenerateReport" OnClick="BtnGenerate_Click"/>
     </td>
     </tr>
     <tr>
     <td>
     <asp:GridView ID="GvUser" CssClass="Gridview"  runat="server"></asp:GridView>
     </td> 
     </tr>   
    </table>
</asp:Content>
