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
    public partial class WebForm47 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["auth"] != null)
            {
                if (Session["auth"].ToString() == "Supervisor")
                {
                    if (!IsPostBack)
                    {///t
                        Tab1.CssClass = "Clicked_button_ar";
                        material_views.ActiveViewIndex = 0;
                        Page.ClientScript.RegisterClientScriptInclude("jquery", Page.ResolveUrl("~/Scripts/jquery-3.6.0.js"));
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

        protected void Tab3_Click(object sender, EventArgs e)
        {
            Tab3.CssClass = "Clicked_button_ar";
            Tab1.CssClass = "Initial_button_ar";
            Tab2.CssClass = "Initial_button_ar";
            Tab4.CssClass = "Initial_button_ar";
            Tab5.CssClass = "Initial_button_ar";
            Tab6.CssClass = "Initial_button_ar";
            Tab7.CssClass = "Initial_button_ar";
            material_views.ActiveViewIndex = 2;
        }

        protected void Tab4_Click(object sender, EventArgs e)
        {
            Tab4.CssClass = "Clicked_button_ar";
            Tab1.CssClass = "Initial_button_ar";
            Tab2.CssClass = "Initial_button_ar";
            Tab3.CssClass = "Initial_button_ar";
            Tab5.CssClass = "Initial_button_ar";
            Tab6.CssClass = "Initial_button_ar";
            Tab7.CssClass = "Initial_button_ar";
            material_views.ActiveViewIndex = 3;
        }

        protected void Tab1_Click(object sender, EventArgs e)
        {

            Tab1.CssClass = "Clicked_button_ar";
            Tab2.CssClass = "Initial_button_ar";
            Tab3.CssClass = "Initial_button_ar";
            Tab4.CssClass = "Initial_button_ar";
            Tab5.CssClass = "Initial_button_ar";
            Tab6.CssClass = "Initial_button_ar";
            Tab7.CssClass = "Initial_button_ar";
            material_views.ActiveViewIndex = 0;


        }

        protected void Tab2_Click(object sender, EventArgs e)
        {

            Tab2.CssClass = "Clicked_button_ar";
            Tab1.CssClass = "Initial_button_ar";
            Tab3.CssClass = "Initial_button_ar";
            Tab4.CssClass = "Initial_button_ar";
            Tab5.CssClass = "Initial_button_ar";
            Tab6.CssClass = "Initial_button_ar";
            Tab7.CssClass = "Initial_button_ar";
            material_views.ActiveViewIndex = 1;

        }

        protected void wood_view_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.fxd_tbl_cbnt_wood_type", con);
            SqlDataReader dr = cmd.ExecuteReader();
            wood_grid.DataSource = dr;
            wood_grid.DataBind();
            con.Close();
        }

        protected void granite_view_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.fxd_tbl_granite_types", con);
            SqlDataReader dr = cmd.ExecuteReader();
            granite_grid.DataSource = dr;
            granite_grid.DataBind();
            con.Close();
        }

        protected void devices_view_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.fxd_tbl_devices", con);
            SqlDataReader dr = cmd.ExecuteReader();
            devices_grid.DataSource = dr;
            devices_grid.DataBind();
            con.Close();
        }

        protected void accessories_view_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.fxd_tbl_accessories", con);
            SqlDataReader dr = cmd.ExecuteReader();
            accessories_grid.DataSource = dr;
            accessories_grid.DataBind();
            con.Close();
        }

        protected void tmr_Tick(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
            con.Open();
            SqlCommand cmd_acc = new SqlCommand("SELECT * FROM dbo.fxd_tbl_accessories", con);
            SqlDataReader dr_acc = cmd_acc.ExecuteReader();
            accessories_grid.DataSource = dr_acc;
            accessories_grid.DataBind();
            con.Close();
            con.Open();
            SqlCommand cmd_dev = new SqlCommand("SELECT * FROM dbo.fxd_tbl_devices", con);
            SqlDataReader dr_dev = cmd_dev.ExecuteReader();
            devices_grid.DataSource = dr_dev;
            devices_grid.DataBind();
            con.Close();
            SqlCommand cmd_gr = new SqlCommand("SELECT * FROM dbo.fxd_tbl_granite_types", con);
            SqlDataReader dr_gr = cmd_gr.ExecuteReader();
            granite_grid.DataSource = dr_gr;
            granite_grid.DataBind();
            con.Close();
            con.Open();
            SqlCommand cmd_wood = new SqlCommand("SELECT * FROM dbo.fxd_tbl_cbnt_wood_type", con);
            SqlDataReader dr_wood = cmd_wood.ExecuteReader();
            wood_grid.DataSource = dr_wood;
            wood_grid.DataBind();
            con.Close();
        }

        protected void btn_add_wood_Click(object sender, EventArgs e)
        {
            string popup = "window.open ('add_wood_ar.aspx', 'popup_window', 'width=300,height=100,left=100,top=100,resizable=yes');";
            ClientScript.RegisterStartupScript(GetType(), "script", popup, true);
        }

        protected void btn_add_acc_Click(object sender, EventArgs e)
        {
            string popup = "window.open ('add_acc_ar.aspx', 'popup_window', 'width=300,height=100,left=100,top=100,resizable=yes');";
            ClientScript.RegisterStartupScript(GetType(), "script", popup, true);
        }

        protected void btn_add_device_Click(object sender, EventArgs e)
        {
            string popup = "window.open ('add_device_ar.aspx', 'popup_window', 'width=300,height=100,left=100,top=100,resizable=yes');";
            ClientScript.RegisterStartupScript(GetType(), "script", popup, true);
        }

        protected void btn_add_granite_Click(object sender, EventArgs e)
        {
            string popup = "window.open ('add_granite_ar.aspx', 'popup_window', 'width=300,height=100,left=100,top=100,resizable=yes');";
            ClientScript.RegisterStartupScript(GetType(), "script", popup, true);
        }

        protected void btn_done_Click(object sender, EventArgs e)
        {
            Response.Write("<script>window.close();</" + "script>");
            Response.End();
        }

        protected void Tab5_Click(object sender, EventArgs e)
        {
            Tab5.CssClass = "Clicked_button_ar";
            Tab1.CssClass = "Initial_button_ar";
            Tab3.CssClass = "Initial_button_ar";
            Tab4.CssClass = "Initial_button_ar";
            Tab2.CssClass = "Initial_button_ar";
            Tab6.CssClass = "Initial_button_ar";
            Tab7.CssClass = "Initial_button_ar";
            material_views.ActiveViewIndex = 4;
        }

        protected void Tab6_Click(object sender, EventArgs e)
        {
            Tab6.CssClass = "Clicked_button_ar";
            Tab1.CssClass = "Initial_button_ar";
            Tab3.CssClass = "Initial_button_ar";
            Tab4.CssClass = "Initial_button_ar";
            Tab5.CssClass = "Initial_button_ar";
            Tab2.CssClass = "Initial_button_ar";
            Tab7.CssClass = "Initial_button_ar";
            material_views.ActiveViewIndex = 5;
        }

        protected void Tab7_Click(object sender, EventArgs e)
        {
            Tab7.CssClass = "Clicked_button_ar";
            Tab1.CssClass = "Initial_button_ar";
            Tab3.CssClass = "Initial_button_ar";
            Tab4.CssClass = "Initial_button_ar";
            Tab5.CssClass = "Initial_button_ar";
            Tab6.CssClass = "Initial_button_ar";
            Tab2.CssClass = "Initial_button_ar";
            material_views.ActiveViewIndex = 6;
        }

        protected void btn_add_lighting_type_Click(object sender, EventArgs e)
        {
            string popup = "window.open ('add_lighting_ar.aspx', 'popup_window', 'width=300,height=100,left=100,top=100,resizable=yes');";
            ClientScript.RegisterStartupScript(GetType(), "script", popup, true);
        }

        protected void btn_add_sink_Click(object sender, EventArgs e)
        {
            string popup = "window.open ('add_sink_ar.aspx', 'popup_window', 'width=300,height=100,left=100,top=100,resizable=yes');";
            ClientScript.RegisterStartupScript(GetType(), "script", popup, true);
        }

        protected void btn_add_faucet_Click(object sender, EventArgs e)
        {
            string popup = "window.open ('add_faucet_ar.aspx', 'popup_window', 'width=300,height=100,left=100,top=100,resizable=yes');";
            ClientScript.RegisterStartupScript(GetType(), "script", popup, true);
        }

        protected void faucets_view_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.fxd_tbl_faucets", con);
            SqlDataReader dr = cmd.ExecuteReader();
            faucets_grid.DataSource = dr;
            faucets_grid.DataBind();
            con.Close();
        }

        protected void sinks_view_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.fxd_tbl_sinks_list", con);
            SqlDataReader dr = cmd.ExecuteReader();
            sinks_grid.DataSource = dr;
            sinks_grid.DataBind();
            con.Close();
        }

        protected void lighting_view_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.fxd_tbl_lighting_types", con);
            SqlDataReader dr = cmd.ExecuteReader();
            lighting_grid.DataSource = dr;
            lighting_grid.DataBind();
            con.Close();
        }
    }
}