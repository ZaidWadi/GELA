<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="project_data_input_ar.aspx.cs" Inherits="GELA_DB.pages.WebForm50" %>

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
            <br /><br /><br /><br /><br /><br /><br /><br />
            <h2>تفاصيل المشروع:</h2>
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
                       </ContentTemplate>
                                  </asp:UpdatePanel>
                                         </asp:TableCell>
                        <asp:TableCell>
                            <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                                <Triggers><asp:AsyncPostBackTrigger ControlID="dlst_MeasuringEngName" /></Triggers>
                                     <ContentTemplate>
            <asp:Label ID="lbl_MeasuringEngPhone" runat="server" Enabled="false">رقم مهندس المقاس: </asp:Label>
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
                           </ContentTemplate>
                                  </asp:UpdatePanel>
                                         </asp:TableCell>
                        <asp:TableCell>
                            <asp:UpdatePanel ID="UpdatePanel10" runat="server">
                                <Triggers><asp:AsyncPostBackTrigger ControlID="dlst_MeasuringEngName" /></Triggers>
                                     <ContentTemplate>
            <asp:Label ID="lbl_DesignerPhone" runat="server" Enabled="false">رقم المصمم: </asp:Label>
            <asp:TextBox ID="txtbx_DesignerPhone" runat="server" AutoPostBack="true" Enabled="false"></asp:TextBox>
                       </ContentTemplate>
                                  </asp:UpdatePanel>
                                         </asp:TableCell>
                        </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
            <asp:Label ID="lbl_QAEng" runat="server">مهندس ضبط الجودة: </asp:Label>
            <asp:DropDownList ID="dlst_QAEng" runat="server"></asp:DropDownList>
                             </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
            <asp:Label ID="lbl_ProdManager" runat="server">مدير الانتاج: </asp:Label>
            <asp:DropDownList ID="dlst_ProdManger" runat="server"></asp:DropDownList>
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
                        <asp:Button ID="btn_done" runat="server" Text="انتهى" OnClick="btn_Done_Click" CssClass="Initial_button_ar" />
                    </asp:TableCell>
                </asp:TableRow>
                        </asp:Table>
            </div>
    </form>
</body>
</html>
