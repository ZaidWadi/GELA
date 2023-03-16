<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login_page.aspx.cs" Inherits="GELA_DB.loginpage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="StyleSheet1.css" rel="stylesheet" />
    <title>login</title>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />

<script src="../Scripts/jquery-3.6.0.min.js"></script>
<script src="../Scripts/bootstrap.min.js"></script>
<script src="../Scripts/select2.min.js"></script>

<link href="../Content/css/select2.css" rel="stylesheet" />

<meta name="viewport" content="width=device-width, initial-scale=1" />
</head>
<body>
    <form id="form1" runat="server" method="get" style="align-content:center; align-items:center; align-self:center; text-align:center;margin:0  auto;">
        <br /><br /><br /><br /><br />
        <asp:Button ID="btn_lang" runat="server" Text="العربية" OnClick="btn_lang_Click" CssClass="Initial_button_ar" />
        <br /><br /><br />
        <fieldset style="align-content:center; align-items:center; align-self:center; text-align:center; width:600px;margin:0  auto;">
        <div style="align-content:center; align-items:center; align-self:center; text-align:center; width:600px;margin:0  auto;">
            <h2>Enter your login details below:</h2>
            <br />
            <asp:Label ID="lbl_UserName" runat="server">User Name:</asp:Label>
            <asp:Textbox ID="txtbx_UserName" runat="server"></asp:Textbox>
           <br /> <br /> <asp:Label ID="lbl_password" runat="server">Password:</asp:Label>
            <asp:Textbox ID="txtbx_password" TextMode="Password" runat="server" OnTextChanged="txtbx_password_TextChanged"></asp:Textbox>  
            <br />
            <br />
            <br />
            <asp:Button ID="btn_login" runat="server" Text="Login" OnClick="btn_login_clk" CssClass="Initial_button_login" />
            <br /> <br />
            <asp:Label ID="permission" runat="server" Visible="True"></asp:Label>
            <asp:Label ID="lbl_wrong_info" runat="server" Text="Wrong username or password" Visible="False" CssClass="wronginfo"></asp:Label>
        </div>
            </fieldset>
    </form>
</body>
</html>
