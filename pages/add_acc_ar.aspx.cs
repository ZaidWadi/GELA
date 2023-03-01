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
    public partial class WebForm28 : System.Web.UI.Page
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
            SqlCommand cmd_add_name = new SqlCommand("INSERT INTO dbo.fxd_tbl_accessories (accessory_code,accessory_name_ar,height,width,color,accessory_price) VALUES(@serial,@name,@height,@width,@color,@fullacc)", con);
            cmd_add_name.Parameters.AddWithValue("@name", txtbx_acc_name.Text);
            cmd_add_name.Parameters.AddWithValue("@serial", txtbx_serial_no.Text);
            cmd_add_name.Parameters.AddWithValue("@price", txtbx_price.Text);
            cmd_add_name.Parameters.AddWithValue("@height", txtbx_height.Text);
            cmd_add_name.Parameters.AddWithValue("@width", txtbx_width.Text);
            cmd_add_name.Parameters.AddWithValue("@color", txtbx_color.Text);
            string fullacc = txtbx_acc_name.Text + " " + txtbx_width + " X " + txtbx_height.Text + " " + txtbx_color.Text;
            cmd_add_name.Parameters.AddWithValue("@fullacc", fullacc);
            cmd_add_name.ExecuteNonQuery();
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