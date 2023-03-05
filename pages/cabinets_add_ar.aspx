<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cabinets_add_ar.aspx.cs" Inherits="GELA_DB.pages.WebForm37" %>

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
        <asp:ScriptManager ID="scrptmgr" runat="server"></asp:ScriptManager>
        <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
        <div style="background-color:whitesmoke;">
            <fieldset>
                <h3>مواصفات الخزانة:</h3>
            <asp:Table runat="server" CellSpacing="10">
                <asp:TableRow>
                    <asp:TableCell>
                        موقع الخزانة(علوي/سفلي/مونة):
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="dlst_verti_pos" runat="server"></asp:DropDownList>
                    </asp:TableCell>
                    <asp:TableCell>
                        موقع الخزانة(وسط/طرف/منفرد):
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="dlst_hori_pos" runat="server"></asp:DropDownList>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        نوع التغطية:
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="dlst_cover" runat="server" OnSelectedIndexChanged="dlst_cover_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                    </asp:TableCell>
                    <asp:TableCell>
                        تعداد الأغطية:
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:UpdatePanel ID="updt_cover_count" runat="server">
                            <Triggers><asp:AsyncPostBackTrigger ControlID="dlst_cover" /></Triggers>
                            <ContentTemplate>
                        <asp:DropDownList ID="dlst_cover_count" runat="server" AutoPostBack="true"></asp:DropDownList>
                                 </ContentTemplate>
                        </asp:UpdatePanel>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        الاجهزة البلت ان:
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="dlst_devices" runat="server"></asp:DropDownList>
                    </asp:TableCell>
                    </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell>
                        دبل:
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="dlst_isdouble" runat="server"></asp:DropDownList>
                    </asp:TableCell>
                    </asp:TableRow>
            </asp:Table>
            </fieldset>
            <asp:Button ID="btn_multipliers" runat="server" Text="ادخال المعادلات" OnClick="btn_multipliers_Click" CssClass="Initial_button_ar" />
            <asp:Button ID="btn_cancel" runat="server" Text="الغاء" OnClick="btn_cancel_Click" CssClass="Initial_button_ar" />
            <asp:Label ID="lbl_err" runat="server" Text="هذه الخزانة موجودة!" CssClass="wronginfo" Visible="false"></asp:Label>
        </div>
    </form>
</body>
</html>
