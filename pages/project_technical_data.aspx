<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="project_technical_data.aspx.cs" Inherits="GELA_DB.pages.WebForm14" %>

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
            <br /><br /><br /><br /><br /><br />
            <asp:Table ID="project_metadata" runat="server" CssClass="borderspaces" BackColor="WhiteSmoke">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="auto_id" runat="server" Visible="false"></asp:Label>
            <asp:Label ID="order_id" runat="server">Project Number: </asp:Label>
            <asp:Label ID="lbl_OrderID" runat="server"></asp:Label><br />
                            </asp:TableCell>
                        </asp:TableRow>
                         <asp:TableRow>
                        </asp:TableRow>
                </asp:Table>
            <fieldset class="loginpagefieldset">
            <h3>Technical Data:</h3>
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
                        <asp:Button ID="btn_done" runat="server" Text="Done" OnClick="btn_Done_Click" CssClass="Initial_button" />
                    </asp:TableCell>
                </asp:TableRow>
                        </asp:Table>
        </div>
    </form>
</body>
</html>
