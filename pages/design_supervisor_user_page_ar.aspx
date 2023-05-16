<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="design_supervisor_user_page_ar.aspx.cs" EnableEventValidation="false" Inherits="GELA_DB.pages.WebForm39" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <link href="StyleSheet1.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />

<script src="../Scripts/jquery-3.6.0.min.js"></script>
<script src="../Scripts/bootstrap.min.js"></script>
<script src="../Scripts/select2.min.js"></script>

<link href="../Content/css/select2.css" rel="stylesheet" />

<meta name="viewport" content="width=device-width, initial-scale=1" />
    <title></title>
</head>
<body>
    
    <br /><br /><br /><br />
    
    <form id="form1" runat="server" dir="rtl">
        <asp:ScriptManager ID="scrptmgr_design_sup" runat="server"></asp:ScriptManager>
        <div dir="rtl">
                 <table width="80%" align="center" dir="rtl">
      <tr>
          <td>
            <asp:Button ID="btn_lang" runat="server" Text="English" OnClick="btn_lang_Click" CssClass="Initial_button_ar" />
              <br /><br /><br />
            <asp:Button ID="btn_log_out" runat="server" Text="تسجيل الخروج" OnClick="btn_log_out_Click" CssClass="Initial_button_ar" />
            <asp:Button ID="btn_des" runat="server" Text="صفحة المصمم" OnClick="btn_des_Click" CssClass="Initial_button" />
            <asp:Button ID="btn_add_new_cabinet" runat="server" Text="اضافة خزائن" OnClick="btn_add_new_cabinet_Click" CssClass="Initial_button_ar" />
            <asp:Button ID="btn_add_raw_materials" runat="server" Text="اضافة مواد أولية" OnClick="btn_add_raw_materials_Click" CssClass="Initial_button_ar" />
            <asp:Button ID="btn_export_to_excel" runat="server" Text="اخراج معلومات المشروع إلى Excel" CssClass="Initial_button_ar" OnClick="btn_export_to_excel_Click" />
          </td>
      </tr>
      </table>
             <br /><br /><br />
      <br /><table width="80%" align="center" dir="rtl">
      <tr dir="rtl">
          <td dir="rtl">
          <asp:Button Text="الزبائن" BorderStyle="None" ID="Tab1" CssClass="Initial_button_ar" runat="server" OnClick="Tab1_Click" />   
          <asp:Button Text="المشاريع" BorderStyle="None" ID="Tab2" CssClass="Initial_button_ar" runat="server" onclick="Tab2_Click"/>
            <asp:Button Text="الموظفين" BorderStyle="None" ID="Tab3" CssClass="Initial_button_ar" runat="server" OnClick="Tab3_Click"/>
              </td>
          </tr>
      <tr>
          <td>
            <asp:MultiView ID="design_views" runat="server" OnActiveViewChanged="MainView_ActiveViewChanged">
                    <asp:View ID="default_view" runat="server">
                    <table style="background-color:whitesmoke; width: 100%; border-width: 1px; border-color: #666; border-style: none">
                    <tr>
                      <td>
                          <span>مرحباً <asp:Label ID="lbl_name" runat="server"></asp:Label>!</span>
                      </td>
                    </tr>
                  </table>
                 </asp:View>
                 <asp:View ID="customers_view" runat="server" OnLoad="customers_view_Load">
                    <table style="background-color:whitesmoke; width: 100%; border-width: 1px; border-color: #666; border-style: none">
                    <tr>
                      <td>
                                     <asp:UpdatePanel ID="updt_customers_grid" runat="server" >
                                         <ContentTemplate>         
 <script>
                               $(document).ready(function () {
                                   $("#search_customers").on("keyup", function () {
                                       var value = $(this).val().toLowerCase();
                                       $("#customers_grid tr").filter(function () {
                                           $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                                       });
                                   });
                               });
 </script>
                         <div style="width:1850px;max-height:500px;background-color:whitesmoke;overflow:auto;">
                             البحث: <asp:TextBox ID="search_customers" Font-Size="12pt" runat="server"></asp:TextBox>
                              <br />      
                             <asp:UpdatePanel runat="server" ChildrenAsTriggers="true">
                             <Triggers><asp:AsyncPostBackTrigger ControlID="customers_grid" /></Triggers>
                             <ContentTemplate>
                                <asp:GridView ID="customers_grid" ClientInstanceName="customers_grid_client" runat="server" AutoGenerateColumns="false" CssClass="mydatagrid" PagerStyle-CssClass="pager"
 HeaderStyle-CssClass="header" RowStyle-CssClass="rows" OnSelectedIndexChanged="customers_grid_SelectedIndexChanged" OnRowDataBound="customers_grid_RowDataBound" ShowHeaderWhenEmpty="true">
                <Columns>
                    <asp:BoundField DataField="customer_ID" headertext="رقم التعريف" />
                    <asp:BoundField DataField="showroom" headertext="المعرض" />
                    <asp:BoundField DataField="prefix" headertext="البادئة" />
                    <asp:BoundField DataField="customer_name" headertext="الاسم" />
                    <asp:BoundField DataField="customer_phone_1" headertext="رقم الهاتف" />
                    <asp:BoundField DataField="customer_phone_2" headertext="رقم الهاتف الثانوي" />
                    <asp:BoundField DataField="city" HeaderText="المدينة" />
                    <asp:BoundField DataField="area" headertext="المنطقة" />
                    <asp:BoundField DataField="address_line" headertext="تفاصيل العنوان" />
                    <asp:BoundField DataField="national_id" headertext="الرقم الوطني"></asp:BoundField>
                    <asp:BoundField DataField="national_id_card_no" HeaderText="رقم الوثيقة" />
                    <asp:BoundField DataField="building_keeper_phone_no" HeaderText="رقم حارس المبنى" />
                    <asp:BoundField DataField="notes" HeaderText="الملاحظات" />
                </Columns>

                              <SelectedRowStyle BackColor="LightGreen" ForeColor="DarkGreen" Font-Bold="true" />
                                 
                              </asp:GridView>
                                  </ContentTemplate>
                         </asp:UpdatePanel>
                                </div>
                                    
                                               </ContentTemplate>
                                     </asp:UpdatePanel>
                      </td>
                    </tr>
                  </table>
                     <asp:updatepanel runat="server">
                         <Triggers><asp:AsyncPostBackTrigger ControlID="customers_grid" /></Triggers>
                         <ContentTemplate>
                     <asp:TextBox ID="txtbx_selected_row_ID" runat="server" AutoPostBack="true" Visible="false"></asp:TextBox>
                     <asp:TextBox ID="txtbx_selected_row_name" runat="server" AutoPostBack="true" Visible="false"></asp:TextBox>
                     <asp:TextBox ID="txtbx_selected_row_city" runat="server" AutoPostBack="true" Visible="false"></asp:TextBox>
                    </ContentTemplate>
                        </asp:updatepanel>
                     <asp:Button ID="new_customer" runat="server" Text="اضافة زبون جديد" OnClick="new_customer_Click" CssClass="Initial_button_ar" />
                     <asp:Button ID="edit_customer" runat="server" Text="التعديل على الزبون" OnClick="edit_customer_Click" CssClass="Initial_button_ar" />
                     <asp:Button ID="btn_delete_customer" runat="server" Text="حذف الزيون" OnClick="btn_delete_customer_Click" CssClass="Initial_button_ar" />  
                     <asp:Label ID="lbl_err_1" runat="server" Text="الرجاء اختيار زبون من القائمة!" Visible="False" CssClass="wronginfo"></asp:Label>
                               </asp:View>
            
               
                <asp:View ID="employees_view" runat="server" OnLoad="employees_view_Load">
                    <table style="background-color:whitesmoke; width: 100%; border-width: 1px; border-color: #666; border-style: none">
                    <tr>
                      <td>
                                 <br />
<script>
    $(document).ready(function () {
        $("#search_employees").on("keyup", function () {
            var value = $(this).val().toLowerCase();
            $("#employees_grid tr").filter(function () {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });
    });
</script>
                         <div style="width:1850px;max-height:500px;background-color:whitesmoke;overflow:auto;">
                             البحث: <asp:TextBox ID="search_employees" Font-Size="12pt" runat="server"></asp:TextBox>                             <asp:UpdatePanel runat="server">
                                 <ContentTemplate>
                                     
                          <asp:GridView ID="employees_grid" runat="server" AutoGenerateColumns="false" CssClass="mydatagrid" PagerStyle-CssClass="pager"
 HeaderStyle-CssClass="header" RowStyle-CssClass="rows" Width="100%" OnSelectedIndexChanged="employees_grid_SelectedIndexChanged" OnRowDataBound="employees_grid_RowDataBound" ShowHeaderWhenEmpty="true">
                              <Columns>
                    <asp:BoundField DataField="eng_name_ar" headertext="اسم الموظف" />
                    <asp:BoundField DataField="specialization" headertext="المجال" />
                    <asp:BoundField DataField="counts" HeaderText="عدد المشاريع" />
                </Columns>
                    <SelectedRowStyle BackColor="LightGreen" ForeColor="DarkGreen" Font-Bold="true" />
                           </asp:GridView>
                                      </ContentTemplate>
                             </asp:UpdatePanel>
                          </div>
                      </td>
                    </tr>
                  </table>
                    <asp:Button ID="btn_new_employee" runat="server" Text="اضافة موظف جديد" OnClick="new_employee_Click" CssClass="Initial_button_ar" />
                    <asp:Button ID="btn_edit_employee" runat="server" Text="التعديل على الموظف" OnClick="btn_edit_employee_Click" CssClass="Initial_button_ar" />
                    <asp:Button ID="btn_remove_employee" runat="server" Text="حذف الموظف" OnClick="remove_employee_Click" CssClass="Initial_button_ar" />
                    <asp:Label ID="lbl_choose_employee" runat="server" Text="الرجاء اختيار موظف من القائمة!" Visible="false" CssClass="wronginfo"></asp:Label>
                    <asp:UpdatePanel runat="server">
                        <Triggers><asp:AsyncPostBackTrigger ControlID="employees_grid" /></Triggers>
                        <ContentTemplate>
                            <asp:TextBox ID="txtbx_employee_name" runat="server" visible="false"></asp:TextBox>
                            <asp:TextBox ID="txtbx_dept" runat="server" visible="false"></asp:TextBox>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                               </asp:View>
                </asp:MultiView>
              </td>
          </tr>
    </table>
        </div>
    </form>
</body>
</html>
