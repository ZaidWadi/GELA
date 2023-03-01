<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="add_multipliers_ar.aspx.cs" Inherits="GELA_DB.pages.WebForm33" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
   <title></title>
    <link href="StyleSheet1.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" dir="rtl">
        <div>
            <br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
            <asp:Table runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        <fieldset style="background-color:whitesmoke;">
                            <h3>معادلات الألماني:</h3>
                            <asp:Table runat="server" CellSpacing="10">
                                <asp:TableRow>
                                    <asp:TableCell>
                                        البودي:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="dtc_body_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="dtc_body_multiplier" ErrorMessage="الرجاء ملئ جميع الحقول!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        الكرنيش العلوي:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="dtc_upper_hood_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="dtc_upper_hood_multiplier" ErrorMessage="الرجاء ملئ جميع الحقول!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                                 <asp:TableRow>
                                    <asp:TableCell>
                                        الكرنيش السفلي
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="dtc_lower_hood_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="dtc_lower_hood_multiplier" ErrorMessage="الرجاء ملئ جميع الحقول!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        جرانيت التوب
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="dtc_top_granite_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="dtc_top_granite_multiplier" ErrorMessage="الرجاء ملئ جميع الحقول!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                                 <asp:TableRow>
                                    <asp:TableCell>
                                        البانيل العلوي:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="dtc_upper_panel_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="dtc_upper_panel_multiplier" ErrorMessage="الرجاء ملئ جميع الحقول!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        البانيل السفلي:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="dtc_lower_panel_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="dtc_lower_panel_multiplier" ErrorMessage="الرجاء ملئ جميع الحقول!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                                 <asp:TableRow>
                                    <asp:TableCell>
                                        الفتحات:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="dtc_holes_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="dtc_holes_multiplier" ErrorMessage="الرجاء ملئ جميع الحقول!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </fieldset>
                    </asp:TableCell>
                    <asp:TableCell>
                        <fieldset style="background-color:whitesmoke;">
                            <h3>معادلات الألماني الدبل:</h3>
                            <asp:Table runat="server" CellSpacing="10">
                                <asp:TableRow>
                                    <asp:TableCell>
                                        البودي:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="dtcd_body_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="dtcd_body_multiplier" ErrorMessage="الرجاء ملئ جميع الحقول!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        الكرنيش العلوي:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="dtcd_upper_hood_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="dtcd_upper_hood_multiplier" ErrorMessage="الرجاء ملئ جميع الحقول!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                                 <asp:TableRow>
                                    <asp:TableCell>
                                        الكرنيش السفلي:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="dtcd_lower_hood_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="dtcd_lower_hood_multiplier" ErrorMessage="الرجاء ملئ جميع الحقول!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        جرانيت التوب:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="dtcd_top_granite_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="dtcd_top_granite_multiplier" ErrorMessage="الرجاء ملئ جميع الحقول!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                                 <asp:TableRow>
                                    <asp:TableCell>
                                        البانيل العلوي:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="dtcd_upper_panel_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="dtcd_upper_panel_multiplier" ErrorMessage="الرجاء ملئ جميع الحقول!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        البانيل السفلي:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="dtcd_lower_panel_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="dtcd_lower_panel_multiplier" ErrorMessage="الرجاء ملئ جميع الحقول!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                                 <asp:TableRow>
                                    <asp:TableCell>
                                        الفتحات:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="dtcd_holes_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="dtcd_holes_multiplier" ErrorMessage="الرجاء ملئ جميع الحقول!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </fieldset>
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell>
                        <fieldset style="background-color:whitesmoke;">
                            <h3>معادلات الفل هايت:</h3>
                            <asp:Table runat="server" CellSpacing="10">
                                <asp:TableRow>
                                    <asp:TableCell>
                                        البودي:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="ful_body_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ful_body_multiplier" ErrorMessage="الرجاء ملئ جميع الحقول!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        الكرنيش العلوي:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="ful_upper_hood_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ful_upper_hood_multiplier" ErrorMessage="الرجاء ملئ جميع الحقول!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                                 <asp:TableRow>
                                    <asp:TableCell>
                                        الكرنيش السفلي:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="ful_lower_hood_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ful_lower_hood_multiplier" ErrorMessage="الرجاء ملئ جميع الحقول!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        جرانيت التوب:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="ful_granite_top_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ful_granite_top_multiplier" ErrorMessage="الرجاء ملئ جميع الحقول!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                                 <asp:TableRow>
                                    <asp:TableCell>
                                        البانيل العلوي:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="ful_upper_panel_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ful_upper_panel_multiplier" ErrorMessage="الرجاء ملئ جميع الحقول!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        البانيل السفلي:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="ful_lower_panel_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ful_lower_panel_multiplier" ErrorMessage="الرجاء ملئ جميع الحقول!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                                 <asp:TableRow>
                                    <asp:TableCell>
                                        الفتحات:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="ful_holes_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ful_holes_multiplier" ErrorMessage="الرجاء ملئ جميع الحقول!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </fieldset>
                    </asp:TableCell>
                    <asp:TableCell>
                        <fieldset style="background-color:whitesmoke;">
                            <h3>معادلات الفل هايت الدبل:</h3>
                            <asp:Table runat="server" CellSpacing="10">
                                <asp:TableRow>
                                    <asp:TableCell>
                                        البودي:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="fuld_body_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="fuld_body_multiplier" ErrorMessage="الرجاء ملئ جميع الحقول!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        الكرنيش العلوي:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="fuld_upper_hood_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="fuld_upper_hood_multiplier" ErrorMessage="الرجاء ملئ جميع الحقول!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                                 <asp:TableRow>
                                    <asp:TableCell>
                                        الكرنيش السفلي:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="fuld_lower_hood_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="fuld_lower_hood_multiplier" ErrorMessage="الرجاء ملئ جميع الحقول!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        جرانيت التوب:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="fuld_top_granite_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="fuld_top_granite_multiplier" ErrorMessage="الرجاء ملئ جميع الحقول!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                                 <asp:TableRow>
                                    <asp:TableCell>
                                        البانيل العلوي:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="fuld_upper_panel_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="fuld_upper_panel_multiplier" ErrorMessage="الرجاء ملئ جميع الحقول!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        البانيل السفلي:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="fuld_lower_panel_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="fuld_lower_panel_multiplier" ErrorMessage="الرجاء ملئ جميع الحقول!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                                 <asp:TableRow>
                                    <asp:TableCell>
                                        الفتحات:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="fuld_holes_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="fuld_holes_multiplier" ErrorMessage="الرجاء ملئ جميع الحقول!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </fieldset>
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell>
                        <fieldset style="background-color:whitesmoke;">
                            <h3>معادلات الامريكي:</h3>
                            <asp:Table runat="server" CellSpacing="10">
                                <asp:TableRow>
                                    <asp:TableCell>
                                        البودي:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="std_body_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="std_body_multiplier" ErrorMessage="الرجاء ملئ جميع الحقول!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        الكرنيش العلوي:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="std_upper_hood_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="std_upper_hood_multiplier" ErrorMessage="الرجاء ملئ جميع الحقول!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                                 <asp:TableRow>
                                    <asp:TableCell>
                                        الكرنيش السفلي:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="std_lower_hood_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="std_lower_hood_multiplier" ErrorMessage="الرجاء ملئ جميع الحقول!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        جرانيت التوب:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="std_top_granite_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="std_top_granite_multiplier" ErrorMessage="الرجاء ملئ جميع الحقول!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                                 <asp:TableRow>
                                    <asp:TableCell>
                                        البانيل العلوي:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="std_upper_panel_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="std_upper_panel_multiplier" ErrorMessage="الرجاء ملئ جميع الحقول!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        البانيل السفلي:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="std_lower_panel_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="std_lower_panel_multiplier" ErrorMessage="الرجاء ملئ جميع الحقول!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                                 <asp:TableRow>
                                    <asp:TableCell>
                                        الفتحات:
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="std_holes_multiplier" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="std_holes_multiplier" ErrorMessage="الرجاء ملئ جميع الحقول!"></asp:RequiredFieldValidator>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </fieldset>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="btn_done" runat="server" Text="انتهى" OnClick="btn_done_Click" CssClass="Initial_button_ar" />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
    </form>
</body>
</html>
