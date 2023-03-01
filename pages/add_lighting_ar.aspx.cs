using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GELA_DB.pages
{
    public partial class WebForm32 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["auth"] != null)
            {
                if (Session["auth"].ToString() == "Supervisor")
                {

                }
                else if (Session["auth"].ToString() == "Design")
                {
                    Response.Redirect("buffer_page.aspx");
                }
            }
            else
            {
                Response.Redirect("buffer_page.aspx");
            }
        }

        protected void btn_done_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
            con.Open();
            SqlCommand cmd_add_name = new SqlCommand("INSERT INTO dbo.fxd_tbl_lighting_types (lighting_type_ar) VALUES(@name)", con);
            cmd_add_name.Parameters.AddWithValue("@name", txtbx_light_name.Text);
            cmd_add_name.ExecuteNonQuery();
            con.Close();
            con.Open();
            SqlCommand cmd_add_price = new SqlCommand("INSERT INTO dbo.fxd_tbl_general_prices (item_name,price) VALUES(@name,@price)", con);
            cmd_add_price.Parameters.AddWithValue("@name", txtbx_light_name.Text);
            cmd_add_price.Parameters.AddWithValue("@price", txtbx_price.Text);
            cmd_add_price.ExecuteNonQuery();
            con.Close();
            string popup = "window.open ('materials_ar.aspx', 'popup_window', 'width=300,height=100,left=100,top=100,resizable=yes');";
            ClientScript.RegisterStartupScript(GetType(), "script", popup, true);
        }

        protected void btn_back_Click(object sender, EventArgs e)
        {
            string popup = "window.open ('materials_ar.aspx', 'popup_window', 'width=300,height=100,left=100,top=100,resizable=yes');";
            ClientScript.RegisterStartupScript(GetType(), "script", popup, true);
        }
    }
}