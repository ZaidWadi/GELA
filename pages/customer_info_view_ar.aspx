<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="customer_info_view_ar.aspx.cs" EnableEventValidation="true" Inherits="GELA_DB.pages.WebForm53" %>

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
    <br /><br /><br /><br />
    <form id="form1" runat="server" dir="rtl">
        <asp:ScriptManager ID="scrptmgr_design_sup" runat="server"></asp:ScriptManager>
        <div>
            <asp:UpdatePanel runat="server" ChildrenAsTriggers="true">
                            <ContentTemplate>
            <asp:Table runat="server">
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">
                        رقم التعريف:
                    </asp:TableCell>
                    <asp:TableCell runat="server">
                        <asp:Label ID="lbl_customer_ID" runat="server"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell runat="server">
                        <asp:Button ID="btn_edit" runat="server" CssClass="Initial_button_ar" Text="تعديل" OnClick="btn_edit_Click" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                     <asp:TableCell>
                        المعرض:
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="dlst_showroom" runat="server" Enabled="false"></asp:DropDownList>
                    </asp:TableCell>
                     </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell>
                        <asp:DropDownList ID="dlst_title" runat="server" Enabled="false"></asp:DropDownList>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Textbox ID="txtbx_name" runat="server" Enabled="false"></asp:Textbox>
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow runat="server">
                     <asp:TableCell>
                        رقم الهاتف:
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Textbox ID="txtbx_phone_1" runat="server" Enabled="false"></asp:Textbox>
                    </asp:TableCell>
                     </asp:TableRow>
                <asp:TableRow runat="server">
                     <asp:TableCell>
                        رقم الهاتف الثانوي:
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Textbox ID="txtbx_phone_2" runat="server" Enabled="false"></asp:Textbox>
                    </asp:TableCell>
                     </asp:TableRow>
                <asp:TableRow runat="server">
                     <asp:TableCell>
                        المدينة:
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="dlst_city" runat="server" Enabled="false"></asp:DropDownList>
                    </asp:TableCell>
                     </asp:TableRow>
                 <asp:TableRow runat="server">
                     <asp:TableCell>
                        المنطقة:
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="dlst_area" runat="server" Enabled="false"></asp:DropDownList>
                    </asp:TableCell>
                     </asp:TableRow>
                 <asp:TableRow runat="server">
                     <asp:TableCell>
                        تفاصيل العنوان:
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtbx_address" runat="server" Enabled="false"></asp:TextBox>
                    </asp:TableCell>
                     </asp:TableRow>
                <asp:TableRow runat="server">
                     <asp:TableCell>
                        الرقم الوطني:
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtbx_nat_id" runat="server" Enabled="false"></asp:TextBox>
                    </asp:TableCell>
                     </asp:TableRow>
                <asp:TableRow runat="server">
                     <asp:TableCell>
                        الملاحظات:
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtbx_botes" runat="server" Enabled="false"></asp:TextBox>
                    </asp:TableCell>
                     </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="btn_save" runat="server" CssClass="Initial_button" Text="Save" OnClick="btn_save_Click" Visible="false"/>                
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:GridView ID="projects_grid" runat="server" AutoGenerateColumns="false" CssClass="mydatagrid" PagerStyle-CssClass="pager"
 HeaderStyle-CssClass="header" RowStyle-CssClass="rows" OnRowDataBound="projects_grid_RowDataBound" ShowHeaderWhenEmpty="true">
                            <Columns>
                                <asp:BoundField DataField="project_ID" headertext="رقم المشروع" />
                                <asp:BoundField DataField="project" headertext="المنتج" />
                                <asp:BoundField DataField="initiation_date" headertext="تاريخ البدء" />
                            </Columns>
                        </asp:GridView>
                        <asp:Button ID="btn_new_project" runat="server" CssClass="Initial_button_ar" Text="اضافة مشروع جديد" OnClick="btn_new_project_Click"/>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
                                </ContentTemplate>
                            </asp:UpdatePanel>
        </div>
    </form>
</body>
</html>
