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
        <asp:ScriptManager ID="scrptmgr_design_sup" runat="server" EnablePartialRendering="true"></asp:ScriptManager>
        <div>
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
             </td>
         </tr>
        <tr>
            <td>
            <asp:MultiView ID="design_views" runat="server">
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
                                         <ContentTemplate>
                             <asp:GridView ID="customers_grid" runat="server" AutoGenerateColumns="false" CssClass="mydatagrid" PagerStyle-CssClass="pager"
 HeaderStyle-CssClass="header" RowStyle-CssClass="rows" OnSelectedIndexChanged="customers_grid_SelectedIndexChanged"  OnRowDataBound="customers_grid_RowDataBound" ShowHeaderWhenEmpty="true">
                <Columns>
                    <asp:TemplateField><ItemTemplate><asp:Button runat="server" Text="عرض" CssClass="Initial_button" OnClick="Unnamed_Click" CommandName="view" CommandArgument="<%# Container.DataItemIndex %>"/></ItemTemplate></asp:TemplateField>
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
                    </ContentTemplate>
                        </asp:updatepanel>
                     <asp:Button ID="new_customer" runat="server" Text="اضافة زبون جديد" OnClick="new_customer_Click" CssClass="Initial_button_ar" />
                     <asp:Label ID="lbl_err_1" runat="server" Text="الرجاء اختيار زبون من القائمة!" Visible="False" CssClass="wronginfo"></asp:Label>
                               </asp:View>
            
                </asp:MultiView>
                            </td>
                        </tr>
              </table>
        </div>
    </form>
</body>
</html>
