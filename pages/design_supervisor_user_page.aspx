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
            <asp:Timer runat="server" ID="tmr_projects" Interval="10000" OnTick="tmr_projects_Tick"></asp:Timer>
                 <table width="80%" align="center" dir="rtl">
      <tr>
          <td>
              <asp:Button ID="btn_lang" runat="server" Text="العربية" OnClick="btn_lang_Click" CssClass="Initial_button_ar" />
              <br /><br /><br />
            <asp:Button ID="btn_log_out" runat="server" Text="Log Out" OnClick="btn_log_out_Click" CssClass="Initial_button_ar" />
            <asp:Button ID="btn_des" runat="server" Text="Designer Page" OnClick="btn_des_Click" CssClass="Initial_button" />
            <asp:Button ID="btn_add_new_cabinet" runat="server" Text="New Cabinet" OnClick="btn_add_new_cabinet_Click" CssClass="Initial_button_ar" />
            <asp:Button ID="btn_add_raw_materials" runat="server" Text="New Raw Materials" OnClick="btn_add_raw_materials_Click" CssClass="Initial_button_ar" />
          </td>
      </tr>
      </table>
             <br /><br /><br />
      <br /><table width="80%" align="center">
      <tr>
          <td>
          <asp:Button Text="Customers" BorderStyle="None" ID="Tab1" CssClass="Initial_button" runat="server" OnClick="Tab1_Click" />   
          <asp:Button Text="Projects Data" BorderStyle="None" ID="Tab2" CssClass="Initial_button" runat="server" onclick="Tab2_Click"/>
            <asp:Button Text="Employee Reports" BorderStyle="None" ID="Tab3" CssClass="Initial_button" runat="server" OnClick="Tab3_Click"/>
              </td>
          </tr>
      <tr>
          <td>
            <asp:MultiView ID="design_views" runat="server" OnActiveViewChanged="MainView_ActiveViewChanged">
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
                                    <Triggers><asp:AsyncPostBackTrigger ControlID="tmr_projects" /></Triggers>
                                    <ContentTemplate>
                                <asp:GridView ID="customers_grid" ClientInstanceName="customers_grid_client" runat="server" AutoGenerateColumns="false" CssClass="mydatagrid" PagerStyle-CssClass="pager"
 HeaderStyle-CssClass="header" RowStyle-CssClass="rows" OnSelectedIndexChanged="customers_grid_SelectedIndexChanged" OnRowDataBound="customers_grid_RowDataBound" ShowHeaderWhenEmpty="true">
                <Columns>
                    <asp:BoundField DataField="customer_ID" headertext="customer ID" />
                    <asp:BoundField DataField="prefix" headertext="prefix" />
                    <asp:BoundField DataField="customer_name" headertext="Customer Name" />
                    <asp:BoundField DataField="customer_phone_1" headertext="Customer Phone Number" />
                    <asp:BoundField DataField="customer_phone_2" headertext="Secondary Phone number" />
                    <asp:BoundField DataField="city" HeaderText="City" />
                    <asp:BoundField DataField="area" headertext="Area" />
                    <asp:BoundField DataField="address_line" headertext="Address Line" />
                    <asp:BoundField DataField="national_id" headertext="National ID Number"></asp:BoundField>
                    <asp:BoundField DataField="national_id_card_no" HeaderText="Document Number" />
                    <asp:BoundField DataField="building_keeper_phone_no" HeaderText="Building Keeper Phone Number" />
                    <asp:BoundField DataField="notes" HeaderText="Notes" />
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
                     <asp:Button ID="new_customer" runat="server" Text="New Customer" OnClick="new_customer_Click" CssClass="Initial_button" />
                     <asp:Button ID="edit_customer" runat="server" Text="Edit Custoemr" OnClick="edit_customer_Click" CssClass="Initial_button" />
                     <asp:Button ID="btn_new_project" runat="server" Text="New Project" OnClick="btn_new_project_Click" CssClass="Initial_button" />  
                     <asp:Button ID="btn_delete_customer" runat="server" Text="Delete Customer" OnClick="btn_delete_customer_Click" CssClass="Initial_button" />  
                     <asp:Label ID="lbl_err_1" runat="server" Text="Please select a customer!" Visible="False" CssClass="wronginfo"></asp:Label>
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
                      <div id="prjct_div" onscroll="SetDivPosition_1()" style="width:1700px;max-height:500px;background-color:whitesmoke;overflow:auto;">
                          Search: <asp:TextBox ID="search_projects" Font-Size="12pt" runat="server"></asp:TextBox>
                              <br />
                          <asp:UpdatePanel ID="updt_project_data" runat="server">
                               <Triggers><asp:AsyncPostBackTrigger ControlID="tmr_projects" /></Triggers>
                              <ContentTemplate>
            <asp:GridView ID="projects_grid" runat="server" AutoGenerateColumns="false" CssClass="mydatagrid" PagerStyle-CssClass="pager"
 HeaderStyle-CssClass="header" RowStyle-CssClass="rows" OnSelectedIndexChanged="projects_grid_SelectedIndexChanged1" OnRowDataBound="projects_grid_row_DataBound" ShowHeaderWhenEmpty="true">
                <Columns>
                    <asp:BoundField DataField="project_ID" headertext="Project ID" />
                    <asp:BoundField DataField="customer_no" HeaderText="Customer Number" />
                    <asp:BoundField DataField="customer" headertext="Customer Name" />
                    <asp:BoundField DataField="project" headertext="Project" />
                    <asp:BoundField DataField="project_status" headertext="Status" />
                    <asp:BoundField DataField="initiation_date" HeaderText="Project Initiation Date" />
                    <asp:BoundField DataField="measuring_eng_name" headertext="Measuring Engineer" />
                    <asp:BoundField DataField="measuring_eng_phone_no" headertext="Measuring Engineer Phone Number" />
                    <asp:BoundField DataField="designer_name" HeaderText="Designer" />
                    <asp:BoundField DataField="designer_phone_no" HeaderText="Designer phone number" />
                    <asp:BoundField DataField="date_of_measurement" HeaderText="Measurement Date" />
                    <asp:BoundField DataField="design_finish_date" HeaderText="Design Finish Date" />
                    <asp:BoundField DataField="customer_contact_date" HeaderText="Contact Date" />
                    <asp:BoundField DataField="QA_eng_name" HeaderText="QA Engineer" />
                    <asp:BoundField DataField="agreed_on_delivery_date" HeaderText="Project Delivery Date" />
                    <asp:BoundField DataField="production_order_date" HeaderText="Date of Production Order" />
                    <asp:BoundField DataField="production_manager" HeaderText="Production Manager" />
                    <asp:BoundField DataField="project_ID" headertext="Project ID" />
                    <asp:BoundField DataField="kitchen_type" headertext="Kitchen Type" />
                    <asp:BoundField DataField="kitchen_height" headertext="Kitchen Height" />
                    <asp:BoundField DataField="kitchen_design" HeaderText="Design" />
                    <asp:BoundField DataField="inner_body_wood" headertext="Inner Body Wood Type" />
                    <asp:BoundField DataField="double_kitchen_high_upper_cabinets_wood_type" headertext="High Upper Cabinets wood type" />
                    <asp:BoundField DataField="double_kitchen_high_upper_cabinets_color" headertext="High Upper Cabinets wood color" />
                    <asp:BoundField DataField="double_kitchen_low_upper_cabinets_wood_type" headertext="High Lower Cabinets wood type" />
                    <asp:BoundField DataField="double_kitchen_low_upper_cabinets_color" headertext="High Lower Cabinets wood color" />
                    <asp:BoundField DataField="classic_upper_cabinets_wood_type" headertext="Classic Upper Cabinets wood type" />
                    <asp:BoundField DataField="classic_upper_cabinets_color" headertext="Classic Upper Cabinets wood color" />
                    <asp:BoundField DataField="lower_cabinets_wood_type" headertext="Lower Cabinets wood type" />
                    <asp:BoundField DataField="lower_cabinets_color" headertext="Lower Cabinets wood color" />
                    <asp:BoundField DataField="Pantry_cabinets_wood_type" headertext="Pantry Cabinets wood type" />
                    <asp:BoundField DataField="pantry_cabinets_color" headertext="Pantry Cabinets wood color" />
                    <asp:BoundField DataField="hinges_trademark" headertext="Hinges and Rails Trademark"></asp:BoundField>
                    <asp:BoundField DataField="hinges_origin" HeaderText="Hinges and Rails Origin" />
                    <asp:BoundField DataField="sink" HeaderText="Sink" />
                    <asp:BoundField DataField="faucet" HeaderText="Faucet" />
                    <asp:BoundField DataField="granite_type" HeaderText="Granite Type" />
                    <asp:BoundField DataField="granite_name" HeaderText="Granite Name" />
                    <asp:BoundField DataField="top_granite_thickness" HeaderText="Granite Top Thickness" />
                    <asp:BoundField DataField="granite_corners" HeaderText="Granite Corners" />
                    <asp:BoundField DataField="electric_layout" HeaderText="Electric Layout" />
                    <asp:BoundField DataField="sanitary_layout" HeaderText="Sanitary Layout" />
                    <asp:BoundField DataField="lighting_type" HeaderText="Lighting" />
                    <asp:BoundField DataField="hands_type" HeaderText="Hands" />
                    <asp:BoundField DataField="sink_hole_type" HeaderText="Sinkhole" />
                    <asp:BoundField DataField="notes" HeaderText="Notes" />
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
                              <br /><br /> <asp:Button ID="btn_production_done" runat="server" OnClick="btn_production_done_Click" Text="Production Finished" Enabled="false" CssClass="Initial_button"/>
                              <br /><br /> <asp:Button ID="btn_installing_done" runat="server" OnClick="btn_installing_done_Click" Text="Installing Finished" Enabled="false" CssClass="Initial_button"/>
                              <br /><br /><br /> <asp:Label ID="lbl_err_3" runat="server" CssClass="wronginfo" Text="Please select a project!" Visible="false"></asp:Label>
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
            <asp:Button ID="btn_lateness" runat="server" Text="Show Reports" OnClick="btn_lateness_Click" CssClass="Initial_button" />
            <asp:Button ID="btn_edit_project_1" runat="server" Text="Edit Project" OnClick="btn_edit_project_Click" CssClass="Initial_button" />
            <asp:Button ID="btn_add_technical_details" runat="server" Text="Add Technical Details" OnClick="btn_add_technical_details_Click" CssClass="Initial_button" />
            <asp:Button ID="btn_price_offer" runat="server" Text="Price Offer" OnClick="btn_price_offer_Click" CssClass="Initial_button" />
            <asp:Button ID="btn_contract" runat="server" Text="Contract" OnClick="btn_contract_Click" CssClass="Initial_button" />
            <asp:Button ID="btn_production_order" runat="server" Text="Production Order" OnClick="btn_production_order_Click" CssClass="Initial_button" />
            <asp:Button ID="btn_delte_project" runat="server" Text="Delete Project" OnClick="btn_delte_project_Click" CssClass="Initial_button" />  
            <asp:Button ID="btn_AddCabinets" runat="server" text="Add Cabinets" OnClick="btn_AddCabinets_Click" CssClass="Initial_button" />
                                <asp:UpdatePanel runat="server">
                                    <ContentTemplate>
            <asp:Label ID="lbl_err_2" runat="server" Text="Please select a project!" Visible="False" CssClass="wronginfo"></asp:Label>
            <asp:Label ID="lbl_err_4" runat="server" Text="Please fill out the project's technical details first!" Visible="false" CssClass="wronginfo"></asp:Label>
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
                                  <Triggers><asp:AsyncPostBackTrigger ControlID="tmr_projects" /></Triggers>
                                 <ContentTemplate>
                                     
                          <asp:GridView ID="employees_grid" runat="server" AutoGenerateColumns="false" CssClass="mydatagrid" PagerStyle-CssClass="pager"
 HeaderStyle-CssClass="header" RowStyle-CssClass="rows" Width="100%" OnSelectedIndexChanged="employees_grid_SelectedIndexChanged" OnRowDataBound="employees_grid_RowDataBound" ShowHeaderWhenEmpty="true">
                              <Columns>
                    <asp:BoundField DataField="eng_name_ar" headertext="Engineer" />
                    <asp:BoundField DataField="specialization" headertext="Specialization" />
                    <asp:BoundField DataField="counts" HeaderText="Active Projects" />
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
                    <asp:Button ID="btn_view_projects" runat="server" Text="View Employee Projects" OnClick="btn_view_projects_Click" CssClass="Initial_button" />
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
                <Triggers><asp:AsyncPostBackTrigger ControlID="projects_grid" /></Triggers>
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
