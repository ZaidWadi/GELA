<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contract.aspx.cs" Inherits="GELA_DB.pages.WebForm13" %>

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
    <form id="form1" runat="server" style="align-self:center;">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <br /><br /><br /><br /><br /><br />
        <div style="align-content:center; text-align:center;width:1700px;text-align:right;align-self:center;" dir="rtl">
            <asp:Label ID="lbl_project_ID" runat="server" Visible="false"></asp:Label>
            <asp:Label ID="lbl_customer_id" runat="server" Visible="false"></asp:Label>
         <h1><b>عقد تصنيع مطبخ</b></h1>
            </div>
        <br /><br /><br />
        <div dir="rtl" style="background-color:whitesmoke;width:1700px;">
            <fieldset>

            <br /><br />
          <asp:Table runat="server" CellSpacing="10" Width="50%">
              <asp:TableRow>
                  <asp:TableCell>
                      التاريخ:
                  </asp:TableCell>
                  <asp:TableCell>
                      <asp:Label ID="lbl_date" runat="server"></asp:Label><br />
                      </asp:TableCell>
                  </asp:TableRow>
               <asp:TableRow>
                  <asp:TableCell>
                      الفريق الأول:
                  </asp:TableCell>
                  <asp:TableCell>
                      <br />
                    &nbsp;&nbsp;  مؤسسة الغابة الخضراء للصناعات الخشبية<br />
                     &nbsp;&nbsp; الاردن - عمان - ضاحية الياسمين - شارع جبل عرفات - معرض جيلا&nbsp;&nbsp; هاتف رقم 0790777888
                      <br /><br />
                      </asp:TableCell>
                  </asp:TableRow>
              </asp:Table>
              <asp:Table runat="server">
              <asp:TableRow>
                  <asp:TableCell>
                      الفريق الثاني:&nbsp;&nbsp;&nbsp;&nbsp;
                  </asp:TableCell>
                  <asp:TableCell>
                      <asp:Label ID="lbl_prefix" runat="server"></asp:Label><br />
                  </asp:TableCell>
                  <asp:TableCell>
                      <asp:Label ID="lbl_name" runat="server"></asp:Label><br />
                      </asp:TableCell>
                      <asp:TableCell>
                     المحترم/ة<br />
                  </asp:TableCell>
                  </asp:TableRow>
              </asp:Table>
                <asp:Table runat="server">
              <asp:TableRow>
                  <asp:TableCell>
                      <br />رقم الهاتف:<br />
                  </asp:TableCell>
                  <asp:TableCell><br /><asp:Label ID="lbl_phone_no" runat="server"></asp:Label></asp:TableCell>
                  <asp:TableCell>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </asp:TableCell>
                  <asp:TableCell>
                      <br />العنوان:<br />
                  </asp:TableCell>
                  <asp:TableCell>
                      <br /><asp:Label ID="lbl_address" runat="server"></asp:Label><br />
                  </asp:TableCell>
              </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>الرقم الوطني:</asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="lbl_nat_id" runat="server"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
          </asp:Table>
                </fieldset>
            <fieldset>
            <h3>المقدمة</h3>
            مقدمة هذه الاتفاقية جزء لا يتجزأ منها وتقرأ أينما وردت ويتكون هذا العقد من 14 بند.
            <br /><br />
            <asp:Table runat="server" CellSpacing="10" Width="50%">
                <asp:TableRow>
                    <asp:TableCell>
                        <h3>أولاً:</h3>
                        <br /><br />
                    </asp:TableCell>
                    <asp:TableCell>
    قام الفريق الثاني باختيار (مطبخ و ابواب) الذي يراه مناسبا له على أن يقوم الفريق الأول بتزويده المخطط الذي يتم تصميمه من قبل الفريق الأول والمتفق عليه .
                        <br /><br />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <h3>ثانياً:</h3>
                        <br /><br />
                    </asp:TableCell>
                    <asp:TableCell>
    تم الاتفاق بين الفريقين على مواصفات الأعمال المنوي تركيبها للفريق الثاني على الشكل التالي :
                        <br />1- مطبخ
                        <br />2- جرانيت
                        <br />3- أعمال إضافية
                        <br /> وذلك بحسب عرض السعر المقدم بتاريخ &nbsp; <asp:Label ID="lbl_po_date" runat="server"></asp:Label>
                        <br /><br />
                    </asp:TableCell>
                            </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell>
                        <h3>ثالثاً:</h3>
                        <br /><br />
                    </asp:TableCell>
                    <asp:TableCell>
    تكون قيمة العقد&nbsp;<asp:Label ID="lbl_value" runat="server"></asp:Label>&nbsp;دينار فقط لا غير
    <br />مكتوبة:_________________________________________________________________
                        <br /><br />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <h3>رابعاً:</h3>
                        <br /><br />
                    </asp:TableCell>
                    <asp:TableCell>
    ترتيب الدفعات :
                        <br />حسب جدول الدفعات بعرض السعر
                        <br /><br />
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell>
                        <h3>خامساً:</h3>
                        <br /><br />
                    </asp:TableCell>
                    <asp:TableCell>
    يلتزم الفريق الأول بالتسليم النهائي للأعمال المتفق عليها حسب المواصفات المقدمه بعرض السعر و بعد استلام  الدفعة الأولى 
                        <br /><br />
                    </asp:TableCell>
                </asp:TableRow>
                  <asp:TableRow>
                    <asp:TableCell>
                        <h3>سادساً:</h3>
                        <br /><br />
                    </asp:TableCell>
                    <asp:TableCell>
    و حيث ان مدة تنفبذ الاعمال المطلوبة هي (_______يوم) واي تغيرات يتم طلبها من قبل الفريق الثاني سواءا بالمواصفات او الالوان يعتبر تمديد تلقائي للعقد 
    <br />و حسب حجم التغير من وجهة نظر الفريق الاول او في حال طلب الفريق الثاني 
    أي أعمال اضافية بعد توقيع العقد فإنها لا تدخل في القيمة الإجمالية للعقد<br /> و لا مدة التوريد حيث تضاف القيمة على إجمالي العقد كذلك مدة التسليم النهائي لكامل المنتجات .
                        <br /><br />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <h3>سابعاً:</h3>
                        <br /><br />
                    </asp:TableCell>
                    <asp:TableCell>
    أي تعديلات على المواصفات أو الكميات بعد توقيع العقد وقبل التصنيع يحق للفريق الأول تغيير الأسعار حسب التغييرات الجديدة مع حق الفريق الأول في رفض أو قبول المواصفات الجديدة . 
                        <br /><br />
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell>
                        <h3>ثامناً:</h3>
                        <br /><br />
                    </asp:TableCell>
                    <asp:TableCell>
    اذا أخل الفريق الثاني بالإلتزامات المالية المذكورة في البند رابعا في هذا العقد يحق للفريق الاول بعدم التقيد بالتاريخ المذكور للتركيب الى أن يصوب الفريق الثاني أوضاعه . 
                        <br /><br />
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell>
                        <h3>تاسعاً:</h3>
                        <br /><br />
                    </asp:TableCell>
                    <asp:TableCell>
    في حال عدم تصويب الفريق الثاني لاوضاعه لمده تزيد عن 10 ايام يحق للفريق الاول بمطالبة الفريق الثاني بقيمة العقد بالاضافة للعطل و الضرر . 
                        <br /><br />
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell>
                        <h3>عاشراً:</h3>
                        <br /><br />
                    </asp:TableCell>
                    <asp:TableCell>
    مدة الكفالة للمنتج أعلاه عشرة سنوات عدا سوء الاستخدام .
                        <br /><br />
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell>
                        <h3>أحد عشر:</h3>
                        <br /><br />
                    </asp:TableCell>
                    <asp:TableCell>
    للفريق الأول الحق بتأجيل التركيب – في أي وقت يراه مناسب حسب جدول تركيب الشركة – اذا تبين له عدم جاهزية الموقع أو عدم وجود تيار كهربائي.
                        <br /><br />
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell>
                        <h3>إثني عشر:</h3>
                        <br /><br />
                    </asp:TableCell>
                    <asp:TableCell>
    الفريق الأول غير ملزم بالتوصيلات الصحية والكهربائية اللازمة لتشغيل المطبخ حيث يعتبر عدم تمديد الكهربائية او الصحية من بنود عدم جاهزية الموقع الا اذا اتفق الفريقين ان تكون مسؤوليه التجهيز على الفريق الاول
                        <br /><br />
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell>
                        <h3>ثلاثة عشر:</h3>
                        <br /><br />
                    </asp:TableCell>
                    <asp:TableCell>
    الفريق الأول غير ملزم بكفالة الخزانات الأرضية في حال تم تركيب الجرانيت والكوريان وأي مادة أخرى من قبل الفريق الثاني .
                        <br /><br />
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell>
                        <h3>أربع عشر:</h3>
                        <br /><br />
                    </asp:TableCell>
                    <asp:TableCell>
    يتم خصم ما قيمته (25%) من قيمة العقد اذا تم فسخ العقد خلال ثلاث أيام من توقيع العقد خلاف ذلك يتم خصم الدفعة الأولى بالكامل  .
                        <br /><br />
                    </asp:TableCell>
                </asp:TableRow>
                </asp:Table>

            </fieldset>
        </div>
    </form>
</body>
</html>
