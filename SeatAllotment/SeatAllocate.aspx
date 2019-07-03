<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SeatAllocate.aspx.cs" Inherits="SeatAllotment.SeatAllocate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style3 {
            position: absolute;
            top: 163px;
            left: 44px;
            z-index: 1;
            bottom: 499px;
            width: 164px;
        }
        .auto-style6 {
            position: absolute;
            top: 204px;
            left: 238px;
            z-index: 1;
            /*/*width: 84px;*/*/
            font-weight: bold;
            height: 29px;
        }
        .auto-style7 {
            position: absolute;
            top: 106px;
            left: 238px;
            z-index: 1;
            width: 119px;
            height: 19px;
            margin-bottom: 10px;
            right: 1035px;
            bottom: 543px;
        }
        .auto-style10 {
            height: 57px;
            width: 1405px;
        }
        .auto-style11 {
            position: absolute;
            top: 159px;
            left: 240px;
            z-index: 1;
            width: 122px;
            height: 19px;
            right: 1030px;
        }
        .auto-style12 {
            position: absolute;
            top: 159px;
            left: 367px;
            z-index: 1;
        }
        .auto-style13 {
            position: absolute;
            top: 110px;
            left: 367px;
            z-index: 1;
        }
        .auto-style14 {
            position: absolute;
            top: 355px;
            left: 36px;
            z-index: 1;
            width: 261px;
            right: 1095px;
            font-size: medium;
        }
        .auto-style15 {
            position: absolute;
            top: 289px;
            left: 66px;
            z-index: 1;
            height: 23px;
            width: 73px;
        }
        .auto-style16 {
            text-align: center;
        }
        .auto-style18 {
            position: absolute;
            top: 398px;
            left: 396px;
            z-index: 1;
            height: 29px;
            width: 84px;
            font-weight: bold;
        }
        .auto-style19 {
            height: 730px;
            width: 629px;
        }
        .auto-style21 {
            position: absolute;
            top: 359px;
            left: 499px;
            z-index: 1;
        }
        .auto-style23 {
            position: absolute;
            top: 106px;
            left: 77px;
            z-index: 1;
            width: 164px;
            height: 37px;
        }
        .auto-style24 {
            position: absolute;
            top: 411px;
            left: 72px;
            z-index: 1;
            width: 264px;
        }
        .auto-style25 {
            position: absolute;
            top: 355px;
            left: 308px;
            z-index: 1;
            width: 177px;
        }
        .auto-style26 {
            width: 512px;
            height: 141px;
            position: absolute;
            top: 84px;
            left: 665px;
            z-index: 1;
        }
        .auto-style27 {
            width: 776px;
            height: 673px;
            position: absolute;
            top: 65px;
            left: 636px;
            z-index: 1;
        }
        .auto-style28 {
            position: absolute;
            top: 21px;
            z-index: 1;
            left: 24px;
        }
        .auto-style29 {
            position: absolute;
            top: 12px;
            z-index: 1;
            width: 60px;
            height: 49px;
            left: 1168px;
            right: 568px;
        }
        .auto-style30 {
            position: absolute;
            top: 22px;
            z-index: 1;
            left: 757px;
            width: 480px;
            height: 27px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="auto-style19" style="background-color: #D4DFE1">
        <div class="auto-style16">
            <strong>
        <asp:Label ID="Label1" runat="server" CssClass="auto-style3" Text="Select Branch:" ForeColor="Black"></asp:Label>
        <asp:Button ID="Button1" runat="server" CssClass="auto-style6" OnClick="Button1_Click" Text="OK" ValidationGroup="Panel1" BackColor="#1E313C" ForeColor="White" />
            </strong>
        <asp:DropDownList ID="DropDownListBatch" runat="server" CssClass="auto-style7" BackColor="#B6D9EE">
            <asp:ListItem>Select Batch</asp:ListItem>
            <asp:ListItem>2016</asp:ListItem>
            <asp:ListItem>2017</asp:ListItem>
        </asp:DropDownList>
            <div class="auto-style10" style="font-family: 'Arial Black'; font-size: x-large; color: #1a3f56; background-color: #1A3F56;">
                <strong>
            <div class="auto-style27" style="background-color: #D4DFE1;">
            </div>
                <asp:Label ID="Label6" runat="server" CssClass="auto-style28" Font-Size="Small" ForeColor="White" Text="Hostel Seat Allocation"></asp:Label>
                <asp:Label ID="Label7" runat="server" BackColor="#1A3F56" CssClass="auto-style30" Font-Size="Small" ForeColor="White" Text="National Institute Of Technology Nagaland"></asp:Label>
            </strong>
            <br />
        </div>
        <asp:DropDownList ID="DropDownListBranch" runat="server" CssClass="auto-style11" BackColor="#B6D9EE">
            <asp:ListItem>Select Branch</asp:ListItem>
            <asp:ListItem>cse</asp:ListItem>
            <asp:ListItem>civil</asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator InitialValue="Select Branch" ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownListBranch" CssClass="auto-style12" ErrorMessage="*Please Select Branch" ForeColor="#FF3300" ValidationGroup="Panel1"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator InitialValue="Select Batch" ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownListBatch" CssClass="auto-style13" ErrorMessage="*Please Select Batch" ForeColor="Red" ValidationGroup="Panel1"></asp:RequiredFieldValidator>
            <strong>
            <asp:Label ID="Label3" runat="server" CssClass="auto-style14" ForeColor="Black" Text="Search By Registration Number:"></asp:Label>
            <asp:Label ID="Label4" runat="server" CssClass="auto-style15" ForeColor="Black" Text="OR" BackColor="#D4DFE1" BorderStyle="None" BorderWidth="2px"></asp:Label>
            </strong>
        </div>
        <strong>
        <asp:Button ID="ButtonSaerchbyReg" runat="server" CssClass="auto-style18" OnClick="Button2_Click" Text="Search" BackColor="#1E313C" ForeColor="White" />
        </strong>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBoxRegNo" CssClass="auto-style21" ErrorMessage="*Enter Registration Number" ForeColor="#FF3300"></asp:RequiredFieldValidator>
        <strong>
        <asp:Label ID="Label5" runat="server" CssClass="auto-style23" Text="Select Batch:" ForeColor="Black"></asp:Label>
        </strong>&nbsp;<asp:Label ID="Labelwrite1" runat="server" CssClass="auto-style24" ForeColor="Red"></asp:Label>
        <asp:TextBox ID="TextBoxRegNo" runat="server" CssClass="auto-style25" BackColor="#B6D9EE" ForeColor="White"></asp:TextBox>
        <asp:GridView ID="GridViewStudent" runat="server" AutoGenerateSelectButton="True" CellPadding="4" CssClass="auto-style26" ForeColor="Black" GridLines="Vertical" OnSelectedIndexChanged="GridViewStudent_SelectedIndexChanged1">
            <AlternatingRowStyle BackColor="White" BorderColor="Black" />
            <EditRowStyle BackColor="Black" />
            <FooterStyle BackColor="#4879BC" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1A3F56" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <img alt="" class="auto-style29" src="Resources/Logo%20Transper.png" /></form>
</body>
</html>
