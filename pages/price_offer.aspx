<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="price_offer.aspx.cs" Inherits="GELA_DB.pages.WebForm9" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="StyleSheet1.css" rel="stylesheet" />
    <title></title>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />

<script src="../Scripts/jquery-3.6.0.min.js"></script>
<script src="../Scripts/bootstrap.min.js"></script>
<script src="../Scripts/select2.min.js"></script>

<link href="../Content/css/select2.css" rel="stylesheet" />

<meta name="viewport" content="width=device-width, initial-scale=1" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <br /><br /><br /><br /><br /><br />
        <div style="align-content:center; text-align:center;" dir="rtl">
            <asp:Label ID="lbl_project_ID" runat="server" Visible="false"></asp:Label>
            <asp:Label ID="lbl_customer_id" runat="server" Visible="false"></asp:Label>
         <h1><b>عرض سعر</b></h1>
        </div>
        <br /><br /><br />
        <div dir="rtl" style="background-color:whitesmoke;">
            <fieldset>
                <h3>فهرس</h3>
                <asp:Table runat="server" CssClass="table" >
                    <asp:TableHeaderRow CssClass="tr">
                        <asp:TableHeaderCell CssClass="td">
                            الترقيم
                        </asp:TableHeaderCell>
                        <asp:TableHeaderCell CssClass="td">
                            المادة
                        </asp:TableHeaderCell>
                    </asp:TableHeaderRow>
                    <asp:TableRow CssClass="tr">
                        <asp:TableCell CssClass="td">
                            أولاً:
                        </asp:TableCell>
                        <asp:TableCell CssClass="td">
                            معلومات العميل
                        </asp:TableCell>
                    </asp:TableRow>
                     <asp:TableRow CssClass="tr">
                        <asp:TableCell CssClass="td">
                            ثانياً:
                        </asp:TableCell>
                        <asp:TableCell CssClass="td">
                            المقدمة
                        </asp:TableCell>
                    </asp:TableRow>
                     <asp:TableRow CssClass="tr">
                        <asp:TableCell CssClass="td">
                            ثالثاً:
                        </asp:TableCell>
                        <asp:TableCell CssClass="td">
                            مواصفات المنتج الأساسية
                        </asp:TableCell>
                    </asp:TableRow>
                     <asp:TableRow CssClass="tr">
                        <asp:TableCell CssClass="td">
                            رابعاً:
                        </asp:TableCell>
                        <asp:TableCell CssClass="td">
                            الاكسسوارات والأجهزة
                        </asp:TableCell>
                    </asp:TableRow>
                     <asp:TableRow CssClass="tr">
                        <asp:TableCell CssClass="td">
                            خامساً:
                        </asp:TableCell>
                        <asp:TableCell CssClass="td">
                            الأسعار
                        </asp:TableCell>
                    </asp:TableRow>
                     <asp:TableRow CssClass="tr">
                        <asp:TableCell CssClass="td">
                            سادساً:
                        </asp:TableCell>
                        <asp:TableCell CssClass="td">
                            الشروط والأحكام
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </fieldset>
            <fieldset>
          <h3>أولاً: معلومات العميل</h3><br />
            <br /><br />
          <asp:Table runat="server" CellSpacing="10">
              <asp:TableRow>
                  <asp:TableCell>
                      <asp:Label ID="lbl_prefix" runat="server"></asp:Label><br />
                  </asp:TableCell>
                  <asp:TableCell>
                      <asp:Label ID="lbl_name" runat="server"></asp:Label><br />
                      </asp:TableCell>
                      <asp:TableCell>
                      المحترم/ة<br />
                  </asp:TableCell>
                  <asp:TableCell>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </asp:TableCell>
                  <asp:TableCell>
                      رقم الهاتف:<br />
                  </asp:TableCell>
                  <asp:TableCell><asp:Label ID="lbl_phone_no" runat="server"></asp:Label></asp:TableCell>
              </asp:TableRow>
              <asp:TableRow>
                  <asp:TableCell>
                      العنوان:<br />
                  </asp:TableCell>
                  <asp:TableCell>
                      <asp:Label ID="lbl_address" runat="server"></asp:Label><br />
                  </asp:TableCell>
              </asp:TableRow>
          </asp:Table>
                </fieldset>
            <fieldset>
            <h3>ثانياً: المقدمة</h3><br />
            <br /><br />
            <asp:Table runat="server" CellSpacing="10">
                <asp:TableRow>
                    <asp:TableCell>
                        تحية طيبة وبعد،،،<br />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        يسعدنا تقديم عرض سعر عن مطابخ حسب المواصفات و الاشكال ادناه:<br />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        1- تصميم حديث بما يتناسب مع المواصفات<br />
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell>
                        2- التنفيذ حسب التصميم المتفق عليه<br />
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell>
                        3- النقل والتركيب في الموقع
                  <br /><br />
                        </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <asp:Table runat="server" CellSpacing="10">
                <asp:TableRow>
                    <asp:TableCell>
                        تصنيف التصميم:<br />
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="lbl_kitchen_design" runat="server"></asp:Label><br />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        نوع المطبخ:<br />
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="lbl_kitchen_type" runat="server"></asp:Label><br />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        ارتفاع المطبخ:<br />
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="lbl_kitchen_height" runat="server"></asp:Label><br />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <br /><br />
            <asp:Table runat="server" CellSpacing="10">
                <asp:TableRow>
                    <asp:TableCell>
                        ويشمل عرض السعر ما يلي:<br />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell></asp:TableCell>
                    <asp:TableCell>1- مواصفات المنتج الأساسية<br /></asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell></asp:TableCell>
                    <asp:TableCell>2- الاضافات الاساسية<br /></asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell></asp:TableCell>
                    <asp:TableCell>3- الاكسسوارات<br /></asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell></asp:TableCell>
                    <asp:TableCell>4- الاجهزة<br /></asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell></asp:TableCell>
                    <asp:TableCell>5- تفاصيل الاسعار<br /></asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell></asp:TableCell>
                    <asp:TableCell>6- الشروط الأساسية للعرض<br /></asp:TableCell>
                </asp:TableRow>
            </asp:Table>
                </fieldset>
            <fieldset>
                <h3>ثالثاً: مواصفات المنتج الأساسية:</h3>
                <asp:Table runat="server" CellSpacing="10">
                    <asp:TableRow>
                        <asp:TableCell>
                            خشب البودي الداخلي:<br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="lbl_inner_body_wood" runat="server"></asp:Label><br />
                        </asp:TableCell>
                         <asp:TableCell><br /></asp:TableCell>
                        <asp:TableCell><asp:Label ID="lbl_inner_body_color" runat="server"></asp:Label><br /></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            خشب الدرف العلوية:<br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="lbl_upper_cabinet_wood" runat="server"><br /></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>اللون:<br /></asp:TableCell>
                        <asp:TableCell><asp:Label ID="lbl_upper_cabinet_color" runat="server"></asp:Label><br /></asp:TableCell>
                    </asp:TableRow>
                     <asp:TableRow>
                        <asp:TableCell>
                            خشب الدرف الدبل المرتفعة:<br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="lbl_u_upper_cabinet_wood" runat="server"><br /></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>اللون:<br /></asp:TableCell>
                        <asp:TableCell><asp:Label ID="lbl_u_upper_cabinet_color" runat="server"></asp:Label><br /></asp:TableCell>
                    </asp:TableRow>
                     <asp:TableRow>
                        <asp:TableCell>
                            خشب الدرف الدبل المنخفضة:<br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="lbl_l_upper_cabinet_wood" runat="server"><br /></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>اللون:<br /></asp:TableCell>
                        <asp:TableCell><asp:Label ID="lbl_l_upper_cabinet_color" runat="server"></asp:Label><br /></asp:TableCell>
                    </asp:TableRow>
                     <asp:TableRow>
                        <asp:TableCell>
                            خشب الدرف السفلية:<br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="lbl_lower_cabinet_wood" runat="server"><br /></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>اللون:<br /></asp:TableCell>
                        <asp:TableCell><asp:Label ID="lbl_lower_cabinet_color" runat="server"></asp:Label><br /></asp:TableCell>
                    </asp:TableRow>
                     <asp:TableRow>
                        <asp:TableCell>
                            خشب درف المونة:<br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="lbl_pantry_cabinet_wood" runat="server"><br /></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>اللون:<br /></asp:TableCell>
                        <asp:TableCell><asp:Label ID="lbl_pantry_cabinet_color" runat="server"></asp:Label><br /></asp:TableCell>
                    </asp:TableRow>
                     <asp:TableRow>
                        <asp:TableCell>
                           نوع الجرانيت:<br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="lbl_granite" runat="server"><br /></asp:Label>
                        </asp:TableCell>
                          <asp:TableCell>
                           اسم الجرانيت:<br />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="lbl_granite_name" runat="server"><br /></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                <asp:Table runat="server" CellSpacing="10">
                    <asp:TableRow>
                        <asp:TableCell>
                            موديل الأيادي
                        </asp:TableCell>
                         <asp:TableCell>
                             <asp:Label ID="lbl_hands" runat="server"></asp:Label>
                        </asp:TableCell>
                         <asp:TableCell>
                             يضاف مبلغ
                        </asp:TableCell>
                         <asp:TableCell>
                             <asp:Label ID="lbl_hands_price" runat="server"></asp:Label>
                        </asp:TableCell>
                         <asp:TableCell>
                             دينار أردني
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            الفصالات والسكك
                        </asp:TableCell>
                         <asp:TableCell>
                              <asp:Label ID="lbl_rails_hinges" runat="server"></asp:Label>
                        </asp:TableCell>
                         <asp:TableCell>
                             يضاف مبلغ
                        </asp:TableCell>
                         <asp:TableCell>
                              <asp:Label ID="lbl_rails_hinges_price" runat="server"></asp:Label>
                        </asp:TableCell>
                         <asp:TableCell>
                             دينار أردني
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            فتحة الدكت
                        </asp:TableCell>
                         <asp:TableCell>
                             <asp:Label ID="lbl_duct_status" runat="server"></asp:Label>
                        </asp:TableCell>
                         <asp:TableCell>
                             يضاف مبلغ
                        </asp:TableCell>
                         <asp:TableCell>
                             <asp:Label ID="lbl_duct_price" runat="server"></asp:Label>
                        </asp:TableCell>
                         <asp:TableCell>
                             دينار أردني
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            الانارة
                        </asp:TableCell>
                         <asp:TableCell>
                             <asp:Label ID="lbl_lighting" runat="server"></asp:Label>
                        </asp:TableCell>
                         <asp:TableCell>
                             يضاف مبلغ
                        </asp:TableCell>
                         <asp:TableCell>
                             <asp:Label ID="lbl_lighting_price" runat="server"></asp:Label>
                        </asp:TableCell>
                         <asp:TableCell>
                             دينار أردني
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            البطارية
                        </asp:TableCell>
                         <asp:TableCell>
                             <asp:Label ID="lbl_faucet" runat="server"></asp:Label>
                        </asp:TableCell>
                         <asp:TableCell>
                             يضاف مبلغ
                        </asp:TableCell>
                         <asp:TableCell>
                             <asp:Label ID="lbl_faucet_price" runat="server"></asp:Label>
                        </asp:TableCell>
                         <asp:TableCell>
                             دينار أردني
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            المجلى
                        </asp:TableCell>
                         <asp:TableCell>
                             <asp:Label ID="lbl_sink" runat="server"></asp:Label>
                        </asp:TableCell>
                         <asp:TableCell>
                             يضاف مبلغ
                        </asp:TableCell>
                         <asp:TableCell>
                             <asp:Label ID="lbl_sink_price" runat="server"></asp:Label>
                        </asp:TableCell>
                         <asp:TableCell>
                             دينار أردني
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </fieldset>
            <fieldset>
                <h3>رابعاً: الاكسسوارات والأجهزة</h3>
                 <div>
                <asp:GridView ID="accessories_grid" runat="server" AutoGenerateColumns="false" CssClass="mydatagrid" PagerStyle-CssClass="pager"
 HeaderStyle-CssClass="header" RowStyle-CssClass="rows" ShowHeaderWhenEmpty="true">
                <Columns>
                    <asp:BoundField DataField="accessories" headertext="الاكسسوارات" />
                    <asp:BoundField DataField="accessory_price" headertext="السعر" />
                    <asp:TemplateField><ItemTemplate>دينار أردني</ItemTemplate></asp:TemplateField>
                </Columns>
                </asp:GridView>
                     </div>
                <div>
                 <asp:GridView ID="devices_grid" runat="server" AutoGenerateColumns="false" CssClass="mydatagrid" PagerStyle-CssClass="pager"
 HeaderStyle-CssClass="header" RowStyle-CssClass="rows" ShowHeaderWhenEmpty="true">
                <Columns>
                    <asp:BoundField DataField="devices" headertext="الاجهزة" />
                    <asp:BoundField DataField="price" headertext="السعر" />
                    <asp:TemplateField><ItemTemplate>دينار أردني</ItemTemplate></asp:TemplateField>
                </Columns>
                </asp:GridView>
                    </div>
            </fieldset>
            <fieldset>
                <h3>خامساً: الأسعار</h3>
                <asp:Table runat="server" CellSpacing="10">
                    <asp:TableRow>
                        <asp:TableCell>
                            اجمالي سعر البودي الداخلي والدرف والجرانيت
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="lbl_woodwork_price" runat="server"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>دينار أردني</asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            اجمالي سعر الاضافات الاساسية
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="lbl_basic_adds_price" runat="server"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>دينار أردني</asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            اجمالي سعر الاكسسوارات
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="lbl_accessories_price" runat="server"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>دينار أردني</asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            اجمالي سعر الأجهزة
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="lbl_devices_price" runat="server"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>دينار أردني</asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            السعر الاجمالي
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="lbl_final_price" runat="server"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>دينار أردني</asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            خصم خاص
                        </asp:TableCell>
                        <asp:TableCell>
                             <asp:UpdatePanel runat="server">
                                 <ContentTemplate>
                            <asp:DropDownList ID="dlst_discount" runat="server" AutoPostBack="true" OnSelectedIndexChanged="dlst_discount_SelectedIndexChanged"></asp:DropDownList>
                       </ContentTemplate>
                            </asp:UpdatePanel>
                                     </asp:TableCell>
                        <asp:TableCell>%</asp:TableCell>
                        <asp:TableCell>دينار أردني</asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            القيمة بعد الخصم
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:UpdatePanel runat="server">
                                <Triggers><asp:AsyncPostBackTrigger ControlID="dlst_discount" /></Triggers>
                                <ContentTemplate>
                            <asp:TextBox ID="txtbx_post_discount_price" runat="server" Enabled="false" AutoPostBack="true"></asp:TextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </asp:TableCell>
                        <asp:TableCell>دينار أردني</asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </fieldset>
            <fieldset>
                <h3>جدول الدفعات:</h3>
                <asp:table runat="server" CellSpacing="10" style="border-left: 1px solid black; border-right: 1px solid black; border-bottom: 1px solid black; border-top: 1px solid black;">
                    <asp:TableHeaderRow>
                        <asp:TableHeaderCell>البيان</asp:TableHeaderCell>
                        <asp:TableHeaderCell>المبلغ</asp:TableHeaderCell>
                        <asp:TableHeaderCell>العملة</asp:TableHeaderCell>
                        <asp:TableHeaderCell>الاستحقاق</asp:TableHeaderCell>
                    </asp:TableHeaderRow>
                    <asp:TableRow>
                        <asp:TableCell>الدفعة الأولى</asp:TableCell>
                        <asp:TableCell>
                            <asp:UpdatePanel runat="server">
                                <Triggers><asp:AsyncPostBackTrigger ControlID="txtbx_post_discount_price" /></Triggers>
                                <ContentTemplate>
                            <asp:TextBox ID="txtbx_first_install_amount" runat="server" Enabled="false" AutoPostBack="true"></asp:TextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </asp:TableCell>
                        <asp:TableCell>دينار أردني</asp:TableCell>
                        <asp:TableCell>عند توقيع العقد</asp:TableCell>
                    </asp:TableRow>
                     <asp:TableRow>
                        <asp:TableCell>الدفعة الثانية</asp:TableCell>
                        <asp:TableCell>
                             <asp:UpdatePanel runat="server">
                                <Triggers><asp:AsyncPostBackTrigger ControlID="txtbx_post_discount_price" /></Triggers>
                                <ContentTemplate>
                            <asp:TextBox ID="txtbx_second_install_amount" runat="server" Enabled="false" AutoPostBack="true"></asp:TextBox>
                                    </ContentTemplate>
                            </asp:UpdatePanel>
                                    </asp:TableCell>
                        <asp:TableCell>دينار أردني</asp:TableCell>
                        <asp:TableCell>قبل تركيب الجرانيت</asp:TableCell>
                    </asp:TableRow>
                     <asp:TableRow>
                        <asp:TableCell>الدفعة الثالثة</asp:TableCell>
                        <asp:TableCell>
                            <asp:UpdatePanel runat="server">
                                <Triggers><asp:AsyncPostBackTrigger ControlID="txtbx_post_discount_price" /></Triggers>
                                <ContentTemplate>
                            <asp:TextBox ID="txtbx_third_install_amount" runat="server" Enabled="false" AutoPostBack="true" ></asp:TextBox>
                                     </ContentTemplate>
                            </asp:UpdatePanel>
                                    </asp:TableCell>
                        <asp:TableCell>دينار أردني</asp:TableCell>
                        <asp:TableCell>قبل التسليم بثلاثة أيام</asp:TableCell>
                    </asp:TableRow>
                </asp:table >
            </fieldset>
            <fieldset>
                <h3>الشروط والاحكام:</h3>
                <asp:Table runat="server" CellSpacing="20">
                    <asp:TableRow>
                        <asp:TableCell>
                            1-
                        </asp:TableCell>
                        <asp:TableCell>
                            المطبخ مكفول من سوء التصنيع لمدة عشرة سنوات ما عدا سوء الاستخدام أو التعديل من طرف ثالث
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            2-
                        </asp:TableCell>
                        <asp:TableCell>
                            الخزائن السفلية غير مكفولة في حال توريد الجرانيت من الطرف الثاني (المشتري)
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            3-
                        </asp:TableCell>
                        <asp:TableCell>
                            أي تعديلات بعد عرض السعر غير مشمولة في عرض السعر الحالي
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            4-
                        </asp:TableCell>
                        <asp:TableCell>
                            أي تأخير في تعديل التمديدات الصحية أو الكهربائية من قبل الطرف الأول يتم اضافتها لتاريخ التسليم (أيام عمل)
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            5-
                        </asp:TableCell>
                        <asp:TableCell>
                           ضرورة تأكيد اللون فور توقيع عقد المبيعات
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            6-
                        </asp:TableCell>
                        <asp:TableCell>
                            أي اكسسوارات تم اختيارها غير متوفرة لدى الوكيل يجب تغييرها وسيتم تأكيد توفرها خلال يومي عمل من قبل الشركة
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            7-
                        </asp:TableCell>
                        <asp:TableCell>
                            أي تعديلات أو اضافات يتم ابلاغ المهندس بها وهي غير موثقة  في عرض السعر أو نموذج تعديل موافق عليه تعتبر لاغية ولا يحق المطالبة بها
                        </asp:TableCell>
                    </asp:TableRow>
                     <asp:TableRow>
                        <asp:TableCell>
                            8-
                        </asp:TableCell>
                        <asp:TableCell>
                            للملاحظات والشكاوي الاتصال بالرقم 0791466614
                        </asp:TableCell>
                    </asp:TableRow>
                     <asp:TableRow>
                        <asp:TableCell>
                            9-
                        </asp:TableCell>
                        <asp:TableCell>
                            هذا العرض صالح لمدة 6 أيام عمل من تاريخ صدوره
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </fieldset>
        </div>
    </form>
</body>
</html>
