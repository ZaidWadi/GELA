<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="materials_ar.aspx.cs" Inherits="GELA_DB.pages.WebForm47" %>

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
    <br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
    
    <form id="form1" runat="server" dir="rtl" >
        <asp:ScriptManager ID="scrptmgr" runat="server"></asp:ScriptManager>
        <div>
             <asp:Timer runat="server" ID="tmr" Interval="10000" OnTick="tmr_Tick"></asp:Timer>
    <br /><table width="80%" align="center">
     <tr>
         <td>
          <asp:Button Text="الخشب" BorderStyle="None" ID="Tab1" CssClass="Initial_button_ar" runat="server" OnClick="Tab1_Click" />
          <asp:Button Text="الجرانيت" BorderStyle="None" ID="Tab2" CssClass="Initial_button_ar" runat="server" onclick="Tab2_Click"/>
          <asp:Button Text="الأجهزة" BorderStyle="None" ID="Tab3" CssClass="Initial_button_ar" runat="server" OnClick="Tab3_Click" />
          <asp:Button Text="الاكسسوارات" BorderStyle="None" ID="Tab4" CssClass="Initial_button_ar" runat="server" onclick="Tab4_Click"/>
          <asp:Button Text="الانارة" BorderStyle="None" ID="Tab5" CssClass="Initial_button_ar" runat="server" onclick="Tab5_Click"/>
          <asp:Button Text="المجالي" BorderStyle="None" ID="Tab6" CssClass="Initial_button_ar" runat="server" onclick="Tab6_Click"/>
          <asp:Button Text="البطاريات" BorderStyle="None" ID="Tab7" CssClass="Initial_button_ar" runat="server" onclick="Tab7_Click"/>

             </td>
         </tr>
        <tr>
            <td>
            <asp:MultiView ID="material_views" runat="server">
                    <asp:View ID="wood_view" runat="server" OnLoad="wood_view_Load">
                    <table style="background-color:whitesmoke; width: 100%; border-width: 1px; border-color: #666; border-style: none">
                    <tr>
                      <td>
                        <h3>
                           <asp:GridView ID="wood_grid" runat="server" AutoGenerateColumns="false" CssClass="mydatagrid" PagerStyle-CssClass="pager"
 HeaderStyle-CssClass="header" RowStyle-CssClass="rows" ShowHeaderWhenEmpty="true">
                <Columns>
                   <asp:BoundField DataField="cbnt_wood_type" HeaderText="نوع الخشب" />
                   <asp:BoundField DataField="wood_place" HeaderText="بودي/درف" />
                </Columns>
                              </asp:GridView>
                        </h3>
                      </td>
                    </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btn_add_wood" runat="server" Text="اضافة نوع خشب جديد" OnClick="btn_add_wood_Click" CssClass="Initial_button_ar" />
                            </td>
                        </tr>
                  </table>
                 </asp:View>
                 <asp:View ID="granite_view" runat="server" OnLoad="granite_view_Load">
                    <table style="background-color:whitesmoke; width: 100%; border-width: 1px; border-color: #666; border-style: none">
                    <tr>
                      <td>
                                     <asp:UpdatePanel runat="server">
                                         <Triggers><asp:AsyncPostBackTrigger ControlID="tmr" /></Triggers>
                                         <ContentTemplate>         
                        <h3>
                            <div style="width:1850px;background-color:whitesmoke;overflow:auto;max-height:500px;">
                          <asp:GridView ID="granite_grid" runat="server" AutoGenerateColumns="false" CssClass="mydatagrid" PagerStyle-CssClass="pager"
 HeaderStyle-CssClass="header" RowStyle-CssClass="rows" ShowHeaderWhenEmpty="true">
                <Columns>
                   <asp:BoundField DataField="granite_type_ar" HeaderText="نوع الجرانيت" />
                </Columns>     
                              </asp:GridView>
                                </div>
                                    
                        </h3>
                                               </ContentTemplate>
                                     </asp:UpdatePanel>
                      </td>
                    </tr>
                         <tr>
                            <td>
                                <asp:Button ID="btn_add_granite" runat="server" Text="اضافة نوع جرانيت جديد" OnClick="btn_add_granite_Click" CssClass="Initial_button_ar" />
                            </td>
                        </tr>
                  </table>
                               </asp:View>
            <asp:View ID="devices_view" runat="server" OnLoad="devices_view_Load" >
                   <br /><br />
                    <table style="background-color:whitesmoke; width: 100%; border-width: 1px; border-color: #666; border-style: none">
                <tr>
                  <td>
                      
                      <div style="width:1700px;max-height:500px;background-color:whitesmoke;overflow:auto;">
                         
                          <asp:UpdatePanel runat="server">
                              <Triggers><asp:AsyncPostBackTrigger ControlID="tmr" /></Triggers>
                              <ContentTemplate>
            <asp:GridView ID="devices_grid" runat="server" AutoGenerateColumns="false" CssClass="mydatagrid" PagerStyle-CssClass="pager"
 HeaderStyle-CssClass="header" RowStyle-CssClass="rows" ShowHeaderWhenEmpty="true">
                <Columns>
                    <asp:BoundField DataField="device_name" HeaderText="الجهاز" />
                   <asp:BoundField DataField="serial_no" HeaderText="الرقم التسلسلي" />
                </Columns>
            </asp:GridView>
                                                                </ContentTemplate>
                          </asp:UpdatePanel>
                          </div>
                          </td> 
                </tr>
                         <tr>
                            <td>
                                <asp:Button ID="btn_add_device" runat="server" Text="اضافة جهاز جديد" OnClick="btn_add_device_Click" CssClass="Initial_button_ar" />
                            </td>
                        </tr>
                        </table>
                                </asp:View>
                <asp:View ID="accessories_view" runat="server" OnLoad="accessories_view_Load" >
                   <br /><br />
                    <table style="background-color:whitesmoke; width: 100%; border-width: 1px; border-color: #666; border-style: none">
                <tr>
                  <td>
                      
                      <div style="width:1700px;max-height:500px;background-color:whitesmoke;overflow:auto;">
                         
                          <asp:UpdatePanel runat="server">
                              <Triggers><asp:AsyncPostBackTrigger ControlID="tmr" /></Triggers>
                              <ContentTemplate>
            <asp:GridView ID="accessories_grid" runat="server" AutoGenerateColumns="false" CssClass="mydatagrid" PagerStyle-CssClass="pager"
 HeaderStyle-CssClass="header" RowStyle-CssClass="rows" ShowHeaderWhenEmpty="true">
                <Columns>
                   <asp:BoundField DataField="accessory_name_ar" HeaderText="الاكسسوار" />
                   <asp:BoundField DataField="height" HeaderText="الارتفاع" />
                   <asp:BoundField DataField="width" HeaderText="العرض" />
                   <asp:BoundField DataField="color" HeaderText="اللون" />
                </Columns>
            </asp:GridView>
                                                                </ContentTemplate>
                          </asp:UpdatePanel>
                          </div>
                          </td> 
                </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btn_add_acc" runat="server" Text="اضافة اكسسوار جديد" OnClick="btn_add_acc_Click" CssClass="Initial_button_ar" />
                            </td>
                        </tr>
                        </table>
                                </asp:View>
                <asp:View ID="lighting_view" runat="server" OnLoad="lighting_view_Load" >
                   <br /><br />
                    <table style="background-color:whitesmoke; width: 100%; border-width: 1px; border-color: #666; border-style: none">
                <tr>
                  <td>
                      
                      <div style="width:1700px;max-height:500px;background-color:whitesmoke;overflow:auto;">
                         
                          <asp:UpdatePanel runat="server">
                              <Triggers><asp:AsyncPostBackTrigger ControlID="tmr" /></Triggers>
                              <ContentTemplate>
            <asp:GridView ID="lighting_grid" runat="server" AutoGenerateColumns="false" CssClass="mydatagrid" PagerStyle-CssClass="pager"
 HeaderStyle-CssClass="header" RowStyle-CssClass="rows" ShowHeaderWhenEmpty="true">
                <Columns>
                   <asp:BoundField DataField="lighting_type_ar" HeaderText="الانارة" />
                </Columns>
            </asp:GridView>
                                                                </ContentTemplate>
                          </asp:UpdatePanel>
                          </div>
                          </td> 
                </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btn_add_lighting_type" runat="server" Text="اضافة انارة جديدة" OnClick="btn_add_lighting_type_Click" CssClass="Initial_button_ar" />
                            </td>
                        </tr>
                        </table>
                                </asp:View>
                <asp:View ID="sinks_view" runat="server" OnLoad="sinks_view_Load" >
                   <br /><br />
                    <table style="background-color:whitesmoke; width: 100%; border-width: 1px; border-color: #666; border-style: none">
                <tr>
                  <td>
                      
                      <div style="width:1700px;max-height:500px;background-color:whitesmoke;overflow:auto;">
                         
                          <asp:UpdatePanel runat="server">
                              <Triggers><asp:AsyncPostBackTrigger ControlID="tmr" /></Triggers>
                              <ContentTemplate>
            <asp:GridView ID="sinks_grid" runat="server" AutoGenerateColumns="false" CssClass="mydatagrid" PagerStyle-CssClass="pager"
 HeaderStyle-CssClass="header" RowStyle-CssClass="rows" ShowHeaderWhenEmpty="true">
                <Columns>
                   <asp:BoundField DataField="sink_name" HeaderText="المجالي" />
                </Columns>
            </asp:GridView>
                                                                </ContentTemplate>
                          </asp:UpdatePanel>
                          </div>
                          </td> 
                </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btn_add_sink" runat="server" Text="اضافة مجلى جديدة" OnClick="btn_add_sink_Click" CssClass="Initial_button_ar" />
                            </td>
                        </tr>
                        </table>
                                </asp:View>
                <asp:View ID="faucets_view" runat="server" OnLoad="faucets_view_Load" >
                   <br /><br />
                    <table style="background-color:whitesmoke; width: 100%; border-width: 1px; border-color: #666; border-style: none">
                <tr>
                  <td>
                      
                      <div style="width:1700px;max-height:500px;background-color:whitesmoke;overflow:auto;">
                         
                          <asp:UpdatePanel runat="server">
                              <Triggers><asp:AsyncPostBackTrigger ControlID="tmr" /></Triggers>
                              <ContentTemplate>
            <asp:GridView ID="faucets_grid" runat="server" AutoGenerateColumns="false" CssClass="mydatagrid" PagerStyle-CssClass="pager"
 HeaderStyle-CssClass="header" RowStyle-CssClass="rows" ShowHeaderWhenEmpty="true">
                <Columns>
                   <asp:BoundField DataField="faucet_name" HeaderText="البطاريات" />
                </Columns>
            </asp:GridView>
                                                                </ContentTemplate>
                          </asp:UpdatePanel>
                          </div>
                          </td> 
                </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btn_add_faucet" runat="server" Text="اضافة بطارية جديدة" OnClick="btn_add_faucet_Click" CssClass="Initial_button_ar" />
                            </td>
                        </tr>
                        </table>
                                </asp:View>
                </asp:MultiView>
                            </td>
                        </tr>
        <tr>
            <td>
                <asp:Button ID="btn_done" runat="server" Text="انتهى" OnClick="btn_done_Click" CssClass="Initial_button_ar" />
            </td>
        </tr>
              </table>
        </div>
    </form>
</body>
</html>
