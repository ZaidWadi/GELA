<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="project_info_view.aspx.cs" Inherits="GELA_DB.pages.WebForm54" %>

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
    <form id="form1" runat="server">
        <asp:ScriptManager ID="scrptmgr_project_data_input" runat="server"></asp:ScriptManager>
        <div>
            <asp:UpdatePanel ID="updt_form" runat="server" ChildrenAsTriggers="true">
                <ContentTemplate>
            <br /><br /><br /><br /><br /><br /><br />
                    <asp:Table runat="server">
                        <asp:TableRow>
                            <asp:TableCell>
                                <asp:Button ID="btn_edit" runat="server" Text="Edit" CssClass="Initial_button_ar" OnClick="btn_edit_Click"/>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
            <br />
                    <asp:Panel ID="pnl_form" runat="server" Enabled="false">
            <h3>Project Data:</h3>
            <fieldset class="loginpagefieldset">
                <asp:Table ID="project_metadata" runat="server" CssClass="borderspaces">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="auto_id" runat="server" Visible="false"></asp:Label>
            <asp:Label ID="order_id" runat="server">Project Number: </asp:Label>
            <asp:Label ID="lbl_OrderID" runat="server"></asp:Label><br />
                            </asp:TableCell>
                            <asp:TableCell>
            <asp:Label ID="customer_id_label" runat="server">Customer ID: </asp:Label>
            <asp:Label ID="lbl_customer_no" runat="server"></asp:Label><br />
                            </asp:TableCell>
                            <asp:TableCell>
            <asp:Label ID="customer_name" runat="server">Customer Name: </asp:Label>
            <asp:Label ID="lbl_customer_name" runat="server"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                         <asp:TableRow>
                        <asp:TableCell>
            <asp:Label ID="lbl_project" runat="server">Project: </asp:Label>
            <asp:TextBox ID="txtbx_project" runat="server"></asp:TextBox>
                            </asp:TableCell>
                        <asp:TableCell>
                            <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                                     <ContentTemplate>
            <asp:Label ID="lbl_MeasuringEngName" runat="server">Measuring Engineer: </asp:Label>
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
            <asp:Label ID="lbl_MeasuringEngPhone" runat="server" Enabled="false">Measuring EngineerPhone Number: </asp:Label>
            <asp:TextBox ID="txtbx_MeasuringEngPhone" runat="server" AutoPostBack="true" Enabled="false"></asp:TextBox>
                                         </ContentTemplate>
                                  </asp:UpdatePanel>
                         </asp:TableCell>
                            </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                                     <ContentTemplate>
            <asp:Label ID="lbl_DesignerName" runat="server">Designer's Name: </asp:Label>
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
            <asp:Label ID="lbl_DesignerPhone" runat="server" Enabled="false">Designer's Phone No: </asp:Label>
            <asp:TextBox ID="txtbx_DesignerPhone" runat="server" AutoPostBack="true" Enabled="false"></asp:TextBox>
                       </ContentTemplate>
                                  </asp:UpdatePanel>
                                         </asp:TableCell>
                        </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
            <asp:Label ID="lbl_QAEng" runat="server">QA Engineer: </asp:Label>
            <asp:DropDownList ID="dlst_QAEng" runat="server"></asp:DropDownList>
                            <script>
                                $(document).ready(function () { $("#dlst_QAEng").select2(); });
                            </script>
                             </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
            <asp:Label ID="lbl_ProdManager" runat="server">Production Manager: </asp:Label>
            <asp:DropDownList ID="dlst_ProdManger" runat="server"></asp:DropDownList>
                            <script>
                                $(document).ready(function () { $("#dlst_ProdManger").select2(); });
                            </script>
                            </asp:TableCell>
                    </asp:TableRow>
                    </asp:Table>
                </fieldset>
            <br /><br />
            <h3>Technical Details:</h3>
            <br />
            <fieldset class="loginpagefieldset">
                <asp:Table ID="technical_specs" runat="server" CssClass="borderspaces">
                    <asp:TableRow>   
                        <asp:TableCell>
                            <asp:UpdatePanel ID="updt_kitchen_type" runat="server">
                                <ContentTemplate>
            <asp:Label ID="lbl_KitchenType" runat="server">Kitchen Type: </asp:Label>
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
            <asp:Label ID="lbl_KitchenHeight" runat="server">Kitchen Height: </asp:Label>
            <asp:TextBox ID="txtbx_KitchenHeight" runat="server" AutoPostBack="true" Enabled="false"></asp:TextBox>
    
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </asp:TableCell>
                        <asp:TableCell>
            <asp:Label ID="lbl_Design" runat="server">Kitchen Design: </asp:Label>
            <asp:DropDownList ID="dlst_Design" runat="server"></asp:DropDownList>
                           </asp:TableCell>
                            </asp:TableRow>
                     <asp:TableRow>
                         <asp:TableCell>
            <asp:Label ID="lbl_InnerBodyWood" runat="server">Inner Body Wood: </asp:Label>
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
            <asp:Label ID="lbl_DKHUCabinets" runat="server">Double Kitchen High Upper Cabinets Wood type: </asp:Label>
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
            <asp:Label ID="lbl_DKHUCabinetsColor" runat="server">Color: </asp:Label>
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
            <asp:Label ID="lbl_DKLUCabinets" runat="server">Double Kitchen Low Upper Cabinets Wood type: </asp:Label>
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
            <asp:Label ID="lbl_DKLUCabinetsColor" runat="server">Color: </asp:Label>
            <asp:TextBox ID="txtbx_DKLUCabinetsColor" runat="server" Enabled="false" AutoPostBack="true"></asp:TextBox>
                           </ContentTemplate>
                            </asp:UpdatePanel>
                                    </asp:TableCell>
                        <asp:TableCell></asp:TableCell>
                                </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
            <asp:Label ID="lbl_ClassicUpperCabinets" runat="server">Classic Upper Cabinets Wood type: </asp:Label>
            <asp:DropDownList ID="dlst_ClassicUpperCabinets" runat="server"></asp:DropDownList>
                            <script>
                                $(document).ready(function () { $("#dlst_ClassicUpperCabinets").select2(); });
                            </script>
                            </asp:TableCell>
                        
                            <asp:TableCell>
            <asp:Label ID="lbl_ClassicUpperCabinetsColor" runat="server">color: </asp:Label>
            <asp:TextBox ID="txtbx_ClassicUpperCabinetsColor" runat="server"></asp:TextBox>
                            </asp:TableCell>
                        <asp:TableCell></asp:TableCell>
                                </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
            <asp:Label ID="lbl_LowerCabinets" runat="server">Lower Cabinets Wood type: </asp:Label>
            <asp:DropDownList ID="dlst_LowerCabinets" runat="server"></asp:DropDownList>
                            <script>
                                $(document).ready(function () { $("#dlst_LowerCabinets").select2(); });
                            </script>
                            </asp:TableCell>
                            <asp:TableCell>
            <asp:Label ID="lbl_LowerCabinetsColor" runat="server">Color: </asp:Label>
            <asp:TextBox ID="txtbx_LowerCabinetsColor" runat="server"></asp:TextBox>
                                </asp:TableCell>
                            </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
            <asp:Label ID="lbl_PantryCabinets" runat="server">Pantry Cabinets Wood type: </asp:Label>
            <asp:DropDownList ID="dlst_PantryCabinets" runat="server"></asp:DropDownList>
                            <script>
                                $(document).ready(function () { $("#dlst_PantryCabinets").select2(); });
                            </script>
            </asp:TableCell>
                            <asp:TableCell>
            <asp:Label ID="lbl_PantryCabinetsColor" runat="server">Color: </asp:Label>
            <asp:TextBox ID="txtbx_PantyCabinetsColor" runat="server"></asp:TextBox>
                           </asp:TableCell>
                            </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                             <asp:UpdatePanel ID="updt_hingestrdmrk" runat="server">
                                <ContentTemplate>
            <asp:Label ID="lbl_HingesTrademark" runat="server">Hinges: </asp:Label>
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
            <asp:Label ID="lbl_HingesOrigin" runat="server">Origin: </asp:Label>
            <asp:TextBox ID="txtbx_HingesOrigin" runat="server" Enabled="false" AutoPostBack="true"></asp:TextBox>
                              </ContentTemplate>
                                    </asp:UpdatePanel>
                                    </asp:TableCell>
                            </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                        <asp:Label ID="lbl_sink" runat="server">Sink:</asp:Label>
                        <asp:DropDownList ID="dlst_sink" runat="server"></asp:DropDownList>
                            <script>
                                $(document).ready(function () { $("#dlst_sink").select2(); });
                            </script>
                        </asp:TableCell>
                        <asp:TableCell>
                        <asp:Label ID="lbl_faucet" runat="server">Faucet:</asp:Label>
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
            <asp:Label ID="lbl_GraniteType" runat="server">Granite Type: </asp:Label>
            <asp:DropDownList ID="dlst_GraniteType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="dlst_GraniteType_SelectedIndexChanged"></asp:DropDownList>
                                     <script>
                                         $(document).ready(function () { $("#dlst_GraniteType").select2(); });
                                     </script>
                       </ContentTemplate>
                            </asp:UpdatePanel>
                                    </asp:TableCell>
                            <asp:TableCell>
            <asp:Label ID="lbl_GraniteName" runat="server">Granite Name: </asp:Label>
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
            <asp:Label ID="lbl_LowerPanel" runat="server">Lower Panel Granite Type: </asp:Label>
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
            <asp:Label ID="lbl_UpperPanel" runat="server">Upper Panel Granite: </asp:Label>
            <asp:TextBox ID="txtbx_UpperPanel" runat="server" Enabled="false" AutoPostBack="true"></asp:TextBox>
                               </ContentTemplate>
                            </asp:UpdatePanel>
                                    </asp:TableCell>
                                <asp:TableCell>
            <asp:Label ID="lbl_GraniteCorners" runat="server">Granite Corners: </asp:Label>
            <asp:DropDownList ID="dlst_GraniteCorners" runat="server"></asp:DropDownList>
                                </asp:TableCell>
                                </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
            <asp:Label ID="lbl_SinkHole" runat="server">Sink Hole Type: </asp:Label>
            <asp:DropDownList ID="dlst_SinkHole" runat="server"></asp:DropDownList>
                            </asp:TableCell>
                            <asp:TableCell>
            <asp:Label ID="lbl_GraniteTopThickness" runat="server">Granite Top Thickness: </asp:Label>
            <asp:DropDownList ID="dlst_GraniteTopThickness" runat="server"></asp:DropDownList>
                            </asp:TableCell>
                                </asp:TableRow>
                     <asp:TableRow>
                        <asp:TableCell>
            <asp:Label ID="lbl_ElectricLayout" runat="server">Electric Layout Status: </asp:Label>
            <asp:DropDownList ID="dlst_ElectricLayout" runat="server"></asp:DropDownList>
                            </asp:TableCell>
                            <asp:TableCell>
            <asp:Label ID="lbl_SanitaryLayout" runat="server">Sanitary Layout Status: </asp:Label>
            <asp:DropDownList ID="dlst_SanitaryLayout" runat="server"></asp:DropDownList>
                            </asp:TableCell>
                                </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
            <asp:Label ID="lbl_LightingType" runat="server">Lighting: </asp:Label>
            <asp:DropDownList ID="dlst_LightingType" runat="server"></asp:DropDownList>
                             <script>
                                 $(document).ready(function () { $("#dlst_LightingType").select2(); });
                             </script>
                            </asp:TableCell>
                            <asp:TableCell>
            <asp:Label ID="lbl_HandsType" runat="server">Hands Type: </asp:Label>
            <asp:DropDownList ID="dlst_HandsType" runat="server"></asp:DropDownList>
                                <script>
                                    $(document).ready(function () { $("#dlst_HandsType").select2(); });
                                </script>
                                </asp:TableCell>
                                <asp:TableCell>
            <asp:Label ID="lbl_DuctOpening" runat="server">Duct Opening Status: </asp:Label>
            <asp:DropDownList ID="dlst_DuctOpening" runat="server"></asp:DropDownList>
                            </asp:TableCell>
                                </asp:TableRow>
                    </asp:Table>
                </fieldset>
            <br /><h3>Notes:</h3>
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
            <br /><br />
            <asp:Table runat="server">
            <asp:TableRow>
                            <asp:TableCell>
                                <asp:Button ID="btn_edit_cabs" runat="server" Text="Edit Cabinets" CssClass="Initial_button_ar" OnClick="btn_edit_Click"/>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
            <br />
            <h3>Cabinets:</h3>
            <br />
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
                     <asp:TableRow>
                        <asp:TableCell>
                            <asp:Button ID="add_cab" runat="server" Text="Add" OnClick="add_cab_Click" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
            <asp:UpdatePanel runat="server">
                                    <ContentTemplate>
                                        <asp:Panel ID="pnl_cabinets" runat="server">
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
                                        </asp:Panel>
                                  </ContentTemplate>
                              </asp:UpdatePanel>
                              </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                        <asp:Button ID="btn_done_cabs" runat="server" CssClass="Initial_button" Text="Done" OnClick="btn_new_project_Click"/>
                             </asp:TableCell>
                    </asp:TableRow>
                    </asp:Table>
                </fieldset>
        </div>
    </form>
</body>
</html>
