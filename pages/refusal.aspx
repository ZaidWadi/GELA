<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="refusal.aspx.cs" Inherits="GELA_DB.pages.WebForm5" %>

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
        <div style="background-color:whitesmoke;">
            <asp:TextBox ID="refusal_reason" runat="server" TextMode="MultiLine" Width="800px" Height="500px"></asp:TextBox>
            <br /><asp:Button ID="btn_send" runat="server" Text="Send" OnClick="btn_send_Click" CssClass="Initial_button" />
        </div>
    </form>
</body>
</html>
