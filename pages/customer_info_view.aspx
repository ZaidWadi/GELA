<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="customer_info_view.aspx.cs" Inherits="GELA_DB.pages.WebForm52" %>

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
    <br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
    <form id="form1" runat="server">
        <asp:ScriptManager ID="scrptmgr_design_sup" runat="server"></asp:ScriptManager>
        <div style="background-color:whitesmoke">
            <h3>Customer's Info:</h3>
        <br />
            <asp:UpdatePanel runat="server" ChildrenAsTriggers="true">
                            <ContentTemplate>
            <asp:Table runat="server">
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">
                        ID:
                    </asp:TableCell>
                    <asp:TableCell runat="server">
                        <asp:Label ID="lbl_customer_ID" runat="server"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell runat="server">
                        <asp:Button ID="btn_edit" runat="server" CssClass="Initial_button" Text="Edit" OnClick="btn_edit_Click" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                     <asp:TableCell>
                        Showroom:
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
                        Phone Number:
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Textbox ID="txtbx_phone_1" runat="server" Enabled="false"></asp:Textbox>
                    </asp:TableCell>
                     </asp:TableRow>
                <asp:TableRow runat="server">
                     <asp:TableCell>
                        Secondary Phone Number:
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Textbox ID="txtbx_phone_2" runat="server" Enabled="false"></asp:Textbox>
                    </asp:TableCell>
                     </asp:TableRow>
                <asp:TableRow runat="server">
                     <asp:TableCell>
                        City:
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="dlst_city" runat="server" Enabled="false"></asp:DropDownList>
                    </asp:TableCell>
                     </asp:TableRow>
                 <asp:TableRow runat="server">
                     <asp:TableCell>
                        Area:
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="dlst_area" runat="server" Enabled="false"></asp:DropDownList>
                    </asp:TableCell>
                     </asp:TableRow>
                 <asp:TableRow runat="server">
                     <asp:TableCell>
                        Address Line:
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtbx_address" runat="server" Enabled="false"></asp:TextBox>
                    </asp:TableCell>
                     </asp:TableRow>
                <asp:TableRow runat="server">
                     <asp:TableCell>
                        National ID:
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtbx_nat_id" runat="server" Enabled="false"></asp:TextBox>
                    </asp:TableCell>
                     </asp:TableRow>
                <asp:TableRow runat="server">
                     <asp:TableCell>
                        Notes:
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
                </asp:Table>
                                <br /><br />
                                <h3>Customer's Projects:</h3>
        <br />
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
                              <ContentTemplate>
                        <asp:GridView ID="projects_grid" runat="server" AutoGenerateColumns="false" CssClass="mydatagrid" PagerStyle-CssClass="pager"
 HeaderStyle-CssClass="header" RowStyle-CssClass="rows" OnRowDataBound="projects_grid_RowDataBound" ShowHeaderWhenEmpty="true">
                            <Columns>
                                <asp:TemplateField><ItemTemplate><asp:Button ID="btn_view" runat="server" Text="View" CssClass="Initial_button" OnClick="btn_view_Click" /></ItemTemplate></asp:TemplateField>
                                <asp:BoundField DataField="project_ID" headertext="Project ID" />
                                <asp:BoundField DataField="project" headertext="Product" />
                                <asp:BoundField DataField="initiation_date" headertext="Initiation Date" />
                            </Columns>
                        </asp:GridView>
                                  </ContentTemplate>
                              </asp:UpdatePanel>
                        <asp:Button ID="btn_new_project" runat="server" CssClass="Initial_button" Text="New Project" OnClick="btn_new_project_Click"/>
                    
            
                                </ContentTemplate>
                            </asp:UpdatePanel>
        </div>
    </form>
</body>
</html>
