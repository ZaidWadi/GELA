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
                                         <ContentTemplate>     
                             <asp:GridView ID="customers_grid" ClientInstanceName="customers_grid_client" runat="server" AutoGenerateColumns="false" CssClass="mydatagrid" PagerStyle-CssClass="pager"
 HeaderStyle-CssClass="header" RowStyle-CssClass="rows" ShowHeaderWhenEmpty="true" OnRowCommand="customers_grid_RowCommand">
                <Columns>
                    <asp:TemplateField><ItemTemplate><asp:Button runat="server" Text="View" CssClass="Initial_button" OnClick="Unnamed_Click" CommandName="view" CommandArgument="<%# Container.DataItemIndex %>"/></ItemTemplate></asp:TemplateField>
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
                    </ContentTemplate>
                        </asp:updatepanel>
                     <asp:Button ID="new_customer" runat="server" Text="New Customer" OnClick="new_customer_Click" CssClass="Initial_button" />
                     <asp:Label ID="lbl_err_1" runat="server" Text="Please select a customer!" Visible="False" CssClass="wronginfo"></asp:Label>
                               </asp:View>
            
                </asp:MultiView>
                            </td>
                        </tr>
              </table>
        </div>
    </form>
</body>
</html>