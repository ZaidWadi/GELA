<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="order_details_input.aspx.cs" Inherits="GELA_DB.pages.WebForm6" %>

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
    <form id="form1" runat="server">
      <asp:ScriptManager ID="scrptmgr_project_data_input" runat="server"></asp:ScriptManager>
        <div>
            <br /><br /><br /><br /><br /><br /><br />
            <asp:gridview ID="grd_debugging" runat="server"></asp:gridview>
            <asp:Button ID="debug" runat="server" Text="debug" OnClick="debug_Click" Visible="false" />
            <fieldset class="loginpagefieldset">
               <asp:Table runat="server"><asp:TableRow><asp:TableCell>
            <asp:Label ID="Label1" runat="server" Visible="false"> </asp:Label>
            <asp:Label ID="k_t" runat="server" Visible="false"></asp:Label>
            <asp:Label ID="lbl_project_id" runat="server">Project ID: </asp:Label>
            <asp:Label ID="project_id" runat="server"></asp:Label>
                </asp:TableCell></asp:TableRow></asp:Table>
            </fieldset>
            <fieldset class="loginpagefieldset">
                <asp:Table ID="order_entry" runat="server" CssClass="borderspaces">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:UpdatePanel ID="updt_product" runat="server">
                                <ContentTemplate>
                                    <asp:Label ID="lbl_product" runat="server">Product:</asp:Label>
                                    <asp:DropDownList ID="dlst_product" runat="server" ToolTip="Select" AutoPostBack="true" OnSelectedIndexChanged="dlst_product_SelectedIndexChanged"></asp:DropDownList>
                                        <script>
                                            $(document).ready(function () { $("#dlst_product").select2(); });
                                        </script>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="lbl_width" runat="server">Width:</asp:Label>
                            <asp:TextBox ID="txtbx_width" runat="server"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:UpdatePanel ID="updt_accessories" runat="server">
                                <ContentTemplate>
                                    <asp:Label ID="lbl_accessories" runat="server">Accessories:</asp:Label>
                                    <asp:DropDownList ID="dlst_accessories" runat="server" ToolTip="Select"></asp:DropDownList>
                                    <script>
                                        $(document).ready(function () { $("#dlst_accessories").select2(); });
                                    </script>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <asp:UpdatePanel runat="server">
                                <Triggers><asp:AsyncPostBackTrigger ControlID="dlst_accessories" /></Triggers>
                                <ContentTemplate>
                                    <asp:TextBox ID="selected_accessory" runat="server" Visible="false"></asp:TextBox>
                                    </ContentTemplate>
                            </asp:UpdatePanel>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:UpdatePanel ID="updt_devices" runat="server">
                                <Triggers><asp:AsyncPostBackTrigger ControlID="dlst_product" /></Triggers>
                                <ContentTemplate>
                                    <asp:Label ID="lbl_devices" runat="server">Devices:</asp:Label>
                                    <asp:DropDownList ID="dlst_devices" runat="server" Enabled="false" AutoPostBack="true" ToolTip="Select"></asp:DropDownList>
                                    <script>
                                        $(document).ready(function () { $("#dlst_devices").select2(); });
                                    </script>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <asp:UpdatePanel runat="server">
                                <Triggers><asp:AsyncPostBackTrigger ControlID="dlst_devices" /></Triggers>
                                <ContentTemplate>
                            <asp:TextBox ID="selected_device" runat="server" Visible="false"></asp:TextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:UpdatePanel ID="updt_lighting" runat="server">
                                <ContentTemplate>
                                    <asp:Label ID="lbl_lighting" runat="server">Lighting:</asp:Label>
                                    <asp:DropDownList ID="dlst_lighting" runat="server" ToolTip="Select"></asp:DropDownList>                                     
                                    <script>
                                        $(document).ready(function () { $("#dlst_lighting").select2(); });
                                    </script>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:UpdatePanel ID="updt_lighting_pos" runat="server">
                                <ContentTemplate>
                                    <asp:Label ID="lbl_lighting_pos" runat="server">Lighting Position:</asp:Label>
                                    <asp:DropDownList ID="dlst_lighting_pos" runat="server" ToolTip="Select"></asp:DropDownList>
                                    <script>
                                        $(document).ready(function () { $("#dlst_lighting_pos").select2(); });
                                    </script>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </asp:TableCell>
                         <asp:TableCell>
                            <asp:UpdatePanel ID="updt_lighting_place" runat="server">
                                <ContentTemplate>
                                    <asp:Label ID="lbl_lighting_place" runat="server">Lighting Place:</asp:Label>
                                    <asp:DropDownList ID="dlst_lighting_place" runat="server" ToolTip="Select"></asp:DropDownList>
                                    <script>
                                        $(document).ready(function () { $("#dlst_lighting_place").select2(); });
                                    </script>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lbl_quantity" runat="server">Quantity:</asp:Label>
                            <asp:TextBox ID="txtbx_quantity" runat="server"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    </asp:Table>
                <asp:Table runat="server">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Button ID="btn_add_cabinet" runat="server" Text="Add Cabinet" OnClick="btn_add_cabinet_Click" CssClass="Initial_button" />
                            &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btn_delete" runat="server" Text="Delete" OnClick="btn_delete_Click" CssClass="Initial_button"/>
                        </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                <br />
                    <asp:Table runat="server">
                    <asp:TableRow>
                        <asp:TableCell>
                          
                            <div style="width:1850px;background-color:whitesmoke; overflow:auto;max-height:500px">
                                <asp:UpdatePanel runat="server">
                                    <ContentTemplate>
                            <asp:GridView ID="cabinets_grid" runat="server" AutoGenerateColumns="false" CssClass="mydatagrid" PagerStyle-CssClass="pager"
 HeaderStyle-CssClass="header" RowStyle-CssClass="rows" ShowHeaderWhenEmpty="true" Width="100%" OnRowDataBound="cabinets_grid_RowDataBound" OnSelectedIndexChanged="cabinets_grid_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="cabinet_entry_ID" HeaderText="Cabinet ID" />
                            <asp:BoundField DataField="product" HeaderText="Cabinet" />
                            <asp:BoundField DataField="width" HeaderText="Width" />
                            <asp:BoundField DataField="accessories" HeaderText="Accessories" />
                            <asp:BoundField DataField="devices" HeaderText="Devices" />
                            <asp:BoundField DataField="lighting" HeaderText="Lighting" />
                            <asp:BoundField DataField="lighting_position" HeaderText="Lighting Position" />
                            <asp:BoundField DataField="lighting_location_type" HeaderText="Lighting Location Type" />
                            <asp:BoundField DataField="quantity" HeaderText="Quantity" />
                        </Columns>
                                <SelectedRowStyle BackColor="LightGreen" ForeColor="DarkGreen" Font-Bold="true" />
                                                 </asp:GridView>
                                        </ContentTemplate>
                                </asp:UpdatePanel>
                                </div>
                                        
                                </asp:TableCell>

                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:UpdatePanel runat="server">
                                <Triggers><asp:AsyncPostBackTrigger ControlID="cabinets_grid" /></Triggers>
                                <ContentTemplate>
                            <asp:TextBox ID="txbx_selected_row" runat="server"  AutoPostBack="true" Visible="false"></asp:TextBox>
                                    </ContentTemplate>
                            </asp:UpdatePanel>
                            <asp:Button ID="btn_done" runat="server" Text="Done" OnClick="btn_done_Click" CssClass="Initial_button" />
                           <br /> <asp:Label ID="lbl_required" runat="server" CssClass="wronginfo" Text="Please fill quantity and width fields!" Visible="false"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </fieldset>
        </div>
    </form>
</body>
</html>
