<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="new_employee.aspx.cs" Inherits="GELA_DB.pages.WebForm10" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet1.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
       <asp:ScriptManager ID="scrptmgr_project_data_input" runat="server"></asp:ScriptManager>
        <div>
            <br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
            <h2>Employee info:</h2>
            <fieldset style="background-color:whitesmoke;">
            <table class="borderspaces">
                <tr>
                    <td>
            <asp:Label ID="lbl_Employee_ID" runat="server"></asp:Label>
                        </td>
                    
                    </tr>
                <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                <tr>
                    <td>
            <asp:Label ID="lbl_Name" runat="server">Full Name: </asp:Label>
            <asp:TextBox ID="txtbx_Name" runat="server"></asp:TextBox>
                        </td>
                     <td>
            <asp:Label ID="lbl_ar_name" runat="server">Arabic Full Name: </asp:Label>
            <asp:TextBox ID="txtbx_ar_name" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>

                 <tr>
                    <td>
            <asp:Label ID="lbl_PhoneNo_1" runat="server">Phone Number: </asp:Label>
            <asp:TextBox ID="txtbx_PhoneNo_1" runat="server"></asp:TextBox>
                        </td>
                     <td>
            <asp:Label ID="lbl_PhoneNo_2" runat="server">Second Phone Number: </asp:Label>
            <asp:TextBox ID="txtbx_PhoneNo_2" runat="server"></asp:TextBox>
                         </td>
                    </tr>
                <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                <tr>
                        <td>
            <asp:Label ID="lbl_department" runat="server">Department: </asp:Label>
            <asp:DropDownList ID="dlst_department" runat="server"></asp:DropDownList>
                        </td>
                    </tr>
              <tr>
                    <td>
            <asp:TextBox ID="txtbx_correlation_status" runat="server" Visible="false"></asp:TextBox>
                        </td>
                    </tr>
               <tr>
                    <td>
                         <asp:Button ID="btn_NextPage" runat="server" text="Done"  OnClick="btn_NextPage_Click" CssClass="Initial_button"/>
                    </td>
                </tr>
           
                </table>
                </fieldset>
        </div>
    </form>
</body>
</html>
