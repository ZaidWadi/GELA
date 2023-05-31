<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="project_info_view_ar.aspx.cs" Inherits="GELA_DB.pages.WebForm55" %>

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
    <form id="form1" runat="server" dir="rtl">
        <asp:ScriptManager ID="scrptmgr_project_data_input" runat="server"></asp:ScriptManager>
        <div>
            <asp:UpdatePanel ID="updt_form" runat="server" ChildrenAsTriggers="true">
                <ContentTemplate>
            <br /><br /><br /><br /><br /><br /><br />
                    <asp:Table runat="server">
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Button ID="btn_edit" runat="server" Text="تعديل" CssClass="Initial_button_ar" OnClick="btn_edit_Click"/>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
            <br />
                    <asp:Panel ID="pnl_form" runat="server" Enabled="false">
            <h3>المعلومات الأساسية:</h3>
            <fieldset class="loginpagefieldset">
                <asp:Table ID="project_metadata" runat="server" CssClass="borderspaces">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="auto_id" runat="server" Visible="false"></asp:Label>
            <asp:Label ID="order_id" runat="server">ؤقم المشروع: </asp:Label>
            <asp:Label ID="lbl_OrderID" runat="server"></asp:Label><br />
                            </asp:TableCell>
                            <asp:TableCell>
            <asp:Label ID="customer_id_label" runat="server">رقم تعريف العميل: </asp:Label>
            <asp:Label ID="lbl_customer_no" runat="server"></asp:Label><br />
                            </asp:TableCell>
                            <asp:TableCell>
            <asp:Label ID="customer_name" runat="server">اسم العميل: </asp:Label>
            <asp:Label ID="lbl_customer_name" runat="server"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                         <asp:TableRow>
                        <asp:TableCell>
            <asp:Label ID="lbl_project" runat="server">المنتج: </asp:Label>
            <asp:DropDownList ID="dlst_project" runat="server"></asp:DropDownList>
                            </asp:TableCell>
                        <asp:TableCell>
                            <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                                     <ContentTemplate>
            <asp:Label ID="lbl_MeasuringEngName" runat="server">مهندس المقاس: </asp:Label>
                            <asp:DropDownList ID="dlst_MeasuringEngName" runat="server" AutoPostBack="true" OnSelectedIndexChanged="dlst_MeasuringEngName_SelectedIndexChanged"></asp:DropDownList>
                                         <script>
                                             $(document).ready(function () { $("#dlst_MeasuringEngName").select2(); });
                                         </script>
                       </ContentTemplate>
                                  </asp:UpdatePanel>
                                         </asp:TableCell>
                        <asp:TableCell>
                            <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                                <Triggers><asp:AsyncPostBackTrigger ControlID="dlst_MeasuringEngName" /></Triggers>
                                     <ContentTemplate>
            <asp:Label ID="lbl_MeasuringEngPhone" runat="server" Enabled="false">رقم هاتف مهندس المقاس: </asp:Label>
            <asp:TextBox ID="txtbx_MeasuringEngPhone" runat="server" AutoPostBack="true" Enabled="false"></asp:TextBox>
                                         </ContentTemplate>
                                  </asp:UpdatePanel>
                         </asp:TableCell>
                            </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                                     <ContentTemplate>
            <asp:Label ID="lbl_DesignerName" runat="server">اسم المصمم: </asp:Label>
            <asp:DropDownList ID="dlst_DesignerName" runat="server" AutoPostBack="true" OnSelectedIndexChanged="dlst_DesignerName_SelectedIndexChanged"></asp:DropDownList>
                                         <script>
                                             $(document).ready(function () { $("#dlst_DesignerName").select2(); });
                                         </script>
                           </ContentTemplate>
                                  </asp:UpdatePanel>
                                         </asp:TableCell>
                        <asp:TableCell>
                            <asp:UpdatePanel ID="UpdatePanel10" runat="server">
                                <Triggers><asp:AsyncPostBackTrigger ControlID="dlst_MeasuringEngName" /></Triggers>
                                     <ContentTemplate>
            <asp:Label ID="lbl_DesignerPhone" runat="server" Enabled="false">رقم هاتف المصمم: </asp:Label>
            <asp:TextBox ID="txtbx_DesignerPhone" runat="server" AutoPostBack="true" Enabled="false"></asp:TextBox>
                       </ContentTemplate>
                                  </asp:UpdatePanel>
                                         </asp:TableCell>
                        </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
            <asp:Label ID="lbl_QAEng" runat="server">مراقب الجودة: </asp:Label>
            <asp:DropDownList ID="dlst_QAEng" runat="server"></asp:DropDownList>
                            <script>
                                $(document).ready(function () { $("#dlst_QAEng").select2(); });
                            </script>
                             </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
            <asp:Label ID="lbl_ProdManager" runat="server">مسؤول الانتاج: </asp:Label>
            <asp:DropDownList ID="dlst_ProdManger" runat="server"></asp:DropDownList>
                            <script>
                                $(document).ready(function () { $("#dlst_ProdManger").select2(); });
                            </script>
                            </asp:TableCell>
                    </asp:TableRow>
                    </asp:Table>
                </fieldset>
            <br /><br />
            <h3>تفاصيل المشروع:</h3>
            <br />
            <fieldset class="loginpagefieldset">
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
            <asp:Label ID="lbl_Design" runat="server">التصميم: </asp:Label>
            <asp:DropDownList ID="dlst_Design" runat="server"></asp:DropDownList>
                           </asp:TableCell>
                            </asp:TableRow>
                     <asp:TableRow>
                         <asp:TableCell>
            <asp:Label ID="lbl_InnerBodyWood" runat="server">خشب البودي الداخلي: </asp:Label>
            <asp:DropDownList ID="dlst_InnerBodyWood" runat="server"></asp:DropDownList>
                             <script>
                                 $(document).ready(function () { $("#dlst_InnerBodyWood").select2(); });
                             </script>
                    </asp:TableCell>
                             </asp:TableRow>
                    <asp:TableRow>
                         <asp:TableCell>
                             <asp:UpdatePanel ID="updt_dkhuwood" runat="server" UpdateMode="Conditional">
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="dlst_KitchenType"/>
                                </Triggers>
                                <ContentTemplate>
            <asp:Label ID="lbl_DKHUCabinets" runat="server">خشب الخزائن الدبل المرتفعة: </asp:Label>
            <asp:DropDownList ID="dlst_DKHUCabinets" runat="server" Enabled="false" AutoPostBack="true"></asp:DropDownList>
                                    <script>
                                        $(document).ready(function () { $("#dlst_DKHUCabinets").select2(); });
                                    </script>
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
            <asp:Label ID="lbl_DKLUCabinets" runat="server">خشب الخزائن الدبل المنخفضة: </asp:Label>
            <asp:DropDownList ID="dlst_DKLUCabinets" runat="server" Enabled="false" AutoPostBack="true"></asp:DropDownList>
                                    <script>
                                        $(document).ready(function () { $("#dlst_DKLUCabinets").select2(); });
                                    </script>
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
            <asp:Label ID="lbl_ClassicUpperCabinets" runat="server">خشب الخزائن العلوية: </asp:Label>
            <asp:DropDownList ID="dlst_ClassicUpperCabinets" runat="server"></asp:DropDownList>
                            <script>
                                $(document).ready(function () { $("#dlst_ClassicUpperCabinets").select2(); });
                            </script>
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
                            <script>
                                $(document).ready(function () { $("#dlst_LowerCabinets").select2(); });
                            </script>
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
                            <script>
                                $(document).ready(function () { $("#dlst_PantryCabinets").select2(); });
                            </script>
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
            <asp:Label ID="lbl_HingesTrademark" runat="server">موديل الفصالات: </asp:Label>
            <asp:DropDownList ID="dlst_HingesTrademark" runat="server" AutoPostBack="true" OnSelectedIndexChanged="dlst_HingesTrademark_SelectedIndexChanged"></asp:DropDownList>
                                    <script>
                                        $(document).ready(function () { $("#dlst_HingesTrademark").select2(); });
                                    </script>
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
                            <script>
                                $(document).ready(function () { $("#dlst_sink").select2(); });
                            </script>
                        </asp:TableCell>
                        <asp:TableCell>
                        <asp:Label ID="lbl_faucet" runat="server">البطارية:</asp:Label>
                        <asp:DropDownList ID="dlst_faucet" runat="server"></asp:DropDownList>
                             <script>
                                 $(document).ready(function () { $("#dlst_faucet").select2(); });
                             </script>
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
                                     <script>
                                         $(document).ready(function () { $("#dlst_GraniteType").select2(); });
                                     </script>
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
            <asp:Label ID="lbl_GraniteCorners" runat="server">برمة الزوايا: </asp:Label>
            <asp:DropDownList ID="dlst_GraniteCorners" runat="server"></asp:DropDownList>
                                </asp:TableCell>
                                </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
            <asp:Label ID="lbl_SinkHole" runat="server">حفرة المجلى: </asp:Label>
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
                             <script>
                                 $(document).ready(function () { $("#dlst_LightingType").select2(); });
                             </script>
                            </asp:TableCell>
                            <asp:TableCell>
            <asp:Label ID="lbl_HandsType" runat="server">نوع الايادي: </asp:Label>
            <asp:DropDownList ID="dlst_HandsType" runat="server"></asp:DropDownList>
                                <script>
                                    $(document).ready(function () { $("#dlst_HandsType").select2(); });
                                </script>
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
                        <asp:Button ID="btn_done" runat="server" Text="Done" OnClick="btn_Done_Click" CssClass="Initial_button" Visible="false"/>
                    </asp:TableCell>
                </asp:TableRow>
                        </asp:Table>
                        </asp:Panel>
                                    </ContentTemplate>
            </asp:UpdatePanel>
            <br />
            <asp:Table runat="server">
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Button ID="btn_edit_cabs" runat="server" Text="تعديل الخزائن" CssClass="Initial_button_ar" OnClick="btn_edit_Click"/>
                            </asp:TableCell>
                        </asp:TableRow>
                <asp:TableRow>
                            <asp:TableCell>
                                <asp:MultiView ID="furniture_views" runat="server">
                                    <asp:View runat="server" ID="view_kitchen" OnLoad="view_kitchen_Load">
                                        <fieldset class="loginpagefieldset">
                <asp:Table ID="order_entry" runat="server" CssClass="borderspaces">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:UpdatePanel ID="updt_product" runat="server">
                                <ContentTemplate>
                                    <asp:Label ID="lbl_product" runat="server">الخزانة:</asp:Label>
                                    <asp:DropDownList ID="dlst_product" runat="server" ToolTip="Select" AutoPostBack="true" OnSelectedIndexChanged="dlst_product_SelectedIndexChanged"></asp:DropDownList>
                                        <script>
                                            $(document).ready(function () { $("#dlst_product").select2(); });
                                        </script>
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
                                    <asp:Label ID="lbl_devices" runat="server">الأجهزة:</asp:Label>
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
                                    <asp:Label ID="lbl_lighting" runat="server">الإنارة:</asp:Label>
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
                                    <asp:Label ID="lbl_lighting_pos" runat="server">موقع الانارة:</asp:Label>
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
                                    <asp:Label ID="lbl_lighting_place" runat="server">فرزة الانارة:</asp:Label>
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
                            <asp:Label ID="lbl_quantity" runat="server">الكمية:</asp:Label>
                            <asp:TextBox ID="txtbx_quantity" runat="server"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    </asp:Table>
                                            </fieldset>
                                    </asp:View>
                                    <asp:View runat="server" ID="view_furnature" OnLoad="view_furnature_Load">
                                        <fieldset class="loginpagefieldset">
                <asp:Table ID="tbl_furniture" runat="server" CssClass="borderspaces">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:UpdatePanel ID="upd_furniture" runat="server">
                                <ContentTemplate>
                                    <asp:Label ID="lbl_piece" runat="server">المنتج:</asp:Label>
                                    <asp:DropDownList ID="dlst_piece" runat="server" ToolTip="Select" AutoPostBack="true" OnSelectedIndexChanged="dlst_piece_SelectedIndexChanged"></asp:DropDownList>
                                        <script>
                                            $(document).ready(function () { $("#dlst_piece").select2(); });
                                        </script>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="lbl_width_frn" runat="server">العرض:</asp:Label>
                            <asp:TextBox ID="txtbx_width_frn" runat="server"></asp:TextBox>
                        </asp:TableCell>
                         <asp:TableCell>
                            <asp:Label ID="lbl_length" runat="server">الطول:</asp:Label>
                            <asp:TextBox ID="txtbx_length" runat="server"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:UpdatePanel ID="updt_accessories_frn" runat="server">
                                <ContentTemplate>
                                    <asp:Label ID="lbl_acc_frn" runat="server">الاكسسوارات:</asp:Label>
                                    <asp:DropDownList ID="dlst_acc_frn" runat="server" ToolTip="Select"></asp:DropDownList>
                                    <script>
                                        $(document).ready(function () { $("#dlst_acc_frn").select2(); });
                                    </script>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <asp:UpdatePanel runat="server">
                                <Triggers><asp:AsyncPostBackTrigger ControlID="dlst_acc_frn" /></Triggers>
                                <ContentTemplate>
                                    <asp:TextBox ID="txtbx_acc" runat="server" Visible="false"></asp:TextBox>
                                    </ContentTemplate>
                            </asp:UpdatePanel>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                <Triggers><asp:AsyncPostBackTrigger ControlID="dlst_piece" /></Triggers>
                                <ContentTemplate>
                                    <asp:Label ID="lbl_devices_frn" runat="server">الأجهزة:</asp:Label>
                                    <asp:DropDownList ID="dlst_dev_frn" runat="server" Enabled="false" AutoPostBack="true" ToolTip="Select"></asp:DropDownList>
                                    <script>
                                        $(document).ready(function () { $("#dlst_dev_frn").select2(); });
                                    </script>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <asp:UpdatePanel runat="server">
                                <Triggers><asp:AsyncPostBackTrigger ControlID="dlst_dev_frn" /></Triggers>
                                <ContentTemplate>
                            <asp:TextBox ID="txtbx_dev_frn" runat="server" Visible="false"></asp:TextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:UpdatePanel ID="updt_lighting_frn" runat="server">
                                <ContentTemplate>
                                    <asp:Label ID="lbl_lighting_frn" runat="server">الإنارة:</asp:Label>
                                    <asp:DropDownList ID="dlst_lighting_frn" runat="server" ToolTip="Select"></asp:DropDownList>                                     
                                    <script>
                                        $(document).ready(function () { $("#dlst_lighting_frn").select2(); });
                                    </script>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:UpdatePanel ID="updt_light_pos_frn" runat="server">
                                <ContentTemplate>
                                    <asp:Label ID="lbl_light_pos_frn" runat="server">موقع الانارة:</asp:Label>
                                    <asp:DropDownList ID="dlst_light_pos_frn" runat="server" ToolTip="Select"></asp:DropDownList>
                                    <script>
                                        $(document).ready(function () { $("#dlst_light_pos_frn").select2(); });
                                    </script>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </asp:TableCell>
                         <asp:TableCell>
                            <asp:UpdatePanel ID="updt_light_place_frn" runat="server">
                                <ContentTemplate>
                                    <asp:Label ID="lbl_light_place_frn" runat="server">فرزة الانارة:</asp:Label>
                                    <asp:DropDownList ID="dlst_light_place_frn" runat="server" ToolTip="Select"></asp:DropDownList>
                                    <script>
                                        $(document).ready(function () { $("#dlst_light_place_frn").select2(); });
                                    </script>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lbl_quantity_frn" runat="server">الكمية:</asp:Label>
                            <asp:TextBox ID="txtbx_quantity_frn" runat="server"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    </asp:Table>
                                            </fieldset>
                                    </asp:View>
                                </asp:MultiView>
                                </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
            <br />
            <h3>الأثاث:</h3>
            <asp:UpdatePanel runat="server">
                                    <ContentTemplate>
                                        <asp:Panel ID="pnl_cabinets" runat="server">
                            <asp:GridView ID="cabinets_grid" runat="server" AutoGenerateColumns="false" CssClass="mydatagrid" PagerStyle-CssClass="pager"
 HeaderStyle-CssClass="header" RowStyle-CssClass="rows" ShowHeaderWhenEmpty="true" Width="100%" OnRowDataBound="cabinets_grid_RowDataBound" OnSelectedIndexChanged="cabinets_grid_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="cabinet_entry_ID" HeaderText="رقم الخزانة" />
                            <asp:BoundField DataField="product" HeaderText="اسم الخزانة" />
                            <asp:BoundField DataField="width" HeaderText="العرض" />
                            <asp:BoundField DataField="accessories" HeaderText="الاكسسوارات" />
                            <asp:BoundField DataField="devices" HeaderText="الأجهزة" />
                            <asp:BoundField DataField="lighting" HeaderText="نوع الإنارة" />
                            <asp:BoundField DataField="lighting_position" HeaderText="موقع الانارة" />
                            <asp:BoundField DataField="lighting_location_type" HeaderText="فرزة الانارة" />
                            <asp:BoundField DataField="quantity" HeaderText="الكمية" />
                        </Columns>
                                <SelectedRowStyle BackColor="LightGreen" ForeColor="DarkGreen" Font-Bold="true" />
                                                 </asp:GridView>
                                        </asp:Panel>
                                  </ContentTemplate>
                              </asp:UpdatePanel>
                        <asp:Button ID="btn_done_cabinets" runat="server" CssClass="Initial_button" Text="انتهى" OnClick="btn_done_cabinets_Click"/>
        </div>
    </form>
</body>
</html>
