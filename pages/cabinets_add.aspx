<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cabinets_add.aspx.cs" Inherits="GELA_DB.pages.WebForm17" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet1.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">     
        <asp:ScriptManager ID="scrptmgr" runat="server"></asp:ScriptManager>
        <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
        <div style="background-color:whitesmoke;">
            <fieldset>
                <h3>Cabinet specs:</h3>
            <asp:Table runat="server" CellSpacing="10">
                <asp:TableRow>
                    <asp:TableCell>
                        Location (Upper/Lower/Pantry):
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="dlst_verti_pos" runat="server"></asp:DropDownList>
                    </asp:TableCell>
                    <asp:TableCell>
                        Location (Middle/Side/Independent):
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="dlst_hori_pos" runat="server"></asp:DropDownList>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        Cover type:
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="dlst_cover" runat="server" OnSelectedIndexChanged="dlst_cover_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                    </asp:TableCell>
                    <asp:TableCell>
                        Cover count:
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
                        Built-in devices:
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="dlst_devices" runat="server"></asp:DropDownList>
                    </asp:TableCell>
                    </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell>
                        Double status:
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="dlst_isdouble" runat="server"></asp:DropDownList>
                    </asp:TableCell>
                    </asp:TableRow>
            </asp:Table>
            </fieldset>
            <asp:Button ID="btn_multipliers" runat="server" Text="Enter multipliers" OnClick="btn_multipliers_Click" CssClass="Initial_button" />
            <asp:Button ID="btn_cancel" runat="server" Text="Cancel" OnClick="btn_cancel_Click" CssClass="Initial_button" />
            <asp:Label ID="lbl_err" runat="server" Text="This cabinet already exists!" CssClass="wronginfo" Visible="false"></asp:Label>
        </div>
    </form>
</body>
</html>
