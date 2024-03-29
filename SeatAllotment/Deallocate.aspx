﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Deallocate.aspx.cs" Inherits="SeatAllotment.Deallocate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style2 {
            height: 701px;
            text-align: center;
            width: 1371px;
            margin-right: 0px;
        }
        .auto-style5 {
            position: absolute;
            top: 117px;
            left: 17px;
            z-index: 1;
            width: 182px;
            right: 1193px;
        }
        .auto-style6 {
            position: absolute;
            top: 117px;
            left: 175px;
            z-index: 1;
            width: 216px;
            height: 26px;
        }
        .auto-style7 {
            position: absolute;
            top: 150px;
            left: 283px;
            z-index: 1;
            width: 112px;
            height: 28px;
        }
        .auto-style8 {
            position: absolute;
            top: 88px;
            left: 210px;
            z-index: 1;
        }
        .auto-style9 {
            position: absolute;
            top: 187px;
            left: 24px;
            z-index: 1;
            width: 363px;
        }
        .auto-style10 {
            position: absolute;
            top: 234px;
            z-index: 1;
            width: 115px;
            right: 1130px;
            height: 31px;
        }
        .auto-style11 {
            position: absolute;
            top: 233px;
            left: 108px;
            z-index: 1;
            width: 200px;
            height: 28px;
        }
        .auto-style12 {
            position: absolute;
            top: 262px;
            left: 201px;
            z-index: 1;
            width: 107px;
            height: 29px;
        }
        .auto-style14 {
            width: 688px;
            height: auto;
            position: absolute;
            top: 108px;
            left: 472px;
            z-index: 1;
        }
        .auto-style15 {
            width: 1371px;
            height: 76px;
            position: absolute;
            top: 0px;
            left: 12px;
            z-index: 1;
        }
        .auto-style16 {
            position: absolute;
            top: 23px;
            left: 5px;
            z-index: 1;
            width: 223px;
        }
        .auto-style17 {
            position: absolute;
            top: 21px;
            left: 825px;
            z-index: 1;
            width: 420px;
        }
        .auto-style18 {
            position: absolute;
            top: 5px;
            left: 1178px;
            z-index: 1;
            height: 57px;
            width: 66px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style2" style="background-color: #D4DFE1">
            <asp:Label ID="Label1" runat="server" CssClass="auto-style5" Text="Registration No:"></asp:Label>
            <asp:TextBox ID="TextBoxRegno" runat="server" CssClass="auto-style6" BackColor="#B6D9EE"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" CssClass="auto-style7" OnClick="Button1_Click" Text="Search" ValidationGroup="Panel1" BackColor="#1E313C" ForeColor="White" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxRegno" CssClass="auto-style8" ErrorMessage="*Registration No. Required" ForeColor="Red" ValidationGroup="Panel1"></asp:RequiredFieldValidator>
            <asp:Label ID="LabelWrite1" runat="server" CssClass="auto-style9" ForeColor="Red"></asp:Label>
            <asp:Label ID="Label2" runat="server" CssClass="auto-style10" Text="Batch:"></asp:Label>
            <div class="auto-style15" style="background-color: #1A3F56">
                <asp:Label ID="Label3" runat="server" CssClass="auto-style16" ForeColor="White" Text="Hostel Deallocation"></asp:Label>
                <asp:Label ID="Label4" runat="server" CssClass="auto-style17" ForeColor="White" Text="National Institute Of Technology Nagaland"></asp:Label>
                <asp:Image ID="Image1" runat="server" CssClass="auto-style18" ImageUrl="~/Resources/Logo Transper.png" />
            </div>
&nbsp;
            <asp:Button ID="Button2" runat="server" CssClass="auto-style12" OnClick="Button2_Click" Text="Delete" BackColor="#1E313C" ForeColor="White" />
            <asp:GridView ID="GridViewDetailsForDeallocation" runat="server" AllowPaging="True" AutoGenerateDeleteButton="True" CellPadding="4" CssClass="auto-style14" ForeColor="#333333" GridLines="Vertical" OnRowDeleting="GridViewDetailsForDeallocation_RowDeleting">
                <AlternatingRowStyle BackColor="White" />
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1A3F56" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1A3F56" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#1A3F56" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
            <asp:DropDownList ID="DropDownListBAtch" runat="server" CssClass="auto-style11" BackColor="#B6D9EE">
            </asp:DropDownList>
        </div>
    </form>
</body>
</html> 
