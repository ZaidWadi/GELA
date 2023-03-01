<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="lateness_report_ar.aspx.cs" Inherits="GELA_DB.pages.WebForm45" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title></title>
    <link href="StyleSheet1.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" dir="rtl">
        <asp:ScriptManager ID="scrptmgr_project_data_input" runat="server"></asp:ScriptManager>
        <br /><br /><br /><br /><br /><br /><br />
        <div style="background-color:whitesmoke;width:contain;height:contain;overflow:auto;">
            <asp:GridView ID="reports_grid" runat="server" AutoGenerateColumns="false" CssClass="mydatagrid_1" PagerStyle-CssClass="pager"
 HeaderStyle-CssClass="header" RowStyle-CssClass="rows" ShowHeaderWhenEmpty="true">
                <Columns>
                    <asp:BoundField DataField="project_ID" HeaderText="رقم المشروع" />
                    <asp:BoundField DataField="customer" HeaderText="اسم الزبون" />
                    <asp:BoundField DataField="project" HeaderText="المشروع" />
                    <asp:BoundField DataField="project_status" HeaderText="الحالة" />
                    <asp:BoundField DataField="measurement_lateness" HeaderText="أيام التأخير في أخذ المقاس" />
                    <asp:BoundField DataField="measuring_eng_name" HeaderText="مهندس المقاس" />
                    <asp:BoundField DataField="design_lateness" HeaderText="أيام التأخير في التصميم" />
                    <asp:BoundField DataField="contact_lateness" HeaderText="أيام التأخير في التواصل مع العميل" />
                    <asp:BoundField DataField="contract_lateness" HeaderText="أيام التأخير في توقيع العقد" />
                    <asp:BoundField DataField="prod_lateness" HeaderText="أيام التأخير في اصدار أمر الانتاج" />
                    <asp:BoundField DataField="designer_name" HeaderText="المصمم" />
                    <asp:BoundField DataField="prod_fin_lateness" HeaderText="أيام التأخير في الانتاج" />
                    <asp:BoundField DataField="install_lateness_prod" HeaderText="أيام التأخير في التركيب" />
                    <asp:BoundField DataField="install_lateness_contract" HeaderText="أيام التأخير عن موعد التسليم" />
                    <asp:BoundField DataField="production_manager" HeaderText="مدير الانتاج" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
