using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GELA_DB.pages
{
    public partial class WebForm46 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["auth"] == null)
            {

            }
            else if (Session["auth"].ToString() == "Design")
            {
                Response.Redirect("~/pages/designer_user_page_ar.aspx");
            }
            else if (Session["auth"].ToString() == "Supervisor")
            {
                Response.Redirect("~/pages/design_supervisor_user_page_ar.aspx");
            }
        }

        protected void btn_login_clk(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * from dbo.fxd_tbl_user_info where UserNames=@UserNames and Passwords=@Passwords", con);
            cmd.Parameters.AddWithValue("@UserNames", txtbx_UserName.Text.ToLower());
            cmd.Parameters.AddWithValue("@Passwords", txtbx_password.Text);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            if (dt.Rows.Count > 0)
            {
                Session["auth"] = dt.Rows[0]["Sector"].ToString();
                Session["username"] = dt.Rows[0]["UserNames"].ToString();
                if (dt.Rows[0]["Sector"].ToString() == "Design")
                {
                    Response.Redirect("~/pages/designer_user_page_ar.aspx");
                }
                else if (dt.Rows[0]["Sector"].ToString() == "Supervisor")
                {
                    Response.Redirect("~/pages/design_supervisor_user_page_ar.aspx");
                }


            }
            else
            {
                lbl_wrong_info.Visible = true;
            }
        }

        protected void txtbx_password_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btn_lang_Click(object sender, EventArgs e)
        {
            Response.Redirect("login_page.aspx");
        }
    }
}