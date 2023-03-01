<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="add_granite.aspx.cs" Inherits="GELA_DB.pages.WebForm21" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet1.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
        <div style="background-color:whitesmoke;">
            <asp:Table runat="server" CellSpacing="10">
                <asp:TableRow>
                    <asp:TableCell>
                        Granite:
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtbx_granite_name" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        Price:
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtbx_price" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell>
                        Upper panel price (/m):
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtbx_u_panel_price" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        Lower panel price (/m):
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtbx_l_panel_price" runat="server"></asp:TextBox>
                    </asp:TableCell>
                     </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="btn_done" runat="server" Text="Done" OnClick="btn_done_Click" CssClass="Initial_button" />
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="btn_back" runat="server" Text="Back" OnClick="btn_back_Click" CssClass="Initial_button" />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
    </form>
</body>
</html>
