<%@ Page Title="" Language="C#" MasterPageFile="~/Mains.Master" AutoEventWireup="true" CodeBehind="SubCategoryDetails.aspx.cs" Inherits="PAWA.Reports.SubCategoryDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../css/Cs.css" rel="stylesheet" />
    <h1 class="h1">SubCategory Report</h1>
    <br />
    <table align="center">
    <tr>
    <td>
    <asp:Label ID="LblSubCategoryId" runat="server" CssClass="Label" Text="SubCategoryId"></asp:Label>
    <asp:TextBox ID="txtSubCategoryId" runat="server" AutoPostBack="True" OnTextChanged="txtSubCategoryId_TextChanged" ></asp:TextBox>
    </td>
    </tr>
     <tr>
     <td>
     <asp:Button ID="BtnGenerate" CssClass="Button" runat="server" Text="GenerateReport" OnClick="BtnGenerate_Click" />
     </td>          
     </tr>
      <tr>
      <td>
      <asp:GridView ID="GvSubCategory" CssClass="Gridview"  runat="server"></asp:GridView>
      </td>
      </tr>
  </table>
</asp:Content>
