<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowAllocatedDetails.aspx.cs" Inherits="SeatAllotment.ShowAllocatedDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 724px;
            width: 1372px;
            text-align: center;
        }
        .auto-style4 {
            position: absolute;
            top: 126px;
            left: 182px;
            z-index: 1;
            width: 115px;
        }
        .auto-style6 {
            position: absolute;
            top: 125px;
            left: 480px;
            z-index: 1;
            height: 20px;
            right: 742px;
            width: 170px;
        }
        .auto-style7 {
            position: absolute;
            top: 125px;
            left: 32px;
            z-index: 1;
        }
        .auto-style8 {
            position: absolute;
            top: 127px;
            left: 434px;
            z-index: 1;
            height: 25px;
            right: 957px;
        }
        .auto-style9 {
            position: absolute;
            top: 125px;
            left: 695px;
            z-index: 1;
        }
        .auto-style11 {
            width: 388px;
            height: 1px;
            position: absolute;
            top: 37px;
            left: 19px;
            z-index: 1;
        }
        .auto-style12 {
            position: absolute;
            top: 126px;
            left: 302px;
            z-index: 1;
            width: 78px;
            right: 1012px;
        }
        .auto-style13 {
            position: absolute;
            top: 161px;
            left: 35px;
            z-index: 1;
        }
        .auto-style14 {
            position: absolute;
            top: 125px;
            left: 921px;
            z-index: 1;
            width: 95px;
            height: 20px;
        }
        .auto-style15 {
            position: absolute;
            top: 125px;
            left: 748px;
            z-index: 1;
            width: 170px;
            height: 20px;
        }
        .auto-style16 {
            position: absolute;
            top: 123px;
            left: 100px;
            z-index: 1;
            width: 470px;
        }
        .auto-style18 {
            width: 944px;
            height: 473px;
            position: absolute;
            top: 202px;
            left: 45px;
            z-index: 1;
        }
        .auto-style19 {
            width: 1372px;
            height: 68px;
            position: absolute;
            top: 8px;
            left: 10px;
            z-index: 1;
        }
        .auto-style20 {
            position: absolute;
            top: 25px;
            left: 14px;
            z-index: 1;
        }
        .auto-style21 {
            position: absolute;
            top: 26px;
            left: 791px;
            z-index: 1;
            width: 465px;
        }
        .auto-style22 {
            position: absolute;
            top: 2px;
            left: 1164px;
            z-index: 1;
            width: 88px;
            height: 64px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1" style="background-color: #D4DFE1">
            <asp:TextBox ID="TextBoxRegNo" runat="server" BackColor="#B6D9EE" CssClass="auto-style4" ValidationGroup="Panel1" CausesValidation="True"></asp:TextBox>
            <asp:DropDownList ID="DropDownListBatchFiler" runat="server" AutoPostBack="True" CssClass="auto-style6" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" BackColor="#B6D9EE">
                <asp:ListItem>select Batch</asp:ListItem>
            </asp:DropDownList>
            <asp:Label ID="Label1" runat="server" CssClass="auto-style7" ForeColor="#1A3F56" Text="Registration No. :"></asp:Label>
            <asp:Label ID="Label2" runat="server" CssClass="auto-style8" ForeColor="#1A3F56" Text="Batch:"></asp:Label>
            <asp:Label ID="Label3" runat="server" CssClass="auto-style9" ForeColor="#1A3F56" Text="Hostel:"></asp:Label>
            <asp:Panel ID="Panel1" runat="server" CssClass="auto-style11">
                <asp:Label ID="LabelWrite" runat="server" CssClass="auto-style16" ForeColor="#CC0000"></asp:Label>
            </asp:Panel>
            <asp:Button ID="Button1" runat="server" CssClass="auto-style12" ForeColor="White" OnClick="Button1_Click1" Text="Filter" ValidationGroup="Panel1" BackColor="#1E313C" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxRegNo" CssClass="auto-style13" ErrorMessage="Registration No Required" ForeColor="#CC0000" ValidationGroup="Panel1"></asp:RequiredFieldValidator>
            <asp:Button ID="ButtonRefresh" runat="server" CssClass="auto-style14" ForeColor="White" OnClick="ButtonRefresh_Click" Text="Refresh" BackColor="#1E313C" />
            <asp:DropDownList ID="DropDownListFilterByHostel" runat="server" AutoPostBack="True" CssClass="auto-style15" OnSelectedIndexChanged="DropDownListFilterByHostel_SelectedIndexChanged" BackColor="#B6D9EE">
            </asp:DropDownList>
            <asp:GridView ID="GridViewShowDetails" runat="server" AllowPaging="True" CellPadding="4" CssClass="auto-style18" ForeColor="#333333" GridLines="Vertical">
                <AlternatingRowStyle BackColor="White" />
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1A3F56" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#1A3F56" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
            <div class="auto-style19" style="background-color: #1A3F56">
                <asp:Label ID="Label4" runat="server" CssClass="auto-style20" ForeColor="White" Text="Allocated Details:"></asp:Label>
                <asp:Label ID="Label5" runat="server" CssClass="auto-style21" ForeColor="White" Text="National Institute Of Technology Nagaland"></asp:Label>
                <img alt="" class="auto-style22" src="Resources/Logo%20Transper.png" /></div>
        </div>
    </form>
</body>
</html>
