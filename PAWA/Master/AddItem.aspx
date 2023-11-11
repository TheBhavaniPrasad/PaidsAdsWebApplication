<%@ Page Title="" Language="C#" MasterPageFile="~/Mains.Master" AutoEventWireup="true" CodeBehind="AddItem.aspx.cs" Inherits="PAWA.Master.AddItem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../css/Controls.css" rel="stylesheet" />
    <h1 class="h1">ADD ITEM</h1>
    <table align="center">
     <tr>
     <td><asp:Label ID= "LblItemNo" CssClass="Label" runat="server" Text="Item No"></asp:Label></td>
     <td><asp:TextBox ID="txtItemNo" runat="server" CssClass="Textbox"></asp:TextBox></td>
     </tr>
     <tr>
     <td><asp:Label ID="LblCategoryId" CssClass="Label" runat="server" Text="CategoryId"></asp:Label></td>
     <td><asp:DropDownList ID="DdlCategoryId" CssClass="Dropdown" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DdlCategoryId_SelectedIndexChanged"></asp:DropDownList></td>       
     </tr>
      <tr>
      <td><asp:Label ID="LblSubCategoryId" CssClass="Label" runat="server" Text="SubCategoryId"></asp:Label></td>
      <td><asp:DropDownList ID="DdlSubCategoryId" CssClass="Dropdown" runat="server" AutoPostBack="True" ></asp:DropDownList></td>
      </tr>
      <tr>
      <td><asp:Label ID="LblItemName" CssClass="Label" runat="server" Text="ItemName"></asp:Label></td>
      <td><asp:TextBox ID="txtItemName" runat="server" CssClass="Textbox"></asp:TextBox></td>
      <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtItemName" ErrorMessage="ItemName is Mandatory" ForeColor="Red"></asp:RequiredFieldValidator></td>
      </tr>
       <tr>
       <td><asp:Label ID="LblImageUpload" CssClass="Label" runat="server" Text="UploadImage"></asp:Label></td>
       <td><asp:FileUpload ID="FileUpload1" CssClass="Linkbutton" runat="server" /></td>
       <td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="FileUpload1" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator></td>
       </tr>
       <tr>
       <td><asp:Label ID="LblItemPrice" CssClass="Label" runat="server" Text="ItemPrice"></asp:Label></td>
       <td><asp:TextBox ID="txtItemPrice" runat="server" CssClass="Textbox"></asp:TextBox></td>
       <td><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtItemPrice" ErrorMessage="Please enter price" ForeColor="Red"></asp:RequiredFieldValidator></td>           
       </tr>
       <tr>
       <td><asp:Label ID="LblIsActive" CssClass="Label" runat="server" Text="IsActive"></asp:Label></td>
       <td><asp:CheckBox ID="ChkIsactive" CssClass="Checkbox" runat="server" /></td>  
       </tr>
        <tr align="center">
        <td>
        <asp:Button ID="BtnNew" CssClass="Button" runat="server" Text="New" Width="150px" OnClick="BtnNew_Click" />
        <asp:Button ID="BtnSave" CssClass="Button" runat="server" Text="Save" Width="150px" OnClick="BtnSave_Click" />
        <asp:Button ID="BtnUpdate" CssClass="Button" runat="server" Text="Update" Width="150px" OnClick="BtnUpdate_Click" />
        <asp:Button ID="BtnDelete" CssClass="Button" runat="server" Text="Delete" Width="150px" OnClick="BtnDelete_Click"  />
        </td>
        </tr>
        <tr>
        <td>
        <asp:Label ID="LblMessage" CssClass="Label" runat="server" Text="Message"></asp:Label>
        </td>
        </tr>
         <tr>
         <td>
         <asp:GridView ID="GridView1" CssClass="Gridview"  runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" >
         <Columns>
         <asp:ImageField DataAlternateTextField="FileName" DataImageUrlFormatString="~/Files/{0}" ControlStyle-Height="100px" ControlStyle-Width="100px" DataImageUrlField="FileName" HeaderText="Image Field">
         <ControlStyle Height="100px" Width="100px"></ControlStyle>
         </asp:ImageField>
         <asp:CommandField ShowSelectButton="True" />
         </Columns>
         </asp:GridView>
         </td>
         </tr>      
    </table>
</asp:Content>
 
