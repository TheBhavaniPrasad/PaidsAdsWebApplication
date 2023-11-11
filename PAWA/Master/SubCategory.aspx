<%@ Page Title="" Language="C#" MasterPageFile="~/Mains.Master" AutoEventWireup="true" CodeBehind="SubCategory.aspx.cs" Inherits="PAWA.Master.SubCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../css/Controls.css" rel="stylesheet" />
    <h1 class="h1">SubCategoryDetails</h1>
    <table align="center">
    <tr>
    <td><asp:Label ID="LblCategoryId" runat="server" CssClass="Label" Text="CategoryId"></asp:Label></td>
    <td><asp:DropDownList ID="DdlCategory" cssClass="Dropdown" runat="server"></asp:DropDownList></td>  
    </tr>
    <tr>
    <td><asp:Label ID="LblSubCategory" CssClass="Label" runat="server" Text="SubCategoryId"></asp:Label></td>
    <td><asp:TextBox ID="TxtSubCategoryId" CssClass="Textbox" runat="server"></asp:TextBox></td>   
    </tr>
    <tr>
    <td><asp:Label ID="LblSubCategoryName" CssClass="Label" runat="server" Text="SubCategoryName"></asp:Label></td>
    <td><asp:TextBox ID="TxtSubCategoryName" CssClass="Textbox" runat="server"></asp:TextBox></td>
    <td><asp:RequiredFieldValidator ID="ReqSname" runat="server" ControlToValidate="TxtSubCategoryName" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator></td>    
    </tr>
    <tr>
    <td><asp:Label ID="LblIsActive" runat="server" CssClass="Label" Text="IsActive"></asp:Label></td>
    <td><asp:CheckBox ID="ChkIsActive" CssClass="Checkbox" runat="server" /></td>  
    </tr>
    <tr>
    <td><asp:Label ID="Message" CssClass="Label" runat="server"></asp:Label></td>
    </tr>
    <tr align="center">
    <td>
    <asp:Button ID="BtnNew" CssClass="Button" runat="server" Text="New" Width="100px" OnClick="BtnNew_Click"  />
    <asp:Button ID="BtnSave" CssClass="Button" runat="server" Text="Save" Width="100px" OnClick="BtnSave_Click"  />
    <asp:Button ID="BtnUpdate" CssClass="Button" runat="server" Text="Update" Width="100px" OnClick="BtnUpdate_Click" />
    <asp:Button ID="BtnDelete" CssClass="Button" runat="server" Text="Delete" Width="100px" OnClick="BtnDelete_Click"  />
    </td>
    </tr>
    <tr align="center">
     <td>
     <asp:GridView ID="GvSubCategory" CssClass="Gridview" runat="server" OnSelectedIndexChanged="GvSubCategory_SelectedIndexChanged">
     <Columns><asp:CommandField ShowSelectButton="True" /></Columns></asp:GridView>
     </td>
     </tr>
        <tr><td><br /></td></tr>
     </table>
</asp:Content>
