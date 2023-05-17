using Microsoft.Ajax.Utilities;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;
using System.Runtime.Remoting.Messaging;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GELA_DB.pages
{

    public partial class WebForm22 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["auth"] != null)
            {
                if (Session["auth"].ToString() == "Supervisor")
                {
                    lbl_name.Text = Session["username"].ToString();
                    if (!IsPostBack)
                    {///t
                        design_views.ActiveViewIndex = 0;
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

        protected void Tab1_Click(object sender, EventArgs e)
        {
            if (Tab1.CssClass == "Clicked_button")
            {
                Tab1.CssClass = "Initial_button";
                design_views.ActiveViewIndex = 0;
            }
            else
            {///h
                Tab1.CssClass = "Clicked_button";
                Tab3.CssClass = "Initial_button";
                design_views.ActiveViewIndex = 1;

            }
        }

        protected void new_customer_Click(object sender, EventArgs e)
        {
            string popup = "window.open ('customer_info_input.aspx', 'popup_window', 'width=300,height=100,left=100,top=100,resizable=yes');";
            ClientScript.RegisterStartupScript(GetType(), "script", popup, true);
        }

        protected void customers_grid_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow customer_row = customers_grid.SelectedRow;
            Session["cust_id"] = customer_row.Cells[0].ToString();
        }

        protected void customers_view_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
                con.Open();
                string sql = "SELECT * from dbo.entry_tbl_customers";
                SqlCommand cmd = new SqlCommand(sql, con);
                SqlDataReader reader = cmd.ExecuteReader();
                customers_grid.DataSource = reader;
                customers_grid.DataBind();
                con.Close();
            }
        }

        protected void customers_grid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Session["cust_id"] = e.Row.Cells[0].Text;
                e.Row.Attributes["onclick"] = "window.location.href='customer_info_view.aspx'";
            }
        }

        protected void employees_view_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
                con.Open();
                string sql_engineers = "SELECT * FROM dbo.fxd_tbl_engineers";
                SqlCommand cmd_engineers = new SqlCommand(sql_engineers, con);
                SqlDataAdapter da_engineers = new SqlDataAdapter(cmd_engineers);
                DataTable dt_engineers = new DataTable();
                da_engineers.Fill(dt_engineers);
                con.Close();
                dt_engineers.Columns.Add("counts", typeof(int));
                foreach (DataRow dr in dt_engineers.Rows)
                {
                    con.Open();
                    SqlCommand cmd_counts = new SqlCommand("SELECT COUNT (*) FROM dbo.entry_tbl_project_data WHERE measuring_eng_name = @eng or designer_name = @eng or QA_eng_name = @eng", con);
                    cmd_counts.Parameters.AddWithValue("@eng", dr[2].ToString());
                    SqlDataReader reader = cmd_counts.ExecuteReader();
                    reader.Read();
                    dr["counts"] = int.Parse(reader[0].ToString());
                    reader.Close();
                    con.Close();
                }
                employees_grid.DataSource = dt_engineers;
                employees_grid.DataBind();
            }
        }

        protected void btn_delete_customer_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
            con.Open();
            SqlCommand delete_customer = new SqlCommand("DELETE FROM dbo.entry_tbl_customers WHERE customer_ID = @id", con);
            delete_customer.Parameters.AddWithValue("@id", txtbx_selected_row_ID.Text);
            delete_customer.ExecuteNonQuery();
            con.Close();
            con.Open();
            string sql_grid = "SELECT * from dbo.entry_tbl_customers";
            SqlCommand cmd_grid = new SqlCommand(sql_grid, con);
            SqlDataReader reader_grid = cmd_grid.ExecuteReader();
            customers_grid.DataSource = reader_grid;
            customers_grid.DataBind();
            con.Close();
        }

        protected void Tab3_Click(object sender, EventArgs e)
        {
            if (Tab3.CssClass == "Clicked_button")
            {
                Tab3.CssClass = "Initial_button";
                design_views.ActiveViewIndex = 0;
            }
            else
            {
                Tab3.CssClass = "Clicked_button";
                Tab1.CssClass = "Initial_button";
                design_views.ActiveViewIndex = 2;
            }
        }

        protected void new_employee_Click(object sender, EventArgs e)
        {
            string popup = "window.open ('new_employee.aspx', 'popup_window', 'width=300,height=100,left=100,top=100,resizable=yes');";
            ClientScript.RegisterStartupScript(GetType(), "script", popup, true);
        }

        protected void remove_employee_Click(object sender, EventArgs e)
        {
            if (txtbx_employee_name.Text.IsNullOrWhiteSpace())
            {
                lbl_choose_employee.Visible = true;
            }
            else
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
                con.Open();
                SqlCommand delete_employee = new SqlCommand("DELETE FROM dbo.fxd_tbl_engineers WHERE eng_name_ar = @name", con);
                delete_employee.Parameters.AddWithValue("@name", txtbx_employee_name.Text);
                delete_employee.ExecuteNonQuery();
                con.Close();
                string sql_grid = "SELECT * from dbo.entry_tbl_engineers";
                SqlCommand cmd_grid = new SqlCommand(sql_grid, con);
                SqlDataReader reader_grid = cmd_grid.ExecuteReader();
                employees_grid.DataSource = reader_grid;
                employees_grid.DataBind();
                con.Close();
            }
        }

        protected void btn_edit_employee_Click(object sender, EventArgs e)
        {
            if (txtbx_employee_name.Text.IsNullOrWhiteSpace())
            {
                lbl_choose_employee.Visible = true;
            }
            else
            {
                Session["employee"] = txtbx_employee_name.Text;
                string popup = "window.open ('edit_employee.aspx', 'popup_window', 'width=300,height=100,left=100,top=100,resizable=yes');";
                ClientScript.RegisterStartupScript(GetType(), "script", popup, true);
            }
        }

        protected void employees_grid_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow employees_row = employees_grid.SelectedRow;
            txtbx_employee_name.Text = employees_row.Cells[0].Text;
            txtbx_dept.Text = employees_row.Cells[1].Text;


        }



        protected void employees_grid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(this.employees_grid, "Select$" + e.Row.RowIndex.ToString());

            }
        }


        protected void btn_view_projects_Click(object sender, EventArgs e)
        {
            if (txtbx_employee_name.Text.IsNullOrWhiteSpace())
            {
                lbl_choose_employee.Visible = true;
            }
            else
            {
                Session["department"] = txtbx_dept.Text;
                Session["employee"] = txtbx_employee_name.Text;
                string popup = "window.open ('engineer_projects.aspx', 'popup_window', 'width=300,height=100,left=100,top=100,resizable=yes');";
                ClientScript.RegisterStartupScript(GetType(), "script", popup, true);
            }
        }

        protected void btn_log_out_Click(object sender, EventArgs e)
        {
            Session["auth"] = null;
            Response.Redirect("login_page.aspx");
        }

        protected void btn_add_new_cabinet_Click(object sender, EventArgs e)
        {
            string popup = "window.open ('cabinets_add.aspx', 'popup_window', 'width=300,height=100,left=100,top=100,resizable=yes');";
            ClientScript.RegisterStartupScript(GetType(), "script", popup, true);
        }

        protected void btn_add_raw_materials_Click(object sender, EventArgs e)
        {
            string popup = "window.open ('materials.aspx', 'popup_window', 'width=300,height=100,left=100,top=100,resizable=yes');";
            ClientScript.RegisterStartupScript(GetType(), "script", popup, true);
        }

        protected void btn_des_Click(object sender, EventArgs e)
        {
            Response.Redirect("designer_user_page.aspx");
        }

        protected void btn_lang_Click(object sender, EventArgs e)
        {
            Response.Redirect("design_supervisor_user_page_ar.aspx");
        }

        protected void btn_export_to_excel_Click(object sender, EventArgs e)
        {
            string batchFilePath = @"C:\Users\GELA\source\repos\marchlann\GELA\pages\exportxlsx.bat";

            // Set up the process start information
            ProcessStartInfo startInfo = new ProcessStartInfo();
            startInfo.FileName = batchFilePath;

            startInfo.CreateNoWindow = true;

            // Start the process and wait for it to exit
            using (Process process = Process.Start(startInfo))
            {
                process.WaitForExit();

                // Read any output from the process (e.g. error messages)
                
            }
        }
    }
}