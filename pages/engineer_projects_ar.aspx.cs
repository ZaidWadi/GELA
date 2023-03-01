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
    public partial class WebForm44 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["employee"] != null)
            {
                lbl_employee_name.Text = Session["employee"].ToString();
                lbl_dept.Text = Session["department"].ToString();
            }
            else
            {
                Response.Redirect("buffer_page.aspx");
            }
        }

        protected void btn_active_projects_Click(object sender, EventArgs e)
        {
            btn_active_projects.CssClass = "Clicked_button";
            btn_inactive_projects.CssClass = "Initial_button";
            btn_active_elsewhere.CssClass = "Initial_button";
            employee_multiview.ActiveViewIndex = 0;
        }


        protected void btn_inactive_projects_Click(object sender, EventArgs e)
        {
            btn_inactive_projects.CssClass = "Clicked_button";
            btn_active_projects.CssClass = "Initial_button";
            btn_active_elsewhere.CssClass = "Initial_button";
            employee_multiview.ActiveViewIndex = 2;
        }

        protected void active_projects_view_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
            con.Open();
            if (lbl_dept.Text == "Measurement")
            {
                SqlCommand cmd_active = new SqlCommand("SELECT * FROM dbo.entry_tbl_project_data WHERE  (measuring_eng_name = @eng) and (project_status = @stat)", con);
                cmd_active.Parameters.AddWithValue("@eng", lbl_employee_name.Text);
                cmd_active.Parameters.AddWithValue("@stat", "بانتظار المقاس");
                SqlDataReader dr_active = cmd_active.ExecuteReader();
                active_projects_grid.DataSource = dr_active;
                active_projects_grid.DataBind();
                con.Close();

            }
            if (lbl_dept.Text == "Design")
            {
                SqlCommand cmd_active = new SqlCommand("SELECT * FROM dbo.entry_tbl_project_data WHERE  (designer_name = @eng) and (project_status = @stat)", con);
                cmd_active.Parameters.AddWithValue("@eng", lbl_employee_name.Text);
                cmd_active.Parameters.AddWithValue("@stat", "في التصميم");
                SqlDataReader dr_active = cmd_active.ExecuteReader();
                active_projects_grid.DataSource = dr_active;
                active_projects_grid.DataBind();
                con.Close();
            }
            if (lbl_dept.Text == "Manufacturing")
            {
                SqlCommand cmd_active = new SqlCommand("SELECT * FROM dbo.entry_tbl_project_data WHERE  (production_manager=@eng) and (project_status = @stat)", con);
                cmd_active.Parameters.AddWithValue("@eng", lbl_employee_name.Text);
                cmd_active.Parameters.AddWithValue("@stat", "في الانتاج");
                SqlDataReader dr_active = cmd_active.ExecuteReader();
                active_projects_grid.DataSource = dr_active;
                active_projects_grid.DataBind();
                con.Close();
            }

        }

        protected void inactive_projects_view_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
            con.Open();
            SqlCommand cmd_active = new SqlCommand("SELECT * FROM dbo.entry_tbl_project_data WHERE  (measuring_eng_name = @eng or designer_name = @eng or QA_eng_name = @eng) and (project_status = @cancelled or project_status = @finished)", con);
            cmd_active.Parameters.AddWithValue("@eng", lbl_employee_name.Text);
            cmd_active.Parameters.AddWithValue("@cancelled", "ملغي");
            cmd_active.Parameters.AddWithValue("@finished", "منتهي");
            SqlDataReader dr_active = cmd_active.ExecuteReader();
            inactive_projects_grid.DataSource = dr_active;
            inactive_projects_grid.DataBind();
            con.Close();
        }

        protected void active_elsewhere_view_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
            con.Open();

            if (lbl_dept.Text == "Measurement")
            {
                SqlCommand cmd_active = new SqlCommand("SELECT * FROM dbo.entry_tbl_project_data WHERE  (measuring_eng_name = @eng or designer_name = @eng or QA_eng_name = @eng) and not(project_status = @cancelled or project_status = @finished or project_status=@stat)", con);
                cmd_active.Parameters.AddWithValue("@eng", lbl_employee_name.Text);
                cmd_active.Parameters.AddWithValue("@cancelled", "ملغي");
                cmd_active.Parameters.AddWithValue("@finished", "منتهي");
                cmd_active.Parameters.AddWithValue("@stat", "بانتظار المقاس");
                SqlDataReader dr_active = cmd_active.ExecuteReader();
                active_elsewhere_grid.DataSource = dr_active;
                active_elsewhere_grid.DataBind();
                con.Close();
            }
            if (lbl_dept.Text == "Design")
            {
                SqlCommand cmd_active = new SqlCommand("SELECT * FROM dbo.entry_tbl_project_data WHERE  (measuring_eng_name = @eng or designer_name = @eng or QA_eng_name = @eng) and not(project_status = @cancelled or project_status = @finished or project_status=@stat)", con);
                cmd_active.Parameters.AddWithValue("@eng", lbl_employee_name.Text);
                cmd_active.Parameters.AddWithValue("@cancelled", "ملغي");
                cmd_active.Parameters.AddWithValue("@finished", "منتهي");
                cmd_active.Parameters.AddWithValue("@stat", "في التصميم");
                SqlDataReader dr_active = cmd_active.ExecuteReader();
                active_elsewhere_grid.DataSource = dr_active;
                active_elsewhere_grid.DataBind();
                con.Close();
            }
            if (lbl_dept.Text == "Manufacturing")
            {
                SqlCommand cmd_active = new SqlCommand("SELECT * FROM dbo.entry_tbl_project_data WHERE  (measuring_eng_name = @eng or designer_name = @eng or QA_eng_name = @eng) and not(project_status = @cancelled or project_status = @finished or project_status=@stat)", con);
                cmd_active.Parameters.AddWithValue("@eng", lbl_employee_name.Text);
                cmd_active.Parameters.AddWithValue("@cancelled", "ملغي");
                cmd_active.Parameters.AddWithValue("@finished", "منتهي");
                cmd_active.Parameters.AddWithValue("@stat", "في الانتاج");
                SqlDataReader dr_active = cmd_active.ExecuteReader();
                active_elsewhere_grid.DataSource = dr_active;
                active_elsewhere_grid.DataBind();
                con.Close();
            }
        }

        protected void btn_active_elsewhere_Click(object sender, EventArgs e)
        {
            btn_inactive_projects.CssClass = "Initial_button";
            btn_active_projects.CssClass = "Initial_button";
            btn_active_elsewhere.CssClass = "Clicked_button";
            employee_multiview.ActiveViewIndex = 1;
        }
    }
}