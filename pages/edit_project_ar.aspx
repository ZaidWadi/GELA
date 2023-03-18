<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="edit_project_ar.aspx.cs" Inherits="GELA_DB.pages.WebForm43" %>

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
    <form id="form1" runat="server" dir="rtl">
        <asp:ScriptManager ID="scrptmgr_project_data_input" runat="server"></asp:ScriptManager>
        <div>
            <br /><br /><br /><br /><br /><br /><br /><br />
            <h2>معلومات المشروع:</h2>
            <fieldset class="loginpagefieldset">
                <asp:Table ID="project_metadata" runat="server" CssClass="borderspaces">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="auto_id" runat="server" Visible="false"></asp:Label>
            <asp:Label ID="order_id" runat="server">رقم المشروع: </asp:Label>
            <asp:Label ID="lbl_OrderID" runat="server"></asp:Label><br />
                            </asp:TableCell>
                            <asp:TableCell>
            <asp:Label ID="customer_id_label" runat="server">رقم الزبون: </asp:Label>
            <asp:Label ID="lbl_customer_no" runat="server"></asp:Label><br />
                            </asp:TableCell>
                            <asp:TableCell>
            <asp:Label ID="customer_name" runat="server">اسم الزبون: </asp:Label>
            <asp:Label ID="lbl_customer_name" runat="server"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                         <asp:TableRow>
                        <asp:TableCell>
            <asp:Label ID="lbl_project" runat="server">المشروع: </asp:Label>
            <asp:TextBox ID="txtbx_project" runat="server"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                    <asp:TableRow>
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
            <asp:Label ID="lbl_MeasuringEngPhone" runat="server" Enabled="false">رقم الهاتف: </asp:Label>
            <asp:TextBox ID="txtbx_MeasuringEngPhone" runat="server" AutoPostBack="true" Enabled="false"></asp:TextBox>
                                         </ContentTemplate>
                                  </asp:UpdatePanel>
                         </asp:TableCell>
                            </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                                     <ContentTemplate>
            <asp:Label ID="lbl_DesignerName" runat="server">المصمم: </asp:Label>
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
            <asp:Label ID="lbl_DesignerPhone" runat="server" Enabled="false">رقم الهاتف: </asp:Label>
            <asp:TextBox ID="txtbx_DesignerPhone" runat="server" AutoPostBack="true" Enabled="false"></asp:TextBox>
                       </ContentTemplate>
                                  </asp:UpdatePanel>
                                         </asp:TableCell>
                        </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
            <asp:Label ID="lbl_QAEng" runat="server">مهندس ضبط الجودة: </asp:Label>
            <asp:DropDownList ID="dlst_QAEng" runat="server"></asp:DropDownList>
                            <script>
                                $(document).ready(function () { $("#dlst_QAEng").select2(); });
                            </script>
                             </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
            <asp:Label ID="lbl_ProdManager" runat="server">مدير الانتاج: </asp:Label>
            <asp:DropDownList ID="dlst_ProdManger" runat="server"></asp:DropDownList>
                            <script>
                                $(document).ready(function () { $("#dlst_ProdManger").select2(); });
                            </script>
                            </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Button ID="btn_submit" runat="server" Text="انتهى" OnClick="btn_submit_Click" />
                        </asp:TableCell>
                    </asp:TableRow>
                    </asp:Table>
                </fieldset>
            </div>
    </form>
</body>
</html>
