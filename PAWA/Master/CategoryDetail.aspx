<%@ Page Title="" Language="C#" MasterPageFile="~/Mains.Master" AutoEventWireup="true" CodeBehind="CategoryDetail.aspx.cs" Inherits="PAWA.Master.CategoryDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../css/Controls.css" rel="stylesheet" />
    <br />
    <h1 class="h1" >CategoryDetails</h1>
    <table align="center">
    <tr>
    <td><asp:Label ID="LblCategory" CssClass="Label" runat="server" Text="Category Id"></asp:Label></td>
    <td><asp:TextBox ID="TxtCategoryId" CssClass="Textbox" runat="server"></asp:TextBox></td>
    </tr>
     <tr>
     <td><asp:Label ID="LblCategoryName" CssClass="Label" runat="server" Text="CategoryName"></asp:Label></td>
     <td><asp:TextBox ID="TxtCategoryName" runat="server" CssClass="Textbox"></asp:TextBox></td>
     <td><asp:RequiredFieldValidator ID="Req2" runat="server" ErrorMessage="CategoryName is Mandatory" ControlToValidate="TxtCategoryName" ForeColor="Red"></asp:RequiredFieldValidator></td>  
     </tr>
      <tr>
      <td><asp:Label ID="LblIsActive" runat="server" CssClass="Label" Text="IsActive"></asp:Label></td>
      <td><asp:CheckBox ID="ChkIsActive" CssClass="Checkbox" runat="server" /></td>
      <td><asp:Label ID="Message" CssClass="Label" runat="server" ></asp:Label></td>
      </tr>
      <tr align="center">
      <td>
      <asp:Button ID="BtnNew" CssClass="Button" runat="server" Text="New" Width="100px" OnClick="BtnNew_Click" />
      <asp:Button ID="BtnSave" CssClass="Button" runat="server" Text="Save" Width="100px" OnClick="BtnSave_Click" />
      <asp:Button ID="BtnUpdate" CssClass="Button" runat="server" Text="Update" Width="100px" OnClick="BtnUpdate_Click" />
      <asp:Button ID="BtnDelete" CssClass="Button" runat="server" Text="Delete" Width="100px" OnClick="BtnDelete_Click" />
      </td>
      </tr>
       <tr align="center">
       <td>
       <asp:GridView ID="GvCategory" CssClass="Gridview" runat="server" OnSelectedIndexChanged="GvCategory_SelectedIndexChanged">
       <Columns><asp:CommandField ShowSelectButton="True" /></Columns>
       </asp:GridView>
       </td>
       </tr>
       </table>
</asp:Content>
