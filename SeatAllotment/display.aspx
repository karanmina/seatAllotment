<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="display.aspx.cs" Inherits="SeatAllotment.display" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style4 {
            position: absolute;
            top: 32px;
            left: -2px;
            z-index: 1;
            width: 299px;
            height: 28px;
        }
        .auto-style5 {
            text-align: center;
        }
        .auto-style6 {
            width: 733px;
            height: 282px;
            position: absolute;
            top: 112px;
            left: 35px;
            z-index: 1;
        }
        .auto-style7 {
            height: 71px;
            width: 1240px;
        }
        .auto-style8 {
            position: absolute;
            top: 34px;
            z-index: 1;
            width: 453px;
            height: 29px;
            left: 753px;
        }
        .auto-style9 {
            position: absolute;
            top: 16px;
            left: 1144px;
            z-index: 1;
            width: 78px;
            height: 62px;
        }
        .auto-style10 {
            width: 1235px;
            height: 510px;
            position: absolute;
            top: 90px;
            left: 10px;
            z-index: 1;
        }
        .auto-style11 {
            position: absolute;
            top: 335px;
            left: 225px;
            z-index: 1;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" style="background-color: #D4DFE1">
        <div class="auto-style5">
        <div class="auto-style7" style="background-color: #1E313C">
            <asp:Label ID="Label2" runat="server" CssClass="auto-style8" Font-Bold="True" Font-Size="Medium" ForeColor="White" Text="National Institute Of Technology Nagaland"></asp:Label>
            <asp:Image ID="Image1" runat="server" CssClass="auto-style9" ImageUrl="~/Resources/Logo Transper.png" />
        </div>
            <asp:Label ID="Label1" runat="server" CssClass="auto-style4" ForeColor="White" Text="Details of Seat Allotment" Font-Bold="True" Font-Size="Medium"></asp:Label>
        </div>
        <asp:GridView ID="GridViewdisplay" runat="server" CellPadding="4" CssClass="auto-style6" ForeColor="#333333" GridLines="Vertical">
            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1E313C" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <div class="auto-style10">
            <asp:HyperLink ID="HyperLink1" runat="server" CssClass="auto-style11" NavigateUrl="~/SeatAllocate.aspx">click to continue Allocation</asp:HyperLink>
        </div>
    </form>
</body>
</html>
