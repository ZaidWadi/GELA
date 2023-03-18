using Microsoft.Ajax.Utilities;
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
    public partial class WebForm39 : System.Web.UI.Page
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
                    Response.Redirect("buffer_page_ar.aspx");
                }
            }
            else
            {
                Response.Redirect("buffer_page_ar.aspx");
            }
        }


        protected void MainView_ActiveViewChanged(object sender, EventArgs e)
        {

        }

        protected void Tab1_Click(object sender, EventArgs e)
        {
            if (Tab1.CssClass == "Clicked_button_ar")
            {
                Tab1.CssClass = "Initial_button_ar";
                design_views.ActiveViewIndex = 0;
            }
            else
            {///h
                Tab1.CssClass = "Clicked_button_ar";
                Tab2.CssClass = "Initial_button_ar";
                Tab3.CssClass = "Initial_button_ar";
                design_views.ActiveViewIndex = 1;

            }
        }

        protected void Tab2_Click(object sender, EventArgs e)
        {
            if (Tab2.CssClass == "Clicked_button_ar")
            {
                Tab2.CssClass = "Initial_button_ar";
                design_views.ActiveViewIndex = 0;
            }
            else
            {
                Tab2.CssClass = "Clicked_button_ar";
                Tab1.CssClass = "Initial_button_ar";
                Tab3.CssClass = "Initial_button_ar";
                design_views.ActiveViewIndex = 2;
            }
        }

        protected void projects_view_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
            con.Open();
            string sql = "SELECT * from dbo.entry_tbl_project_data";
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader reader = cmd.ExecuteReader();
            projects_grid.DataSource = reader;
            projects_grid.DataBind();
            con.Close();
        }/// <summary>
         /// i


        protected void btn_new_project_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtbx_selected_row_ID.Text) && string.IsNullOrEmpty(txtbx_selected_row_name.Text))
            {
                lbl_err_1.Visible = true;
            }
            else
            {
                string popup = "window.open ('project_data_input_ar.aspx', 'popup_window', 'width=300,height=100,left=100,top=100,resizable=yes');";
                ClientScript.RegisterStartupScript(GetType(), "script", popup, true);
                Session["ID"] = txtbx_selected_row_ID.Text;
                Session["Name"] = txtbx_selected_row_name.Text;
                Session["cust_id"] = txtbx_customer_id.Text;
            }
        }

        protected void btn_edit_project_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtbx_selected_row_project_ID.Text))
            {
                lbl_err_2.Visible = true;

            }
            else
            {
                string popup = "window.open ('edit_project_ar.aspx', 'popup_window', 'width=300,height=100,left=100,top=100,resizable=yes');";
                ClientScript.RegisterStartupScript(GetType(), "script", popup, true);
                Session["project_ID"] = txtbx_selected_row_project_ID.Text;
            }

        }

        protected void project_technical_data_Load(object sender, EventArgs e)
        {
            ///s
        }
        protected void projects_view_Load1(object sender, EventArgs e)
        {
            if (!IsPostBack) { 
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
            con.Open();
            string sql = "SELECT * from dbo.entry_tbl_project_data";
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader reader = cmd.ExecuteReader();
            projects_grid.DataSource = reader;
            projects_grid.DataBind();
            con.Close();
            }
        }

        protected void edit_customer_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtbx_selected_row_ID.Text))
            {
                lbl_err_1.Visible = true;
            }
            else
            {
                Session["customer_edit_ID"] = txtbx_selected_row_ID.Text;
                string popup = "window.open ('edit_customer_ar.aspx', 'popup_window', 'width=300,height=100,left=100,top=100,resizable=yes');";
                ClientScript.RegisterStartupScript(GetType(), "script", popup, true);
                Session["ID"] = txtbx_selected_row_ID.Text;
                Session["City"] = txtbx_selected_row_city.Text;
            }
        }

        protected void new_customer_Click(object sender, EventArgs e)
        {
            string popup = "window.open ('customer_info_input_ar.aspx', 'popup_window', 'width=300,height=100,left=100,top=100,resizable=yes');";
            ClientScript.RegisterStartupScript(GetType(), "script", popup, true);
        }

        protected void projects_grid_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow project_row = projects_grid.SelectedRow;
        }

        protected void customers_grid_SelectedIndexChanged(object sender, EventArgs e)
        {

            GridViewRow customer_row = customers_grid.SelectedRow;
            txtbx_selected_row_ID.Text = customer_row.Cells[0].Text;
            txtbx_selected_row_name.Text = customer_row.Cells[2].Text;
            txtbx_selected_row_city.Text = customer_row.Cells[5].Text;
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
                e.Row.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(this.customers_grid, "Select$" + e.Row.RowIndex.ToString());
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





        protected void projects_grid_row_DataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(this.projects_grid, "Select$" + e.Row.RowIndex.ToString());
            }
        }

        protected void projects_grid_SelectedIndexChanged1(object sender, EventArgs e)
        {
            GridViewRow project_row = projects_grid.SelectedRow;
            txtbx_selected_row_project_ID.Text = project_row.Cells[0].Text;
            txtbx_customer_id.Text = project_row.Cells[1].Text;
            btn_edit_project_1.Enabled = true;
            if (project_row.Cells[4].Text == "في الانتاج")
            {
                btn_production_done.Enabled = true;
            }
            else if (project_row.Cells[4].Text == "في التركيب")
            {
                btn_production_done.Enabled = true;
                btn_installing_done.Enabled = true;
            }
            else
            {
                btn_production_done.Enabled = false;
                btn_installing_done.Enabled = false;
            }
        }


        protected void btn_price_offer_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtbx_selected_row_project_ID.Text))
            {
                lbl_err_2.Visible = true;
            }
            else
            {
                Session["cust_id"] = txtbx_customer_id.Text;
                Session["price_offer_ID"] = txtbx_selected_row_project_ID.Text;
                string popup = "window.open ('price_offer.aspx', 'popup_window', 'width=300,height=100,left=100,top=100,resizable=yes');";
                ClientScript.RegisterStartupScript(GetType(), "script", popup, true);

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
        }

        protected void btn_delte_project_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
            con.Open();
            SqlCommand delte_cabinets = new SqlCommand("DELETE FROM dbo.entry_tbl_order WHERE project_no = @id", con);
            delte_cabinets.Parameters.AddWithValue("@id", txtbx_selected_row_project_ID.Text);
            delte_cabinets.ExecuteNonQuery();
            con.Close();
            con.Open();
            SqlCommand delete_project = new SqlCommand("DELETE FROM dbo.entry_tbl_project_data WHERE project_ID = @id", con);
            delete_project.Parameters.AddWithValue("@id", txtbx_selected_row_project_ID.Text);
            delete_project.ExecuteNonQuery();
            con.Close();
        }


        protected void Tab3_Click(object sender, EventArgs e)
        {
            if (Tab3.CssClass == "Clicked_button_ar")
            {
                Tab3.CssClass = "Initial_button_ar";
                design_views.ActiveViewIndex = 0;
            }
            else
            {
                Tab3.CssClass = "Clicked_button_ar";
                Tab1.CssClass = "Initial_button_ar";
                Tab2.CssClass = "Initial_button_ar";
                design_views.ActiveViewIndex = 3;
            }
        }

        protected void new_employee_Click(object sender, EventArgs e)
        {
            string popup = "window.open ('new_employee_ar.aspx', 'popup_window', 'width=300,height=100,left=100,top=100,resizable=yes');";
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
                string popup = "window.open ('edit_employee_ar.aspx', 'popup_window', 'width=300,height=100,left=100,top=100,resizable=yes');";
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
                string popup = "window.open ('engineer_projects_ar.aspx', 'popup_window', 'width=300,height=100,left=100,top=100,resizable=yes');";
                ClientScript.RegisterStartupScript(GetType(), "script", popup, true);
            }
        }

        protected void btn_contract_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtbx_selected_row_project_ID.Text))
            {
                lbl_err_2.Visible = true;
            }
            else
            {
                Session["cust_id"] = txtbx_customer_id.Text;
                Session["contract_ID"] = txtbx_selected_row_project_ID.Text;
                string popup = "window.open ('contract.aspx', 'popup_window', 'width=300,height=100,left=100,top=100,resizable=yes');";
                ClientScript.RegisterStartupScript(GetType(), "script", popup, true);
            }
        }

        protected void btn_add_technical_details_Click(object sender, EventArgs e)
        {
            if (!txtbx_selected_row_project_ID.Text.IsNullOrWhiteSpace())
            {
                Session["Im_running_out_of_session_names"] = txtbx_selected_row_project_ID.Text;
                string popup = "window.open ('project_technical_data_ar.aspx', 'popup_window', 'width=300,height=100,left=100,top=100,resizable=yes');";
                ClientScript.RegisterStartupScript(GetType(), "script", popup, true);
            }
            else
            {
                lbl_err_2.Visible = true;
            }
        }

        protected void btn_production_done_Click(object sender, EventArgs e)
        {
            if (!txtbx_selected_row_project_ID.Text.IsNullOrWhiteSpace())
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE dbo.entry_tbl_project_data SET production_finish_date=@date,project_status=@status WHERE project_ID = @project", con);
                cmd.Parameters.AddWithValue("@date", DateTime.Today);
                cmd.Parameters.AddWithValue("@project", txtbx_selected_row_project_ID.Text);
                cmd.Parameters.AddWithValue("status", "في التركيب");
                cmd.ExecuteNonQuery();
                con.Close();
            }
            else
            {
                lbl_err_3.Visible = true;
            }
        }

        protected void btn_installing_done_Click(object sender, EventArgs e)
        {
            if (!txtbx_selected_row_project_ID.Text.IsNullOrWhiteSpace())
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE dbo.entry_tbl_project_data SET real_delivery_date=@date,project_status=@status WHERE project_ID = @project", con);
                cmd.Parameters.AddWithValue("@date", DateTime.Today);
                cmd.Parameters.AddWithValue("@project", txtbx_selected_row_project_ID.Text);
                cmd.Parameters.AddWithValue("status", "انتهى");
                cmd.ExecuteNonQuery();
                con.Close();
            }
            else
            {
                lbl_err_3.Visible = true;
            }
        }

        protected void btn_lateness_Click(object sender, EventArgs e)
        {
            string popup = "window.open ('lateness_report_ar.aspx', 'popup_window', 'width=300,height=100,left=100,top=100,resizable=yes');";
            ClientScript.RegisterStartupScript(GetType(), "script", popup, true);
        }

        protected void tmr_projects_Tick(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
            con.Open();
            string sql_customers = "SELECT * from dbo.entry_tbl_customers";
            SqlCommand cmd_customers = new SqlCommand(sql_customers, con);
            SqlDataReader reader_customers = cmd_customers.ExecuteReader();
            customers_grid.DataSource = reader_customers;
            customers_grid.DataBind();
            con.Close();
            con.Open();
            string sql = "SELECT * from dbo.entry_tbl_project_data";
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader reader = cmd.ExecuteReader();
            projects_grid.DataSource = reader;
            projects_grid.DataBind();
            con.Close();
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
                SqlDataReader reader_employees = cmd_counts.ExecuteReader();
                reader_employees.Read();
                dr["counts"] = int.Parse(reader_employees[0].ToString());
                reader_employees.Close();
                con.Close();
            }
            employees_grid.DataSource = dt_engineers;
            employees_grid.DataBind();
            if (!txtbx_selected_row_project_ID.Text.IsNullOrWhiteSpace())
            {
                GridViewRow project_row = projects_grid.SelectedRow;
                if (project_row.Cells[4].Text == "في الانتاج")
                {
                    btn_production_done.Enabled = true;
                }
                else if (project_row.Cells[4].Text == "في التركيب")
                {
                    btn_production_done.Enabled = true;
                    btn_installing_done.Enabled = true;
                }
                else
                {
                    btn_production_done.Enabled = false;
                    btn_installing_done.Enabled = false;
                }
            }

        }

        protected void btn_log_out_Click(object sender, EventArgs e)
        {
            Session["auth"] = null;
            Response.Redirect("login_page_ar.aspx");
        }

        protected void btn_production_order_Click(object sender, EventArgs e)
        {
            if (!txtbx_selected_row_project_ID.Text.IsNullOrWhiteSpace())
            {
                Session["another_project_id_sess"] = txtbx_selected_row_project_ID.Text;
                string popup = "window.open ('production_details.aspx', 'popup_window', 'width=300,height=100,left=100,top=100,resizable=yes');";
                ClientScript.RegisterStartupScript(GetType(), "script", popup, true);
            }
            else
            {
                lbl_err_2.Visible = true;
            }
        }

        protected void btn_add_new_cabinet_Click(object sender, EventArgs e)
        {
            string popup = "window.open ('cabinets_add_ar.aspx', 'popup_window', 'width=300,height=100,left=100,top=100,resizable=yes');";
            ClientScript.RegisterStartupScript(GetType(), "script", popup, true);
        }

        protected void btn_add_raw_materials_Click(object sender, EventArgs e)
        {
            string popup = "window.open ('materials_ar.aspx', 'popup_window', 'width=300,height=100,left=100,top=100,resizable=yes');";
            ClientScript.RegisterStartupScript(GetType(), "script", popup, true);
        }

        protected void btn_des_Click(object sender, EventArgs e)
        {
            Response.Redirect("designer_user_page_ar.aspx");
        }

        protected void btn_lang_Click(object sender, EventArgs e)
        {
            Response.Redirect("design_supervisor_user_page.aspx");
        }
        protected void btn_AddCabinets_Click(object sender, EventArgs e)
        {
            Session["project_id"] = txtbx_selected_row_project_ID.Text;
            GridViewRow rk = projects_grid.SelectedRow;
            if (!rk.Cells[18].Text.Trim().IsNullOrWhiteSpace() && rk.Cells[17].Text != "&nbsp;")
            {
                Session["kitchen_type"] = rk.Cells[17].Text;
                string popup = "window.open ('order_details_input_ar.aspx', 'popup_window', 'width=300,height=100,left=100,top=100,resizable=yes');";
                ClientScript.RegisterStartupScript(GetType(), "script", popup, true);
            }
            else
            {
                lbl_err_4.Visible = true;
            }
        }

        protected void btn_cancel_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("UPDATE dbo.entry_tbl_project_data SET project_status=@status WHERE project_ID = @project", con);
            cmd.Parameters.AddWithValue("@project", txtbx_selected_row_project_ID.Text);
            cmd.Parameters.AddWithValue("status", "ملغي");
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}