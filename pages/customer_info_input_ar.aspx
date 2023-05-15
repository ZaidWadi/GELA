<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="customer_info_input_ar.aspx.cs" Inherits="GELA_DB.pages.WebForm38" %>

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
            <br /><br /><br /><br /><br />
            <h2>معلومات العميل:</h2>
            <fieldset style="background-color:whitesmoke;">
            <table class="borderspaces">
                <tr>
                    <td>
            <asp:Label ID="lbl_customer_ID" runat="server"></asp:Label>
                        </td>
                    
                    </tr>
                <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                <tr>
                    <td>
                        <asp:Label ID="lbl_showroom" runat="server">Showroom:</asp:Label>
                        <asp:DropDownList ID="dlst_showroom" runat="server"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                     <td>
            <asp:Label ID="lbl_title" runat="server">البادئة: </asp:Label>
            <asp:DropDownList ID="dlst_title" runat="server"></asp:DropDownList>
                        </td>
                    <td>
            <asp:Label ID="lbl_Name" runat="server">الاسم الكامل: </asp:Label>
            <asp:TextBox ID="txtbx_Name" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>

                 <tr>
                    <td>
            <asp:Label ID="lbl_PhoneNo_1" runat="server">رقم الهاتف: </asp:Label>
            <asp:TextBox ID="txtbx_PhoneNo_1" runat="server"></asp:TextBox>
                        </td>
                     <td>
            <asp:Label ID="lbl_PhoneNo_2" runat="server">رقم هاتف ثانوي: </asp:Label>
            <asp:TextBox ID="txtbx_PhoneNo_2" runat="server"></asp:TextBox>
                         </td>
                    </tr>
                <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                <tr>
                        <td>
                            <asp:UpdatePanel ID="updt_city" runat="server">
                                <ContentTemplate>
            <asp:Label ID="lbl_City" runat="server">المدينة: </asp:Label>
            <asp:DropDownList ID="dlst_City" runat="server" OnSelectedIndexChanged="dlst_City_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                    <script>
                                        $(document).ready(function () { $("#dlst_City").select2(); });
                                    </script>
                        </ContentTemplate>
                            </asp:UpdatePanel>
                                    </td>
                        <td>
                            <asp:UpdatePanel ID="updt_areas" runat="server">
                                <Triggers><asp:AsyncPostBackTrigger ControlID="dlst_City" /></Triggers>
                                <ContentTemplate>
            <asp:Label ID="lbl_Area" runat="server">المنطقة: </asp:Label>
            <asp:DropDownList ID="dlst_Area" runat="server" AutoPostBack="true" Enabled="false"></asp:DropDownList>
                                    <script>
                                        $(document).ready(function () { $("#dlst_Area").select2(); });
                                    </script>
                    </ContentTemplate>
                            </asp:UpdatePanel>
                                    </td>
                        <td>
            <asp:Label ID="lbl_AddressLine" runat="server">تفاصيل العنوان: </asp:Label>
            <asp:TextBox ID="txtbx_AddressLine" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                <tr>
                    <td>
            <asp:Label ID="lbl_NationalID" runat="server">الرقم الوطني: </asp:Label>
            <asp:TextBox ID="txtbx_NationalID" runat="server"></asp:TextBox>
                        </td>
                    <td>
            <asp:Label ID="lbl_DocumentNo" runat="server">رقم الوثيقة: </asp:Label>
            <asp:TextBox ID="txtbx_DocumentNo" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                <tr>
                    <td>
            <asp:Label ID="lbl_KeeperPhoneNo" runat="server">رقم حارس المبنى: </asp:Label>
            <asp:TextBox ID="txtbx_KeeperPhoneNo" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                <tr>
                    <td>
            <asp:TextBox ID="txtbx_correlation_status" runat="server" Visible="false"></asp:TextBox>
            <asp:Label ID="lbl_Notes" runat="server">ملاحظات: </asp:Label>
            <asp:TextBox ID="txtbx_Notes" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                <tr>
                    <td>
                         <asp:Button ID="btn_NextPage" runat="server" text="انتهى"  OnClick="btn_NextPage_Click" CssClass="Initial_button_ar"/>
                    </td>
                </tr>
                </table>
                </fieldset>
        </div>
    </form>
</body>
</html>
