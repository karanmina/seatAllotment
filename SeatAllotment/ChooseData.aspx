<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChooseData.aspx.cs" Inherits="SeatAllotment.ChooseData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <link href="style/design.css" rel="stylesheet" type="text/css" />
</head>
<body style="height: 1024px; margin-right: 420px;">
    <form id="form1" runat="server">
        <div class="auto-style1" style="background-color: #D4DFE1">
            <asp:Label ID="Label1" runat="server" CssClass="auto-style3" ForeColor="#CC0000" Text="Selected Student Details"></asp:Label>
            <asp:Label ID="Label2" runat="server" CssClass="auto-style5" Text="Hostel:"></asp:Label>
            <asp:Button ID="Button1" runat="server" CssClass="auto-style7" OnClick="Button1_Click" Text="Click" BackColor="#1E313C" ForeColor="White" />
            <asp:GridView ID="GridViewHostel" runat="server" CellPadding="4" CssClass="auto-style8" ForeColor="#333333" GridLines="Vertical">
                <AlternatingRowStyle BackColor="White" />
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1A3F56" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
            <asp:Label ID="Label3" runat="server" CssClass="auto-style10" Text=" Room: "></asp:Label>
            <asp:DropDownList ID="DropDownListSelectRoom" runat="server" CssClass="auto-style11" BackColor="#B6D9EE">
            </asp:DropDownList>
            <asp:Button ID="Button2" runat="server" CssClass="auto-style12" Text="Click To Allocate" OnClick="Button2_Click" BackColor="#1E313C" ForeColor="White" />
            <asp:DropDownList ID="DropDownListHostel" runat="server" CssClass="auto-style14" BackColor="#B6D9EE">
            </asp:DropDownList>
            <asp:GridView ID="GridViewStudDetails" runat="server" CellPadding="4" CssClass="auto-style15" ForeColor="#333333" GridLines="Vertical">
                <AlternatingRowStyle BackColor="White" />
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1A3F56" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
            <div class="auto-style16" style="background-color: #1A3F56">
                <asp:Label ID="Label5" runat="server" CssClass="auto-style19" ForeColor="White" Text="National Institute Of Technology Nagaland"></asp:Label>
            </div>
            <asp:Label ID="Label4" runat="server" CssClass="auto-style17" ForeColor="Red" Text="Click here to check hostel availability:"></asp:Label>
            <asp:Image ID="Image1" runat="server" CssClass="auto-style18" ImageUrl="~/Resources/Logo Transper.png" />
        </div>
    </form>
</body>
</html>
