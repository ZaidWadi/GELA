<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="order_details_input_ar.aspx.cs" Inherits="GELA_DB.pages.WebForm49" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <link href="StyleSheet1.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server" dir="rtl">
      <asp:ScriptManager ID="scrptmgr_project_data_input" runat="server"></asp:ScriptManager>
        <div>
            <br /><br /><br /><br /><br /><br /><br />
            <asp:gridview ID="grd_debugging" runat="server"></asp:gridview>
            <asp:Button ID="debug" runat="server" Text="debug" OnClick="debug_Click" Visible="false" />
            <fieldset class="loginpagefieldset">
               <asp:Table runat="server"><asp:TableRow><asp:TableCell>
            <asp:Label ID="lbl_project_id" runat="server">رقم المشروع: </asp:Label>
            <asp:Label ID="project_id" runat="server"></asp:Label>
                </asp:TableCell></asp:TableRow></asp:Table>
            </fieldset>
            <fieldset class="loginpagefieldset">
                <asp:Table ID="order_entry" runat="server" CssClass="borderspaces">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:UpdatePanel ID="updt_product" runat="server">
                                <ContentTemplate>
                                    <asp:Label ID="lbl_product" runat="server">الخزانة:</asp:Label>
                                    <asp:DropDownList ID="dlst_product" runat="server" AutoPostBack="true" OnSelectedIndexChanged="dlst_product_SelectedIndexChanged"></asp:DropDownList>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="lbl_width" runat="server">العرض:</asp:Label>
                            <asp:TextBox ID="txtbx_width" runat="server"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:UpdatePanel ID="updt_accessories" runat="server">
                                <ContentTemplate>
                                    <asp:Label ID="lbl_accessories" runat="server">الاكسسوارات:</asp:Label>
                                    <asp:DropDownList ID="dlst_accessories" runat="server"></asp:DropDownList>
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
                                    <asp:Label ID="lbl_devices" runat="server">الاجهزة:</asp:Label>
                                    <asp:DropDownList ID="dlst_devices" runat="server" Enabled="false" AutoPostBack="true"></asp:DropDownList>
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
                                    <asp:Label ID="lbl_lighting" runat="server">الانارة:</asp:Label>
                                    <asp:DropDownList ID="dlst_lighting" runat="server"></asp:DropDownList>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:UpdatePanel ID="updt_lighting_pos" runat="server">
                                <ContentTemplate>
                                    <asp:Label ID="lbl_lighting_pos" runat="server">موقع الانارة:</asp:Label>
                                    <asp:DropDownList ID="dlst_lighting_pos" runat="server"></asp:DropDownList>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </asp:TableCell>
                         <asp:TableCell>
                            <asp:UpdatePanel ID="updt_lighting_place" runat="server">
                                <ContentTemplate>
                                    <asp:Label ID="lbl_lighting_place" runat="server">قاعدة الانارة:</asp:Label>
                                    <asp:DropDownList ID="dlst_lighting_place" runat="server"></asp:DropDownList>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lbl_quantity" runat="server">الكمية:</asp:Label>
                            <asp:TextBox ID="txtbx_quantity" runat="server"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    </asp:Table>
                <asp:Table runat="server">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Button ID="btn_add_cabinet" runat="server" Text="اضافة" OnClick="btn_add_cabinet_Click" CssClass="Initial_button_ar" />
                            &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btn_delete" runat="server" Text="حذف" OnClick="btn_delete_Click" CssClass="Initial_button_ar"/>
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
                            <asp:BoundField DataField="cabinet_entry_ID" HeaderText="رقم الخزانة" />
                            <asp:BoundField DataField="product" HeaderText="اسم الخزانة" />
                            <asp:BoundField DataField="width" HeaderText="العرض" />
                            <asp:BoundField DataField="accessories" HeaderText="الاكسسوارات" />
                            <asp:BoundField DataField="devices" HeaderText="الاجهزة" />
                            <asp:BoundField DataField="lighting" HeaderText="الانارة" />
                            <asp:BoundField DataField="lighting_position" HeaderText="موقع الانارة" />
                            <asp:BoundField DataField="lighting_location_type" HeaderText="قاعدة الانارة" />
                            <asp:BoundField DataField="quantity" HeaderText="الكمية" />
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
                            <asp:Button ID="btn_done" runat="server" Text="انتهى" OnClick="btn_done_Click" CssClass="Initial_button_ar" />
                           <br /> <asp:Label ID="lbl_required" runat="server" CssClass="wronginfo" Text="الرجاء ملئ حقول العرض والكمية!" Visible="false"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </fieldset>
        </div>
    </form>
</body>
</html>
