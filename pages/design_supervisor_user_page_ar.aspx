<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="design_supervisor_user_page_ar.aspx.cs" EnableEventValidation="false" Inherits="GELA_DB.pages.WebForm39" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <link href="StyleSheet1.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    
    <br /><br /><br /><br />
    
    <form id="form1" runat="server" dir="rtl">
        <asp:ScriptManager ID="scrptmgr_design_sup" runat="server"></asp:ScriptManager>
        <div dir="rtl">
            <asp:Timer runat="server" ID="tmr_projects" Interval="10000" OnTick="tmr_projects_Tick"></asp:Timer>
                 <table width="80%" align="center" dir="rtl">
      <tr>
          <td>
            <asp:Button ID="btn_lang" runat="server" Text="English" OnClick="btn_lang_Click" CssClass="Initial_button_ar" />
              <br /><br /><br />
            <asp:Button ID="btn_log_out" runat="server" Text="تسجيل الخروج" OnClick="btn_log_out_Click" CssClass="Initial_button_ar" />
            <asp:Button ID="btn_des" runat="server" Text="صفحة المصمم" OnClick="btn_des_Click" CssClass="Initial_button" />
            <asp:Button ID="btn_add_new_cabinet" runat="server" Text="اضافة خزائن" OnClick="btn_add_new_cabinet_Click" CssClass="Initial_button_ar" />
            <asp:Button ID="btn_add_raw_materials" runat="server" Text="اضافة مواد أولية" OnClick="btn_add_raw_materials_Click" CssClass="Initial_button_ar" />
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
                        <h3>
                          <span>مرحباً <asp:Label ID="lbl_name" runat="server"></asp:Label>!</span>
                        </h3>
                      </td>
                    </tr>
                  </table>
                 </asp:View>
                 <asp:View ID="customers_view" runat="server" OnLoad="customers_view_Load">
                    <table style="background-color:whitesmoke; width: 100%; border-width: 1px; border-color: #666; border-style: none">
                    <tr>
                      <td>
                                     <asp:UpdatePanel ID="updt_customers_grid" runat="server" >
                                          <Triggers><asp:AsyncPostBackTrigger ControlID="tmr_projects" /></Triggers>
                                         <ContentTemplate>         
                        <h3>
                            <div style="width:1850px;background-color:whitesmoke;overflow:auto;max-height:500px;">
                         <asp:UpdatePanel runat="server" ChildrenAsTriggers="true">
                             <Triggers><asp:AsyncPostBackTrigger ControlID="customers_grid" /></Triggers>
                             <ContentTemplate>
                                <asp:GridView ID="customers_grid" ClientInstanceName="customers_grid_client" runat="server" AutoGenerateColumns="false" CssClass="mydatagrid" PagerStyle-CssClass="pager"
 HeaderStyle-CssClass="header" RowStyle-CssClass="rows" OnSelectedIndexChanged="customers_grid_SelectedIndexChanged" OnRowDataBound="customers_grid_RowDataBound" ShowHeaderWhenEmpty="true">
                <Columns>
                    <asp:BoundField DataField="customer_ID" headertext="رقم التعريف" />
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
                                    
                        </h3>
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
                     <asp:TextBox ID="txtbx_selected_row_project_ID" runat="server" AutoPostBack="true" Visible="false"></asp:TextBox>
                    </ContentTemplate>
                        </asp:updatepanel>
                     <asp:Button ID="new_customer" runat="server" Text="اضافة زبون جديد" OnClick="new_customer_Click" CssClass="Initial_button_ar" />
                     <asp:Button ID="edit_customer" runat="server" Text="التعديل على الزبون" OnClick="edit_customer_Click" CssClass="Initial_button_ar" />
                     <asp:Button ID="btn_new_project" runat="server" Text="اضافة مشروع جديد" OnClick="btn_new_project_Click" CssClass="Initial_button_ar" />  
                     <asp:Button ID="btn_delete_customer" runat="server" Text="حذف الزيون" OnClick="btn_delete_customer_Click" CssClass="Initial_button_ar" />  
                     <asp:Label ID="lbl_err_1" runat="server" Text="الرجاء اختيار زبون من القائمة!" Visible="False" CssClass="wronginfo"></asp:Label>
                               </asp:View>
            <asp:View ID="projects_view" runat="server" OnLoad="projects_view_Load1" >
                   <br /><br />
                    <table style="background-color:whitesmoke; width: 100%; border-width: 1px; border-color: #666; border-style: none">
                <tr>
                  <td>
                      <div style="width:1700px;max-height:500px;background-color:whitesmoke;overflow:auto;">
                          <asp:UpdatePanel ID="updt_project_data" runat="server">
                               <Triggers><asp:AsyncPostBackTrigger ControlID="tmr_projects" /></Triggers>
                              <ContentTemplate>
            <asp:GridView ID="projects_grid" runat="server" AutoGenerateColumns="false" CssClass="mydatagrid" PagerStyle-CssClass="pager"
 HeaderStyle-CssClass="header" RowStyle-CssClass="rows" OnSelectedIndexChanged="projects_grid_SelectedIndexChanged1" OnRowDataBound="projects_grid_row_DataBound" ShowHeaderWhenEmpty="true">
                <Columns>
                    <asp:BoundField DataField="project_ID" headertext="رقم التعريف للمشروع" />
                    <asp:BoundField DataField="customer_no" HeaderText="رقم التعريف للزبون" />
                    <asp:BoundField DataField="customer" headertext="اسم الزبون" />
                    <asp:BoundField DataField="project" headertext="المشروع" />
                    <asp:BoundField DataField="project_status" headertext="حالة المشروع" />
                    <asp:BoundField DataField="initiation_date" HeaderText="تاريخ الزيارة" />
                    <asp:BoundField DataField="measuring_eng_name" headertext="مهندس المقاس" />
                    <asp:BoundField DataField="measuring_eng_phone_no" headertext="رقم هاتف مهندس المقاس" />
                    <asp:BoundField DataField="designer_name" HeaderText="المصمم" />
                    <asp:BoundField DataField="designer_phone_no" HeaderText="رقم هاتف المصمم" />
                    <asp:BoundField DataField="date_of_measurement" HeaderText="تاريخ أخذ المقاس" />
                    <asp:BoundField DataField="design_finish_date" HeaderText="تاريخ انهاء التصميم" />
                    <asp:BoundField DataField="customer_contact_date" HeaderText="تاريخ التواصل مع العميل" />
                    <asp:BoundField DataField="QA_eng_name" HeaderText="مهندس ضبط الجودة" />
                    <asp:BoundField DataField="agreed_on_delivery_date" HeaderText="تاريخ الانهاء المتفق عليه" />
                    <asp:BoundField DataField="production_order_date" HeaderText="تاريخ اصدار أمر الانتاج" />
                    <asp:BoundField DataField="production_manager" HeaderText="مدير الانتاج" />
                    <asp:BoundField DataField="kitchen_type" headertext="نوع المطبخ" />
                    <asp:BoundField DataField="kitchen_height" headertext="ارتفاع المطبخ" />
                    <asp:BoundField DataField="kitchen_design" HeaderText="التصميم" />
                    <asp:BoundField DataField="inner_body_wood" headertext="خشب البودي الداخلي" />
                    <asp:BoundField DataField="double_kitchen_high_upper_cabinets_wood_type" headertext="خشب الخزائن العلوية المرتفعة لموديل الدبل" />
                    <asp:BoundField DataField="double_kitchen_high_upper_cabinets_color" headertext="لون الخزائن العلوية المرتفعة لموديل الدبل" />
                    <asp:BoundField DataField="double_kitchen_low_upper_cabinets_wood_type" headertext="خشب الخزائن العلوية المنخفضة لموديل الدبل" />
                    <asp:BoundField DataField="double_kitchen_low_upper_cabinets_color" headertext="لون الخزائن العلوية المنخفضة لموديل الدبل" />
                    <asp:BoundField DataField="classic_upper_cabinets_wood_type" headertext="خشب الخزائن العلوية الكلاسيك" />
                    <asp:BoundField DataField="classic_upper_cabinets_color" headertext="لون الخزائن العلوية الكلاسيك" />
                    <asp:BoundField DataField="lower_cabinets_wood_type" headertext="خشب الخزائن السفلية" />
                    <asp:BoundField DataField="lower_cabinets_color" headertext="لون الخزائن السفلية" />
                    <asp:BoundField DataField="Pantry_cabinets_wood_type" headertext="خشب خزائن المونة" />
                    <asp:BoundField DataField="pantry_cabinets_color" headertext="لون خزائن المونة" />
                    <asp:BoundField DataField="hinges_trademark" headertext="ماركة الفصالات والسكك"></asp:BoundField>
                    <asp:BoundField DataField="hinges_origin" HeaderText="منشأ الفصالات والسكك" />
                    <asp:BoundField DataField="sink" HeaderText="المجلى" />
                    <asp:BoundField DataField="faucet" HeaderText="البطارية" />
                    <asp:BoundField DataField="granite_type" HeaderText="نوع الجرانيت" />
                    <asp:BoundField DataField="granite_name" HeaderText="اسم الجرانيت" />
                    <asp:BoundField DataField="top_granite_thickness" HeaderText="تسميكة التوب" />
                    <asp:BoundField DataField="granite_corners" HeaderText="برمة زوايا الجرانيت" />
                    <asp:BoundField DataField="electric_layout" HeaderText="التمديدات الكهربائية" />
                    <asp:BoundField DataField="sanitary_layout" HeaderText="التمديدات الصحية" />
                    <asp:BoundField DataField="lighting_type" HeaderText="الانارة" />
                    <asp:BoundField DataField="hands_type" HeaderText="الأيادي" />
                    <asp:BoundField DataField="sink_hole_type" HeaderText="فتحة المجلى" />
                    <asp:BoundField DataField="notes" HeaderText="ملاحظات" />
                </Columns>
                <SelectedRowStyle BackColor="LightGreen" ForeColor="DarkGreen" Font-Bold="true" />
            </asp:GridView>
                                                                </ContentTemplate>
                          </asp:UpdatePanel>
                          </div>
                  </td>
                    <td>
                                  مراحل المشروع:
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                              <br /><br /> <asp:Button ID="btn_production_done" runat="server" OnClick="btn_production_done_Click" Text="تم انهاء الانتاج" Enabled="false" CssClass="Initial_button_ar"/>
                              <br /><br /> <asp:Button ID="btn_installing_done" runat="server" OnClick="btn_installing_done_Click" Text="تم التسليم" Enabled="false" CssClass="Initial_button_ar"/>
                              <br /><br /><br /> <asp:Label ID="lbl_err_3" runat="server" CssClass="wronginfo" Text="الرجاء اختيار مشروع من القائمة!" Visible="false"></asp:Label>
                                                             </ContentTemplate>
                        </asp:UpdatePanel>

                                </td>
                </tr>
                        <tr>
                            <td>
                                  <asp:updatepanel runat="server">
                         <Triggers><asp:AsyncPostBackTrigger ControlID="projects_grid" /></Triggers>
                         <ContentTemplate>
                     <asp:TextBox ID="txtbx_customer_id" runat="server" AutoPostBack="true" Visible="false"></asp:TextBox>
                             </ContentTemplate>
                        </asp:updatepanel>
            <asp:Button ID="btn_lateness" runat="server" Text="اظهار التقارير" OnClick="btn_lateness_Click" CssClass="Initial_button_ar" />
            <asp:Button ID="btn_edit_project_1" runat="server" Text="التعديل على المشروع" OnClick="btn_edit_project_Click" CssClass="Initial_button_ar" />
            <asp:Button ID="btn_add_technical_details" runat="server" Text="اضافة تفاصيل المشروع" OnClick="btn_add_technical_details_Click" CssClass="Initial_button_ar" />
            <asp:Button ID="btn_price_offer" runat="server" Text="اخراج عرض سعر" OnClick="btn_price_offer_Click" CssClass="Initial_button_ar" />
            <asp:Button ID="btn_contract" runat="server" Text="اخراج عقد بيع" OnClick="btn_contract_Click" CssClass="Initial_button_ar" />
            <asp:Button ID="btn_production_order" runat="server" Text="اخراج تفاصيل الانتاج" OnClick="btn_production_order_Click" CssClass="Initial_button_ar" />
            <asp:Button ID="btn_delte_project" runat="server" Text="حذف المشروع" OnClick="btn_delte_project_Click" CssClass="Initial_button_ar" />  
                                <asp:UpdatePanel runat="server">
                                    <ContentTemplate>
            <asp:Label ID="lbl_err_2" runat="server" Text="الرجاء اختيار مشروع من القائمة!" Visible="False" CssClass="wronginfo"></asp:Label>
                                          </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
              </table>
                </asp:View>
               
                <asp:View ID="employees_view" runat="server" OnLoad="employees_view_Load">
                    <table style="background-color:whitesmoke; width: 100%; border-width: 1px; border-color: #666; border-style: none">
                    <tr>
                      <td>
                                 <br />
                         <div style="width:1850px;max-height:500px;background-color:whitesmoke;overflow:auto;">
                             <asp:UpdatePanel runat="server">
                                  <Triggers><asp:AsyncPostBackTrigger ControlID="tmr_projects" /></Triggers>
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
                    <asp:Button ID="btn_view_projects" runat="server" Text="عرض مشاريع الموظف" OnClick="btn_view_projects_Click" CssClass="Initial_button_ar" />
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
