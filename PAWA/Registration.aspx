<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="PAWA.Registration" %>
<!DOCTYPE html>
    <link href="MainPage.css" rel="stylesheet" />
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
    <title></title>
    <link href="css/Cs.css" rel="stylesheet" />
    </head>
    <body>
    <form id="form1" runat="server">
    <h1 class="h1">Registration</h1>
    <table align="center">
    <tr>
    <td><asp:Label ID="LblUserId" CssClass="Label" runat="server" Text="UserId"></asp:Label></td>
    <td><asp:TextBox ID="txtUserId" runat="server"></asp:TextBox></td>                  
    </tr>
     <tr>
     <td><asp:Label ID="LblName" CssClass="Label" runat="server" Text="Name"></asp:Label></td>
     <td><asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
     <td><asp:RequiredFieldValidator ID="Req2" runat="server" ErrorMessage="Name is Mandatory" ControlToValidate="txtName" ForeColor="Red"></asp:RequiredFieldValidator></td>
     </tr>
      <tr>
      <td><asp:Label ID="LblPassword" runat="server" CssClass="Label" Text="Password"></asp:Label></td>
      <td><asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox></td>
      <td><asp:RequiredFieldValidator ID="Req3" runat="server" ErrorMessage="Password is Mandatory" ControlToValidate="txtPassword" ForeColor="Red"></asp:RequiredFieldValidator></td>
      </tr>
      <tr>
       <td><asp:Label ID="Lblcpassword" runat="server" CssClass="Label" Text="CPassword"></asp:Label></td>
       <td><asp:TextBox ID="txtCPassword" runat="server" TextMode="Password" ></asp:TextBox></td>
       <td><asp:RequiredFieldValidator ID="Req4" runat="server" ErrorMessage=" Confirm Password " ControlToValidate="txtPassword" ForeColor="Red"></asp:RequiredFieldValidator></td>
       <td><asp:CompareValidator ID="Req7" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtCPassword" ErrorMessage="Cpassword should match with Password" ForeColor="Red"></asp:CompareValidator></td>
       </tr>
        <tr>
        <td><asp:Label ID="LblMobilenumber" CssClass="Label" runat="server" Text="MobileNumber"></asp:Label></td>
        <td><asp:TextBox ID="txtMobileNumber" runat="server"></asp:TextBox></td>
        <td><asp:RegularExpressionValidator ID="Reg2" runat="server" ControlToValidate="txtMobileNumber" ErrorMessage="Enter Valid Mobile Number"  ValidationExpression="[0-9]{10}" ForeColor="Red"></asp:RegularExpressionValidator></td>
        </tr>
         <tr>
         <td><asp:Label ID="LblEmailId" CssClass="Label" runat="server" Text="E-mail Id"></asp:Label></td>
         <td><asp:TextBox ID="txtEmailId" runat="server" ></asp:TextBox></td>
         <td><asp:RegularExpressionValidator ID="Reg1" runat="server" ControlToValidate="txtEmailId" ErrorMessage="Valid Email Id is mandatory" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red"></asp:RegularExpressionValidator></td>
         </tr>
          <tr>
          <td><asp:Label ID="LblRole" CssClass="Label" runat="server" Text="Role"></asp:Label></td>
          <td><asp:DropDownList ID="DdlRole" CssClass=" Dropdown" runat="server"> </asp:DropDownList></td>
          </tr> 
          <tr>
          <td><asp:Label ID="LblIsActive" runat="server" CssClass="Label" Text="IsActive"></asp:Label></td>
          <td><asp:Checkbox ID="chkIsActive" CssClass="Checkbox" runat="server" Text="Yes\No"></asp:Checkbox></td>
          </tr>
          <tr><td><asp:Label ID="LblMessage" CssClass="Label" runat="server" Text="LblMessage"></asp:Label></td></tr>  
          <tr align="center">
           <td >
           <asp:Button ID="BtnNew" runat="server" CssClass="Button" Text="New" OnClick="BtnNew_Click" ></asp:Button>
           <asp:Button ID="BtnSignIn" runat="server" CssClass="Button" Text="SignIn" OnClick="BtnSignIn_Click" ></asp:Button>
           </td>
           </tr>  
           <tr>
           <td>
           <asp:GridView ID="GridUser" runat="server"></asp:GridView>
           </td>
           </tr>
           </table> 
</form>
</body>
</html>
