<%@ Page Title="" Language="C#" MasterPageFile="~/Mains.Master" AutoEventWireup="true" CodeBehind="CustDetails.aspx.cs" Inherits="PAWA.Master.UserDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <link href="../css/Controls.css" rel="stylesheet" />
        <h1 class="h1">Customer Details</h1>
        <table align="center">
        <tr>
        <td><asp:Label ID="LblCustId"  CssClass="Label" runat="server" Text="CustomerId"></asp:Label></td>
        <td><asp:TextBox ID="txtCustId"  CssClass="Textbox" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
        <td><asp:Label ID="LblCustName" CssClass="Label" runat="server" Text="CustomerName"></asp:Label></td>
        <td><asp:TextBox ID="txtCustName"  CssClass="Textbox" runat="server"></asp:TextBox></td>
        <td><asp:RequiredFieldValidator ID="Req1" runat="server" ControlToValidate="txtCustName" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
        <td><asp:Label ID="LblContactNo" CssClass="Label" runat="server" Text="ContactNo"></asp:Label></td>
        <td><asp:TextBox ID="txtContactNo"  CssClass="Textbox" runat="server"></asp:TextBox></td>
        <td><asp:RegularExpressionValidator ID="Reg1" runat="server" ControlToValidate="txtContactNo" ValidationExpression="[0-9]{10}" ErrorMessage="*" ForeColor="Red"></asp:RegularExpressionValidator></td>
        <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtContactNo" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
        <td><asp:Label ID="LblEid" CssClass="Label" runat="server" Text="EmailId"></asp:Label></td>
        <td><asp:TextBox ID="txtEmailId"  CssClass="Textbox"  runat="server"></asp:TextBox></td>
        <td><asp:RegularExpressionValidator ID="Reg2" runat="server" ControlToValidate="txtEmailId" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="*" ForeColor="Red"></asp:RegularExpressionValidator></td>
        <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmailId" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
        <td><asp:Label ID="LblAddress" CssClass="Label" runat="server" Text="Address"></asp:Label></td>
        <td><asp:TextBox ID="txtAddress"  CssClass="Textbox" runat="server" TextMode="MultiLine"></asp:TextBox></td>
        <td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAddress" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
        <td><asp:Label ID="LblDate" CssClass="Label" runat="server" Text="Date"></asp:Label></td>
        <td><asp:TextBox ID="txtDate" TextMode="Date" CssClass="Textbox" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
        <td><asp:Label ID="LblMessage" CssClass="Label" runat="server" Text="message"></asp:Label></td>
        </tr>
        <tr align="center">
         <td>
         <asp:Button ID="BtnNew" runat="server" Text="New" Width="100px" CssClass="Button" OnClick="BtnNew_Click" />
         <asp:Button ID="BtnSave" runat="server" Text="Save" Width="100px" CssClass="Button" OnClick="BtnSave_Click" />
         <asp:Button ID="BtnUpdate" runat="server" Text="Update" Width="100px" CssClass="Button" OnClick="BtnUpdate_Click" />
         <asp:Button ID="BtnDelete" runat="server" Text="Delete" Width="100px" CssClass="Button" OnClick="BtnDelete_Click" />
         </td>
         </tr>
         <tr align="center">
         <td>
         <asp:GridView ID="GvCustomer" CssClass="Gridview" runat="server" OnSelectedIndexChanged="GvCustomer_SelectedIndexChanged">
         <Columns><asp:CommandField /><asp:CommandField ShowSelectButton="True" /></Columns>
         </asp:GridView>
         </td>
         </tr>
         </table>
</asp:Content>
