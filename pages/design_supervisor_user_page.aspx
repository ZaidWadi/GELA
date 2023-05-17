<%@ Page Language="C#" MaintainScrollPositionOnPostBack="true" AutoEventWireup="true" CodeBehind="design_supervisor_user_page.aspx.cs" Inherits="GELA_DB.pages.WebForm22" EnableEventValidation="false" %>

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
    
    <form id="form1" runat="server" >
        <asp:ScriptManager ID="scrptmgr_design_sup" runat="server"></asp:ScriptManager>
        <div>
                 <table width="80%" align="center" dir="rtl">
      <tr>
          <td>
              <asp:Button ID="btn_lang" runat="server" Text="العربية" OnClick="btn_lang_Click" CssClass="Initial_button_ar" />
              <br /><br /><br />
              <asp:Label ID="directory" runat="server"></asp:Label>
            <asp:Button ID="btn_log_out" runat="server" Text="Log Out" OnClick="btn_log_out_Click" CssClass="Initial_button_ar" />
            <asp:Button ID="btn_des" runat="server" Text="Designer Page" OnClick="btn_des_Click" CssClass="Initial_button" />
            <asp:Button ID="btn_add_new_cabinet" runat="server" Text="New Cabinet" OnClick="btn_add_new_cabinet_Click" CssClass="Initial_button_ar" />
            <asp:Button ID="btn_add_raw_materials" runat="server" Text="New Raw Materials" OnClick="btn_add_raw_materials_Click" CssClass="Initial_button_ar" />
            <asp:Button ID="btn_export_to_excel" runat="server" Text="Export Data To Excel" CssClass="Initial_button_ar" OnClick="btn_export_to_excel_Click" />
          </td>
      </tr>
      </table>
             <br /><br /><br />
      <br /><table width="80%" align="center">
      <tr>
          <td>
          <asp:Button Text="Customers" BorderStyle="None" ID="Tab1" CssClass="Initial_button" runat="server" OnClick="Tab1_Click" />   
            <asp:Button Text="Employee Reports" BorderStyle="None" ID="Tab3" CssClass="Initial_button" runat="server" OnClick="Tab3_Click"/>
              </td>
          </tr>
      <tr>
          <td>
            <asp:MultiView ID="design_views" runat="server">
                    <asp:View ID="default_view" runat="server">
                    <table style="background-color:whitesmoke; width: 100%; border-width: 1px; border-color: #666; border-style: none">
                    <tr>
                      <td>
                          <span>Hello <asp:Label ID="lbl_name" runat="server"></asp:Label>!</span>
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
                                   $("#search_clients").on("keyup", function () {
                                       var value = $(this).val().toLowerCase();
                                       $("#customers_grid tr").filter(function () {
                                           $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                                       });
                                   });
                               });
                           </script>
                            <div id="cstmr_div" onscroll="SetDivPosition()" style="width:1850px;background-color:whitesmoke;overflow:auto;max-height:500px;">
                         Search: <asp:TextBox ID="search_clients" Font-Size="12pt" runat="server"></asp:TextBox>
                              <br />
                                <asp:UpdatePanel runat="server">
                                    <ContentTemplate>
                                <asp:GridView ID="customers_grid" ClientInstanceName="customers_grid_client" runat="server" AutoGenerateColumns="false" CssClass="mydatagrid" PagerStyle-CssClass="pager"
 HeaderStyle-CssClass="header" RowStyle-CssClass="rows" OnSelectedIndexChanged="customers_grid_SelectedIndexChanged" OnRowDataBound="customers_grid_RowDataBound" ShowHeaderWhenEmpty="true">
                <Columns>
                    <asp:BoundField DataField="customer_ID" headertext="customer ID" />
                    <asp:BoundField DataField="showroom" headertext="Showroom" />
                    <asp:BoundField DataField="prefix" headertext="prefix" />
                    <asp:BoundField DataField="customer_name" headertext="Customer Name" />
                    <asp:BoundField DataField="customer_phone_1" headertext="Customer Phone Number" />
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
                     <asp:Button ID="new_customer" runat="server" Text="New Customer" OnClick="new_customer_Click" CssClass="Initial_button" />
                     <asp:Button ID="btn_delete_customer" runat="server" Text="Delete Customer" OnClick="btn_delete_customer_Click" CssClass="Initial_button" />  
                     <asp:Label ID="lbl_err_1" runat="server" Text="Please select a customer!" Visible="False" CssClass="wronginfo"></asp:Label>
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
                         <div id="emp_div" onscroll="SetDivPosition_2()" style="width:1850px;max-height:500px;background-color:whitesmoke;overflow:auto;">
                             Search: <asp:TextBox ID="search_employees" Font-Size="12pt" runat="server"></asp:TextBox>
                              <br />
                             <asp:UpdatePanel runat="server">
                                 <ContentTemplate>
                                     
                          <asp:GridView ID="employees_grid" runat="server" AutoGenerateColumns="false" CssClass="mydatagrid" PagerStyle-CssClass="pager"
 HeaderStyle-CssClass="header" RowStyle-CssClass="rows" Width="100%" OnSelectedIndexChanged="employees_grid_SelectedIndexChanged" OnRowDataBound="employees_grid_RowDataBound" ShowHeaderWhenEmpty="true">
                              <Columns>
                    <asp:BoundField DataField="eng_name_ar" headertext="Engineer" />
                    <asp:BoundField DataField="specialization" headertext="Specialization" />
                </Columns>
                    <SelectedRowStyle BackColor="LightGreen" ForeColor="DarkGreen" Font-Bold="true" />
                           </asp:GridView>
                                      </ContentTemplate>
                             </asp:UpdatePanel>
                          </div>
                      </td>
                    </tr>
                  </table>
                    <asp:Button ID="btn_new_employee" runat="server" Text="New Employee" OnClick="new_employee_Click" CssClass="Initial_button" />
                    <asp:Button ID="btn_edit_employee" runat="server" Text="Edit Employee" OnClick="btn_edit_employee_Click" CssClass="Initial_button" />
                    <asp:Button ID="btn_remove_employee" runat="server" Text="Delete Employee" OnClick="remove_employee_Click" CssClass="Initial_button" />
                    <asp:Label ID="lbl_choose_employee" runat="server" Text="Please choose an employee!" Visible="false" CssClass="wronginfo"></asp:Label>
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
          <tr>
              <td>
                  <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <asp:TextBox ID="txtbx_selected_kitchen_type" Visible="false" runat="server" AutoPostBack="true"></asp:TextBox>
                </ContentTemplate>
                </asp:UpdatePanel>
              </td>
          </tr>
    </table>
        </div>
    </form>
    <script type="text/javascript">
        window.onload = function () {
            var strCook = document.cookie;
            if (strCook.indexOf("!~") != 0) {
                var intS = strCook.indexOf("!~");
                var intE = strCook.indexOf("~!");
                var strPos = strCook.substring(intS + 2, intE);
                document.getElementById("cstmr_div").scrollTop = strPos;
            }
        }
        function SetDivPosition() {
            var intY = document.getElementById("cstmr_div").scrollTop;
            document.cookie = "yPos=!~" + intY + "~!";
        }
    </script>
    <script type="text/javascript">
        window.onload = function () {
            var strCook = document.cookie;
            if (strCook.indexOf("!~") != 0) {
                var intS = strCook.indexOf("!~");
                var intE = strCook.indexOf("~!");
                var strPos = strCook.substring(intS + 2, intE);
                document.getElementById("prjct_div").scrollTop = strPos;
            }
        }
        function SetDivPosition_1() {
            var intY = document.getElementById("prjct_div").scrollTop;
            document.cookie = "yPos=!~" + intY + "~!";
        }
    </script>
    <script type="text/javascript">
        window.onload = function () {
            var strCook = document.cookie;
            if (strCook.indexOf("!~") != 0) {
                var intS = strCook.indexOf("!~");
                var intE = strCook.indexOf("~!");
                var strPos = strCook.substring(intS + 2, intE);
                document.getElementById("emp_div").scrollTop = strPos;
            }
        }
        function SetDivPosition_2() {
            var intY = document.getElementById("emp_div").scrollTop;
            document.cookie = "yPos=!~" + intY + "~!";
        }
    </script>
</body>
</html>
