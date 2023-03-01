<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login_page_ar.aspx.cs" Inherits="GELA_DB.pages.WebForm46" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="StyleSheet1.css" rel="stylesheet" />
    <title>login</title>
</head>
<body>
    <form id="form1" runat="server" method="get" dir="rtl">
        <br /><br /><br /><br /><br />
        <asp:Button ID="btn_lang" runat="server" Text="English" OnClick="btn_lang_Click" CssClass="Initial_button_ar" />
        <br /><br /><br />
        <fieldset class="loginpagefieldset">
        <div>
            <h2>الرجاء ادخال معلومات تسجيل الدخول:</h2>
            <asp:Label ID="lbl_UserName" runat="server">اسم المستخدم:</asp:Label>
            <asp:Textbox ID="txtbx_UserName" runat="server"></asp:Textbox>    
           <br /> <br /> <asp:Label ID="lbl_password" runat="server">كلمة المرور:</asp:Label>
            <asp:Textbox ID="txtbx_password" TextMode="Password" runat="server" OnTextChanged="txtbx_password_TextChanged"></asp:Textbox>  
            <br />
            <br />
            <br />
            <asp:Button ID="btn_login" runat="server" Text="تسجيل الدخول" OnClick="btn_login_clk" CssClass="Initial_button_ar" />
            <br /> <br />
            <asp:Label ID="permission" runat="server" Visible="True"></asp:Label>
            <asp:Label ID="lbl_wrong_info" runat="server" Text="خطأ في اسم المستخدم أو كلمة المرور!" Visible="False" CssClass="wronginfo"></asp:Label>
        </div>
            </fieldset>
    </form>
</body>
</html>
