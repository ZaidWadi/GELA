<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="designer_user_page.aspx.cs" Inherits="GELA_DB.pages.WebForm4" EnableEventValidation="false" %>

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
        <asp:ScriptManager ID="scrptmgr_design_sup" runat="server" EnablePartialRendering="true"></asp:ScriptManager>
        <div>
             <asp:Timer runat="server" ID="tmr_projects" Interval="10000" OnTick="tmr_projects_Tick"></asp:Timer>
            <table width="80%" align="center" dir="rtl">
                <tr><td>
            <div dir="rtl">
                <asp:Button ID="btn_lang" runat="server" Text="العربية" OnClick="btn_lang_Click" CssClass="Initial_button_ar" />
              <br /><br /><br />
            <asp:Button ID="btn_log_out" runat="server" Text="Log Out" OnClick="btn_log_out_Click" CssClass="Initial_button_ar"/>
            <asp:Button ID="btn_sup" runat="server" Text="Supervisor Page" OnClick="btn_sup_Click" Visible="false" CssClass="Initial_button"/>
                </div>
                    </td></tr>
                </table>
            <br /><br /><br />
    <br /><table width="80%" align="center">
     <tr>
         <td>
          <asp:Button Text="Customers" BorderStyle="None" ID="Tab1" CssClass="Initial_button" runat="server" OnClick="Tab1_Click" />
          <asp:Button Text="Projects Data" BorderStyle="None" ID="Tab2" CssClass="Initial_button" runat="server" onclick="Tab2_Click"/>
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
         $("#search_customers").on("keyup", function () {
             var value = $(this).val().toLowerCase();
             $("#customers_grid tr").filter(function () {
                 $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
             });
         });
     });
</script>
                         <div id="cstmr_div" style="width:contain;max-height:500px;background-color:whitesmoke;overflow:auto;">
                             Search: <asp:TextBox ID="search_customers" Font-Size="12pt" runat="server"></asp:TextBox>
                              <br />         
                              <asp:UpdatePanel runat="server">
                                         <Triggers><asp:AsyncPostBackTrigger ControlID="tmr_projects" /></Triggers>
                                         <ContentTemplate>     
                             <asp:GridView ID="customers_grid" ClientInstanceName="customers_grid_client" runat="server" AutoGenerateColumns="false" CssClass="mydatagrid" PagerStyle-CssClass="pager"
 HeaderStyle-CssClass="header" RowStyle-CssClass="rows" OnSelectedIndexChanged="customers_grid_SelectedIndexChanged"  OnRowDataBound="customers_grid_RowDataBound" ShowHeaderWhenEmpty="true">
                <Columns>
                    <asp:BoundField DataField="customer_ID" headertext="customer ID" />
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
                     <asp:TextBox ID="txtbx_selected_row_project_ID" runat="server" AutoPostBack="true" Visible="false"></asp:TextBox>
                    </ContentTemplate>
                        </asp:updatepanel>
                     <asp:Button ID="new_customer" runat="server" Text="New Customer" OnClick="new_customer_Click" CssClass="Initial_button" />
                     <asp:Button ID="btn_new_project" runat="server" Text="New Project" OnClick="btn_new_project_Click" CssClass="Initial_button" />  
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
                         <div style="width:1700px;max-height:500px;background-color:whitesmoke;overflow:auto;">
                             Search: <asp:TextBox ID="search_projects" Font-Size="12pt" runat="server"></asp:TextBox>
                              <br />                                 
                          <asp:UpdatePanel ID="updt_project_data" runat="server">
                              <Triggers><asp:AsyncPostBackTrigger ControlID="tmr_projects" /></Triggers>
                              <ContentTemplate>
            <asp:GridView ID="projects_grid" runat="server" AutoGenerateColumns="false" CssClass="mydatagrid" PagerStyle-CssClass="pager"
 HeaderStyle-CssClass="header" RowStyle-CssClass="rows" OnSelectedIndexChanged="projects_grid_SelectedIndexChanged1"  OnRowDataBound="projects_grid_row_DataBound" ShowHeaderWhenEmpty="true">
                <Columns>
                    <asp:BoundField DataField="project_ID" headertext="Project ID" />
                    <asp:BoundField DataField="customer_no" HeaderText="Customer Number" />
                    <asp:BoundField DataField="customer" headertext="Customer Name" />
                    <asp:BoundField DataField="project" headertext="Project" />
                    <asp:BoundField DataField="project_status" headertext="Status" />
                    <asp:BoundField DataField="initiation_date" HeaderText="Project Initiation Date" />
                    <asp:BoundField DataField="measuring_eng_name" headertext="Measuring Engineer" />
                    <asp:BoundField DataField="measuring_eng_phone_no" headertext="Measuring Engineer Phone Number" />
                    <asp:BoundField DataField="QA_eng_name" HeaderText="QA engineer" />
                    <asp:BoundField DataField="kitchen_type" headertext="Kitchen Type" />
                    <asp:BoundField DataField="kitchen_height" headertext="Kitchen Height" />
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
                    <asp:BoundField DataField="faucet" HeaderText="Fuacet" />
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
                              <asp:UpdatePanel runat="server" ChildrenAsTriggers="true">
                                  <ContentTemplate>
                              <br /><br /> <asp:Button ID="btn_measurements_taken" runat="server" OnClick="btn_measurements_taken_Click" Text="Measurements Taken" CssClass="Initial_button" />
                              <br /><br /> <asp:Button ID="btn_des_finished" runat="server" OnClick="btn_des_finished_Click" Text="Design Done" Enabled="false" CssClass="Initial_button" />
                              <br /><br /> <asp:Button ID="btn_contact" runat="server" OnClick="btn_contact_Click" Text="Customer Contacted" Enabled="false" CssClass="Initial_button" />
                              <br /><br /> <asp:Button ID="btn_contract_signed" runat="server" OnClick="btn_contract_signed_Click" Text="Contract Signed" Enabled="false" CssClass="Initial_button" />
                              <br /><br /> <asp:Button ID="btn_PO_issued" runat="server" OnClick="btn_PO_issued_Click" Text="Production Order Isuued" Enabled="false" CssClass="Initial_button" />    
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
            <asp:Button ID="btn_add_technical_details" runat="server" Text="Add Technical Details" OnClick="btn_add_technical_details_Click" CssClass="Initial_button" />
            <asp:Button ID="btn_AddCabinets" runat="server" text="Add Cabinets" OnClick="btn_AddCabinets_Click" CssClass="Initial_button" />
            <asp:Button ID="btn_price_offer" runat="server" Text="Price Offer" OnClick="btn_price_offer_Click" CssClass="Initial_button" />
            <asp:Button ID="btn_contract" runat="server" Text="Contract" OnClick="btn_contract_Click" CssClass="Initial_button" />
            <asp:Button ID="btn_contract_refused" runat="server" Text="Request Cancellation" OnClick="btn_contract_refused_Click" CssClass="Initial_button" />
                                <asp:UpdatePanel runat="server">
                                    <ContentTemplate>
            <asp:Label ID="lbl_err_2" runat="server" Text="Please select a project!" Visible="False" CssClass="wronginfo"></asp:Label>
            <asp:Label ID="lbl_err_4" runat="server" Text="Please fill out the project's technical details first!" Visible="False" CssClass="wronginfo"></asp:Label>
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