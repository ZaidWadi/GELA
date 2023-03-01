using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GELA_DB.pages
{
    public partial class WebForm36 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ///f
        }

        protected void timer_Tick(object sender, EventArgs e)
        {
            if (Session["auth"] != null)
            {
                if (Session["auth"].ToString() == "Design")
                {
                    Response.Redirect("designer_user_page_ar.aspx");
                }
                else if (Session["auth"].ToString() == "Supervisor")
                {
                    Response.Redirect("design_supervisor_user_page_ar.aspx");
                }
            }
            else
            {
                Response.Redirect("login_page_ar.aspx");
            }
        }
    }
}