<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="project_technical_data_ar.aspx.cs" Inherits="GELA_DB.pages.WebForm51" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title></title>
    <link href="StyleSheet1.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" dir="rtl">
        <asp:ScriptManager ID="scrptmgr_project_data_input" runat="server"></asp:ScriptManager>
        <div>
            <br /><br /><br /><br /><br /><br />
            <asp:Table ID="project_metadata" runat="server" CssClass="borderspaces" BackColor="WhiteSmoke">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="auto_id" runat="server" Visible="false"></asp:Label>
            <asp:Label ID="order_id" runat="server">رقم المشروع: </asp:Label>
            <asp:Label ID="lbl_OrderID" runat="server"></asp:Label><br />
                            </asp:TableCell>
                        </asp:TableRow>
                         <asp:TableRow>
                        </asp:TableRow>
                </asp:Table>
            <fieldset class="loginpagefieldset">
            <h3>تفاصيل المشروع:</h3>
                <asp:Table ID="technical_specs" runat="server" CssClass="borderspaces">
                    <asp:TableRow>   
                        <asp:TableCell>
                            <asp:UpdatePanel ID="updt_kitchen_type" runat="server">
                                <ContentTemplate>
            <asp:Label ID="lbl_KitchenType" runat="server">نوع المطبخ: </asp:Label>
            <asp:DropDownList ID="dlst_KitchenType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="dlst_KitchenType_SelectedIndexChanged"></asp:DropDownList>
                           </ContentTemplate>
                            </asp:UpdatePanel>
                                </asp:TableCell>
                        <asp:TableCell>
                            <asp:UpdatePanel ID="updt_kitchen_hieght" runat="server" UpdateMode="Conditional">
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="dlst_KitchenType"/>
                                </Triggers>
                                <ContentTemplate>  
            <asp:Label ID="lbl_KitchenHeight" runat="server">ارتفاع المطبخ: </asp:Label>
            <asp:TextBox ID="txtbx_KitchenHeight" runat="server" AutoPostBack="true" Enabled="false"></asp:TextBox>
    
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </asp:TableCell>
                        <asp:TableCell>
            <asp:Label ID="lbl_Design" runat="server">الموديل: </asp:Label>
            <asp:DropDownList ID="dlst_Design" runat="server"></asp:DropDownList>
                           </asp:TableCell>
                            </asp:TableRow>
                     <asp:TableRow>
                         <asp:TableCell>
            <asp:Label ID="lbl_InnerBodyWood" runat="server">خشب البودي الداخلي: </asp:Label>
            <asp:DropDownList ID="dlst_InnerBodyWood" runat="server"></asp:DropDownList>
                    </asp:TableCell>
                             </asp:TableRow>
                    <asp:TableRow>
                         <asp:TableCell>
                             <asp:UpdatePanel ID="updt_dkhuwood" runat="server" UpdateMode="Conditional">
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="dlst_KitchenType"/>
                                </Triggers>
                                <ContentTemplate>
            <asp:Label ID="lbl_DKHUCabinets" runat="server">خشب الدرف للخزائن العلوية المرتفعة موديل الدبل: </asp:Label>
            <asp:DropDownList ID="dlst_DKHUCabinets" runat="server" Enabled="false" AutoPostBack="true"></asp:DropDownList>
                                    </ContentTemplate>
                            </asp:UpdatePanel>
                             </asp:TableCell>
                        <asp:TableCell>
                             <asp:UpdatePanel ID="updt_dkhucolor" runat="server" UpdateMode="Conditional">
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="dlst_KitchenType"/>
                                </Triggers>
                                <ContentTemplate>
            <asp:Label ID="lbl_DKHUCabinetsColor" runat="server">اللون: </asp:Label>
            <asp:TextBox ID="txtbx_DKHUCabinetsColor" runat="server" Enabled="false" AutoPostBack="true"></asp:TextBox>
                           </ContentTemplate>
                            </asp:UpdatePanel>
                                    </asp:TableCell>
                        <asp:TableCell></asp:TableCell>
                        </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:UpdatePanel ID="updt_dkluwood" runat="server" UpdateMode="Conditional">
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="dlst_KitchenType"/>
                                </Triggers>
                                <ContentTemplate>
            <asp:Label ID="lbl_DKLUCabinets" runat="server">خشب الدرف العلوية المنخفضة موديل الدبل: </asp:Label>
            <asp:DropDownList ID="dlst_DKLUCabinets" runat="server" Enabled="false" AutoPostBack="true"></asp:DropDownList>
                           </ContentTemplate>
                            </asp:UpdatePanel>
                                    </asp:TableCell>
                            <asp:TableCell>
                                <asp:UpdatePanel ID="updt_dklucolor" runat="server" UpdateMode="Conditional">
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="dlst_KitchenType"/>
                                </Triggers>
                                <ContentTemplate>
            <asp:Label ID="lbl_DKLUCabinetsColor" runat="server">اللون: </asp:Label>
            <asp:TextBox ID="txtbx_DKLUCabinetsColor" runat="server" Enabled="false" AutoPostBack="true"></asp:TextBox>
                           </ContentTemplate>
                            </asp:UpdatePanel>
                                    </asp:TableCell>
                        <asp:TableCell></asp:TableCell>
                                </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
            <asp:Label ID="lbl_ClassicUpperCabinets" runat="server">خشب الخزائن العلوية الكلاسيك: </asp:Label>
            <asp:DropDownList ID="dlst_ClassicUpperCabinets" runat="server"></asp:DropDownList>
                            </asp:TableCell>
                        
                            <asp:TableCell>
            <asp:Label ID="lbl_ClassicUpperCabinetsColor" runat="server">اللون: </asp:Label>
            <asp:TextBox ID="txtbx_ClassicUpperCabinetsColor" runat="server"></asp:TextBox>
                            </asp:TableCell>
                        <asp:TableCell></asp:TableCell>
                                </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
            <asp:Label ID="lbl_LowerCabinets" runat="server">خشب الخزائن السفلية: </asp:Label>
            <asp:DropDownList ID="dlst_LowerCabinets" runat="server"></asp:DropDownList>
                            </asp:TableCell>
                            <asp:TableCell>
            <asp:Label ID="lbl_LowerCabinetsColor" runat="server">اللون: </asp:Label>
            <asp:TextBox ID="txtbx_LowerCabinetsColor" runat="server"></asp:TextBox>
                                </asp:TableCell>
                            </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
            <asp:Label ID="lbl_PantryCabinets" runat="server">خشب خزائن المونة: </asp:Label>
            <asp:DropDownList ID="dlst_PantryCabinets" runat="server"></asp:DropDownList>
            </asp:TableCell>
                            <asp:TableCell>
            <asp:Label ID="lbl_PantryCabinetsColor" runat="server">اللون: </asp:Label>
            <asp:TextBox ID="txtbx_PantyCabinetsColor" runat="server"></asp:TextBox>
                           </asp:TableCell>
                            </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                             <asp:UpdatePanel ID="updt_hingestrdmrk" runat="server">
                                <ContentTemplate>
            <asp:Label ID="lbl_HingesTrademark" runat="server">الفصالات: </asp:Label>
            <asp:DropDownList ID="dlst_HingesTrademark" runat="server" AutoPostBack="true" OnSelectedIndexChanged="dlst_HingesTrademark_SelectedIndexChanged"></asp:DropDownList>
                          </ContentTemplate>
                                    </asp:UpdatePanel>
                                    </asp:TableCell>
                            <asp:TableCell>
                                <asp:UpdatePanel ID="updt_hingesorigin" runat="server" UpdateMode="Conditional">
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="dlst_HingesTrademark"/>
                                </Triggers>
                                <ContentTemplate>  
            <asp:Label ID="lbl_HingesOrigin" runat="server">منشأ الفصالات: </asp:Label>
            <asp:TextBox ID="txtbx_HingesOrigin" runat="server" Enabled="false" AutoPostBack="true"></asp:TextBox>
                              </ContentTemplate>
                                    </asp:UpdatePanel>
                                    </asp:TableCell>
                            </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                        <asp:Label ID="lbl_sink" runat="server">المجلى:</asp:Label>
                        <asp:DropDownList ID="dlst_sink" runat="server"></asp:DropDownList>
                        </asp:TableCell>
                        <asp:TableCell>
                        <asp:Label ID="lbl_faucet" runat="server">البطارية:</asp:Label>
                        <asp:DropDownList ID="dlst_faucet" runat="server"></asp:DropDownList>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="dlst_GraniteType"/>
                                </Triggers>
                                <ContentTemplate>
            <asp:Label ID="lbl_GraniteType" runat="server">نوع الجرانيت: </asp:Label>
            <asp:DropDownList ID="dlst_GraniteType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="dlst_GraniteType_SelectedIndexChanged"></asp:DropDownList>
                       </ContentTemplate>
                            </asp:UpdatePanel>
                                    </asp:TableCell>
                            <asp:TableCell>
            <asp:Label ID="lbl_GraniteName" runat="server">اسم الجرانيت: </asp:Label>
            <asp:TextBox ID="txtbx_GraniteName" runat="server"></asp:TextBox>
                                </asp:TableCell>
                            </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:UpdatePanel ID="updt_lowerpanelgranite" runat="server" UpdateMode="Conditional">
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="dlst_GraniteType"/>
                                </Triggers>
                                <ContentTemplate>
            <asp:Label ID="lbl_LowerPanel" runat="server">جرانيت البانيل السفلي: </asp:Label>
            <asp:TextBox ID="txtbx_LowerPanel" runat="server" Enabled="false" AutoPostBack="true"></asp:TextBox>
                          </ContentTemplate>
                            </asp:UpdatePanel>
                                    </asp:TableCell>
                            <asp:TableCell>
                                <asp:UpdatePanel ID="updt_upperpanelgranite" runat="server" UpdateMode="Conditional">
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="dlst_GraniteType"/>
                                </Triggers>
                                <ContentTemplate>
            <asp:Label ID="lbl_UpperPanel" runat="server">جرانيت البانيل العلوي: </asp:Label>
            <asp:TextBox ID="txtbx_UpperPanel" runat="server" Enabled="false" AutoPostBack="true"></asp:TextBox>
                               </ContentTemplate>
                            </asp:UpdatePanel>
                                    </asp:TableCell>
                                <asp:TableCell>
            <asp:Label ID="lbl_GraniteCorners" runat="server">برمة زوايا الجرانيت: </asp:Label>
            <asp:DropDownList ID="dlst_GraniteCorners" runat="server"></asp:DropDownList>
                                </asp:TableCell>
                                </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
            <asp:Label ID="lbl_SinkHole" runat="server">فتحة المجلى: </asp:Label>
            <asp:DropDownList ID="dlst_SinkHole" runat="server"></asp:DropDownList>
                            </asp:TableCell>
                            <asp:TableCell>
            <asp:Label ID="lbl_GraniteTopThickness" runat="server">تسميكة التوب: </asp:Label>
            <asp:DropDownList ID="dlst_GraniteTopThickness" runat="server"></asp:DropDownList>
                            </asp:TableCell>
                                </asp:TableRow>
                     <asp:TableRow>
                        <asp:TableCell>
            <asp:Label ID="lbl_ElectricLayout" runat="server">التمديدات الكهربائية: </asp:Label>
            <asp:DropDownList ID="dlst_ElectricLayout" runat="server"></asp:DropDownList>
                            </asp:TableCell>
                            <asp:TableCell>
            <asp:Label ID="lbl_SanitaryLayout" runat="server">التمديدات الصحية: </asp:Label>
            <asp:DropDownList ID="dlst_SanitaryLayout" runat="server"></asp:DropDownList>
                            </asp:TableCell>
                                </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
            <asp:Label ID="lbl_LightingType" runat="server">الانارة: </asp:Label>
            <asp:DropDownList ID="dlst_LightingType" runat="server"></asp:DropDownList>
                            </asp:TableCell>
                            <asp:TableCell>
            <asp:Label ID="lbl_HandsType" runat="server">الأيادي: </asp:Label>
            <asp:DropDownList ID="dlst_HandsType" runat="server"></asp:DropDownList>
                                </asp:TableCell>
                                <asp:TableCell>
            <asp:Label ID="lbl_DuctOpening" runat="server">فتحة الدكت: </asp:Label>
            <asp:DropDownList ID="dlst_DuctOpening" runat="server"></asp:DropDownList>
                            </asp:TableCell>
                                </asp:TableRow>
                    </asp:Table>
                </fieldset>
            <br /><h3>ملاحظات:</h3>
            <asp:TextBox ID="txtbx_Notes" runat="server" TextMode="MultiLine" Width="800px" Height="300px"></asp:TextBox> <br /><br /><br /><br />
            <asp:Table ID="btns" runat="server" CssClass="borderspaces">
                <asp:TableRow>
                    <asp:TableCell>
            <asp:Button ID="btn_AddCabinets" runat="server" text="ادخال الخزائن" OnClick="btn_AddCabinets_Click" CssClass="Initial_button_ar" />
               </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="btn_done" runat="server" Text="انتهى" OnClick="btn_Done_Click" CssClass="Initial_button_ar" />
                    </asp:TableCell>
                </asp:TableRow>
                        </asp:Table>
        </div>
    </form>
</body>
</html>
