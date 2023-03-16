<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="project_data_input.aspx.cs" Inherits="GELA_DB.pages.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="StyleSheet1.css" rel="stylesheet" />
    <title></title>
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
            <br /><br /><br /><br /><br /><br /><br /><br />
            <h2>Project Data:</h2>
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
                        </asp:TableRow>
                    <asp:TableRow>
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
            <br />
            <h3>Notes:</h3>
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
