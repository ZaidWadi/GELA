<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="designer_user_page_ar.aspx.cs" Inherits="GELA_DB.pages.WebForm40" %>

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
        <div>
             <asp:Timer runat="server" ID="tmr_projects" Interval="10000" OnTick="tmr_projects_Tick"></asp:Timer>
            <table width="80%" align="center" dir="rtl">
                <tr><td>
            <div dir="rtl">
            <asp:Button ID="btn_lang" runat="server" Text="English" OnClick="btn_lang_Click" CssClass="Initial_button_ar" />
                <br /><br /><br />
            <asp:Button ID="btn_log_out" runat="server" Text="تسجيل الخروج" OnClick="btn_log_out_Click" CssClass="Initial_button_ar"/>
            <asp:Button ID="btn_sup" runat="server" Text="العودة لصفحة المشرف" OnClick="btn_sup_Click" Visible="false" CssClass="Initial_button"/>
                </div>
                    </td></tr>
                </table>
            <br /><br /><br />
    <br /><table width="80%" align="center" dir="rtl">
     <tr>
         <td dir="rtl">
          <asp:Button Text="الزبائن" BorderStyle="None" ID="Tab1" CssClass="Initial_button_ar" runat="server" OnClick="Tab1_Click" />
          <asp:Button Text="المشاريع" BorderStyle="None" ID="Tab2" CssClass="Initial_button_ar" runat="server" onclick="Tab2_Click"/>
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
                         
                         <div id="cstmr_div" style="width:1850px;max-height:500px;background-color:whitesmoke;overflow:auto;">
                             البحث: <asp:TextBox ID="search_customers" Font-Size="12pt" runat="server"></asp:TextBox>
                              <br />    
                              <asp:UpdatePanel runat="server">
                                         <Triggers><asp:AsyncPostBackTrigger ControlID="tmr_projects" /></Triggers>
                                         <ContentTemplate>
                             <asp:GridView ID="customers_grid" runat="server" AutoGenerateColumns="false" CssClass="mydatagrid" PagerStyle-CssClass="pager"
 HeaderStyle-CssClass="header" RowStyle-CssClass="rows" OnSelectedIndexChanged="customers_grid_SelectedIndexChanged"  OnRowDataBound="customers_grid_RowDataBound" ShowHeaderWhenEmpty="true">
                <Columns>
                    <asp:BoundField DataField="customer_ID" headertext="رقم التعريف" />
                    <asp:BoundField DataField="prefix" headertext="البادئة" />
                    <asp:BoundField DataField="customer_name" headertext="الاسم" />
                    <asp:BoundField DataField="customer_phone_1" headertext="رقم الهاتف" />
                </Columns>

                              <SelectedRowStyle BackColor="LightGreen" ForeColor="DarkGreen" Font-Bold="true" />
                                 
                              </asp:GridView>
                                             </ContentTemplate>
                                     </asp:UpdatePanel>
                                </div>
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
                     <asp:Button ID="btn_new_project" runat="server" Text="اضافة مشروع جديد" OnClick="btn_new_project_Click" CssClass="Initial_button_ar" />  
                     <asp:Label ID="lbl_err_1" runat="server" Text="الرجاء اختيار زبون من القائمة!" Visible="False" CssClass="wronginfo"></asp:Label>
                               </asp:View>
            <asp:View ID="projects_view" runat="server" OnLoad="projects_view_Load1" >
                   <br /><br />
                    <table style="background-color:whitesmoke; width: 100%; border-width: 1px; border-color: #666; border-style: none">
                <tr>
                  <td>
                      
 <script>
     $(document).ready(function () {
         $("#search_projects").on("keyup", function () {
             var value = $(this).val().toLowerCase();
             $("#projects_grid tr").filter(function () {
                 $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
             });
         });
     });
 </script>
                         <div style="width:1700px;max-height:500px;background-color:whitesmoke;overflow:auto;">
                             البحث: <asp:TextBox ID="search_projects" Font-Size="12pt" runat="server"></asp:TextBox>
                              <br />      
                             
                          <asp:UpdatePanel ID="updt_project_data" runat="server">
                              <Triggers><asp:AsyncPostBackTrigger ControlID="tmr_projects" /></Triggers>
                              <ContentTemplate>
            <asp:GridView ID="projects_grid" runat="server" AutoGenerateColumns="false" CssClass="mydatagrid" PagerStyle-CssClass="pager"
 HeaderStyle-CssClass="header" RowStyle-CssClass="rows" OnSelectedIndexChanged="projects_grid_SelectedIndexChanged1"  OnRowDataBound="projects_grid_row_DataBound" ShowHeaderWhenEmpty="true">
                <Columns>
                    <asp:BoundField DataField="project_ID" headertext="رقم التعريف للمشروع" />
                    <asp:BoundField DataField="customer_no" HeaderText="رقم التعريف للزبون" />
                    <asp:BoundField DataField="customer" headertext="اسم الزبون" />
                    <asp:BoundField DataField="project" headertext="المشروع" />
                    <asp:BoundField DataField="project_status" headertext="حالة المشروع" />
                    <asp:BoundField DataField="initiation_date" HeaderText="تاريخ الزيارة" />
                    <asp:BoundField DataField="measuring_eng_name" headertext="مهندس المقاس" />
                    <asp:BoundField DataField="measuring_eng_phone_no" headertext="رقم هاتف مهندس المقاس" />
                    <asp:BoundField DataField="QA_eng_name" HeaderText="مهندس ضبط الجودة" />
                    <asp:BoundField DataField="kitchen_type" headertext="نوع المطبخ" />
                    <asp:BoundField DataField="kitchen_height" headertext="ارتفاع المطبخ" />
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
                                  Project Progression:
                              <asp:UpdatePanel runat="server">
                                  <ContentTemplate>
                              <br /><br /> <asp:Button ID="btn_measurements_taken" runat="server" OnClick="btn_measurements_taken_Click" Text="تم اخذ المقاس" CssClass="Initial_button_ar" />
                              <br /><br /> <asp:Button ID="btn_des_finished" runat="server" OnClick="btn_des_finished_Click" Text="تم انهاء التصميم" Enabled="false" CssClass="Initial_button_ar" />
                              <br /><br /> <asp:Button ID="btn_contact" runat="server" OnClick="btn_contact_Click" Text="تم التواصل مع الزبون" Enabled="false" CssClass="Initial_button_ar" />
                              <br /><br /> <asp:Button ID="btn_contract_signed" runat="server" OnClick="btn_contract_signed_Click" Text="تم توقيع العقد" Enabled="false" CssClass="Initial_button_ar" />
                                           <asp:Button ID="btn_contract_refused" runat="server" Text="رفض العقد" OnClick="btn_contract_refused_Click" Enabled="false" CssClass="Initial_button_ar" />
                              <br /><br /> <asp:Button ID="btn_PO_issued" runat="server" OnClick="btn_PO_issued_Click" Text="تم اصدار أمر الانتاج" Enabled="false" CssClass="Initial_button_ar" />    
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
            <asp:Button ID="btn_add_technical_details" runat="server" Text="اضافة تفاصيل المشروع" OnClick="btn_add_technical_details_Click" CssClass="Initial_button_ar" />
            <asp:Button ID="btn_AddCabinets" runat="server" text="ادخال الخزائن" OnClick="btn_AddCabinets_Click" CssClass="Initial_button_ar" />
            <asp:Button ID="btn_price_offer" runat="server" Text="اخراج عرض السعر" OnClick="btn_price_offer_Click" CssClass="Initial_button_ar" />
            <asp:Button ID="btn_contract" runat="server" Text="اخراج عقد المبيعات" OnClick="btn_contract_Click" CssClass="Initial_button_ar" />
                                <asp:UpdatePanel runat="server">
                                    <ContentTemplate>
            <asp:Label ID="lbl_err_2" runat="server" Text="الرجاء اختيار مشروع من القائمة!" Visible="False" CssClass="wronginfo"></asp:Label>
            <asp:Label ID="lbl_err_4" runat="server" Text="الرجاء تعبئة تفاصيل المشروع قبل ادخال الخزائن!" Visible="false" CssClass="wronginfo"></asp:Label>
                                          </ContentTemplate>
                                </asp:UpdatePanel>
                                </td>
            </tr>
                        </table>
                                </asp:View>
                </asp:MultiView>
                            </td>
                        </tr>
              </table>
        </div>
    </form>
</body>
</html>
