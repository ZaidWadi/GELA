<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="production_details.aspx.cs" Inherits="GELA_DB.pages.WebForm16" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet1.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div dir="rtl">
            <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
            <fieldset style="background-color:whitesmoke;">
                <asp:Table runat="server">
                    <asp:TableRow>
                        <asp:TableCell>
                            اسم العميل:
                        </asp:TableCell>
                        <asp:TableCell>
                            <b><asp:Label ID="lbl_customer" runat="server"></asp:Label></b>
                        </asp:TableCell>
                    </asp:TableRow>
                     <asp:TableRow>
                        <asp:TableCell>
                            مدير الانتاج:
                        </asp:TableCell>
                        <asp:TableCell>
                           <b><asp:Label ID="lbl_prod_manager" runat="server"></asp:Label></b>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </fieldset>
             <fieldset style="background-color:whitesmoke;">
                <asp:Table runat="server" CssClass="table">
                    <asp:TableRow CssClass="tr">
                        <asp:TableCell>
                            خشب البودي الداخلي:
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="lbl_inner_body_wood" runat="server"></asp:Label>
                        </asp:TableCell>
                            </asp:TableRow>
                    <asp:TableRow CssClass="tr">
                        <asp:TableCell>
                            خشب الدرف السفلية:
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="lbl_lower_cabinets_wood" runat="server"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                           &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; اللون: &nbsp;&nbsp;
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="lbl_lower_cabinets_color" runat="server"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow CssClass="tr">
                        <asp:TableCell>
                            خشب الدرف العلوية الكلاسيك:
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="lbl_upper_cabinets_wood" runat="server"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                           &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; اللون: &nbsp;&nbsp;
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="lbl_upper_cabinets_color" runat="server"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow CssClass="tr">
                        <asp:TableCell>
                            خشب الدرف العلوية الدبل المنخفضة:
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="lbl_dklh_wood" runat="server"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                           &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; اللون: &nbsp;&nbsp;
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="lbl_dklh_color" runat="server"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow CssClass="tr">
                        <asp:TableCell>
                            خشب الدرف العلوية الدبل المرتفعة
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="lbl_dkuh_wood" runat="server"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                           &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; اللون: &nbsp;&nbsp;
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="lbl_dkuh_color" runat="server"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow CssClass="tr">
                        <asp:TableCell>
                            خشب درف المونة:
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="lbl_pantry_wood" runat="server"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                           &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; اللون: &nbsp;&nbsp;
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="lbl_pantry_color" runat="server"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
             </fieldset>
            <fieldset style="background-color:whitesmoke;">
            <h3>معلومات الانتاج</h3>
            <asp:Table runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:GridView ID="cabinets_grid" runat="server" Width="100%" AutoGenerateColumns="false" CssClass="mydatagrid" PagerStyle-CssClass="pager"
 HeaderStyle-CssClass="header" RowStyle-CssClass="rows">
                            <Columns>
                                <asp:BoundField DataField="product" HeaderText="الخزانة" />
                                <asp:BoundField DataField="width" HeaderText="العرض" />
                                <asp:BoundField DataField="accessories" HeaderText="الاكسسوارات" />
                                <asp:BoundField DataField="devices" HeaderText="الاجهزة" />
                                <asp:BoundField DataField="lighting" HeaderText="نوع الانارة" />
                                <asp:BoundField DataField="lighting_position" HeaderText="مكان الانارة" />
                                <asp:BoundField DataField="lighting_location_type" HeaderText="موقع الانارة" />
                                <asp:BoundField DataField="quantity" HeaderText="الكمية" />
                            </Columns>
                        </asp:GridView>
                    </asp:TableCell>
                </asp:TableRow>
                </asp:Table>
            <asp:Table runat="server" CssClass="table">
                 <asp:TableRow CssClass="tr">
                    <asp:TableCell>
                        المجلى:
                    </asp:TableCell>
                     <asp:TableCell>
                        <asp:Label ID="lbl_sink" runat="server"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow CssClass="tr">
                    <asp:TableCell>
                        البطارية:
                    </asp:TableCell>
                     <asp:TableCell>
                        <asp:Label ID="lbl_faucet" runat="server"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow CssClass="tr">
                    <asp:TableCell>
                        نوع الفصالات والسكك:
                    </asp:TableCell>
                     <asp:TableCell>
                        <asp:Label ID="lbl_hinges" runat="server"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow CssClass="tr">
                    <asp:TableCell>
                        نوع واسم الجرانيت:
                    </asp:TableCell>
                     <asp:TableCell>
                        <asp:Label ID="lbl_granite" runat="server"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow CssClass="tr">
                    <asp:TableCell>
                        تسميكة التوب:
                    </asp:TableCell>
                     <asp:TableCell>
                        <asp:Label ID="lbl_top_thickness" runat="server"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow CssClass="tr">
                    <asp:TableCell>
                        برمة الجرانيت:
                    </asp:TableCell>
                     <asp:TableCell>
                        <asp:Label ID="lbl_granite_corners" runat="server"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow CssClass="tr">
                    <asp:TableCell>
                        الايادي:
                    </asp:TableCell>
                     <asp:TableCell>
                        <asp:Label ID="lbl_hands" runat="server"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow CssClass="tr">
                    <asp:TableCell>
                        فتحة المجلى:
                    </asp:TableCell>
                     <asp:TableCell>
                        <asp:Label ID="lbl_sinkhole" runat="server"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow CssClass="tr">
                    <asp:TableCell>
                        التمديدات الكهربائية:
                    </asp:TableCell>
                     <asp:TableCell>
                        <asp:Label ID="lbl_electric_layout" runat="server"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow CssClass="tr">
                    <asp:TableCell>
                        التمديدات الصحية:
                    </asp:TableCell>
                     <asp:TableCell>
                        <asp:Label ID="lbl_sanitary_layout" runat="server"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow CssClass="tr">
                    <asp:TableCell>
                        فتحةالدكت:
                    </asp:TableCell>
                     <asp:TableCell>
                        <asp:Label ID="lbl_duct" runat="server"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
                </fieldset>
        </div>
    </form>
</body>
</html>
