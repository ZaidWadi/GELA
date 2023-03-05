<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="lateness_report.aspx.cs" Inherits="GELA_DB.pages.WebForm15" %>

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
        <asp:ScriptManager ID="scrptmgr_project_data_input" runat="server"></asp:ScriptManager>
        <br /><br /><br /><br /><br /><br /><br />
<script>
    $(document).ready(function () {
        $("#search_projects").on("keyup", function () {
            var value = $(this).val().toLowerCase();
            $("#reports_grid tr").filter(function () {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });
    });
</script>
                         <div style="width:1850px;max-height:500px;background-color:whitesmoke;overflow:auto;">
                             Search: <asp:TextBox ID="search_projects" Font-Size="20px" runat="server"></asp:TextBox>
                              <br />            <asp:GridView ID="reports_grid" runat="server" AutoGenerateColumns="false" CssClass="mydatagrid_1" PagerStyle-CssClass="pager"
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
