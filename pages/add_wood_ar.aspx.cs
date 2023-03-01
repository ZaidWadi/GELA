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
    public partial class WebForm35 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["auth"] != null)
            {
                if (Session["auth"].ToString() == "Supervisor")
                {
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
                    if (!IsPostBack)
                    {
                        con.Open();
                        SqlCommand wood_place = new SqlCommand("SELECT * from dbo.fxd_tbl_wood_loc", con);
                        SqlDataAdapter wp = new SqlDataAdapter(wood_place);
                        DataTable w_p = new DataTable();
                        wp.Fill(w_p);
                        dlst_wood_place.DataSource = w_p;
                        dlst_wood_place.DataBind();
                        dlst_wood_place.DataTextField = "wood_loc";
                        dlst_wood_place.DataValueField = "wood_loc_ID";
                        dlst_wood_place.DataBind();
                        con.Close();
                    }
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
            SqlCommand cmd_add_name = new SqlCommand("INSERT INTO dbo.fxd_tbl_cbnt_wood_type (cbnt_wood_type,wood_place) VALUES(@wood,@place)", con);
            cmd_add_name.Parameters.AddWithValue("@wood", txtbx_wood_name.Text);
            cmd_add_name.Parameters.AddWithValue("@place", dlst_wood_place.SelectedItem.Text);
            cmd_add_name.ExecuteNonQuery();
            con.Close();
            con.Open();
            SqlCommand cmd_add_price = new SqlCommand("INSERT INTO fxd_tbl_wood_granite_prices (wood_granite_name,wood_granite_price) VALUES(@name,@price)", con);
            cmd_add_price.Parameters.AddWithValue("@name", txtbx_wood_name.Text);
            cmd_add_price.Parameters.AddWithValue("@price", txtbx_price.Text);
            cmd_add_price.ExecuteNonQuery();
            con.Close();
            con.Open();
            SqlCommand cmd_add_u_hood_price = new SqlCommand("INSERT INTO fxd_tbl_upper_hood_prices (wood_type,price) VALUES(@name,@price)", con);
            cmd_add_u_hood_price.Parameters.AddWithValue("@name", txtbx_wood_name.Text);
            cmd_add_u_hood_price.Parameters.AddWithValue("@price", txtbx_price.Text);
            cmd_add_u_hood_price.ExecuteNonQuery();
            con.Close();
            con.Open();
            SqlCommand cmd_add_l_hood_price = new SqlCommand("INSERT INTO fxd_tbl_lower_hood_prices (wood_type,price) VALUES(@name,@price)", con);
            cmd_add_l_hood_price.Parameters.AddWithValue("@name", txtbx_wood_name.Text);
            cmd_add_l_hood_price.Parameters.AddWithValue("@price", txtbx_l_hood_price.Text);
            cmd_add_l_hood_price.ExecuteNonQuery();
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