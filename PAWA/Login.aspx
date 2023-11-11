<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PAWA.Login" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../CSS/Style.css" rel="stylesheet" />
    <title></title>
     <style>
@import url('https://fonts.googleapis.com/css?family=Anton|Boogaloo|Passion+One|Righteous');
</style>
</head>
<body>
    <header class="h1">PAID ADS WEB APPLICATION</header>
    <form id="form1" runat="server">
            <section>
           <img src="Images/new6.jpg" class="animated fadeInUpBig" alt="" />
        <div class="container">
            <div class="inner animated fadeInDown">
                 <asp:Label ID="lbllogin" runat="server" Text="Login"></asp:Label><br />
                <asp:Label ID="lblUserName" CssClass="lbl1 lblstyle" runat="server" Text="User name"></asp:Label><br />
                <asp:TextBox ID="txtUserName" CssClass="txtstyle" placeholder="Enter UserName" runat="server"></asp:TextBox><br />
                <asp:RegularExpressionValidator ID="Reg1" runat="server" ErrorMessage="Enter username Correctly" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtUserName"></asp:RegularExpressionValidator>
                <br />
                <asp:Label ID="lblPassword" runat="server" CssClass="lbl2 lblstyle" Text="Password"></asp:Label><br />
                <asp:TextBox ID="txtPassword" TextMode="Password" CssClass="txtstyle" placeholder="Enter Password" runat="server"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="Req1" runat="server" ErrorMessage="Password is mandatory" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                <br />
                <br />
                 <asp:label ID="Message" runat="server" font-color="red" BackColor="White" ForeColor="Red"></asp:label>
                <br />
                <br />
                <asp:Button ID="BtnLogin" runat="server" Text="Login" OnClick="BtnLogin_Click1" />
                <br />
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Registration.aspx">NewUser!Click here</asp:HyperLink>
            </div>
            </div>
                </section>
    </form>
</body>
</html>
