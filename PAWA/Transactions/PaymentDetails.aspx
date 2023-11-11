<%@ Page Title="" Language="C#" MasterPageFile="~/Mains.Master" AutoEventWireup="true" CodeBehind="PaymentDetails.aspx.cs" Inherits="PAWA.Transactions.PaymentDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../css/Cs.css" rel="stylesheet" />
    <br />
    <h1 class="h1" >PaymentDetails</h1>
    <table align="center">
          <tr>
              <td>
                <asp:Label ID="LblPaymentId" CssClass="Label" runat="server" Text="PaymentId" Width="200px"></asp:Label>
                </td>
            <td>
                <asp:TextBox ID="txtPaymentId" CssClass="Textbox" runat="server"></asp:TextBox>
            </td>
          </tr>
             <tr>
                <td>
                <asp:Label ID="LblBookId" CssClass="Label" runat="server" Text="BookingId" Width="200px"></asp:Label>
                </td>
                 <td>
                <asp:DropDownList ID="DdlBookid1" CssClass="Dropdown" runat="server" OnSelectedIndexChanged="DdlBookid1_SelectedIndexChanged" AutoPostBack="True" ></asp:DropDownList>
                </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="LblRprice" CssClass="Label" runat="server" Text="RecievedPrice" Width="200px"></asp:Label>
                </td>
            <td>
                <asp:DropDownList ID="ddlRecievedPrice" CssClass="Dropdown" runat="server" AutoPostBack="True" ></asp:DropDownList>
           </td>
        </tr>
        <tr>
            <td>
            <asp:Label ID="LblTamount" CssClass="Label" runat="server" Text="TotalAmount" Width="200px"></asp:Label>
            </td>
            <td>
             <asp:TextBox ID="txtTotalAmount" CssClass="Textbox" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="Req2" runat="server" ControlToValidate="txtTotalAmount" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
             </td>          
        </tr>
        <tr>
               <td>
                <asp:Label ID="LblBalance" CssClass="Label" runat="server" Text="Balance" Width="200px"></asp:Label>
                </td>
                <td>
                <asp:TextBox ID="txtBalance" runat="server" CssClass="Textbox" OnTextChanged="txtBalance_TextChanged" AutoPostBack="True"></asp:TextBox>
            </td>
            </tr>
              <tr>
                <td>
                <asp:Label ID="LblReason" CssClass="Label" runat="server" Text="Reason" Width="200px"></asp:Label>
                </td>
                <td>
                <asp:TextBox ID="txtReason" CssClass="Textbox" runat="server" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="Req3" runat="server" ControltoValidate="txtReason"  ErrorMessage="*" ForeColor="Red" ></asp:RequiredFieldValidator>
            </td>
          </tr>
           <tr>
            <td>
                <asp:Label ID="LblIsActive" runat="server" CssClass="Label" Text="IsActive"></asp:Label>
                <asp:CheckBox ID="ChKIsActive" CssClass="Checkbox" runat="server" />
            </td>
        </tr>
        <tr align="center">
            <td>
                <asp:Button ID="BtnSubmit" CssClass="Button" runat="server" Text="Submit" OnClick="BtnSubmit_Click" />
                <asp:Button ID="BtnClose" CssClass="Button" runat="server" Text="Close" OnClick="BtnClose_Click" />
            </td>
        </tr>
        <tr>
        <td>
        <asp:Label ID="LblMessage" CssClass="Label" runat="server" Text="Message"></asp:Label>
        </td>
         <td>
        <asp:GridView ID="GPayView" CssClass="Gridview" runat="server"></asp:GridView>
         </td>
        </tr>
    </table>
</asp:Content>
