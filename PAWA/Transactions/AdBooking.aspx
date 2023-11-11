<%@ Page Title="" Language="C#" MasterPageFile="~/Mains.Master" AutoEventWireup="true" CodeBehind="AdBooking.aspx.cs" Inherits="PAWA.Transactions.AdBooking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../css/Controls.css" rel="stylesheet" />
    <h1 class="h1">Ad Booking</h1>
    <table>
     <tr>
     <td><asp:Label ID="LblBookingId" runat="server" CssClass="Label" Text="BookingID"></asp:Label></td>
     <td class="auto-style1"><asp:TextBox ID="txtBookingId" CssClass="Textbox" runat="server"></asp:TextBox></td>
     </tr>
      <tr>
      <td><asp:Label ID="LblAdType" CssClass="Label" runat="server" Text="AdType"></asp:Label></td>
      <td class="auto-style1"><asp:TextBox ID="TxtAdType" CssClass="Textbox" runat="server"></asp:TextBox></td>
      </tr>
       <tr>
       <td><asp:Label ID="LblItemId" CssClass="Label" runat="server" Text="ItemId"></asp:Label></td>
       <td class="auto-style1"><asp:DropDownList ID="DdlItemId" CssClass="Dropdown" AutoPostBack="true" runat="server" OnSelectedIndexChanged="DdlItemId_SelectedIndexChanged"></asp:DropDownList></td>
       </tr>
        <tr>
        <td><asp:Label ID="LblPrice" CssClass="Label" runat="server" Text="Price"></asp:Label></td>
        <td class="auto-style1"><asp:DropDownList ID="DdlPrice" CssClass="Dropdown" AutoPostBack="true" runat="server"></asp:DropDownList></td>
        </tr>
        <tr>
        <td><asp:Label ID="LblItemDescription" runat="server" CssClass="Label" Text="Description"></asp:Label></td>
        <td class="auto-style1"><asp:TextBox ID="TxtDescription" CssClass="Textbox" TextMode="MultiLine" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
        <td><asp:Label ID="LblDate" CssClass="Label" runat="server" Text="Date"></asp:Label></td>
        <td class="auto-style1"><asp:TextBox ID="TxtDate" runat="server" CssClass="Textbox" TextMode="Date"></asp:TextBox></td>
        </tr>
        <tr>
        <td><asp:Label ID="LblLocation" CssClass="Label" runat="server" Text="Location"></asp:Label></td>
        <td class="auto-style1">
        <asp:DropDownList ID="DdlLocation" CssClass="Dropdown" runat="server">
        <asp:ListItem>--select--</asp:ListItem>
        <asp:ListItem>(NewsPaper,Page,Front)</asp:ListItem>
        <asp:ListItem>(NewsPaper,Page,Middle)</asp:ListItem>
        <asp:ListItem>(NewsPaper,Page,End)</asp:ListItem>
        <asp:ListItem>Website</asp:ListItem>
        <asp:ListItem>Social</asp:ListItem>
        </asp:DropDownList>
        </td>
        </tr>
        <tr>
        <td><asp:Label ID="LblAmount" CssClass="Label" runat="server" Text="Amount"></asp:Label></td>
        <td class="auto-style1"><asp:TextBox ID="txtAmount" CssClass="Textbox" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
        <td><asp:Label ID="LblIsactive" runat="server" CssClass="Label" Text="IsActive"></asp:Label></td>
        <td class="auto-style1"><asp:CheckBox ID="ChkIsActive" CssClass="Checkbox" runat="server" /></td>
        </tr>
         <tr align="center">
         <td><asp:Button ID="BtnNew" CssClass="Button" runat="server" Text="New" OnClick="BtnNew_Click" />
             <asp:Button ID="BtnSave" CssClass="Button" runat="server" Text="Save" OnClick="BtnSave_Click" />
             <asp:Button ID="BtnUpdate" CssClass="Button" runat="server" Text="Update" OnClick="BtnUpdate_Click" />
             <asp:Button ID="BtnDelete" CssClass="Button" runat="server" Text="Delete" OnClick="BtnDelete_Click" />
             <asp:Button ID="BtnClose" CssClass="Button" runat="server" Text="Close" OnClick="BtnClose_Click" /></td>
         </tr>
         <tr>
         <td><asp:Label ID="LblMessage" CssClass="Label" runat="server" Text="Message"></asp:Label></td>
         </tr>
        </table>
        <table>
         <tr>
         <td>
         <asp:GridView ID="GvBooking" CssClass="Gridview" runat="server" OnSelectedIndexChanged="GvBooking_SelectedIndexChanged">
             <Columns><asp:CommandField ShowSelectButton="True" /> </Columns>
             </asp:GridView>
         </td>
         </tr>
        </table>
</asp:Content>
