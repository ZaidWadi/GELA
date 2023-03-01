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
    public partial class WebForm23 : System.Web.UI.Page
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
            SqlCommand cmd_add_name = new SqlCommand("INSERT INTO dbo.fxd_tbl_devices (device_name,serial_no,price,fulldev) VALUES(@name,@serial,@price,@fulldev)", con);
            cmd_add_name.Parameters.AddWithValue("@name", txtbx_device_name.Text);
            cmd_add_name.Parameters.AddWithValue("@serial", txtbx_serial_no.Text);
            cmd_add_name.Parameters.AddWithValue("@price", txtbx_price.Text);
            string fulldev = txtbx_device_name.Text + " " + txtbx_serial_no.Text;
            cmd_add_name.Parameters.AddWithValue("@fulldev", fulldev);
            cmd_add_name.ExecuteNonQuery();
            con.Close();
            string popup = "window.open ('materials.aspx', 'popup_window', 'width=300,height=100,left=100,top=100,resizable=yes');";
            ClientScript.RegisterStartupScript(GetType(), "script", popup, true);
        }

        protected void btn_back_Click(object sender, EventArgs e)
        {
            string popup = "window.open ('materials.aspx', 'popup_window', 'width=300,height=100,left=100,top=100,resizable=yes');";
            ClientScript.RegisterStartupScript(GetType(), "script", popup, true);
        }
    }
}