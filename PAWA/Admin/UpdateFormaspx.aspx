<%@ Page Title="" Language="C#" MasterPageFile="~/Mains.Master" AutoEventWireup="true" CodeBehind="UpdateFormaspx.aspx.cs" Inherits="PAWA.Admin.UpdateFormaspx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<link href="../css/Controls.css" rel="stylesheet" />
<h1 class="h1" >Registration Form</h1>
<table align="center">
 <tr>
 <td><asp:Label ID="LblUserId"  CssClass="Label" runat="server" Text="UserId" Width="150px"></asp:Label></td>
 <td><asp:TextBox ID="txtUserId" CssClass="Textbox" runat="server"></asp:TextBox></td>                  
 </tr>
  <tr>
  <td><asp:Label ID="LblName" CssClass="Label" runat="server" Text="Name" Width="150px"></asp:Label></td>
  <td><asp:TextBox ID="txtName" runat="server" CssClass="Textbox"></asp:TextBox></td>
  <td><asp:RequiredFieldValidator ID="Req2" runat="server" ErrorMessage="Name is Mandatory" ControlToValidate="txtName" ForeColor="Red"></asp:RequiredFieldValidator></td>
  </tr>
   <tr>
   <td><asp:Label ID="LblPassword" CssClass="Label" runat="server" Text="Password" Width="150px"></asp:Label></td>
   <td><asp:TextBox ID="txtPassword" runat="server" CssClass="Textbox" TextMode="Password"></asp:TextBox></td>
   <td><asp:RequiredFieldValidator ID="Req3" runat="server" ErrorMessage="Password is Mandatory" ControlToValidate="txtPassword" ForeColor="Red"></asp:RequiredFieldValidator></td>
   </tr>
   <tr>
   <td><asp:Label ID="Lblcpassword" CssClass="Label" runat="server" Text="CPassword" Width="150px"></asp:Label></td>
   <td><asp:TextBox ID="txtCPassword" runat="server" CssClass="Textbox" TextMode="Password"></asp:TextBox></td>
   <td><asp:RequiredFieldValidator ID="Req4" runat="server" ErrorMessage=" Confirm Password " ControlToValidate="txtPassword" ForeColor="Red"></asp:RequiredFieldValidator></td>
   <td><asp:CompareValidator ID="Req7" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtCPassword" ErrorMessage="Cpassword should match with Password" ForeColor="Red"></asp:CompareValidator></td>
   </tr>
    <tr>
    <td><asp:Label ID="LblMobilenumber" CssClass="Label" runat="server" Text="MobileNumber" Width="150px"></asp:Label></td>
    <td><asp:TextBox ID="txtMobileNumber" runat="server"  CssClass="Textbox"></asp:TextBox></td>
    <td><asp:RegularExpressionValidator ID="Reg2" runat="server" ControlToValidate="txtMobileNumber" ErrorMessage="Enter Valid Mobile Number"  ValidationExpression="[0-9]{10}" ForeColor="Red"></asp:RegularExpressionValidator></td> 
    </tr>
     <tr>
     <td><asp:Label ID="LblEmailId"  CssClass="Label" runat="server" Text="E-mail Id" Width="150px"></asp:Label></td>
     <td><asp:TextBox ID="txtEmailId" runat="server" CssClass="Textbox"></asp:TextBox></td>
     <td><asp:RegularExpressionValidator ID="Reg1" runat="server" ControlToValidate="txtEmailId" ErrorMessage="Valid Email Id is mandatory" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red"></asp:RegularExpressionValidator></td>
     </tr>
      <tr>           
      <td><asp:Label ID="LblRole" runat="server" CssClass="Label" Text="Role" Width="150px"></asp:Label></td>
      <td><asp:DropDownList ID="DdlRole" CssClass="Dropdown" runat="server"></asp:DropDownList></td>          
      </tr>
       <tr>
       <td><asp:Label ID="LblIsActive" CssClass="Label" runat="server" Text="IsActive" Width="150px"></asp:Label></td>
       <td><asp:Checkbox ID="chkIsActive" CssClass="Checkbox" runat="server"  Width="200px" Text="Yes\No"></asp:Checkbox></td>
       <td><asp:Label ID="LblMessage" CssClass="Label" runat="server" Text="LblMessage"></asp:Label></td>
       </tr>
       <tr align="center">
        <td colspan="2">
        <asp:Button ID="BtnNew" CssClass="Button" runat="server" Text="New"  Width="200px" OnClick="BtnNew_Click"></asp:Button>
        <asp:Button ID="BtnUpdate" CssClass="Button"  runat="server" Text="Update" Width="200px" OnClick="BtnUpdate_Click"></asp:Button>
        <asp:Button ID="BtnDelete" CssClass="Button"  runat="server" Text="Delete" Width="200px" OnClick="BtnDelete_Click"></asp:Button>
        </td>
        </tr> 
        </table>
     <table align="center">
         <tr>
         <td><asp:GridView ID="GvReg" CssClass="Gridview" runat="server" OnSelectedIndexChanged="GvReg_SelectedIndexChanged">
             <Columns><asp:CommandField ShowSelectButton="True" /></Columns></asp:GridView>
         </td>
         </tr>    
      </table>
</asp:Content>
