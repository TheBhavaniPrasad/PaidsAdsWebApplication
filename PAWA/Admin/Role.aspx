<%@ Page Title="" Language="C#" MasterPageFile="~/Mains.Master" AutoEventWireup="true" CodeBehind="Role.aspx.cs" Inherits="PAWA.Admin.Role" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../css/Controls.css" rel="stylesheet" />
    <br />
    <h1 class="h1" >RoleMaster</h1>
    <table align="center">
    <tr>
    <td><asp:Label ID="lblRoleId" CssClass="Label" runat="server" Text="RoleId" Width="150px"></asp:Label></td>
    <td><asp:TextBox ID="txtRoleId" CssClass="Textbox" runat="server" Width="200px"></asp:TextBox></td>
    </tr>
    <tr>
    <td><asp:Label ID="lblRole" CssClass="Label" runat="server" Text="Role" Width="150px"></asp:Label></td>
    <td><asp:TextBox ID="TxtRole" CssClass="Textbox" runat="server"></asp:TextBox></td>
    <td><asp:RequiredFieldValidator ID="ReqRole" ControlToValidate="TxtRole" runat="server" ErrorMessage="Role is Mandatory"></asp:RequiredFieldValidator></td>  
    </tr>
    <tr>
    <td><asp:Label ID="lblIsActive" CssClass="Label" runat="server" Text="IsActive" Width="150px"></asp:Label></td>
    <td><asp:CheckBox ID="Chkboxisactive" runat="server" Text=" " CssClass="Checkbox" ForeColor="#3333FF"></asp:CheckBox></td>
    <td><asp:Label ID="LblMessage" CssClass="Label" runat="server" Text="LblMessage"></asp:Label></td>   
    </tr>
     <tr align="center">
      <td><asp:Button ID="BtnNew" runat="server" CssClass="Button" Text="New" Width="100px" OnClick="BtnNew_Click"></asp:Button>
      <asp:Button ID="BtnSave" runat="server" CssClass="Button" Text="Save" Width="100px" OnClick="BtnSave_Click"></asp:Button>
      <asp:Button ID="BtnUpdate" runat="server" CssClass="Button" Text="Update" Width="100px" OnClick="BtnUpdate_Click1"></asp:Button>
      <asp:Button ID="BtnDelete" runat="server" CssClass="Button" Text="Delete" Width="100px" OnClick="BtnDelete_Click"></asp:Button></td>
      </tr>
      <tr align="center">
      <td><asp:GridView ID="GvUserList" CssClass="Gridview" runat="server" OnSelectedIndexChanged="GvUserList_SelectedIndexChanged1">
          <Columns><asp:CommandField /><asp:CommandField ShowSelectButton="True" /></Columns>
          </asp:GridView></td>
      </tr>
    </table>
    </asp:Content>

