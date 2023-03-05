<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="engineer_projects.aspx.cs" Inherits="GELA_DB.pages.WebForm12" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet1.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />

<script src="../Scripts/jquery-3.6.0.min.js"></script>
<script src="../Scripts/bootstrap.min.js"></script>
<script src="../Scripts/select2.min.js"></script>

<link href="../Content/css/select2.css" rel="stylesheet" />

<meta name="viewport" content="width=device-width, initial-scale=1" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <br /><br /><br /><br /><br /><br />
        <div>
            <div dir="rtl">
            <asp:Table runat="server">
                <asp:TableRow>
                    <asp:TableCell>Projects </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="lbl_employee_name" runat="server"></asp:Label>
                        <asp:Label ID="lbl_dept" runat="server" Visible="false"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
                <br /><br /><br />
                </div>
            <asp:Table runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="btn_active_projects" runat="server" Text="Active Projects With Engineer" CssClass="Initial_button" OnClick="btn_active_projects_Click" />
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="btn_active_elsewhere" runat="server" Text="Active Projects Elsewhere" CssClass="Initial_button" OnClick="btn_active_elsewhere_Click" />
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="btn_inactive_projects" runat="server" Text="Inactive Projects" CssClass="Initial_button" OnClick="btn_inactive_projects_Click" />
                    </asp:TableCell>
                </asp:TableRow>
                </asp:Table>
            <br />
            <asp:Table runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        <div style="overflow:auto; width:1900px;">
            <asp:MultiView ID="employee_multiview" runat="server">
            <asp:View ID="active_projects_view" runat="server" OnLoad="active_projects_view_Load">
                <asp:GridView ID="active_projects_grid" runat="server" CssClass="mydatagrid" PagerStyle-CssClass="pager"
 HeaderStyle-CssClass="header" RowStyle-CssClass="rows" Width="100%" ShowHeaderWhenEmpty="true"></asp:GridView>
            </asp:View>
                 <asp:View ID="active_elsewhere_view" runat="server" OnLoad="active_elsewhere_view_Load">
                <asp:GridView ID="active_elsewhere_grid" runat="server" CssClass="mydatagrid" PagerStyle-CssClass="pager"
 HeaderStyle-CssClass="header" RowStyle-CssClass="rows" Width="100%" ShowHeaderWhenEmpty="true"></asp:GridView>
            </asp:View>
            <asp:View ID="inactive_projects_view" runat="server" OnLoad="inactive_projects_view_Load">
                <asp:GridView ID="inactive_projects_grid" runat="server" CssClass="mydatagrid" PagerStyle-CssClass="pager"
 HeaderStyle-CssClass="header" RowStyle-CssClass="rows" Width="100%" ShowHeaderWhenEmpty="true"></asp:GridView>
            </asp:View>
                </asp:MultiView>
                            </div>
                        </asp:TableCell>
                </asp:TableRow>
                </asp:Table>
        </div>
    </form>
</body>
</html>
