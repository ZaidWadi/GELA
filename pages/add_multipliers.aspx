<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="add_multipliers.aspx.cs" Inherits="GELA_DB.pages.WebForm18" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet1.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
            <asp:Table runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        <fieldset style="background-color:whitesmoke;">
                            <h3>German height multiupliers:</h3>
                            <asp:Table runat="server" CellSpacing="10">
                                <asp:TableRow>
                                    <asp:TableCell>
                                        Body:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="dtc_body_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="dtc_body_multiplier" ErrorMessage="This field is required!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                       Upper hood:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="dtc_upper_hood_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="dtc_upper_hood_multiplier" ErrorMessage="This field is required!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                                 <asp:TableRow>
                                    <asp:TableCell>
                                        Lower hood:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="dtc_lower_hood_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="dtc_lower_hood_multiplier" ErrorMessage="This field is required!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        Top granite:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="dtc_top_granite_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="dtc_top_granite_multiplier" ErrorMessage="This field is required!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                                 <asp:TableRow>
                                    <asp:TableCell>
                                        Upper panel:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="dtc_upper_panel_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="dtc_upper_panel_multiplier" ErrorMessage="This field is required!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        Lower panel:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="dtc_lower_panel_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="dtc_lower_panel_multiplier" ErrorMessage="This field is required!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                                 <asp:TableRow>
                                    <asp:TableCell>
                                        Holes:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="dtc_holes_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="dtc_holes_multiplier" ErrorMessage="This field is required!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </fieldset>
                    </asp:TableCell>
                    <asp:TableCell>
                        <fieldset style="background-color:whitesmoke;">
                            <h3>Double German Height Multipliers:</h3>
                            <asp:Table runat="server" CellSpacing="10">
                                <asp:TableRow>
                                    <asp:TableCell>
                                        Body:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="dtcd_body_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="dtcd_body_multiplier" ErrorMessage="This field is required!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                       Upper hood:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="dtcd_upper_hood_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="dtcd_upper_hood_multiplier" ErrorMessage="This field is required!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                                 <asp:TableRow>
                                    <asp:TableCell>
                                        Lower hood:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="dtcd_lower_hood_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="dtcd_lower_hood_multiplier" ErrorMessage="This field is required!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        Top granite:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="dtcd_top_granite_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="dtcd_top_granite_multiplier" ErrorMessage="This field is required!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                                 <asp:TableRow>
                                    <asp:TableCell>
                                        Upper panel:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="dtcd_upper_panel_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="dtcd_upper_panel_multiplier" ErrorMessage="This field is required!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                       Lower panel:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="dtcd_lower_panel_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="dtcd_lower_panel_multiplier" ErrorMessage="This field is required!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                                 <asp:TableRow>
                                    <asp:TableCell>
                                        Holes:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="dtcd_holes_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="dtcd_holes_multiplier" ErrorMessage="This field is required!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </fieldset>
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell>
                        <fieldset style="background-color:whitesmoke;">
                            <h3>Full height multipliers:</h3>
                            <asp:Table runat="server" CellSpacing="10">
                                <asp:TableRow>
                                    <asp:TableCell>
                                        Body:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="ful_body_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ful_body_multiplier" ErrorMessage="This field is required!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        Upper hood:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="ful_upper_hood_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ful_upper_hood_multiplier" ErrorMessage="This field is required!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                                 <asp:TableRow>
                                    <asp:TableCell>
                                        Lower hood:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="ful_lower_hood_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ful_lower_hood_multiplier" ErrorMessage="This field is required!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        Top granite:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="ful_granite_top_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ful_granite_top_multiplier" ErrorMessage="This field is required!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                                 <asp:TableRow>
                                    <asp:TableCell>
                                        Upper panel:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="ful_upper_panel_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ful_upper_panel_multiplier" ErrorMessage="This field is required!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        Lower panel:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="ful_lower_panel_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ful_lower_panel_multiplier" ErrorMessage="This field is required!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                                 <asp:TableRow>
                                    <asp:TableCell>
                                        Holes:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="ful_holes_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ful_holes_multiplier" ErrorMessage="This field is required!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </fieldset>
                    </asp:TableCell>
                    <asp:TableCell>
                        <fieldset style="background-color:whitesmoke;">
                            <h3>Double full height multipliers:</h3>
                            <asp:Table runat="server" CellSpacing="10">
                                <asp:TableRow>
                                    <asp:TableCell>
                                        Body:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="fuld_body_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="fuld_body_multiplier" ErrorMessage="This field is required!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                       Upper hood:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="fuld_upper_hood_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="fuld_upper_hood_multiplier" ErrorMessage="This field is required!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                                 <asp:TableRow>
                                    <asp:TableCell>
                                       Lower hood:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="fuld_lower_hood_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="fuld_lower_hood_multiplier" ErrorMessage="This field is required!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                       Top granite:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="fuld_top_granite_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="fuld_top_granite_multiplier" ErrorMessage="This field is required!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                                 <asp:TableRow>
                                    <asp:TableCell>
                                       Upper panel:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="fuld_upper_panel_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="fuld_upper_panel_multiplier" ErrorMessage="This field is required!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                       Lower panel:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="fuld_lower_panel_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="fuld_lower_panel_multiplier" ErrorMessage="This field is required!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                                 <asp:TableRow>
                                    <asp:TableCell>
                                        Holes:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="fuld_holes_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="fuld_holes_multiplier" ErrorMessage="This field is required!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </fieldset>
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell>
                        <fieldset style="background-color:whitesmoke;">
                            <h3>American height multipliers:</h3>
                            <asp:Table runat="server" CellSpacing="10">
                                <asp:TableRow>
                                    <asp:TableCell>
                                        Body:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="std_body_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="std_body_multiplier" ErrorMessage="This field is required!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        Upper hood:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="std_upper_hood_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="std_upper_hood_multiplier" ErrorMessage="This field is required!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                                 <asp:TableRow>
                                    <asp:TableCell>
                                        Lower hood:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="std_lower_hood_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="std_lower_hood_multiplier" ErrorMessage="This field is required!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        Top granite:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="std_top_granite_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="std_top_granite_multiplier" ErrorMessage="This field is required!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                                 <asp:TableRow>
                                    <asp:TableCell>
                                        Upper panel:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="std_upper_panel_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="std_upper_panel_multiplier" ErrorMessage="This field is required!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                       Lower panel:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="std_lower_panel_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="std_lower_panel_multiplier" ErrorMessage="This field is required!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                                 <asp:TableRow>
                                    <asp:TableCell>
                                        Holes:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="std_holes_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="std_holes_multiplier" ErrorMessage="This field is required!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </fieldset>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="btn_done" runat="server" Text="Done" OnClick="btn_done_Click" CssClass="Initial_button" />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
    </form>
</body>
</html>
