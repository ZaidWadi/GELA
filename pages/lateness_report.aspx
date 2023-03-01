<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="lateness_report.aspx.cs" Inherits="GELA_DB.pages.WebForm15" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet1.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="scrptmgr_project_data_input" runat="server"></asp:ScriptManager>
        <br /><br /><br /><br /><br /><br /><br />
        <div style="background-color:whitesmoke;width:contain;height:contain;overflow:auto;">
            <asp:GridView ID="reports_grid" runat="server" AutoGenerateColumns="false" CssClass="mydatagrid_1" PagerStyle-CssClass="pager"
 HeaderStyle-CssClass="header" RowStyle-CssClass="rows" ShowHeaderWhenEmpty="true">
                <Columns>
                    <asp:BoundField DataField="project_ID" HeaderText="ID" />
                    <asp:BoundField DataField="customer" HeaderText="Customer Name" />
                    <asp:BoundField DataField="project" HeaderText="Project" />
                    <asp:BoundField DataField="project_status" HeaderText="Status" />
                    <asp:BoundField DataField="measurement_lateness" HeaderText="Measurements Lateness" />
                    <asp:BoundField DataField="measuring_eng_name" HeaderText="Measuring Engineer" />
                    <asp:BoundField DataField="design_lateness" HeaderText="Design Lateness" />
                    <asp:BoundField DataField="contact_lateness" HeaderText="Customer Contact Lateness" />
                    <asp:BoundField DataField="contract_lateness" HeaderText="Customer Contact Lateness" />
                    <asp:BoundField DataField="prod_lateness" HeaderText="Production Order Lateness" />
                    <asp:BoundField DataField="designer_name" HeaderText="Designer" />
                    <asp:BoundField DataField="prod_fin_lateness" HeaderText="Production Lateness" />
                    <asp:BoundField DataField="install_lateness_prod" HeaderText="Installing Lateness from Production" />
                    <asp:BoundField DataField="install_lateness_contract" HeaderText="Installing Lateness from Agreed Date" />
                    <asp:BoundField DataField="production_manager" HeaderText="Production Manager" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
