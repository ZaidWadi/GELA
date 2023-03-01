using System;

namespace GELA_DB.pages
{
    public partial class WebForm3 : System.Web.UI.Page
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
                    Response.Redirect("designer_user_page.aspx");
                }
                else if (Session["auth"].ToString() == "Supervisor")
                {
                    Response.Redirect("design_supervisor_user_page.aspx");
                }
            }
            else
            {
                Response.Redirect("login_page.aspx");
            }
        }
    }
}