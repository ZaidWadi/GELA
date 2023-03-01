using System;
using System.Web.UI;

namespace GELA_DB
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Redirect("~/pages/login_page.aspx");
        }
    }
}