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
    public partial class WebForm40 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["auth"] != null)
            {
                if (Session["auth"].ToString() == "Design" || Session["auth"].ToString() == "Supervisor")
                {
                    lbl_name.Text = Session["username"].ToString();
                    if (!IsPostBack)
                    {///t
                        design_views.ActiveViewIndex = 0;
                        Page.ClientScript.RegisterClientScriptInclude("jquery", Page.ResolveUrl("~/Scripts/jquery-3.6.0.js"));
                    }
                    if (Session["auth"].ToString() == "Supervisor")
                    {
                        btn_sup.Visible = true;
                    }
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
                design_views.ActiveViewIndex = 1;

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
                string popup = "window.open ('edit_customer.aspx', 'popup_window', 'width=300,height=100,left=100,top=100,resizable=yes');";
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


        protected void customers_grid_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow customer_row = customers_grid.SelectedRow;
            txtbx_selected_row_ID.Text = customer_row.Cells[0].Text;
            txtbx_selected_row_name.Text = customer_row.Cells[2].Text;
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



        protected void btn_delete_customer_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
            con.Open();
            SqlCommand delete_customer = new SqlCommand("DELETE FROM dbo.entry_tbl_customers WHERE customer_ID = @id", con);
            delete_customer.Parameters.AddWithValue("@id", txtbx_selected_row_ID.Text);
            delete_customer.ExecuteNonQuery();
            con.Close();
        }



        protected void new_employee_Click(object sender, EventArgs e)
        {
            string popup = "window.open ('new_employee.aspx', 'popup_window', 'width=300,height=100,left=100,top=100,resizable=yes');";
            ClientScript.RegisterStartupScript(GetType(), "script", popup, true);
        }



        protected void btn_log_out_Click(object sender, EventArgs e)
        {
            Session["auth"] = null;
            Response.Redirect("login_page_ar.aspx");
        }

        protected void btn_sup_Click(object sender, EventArgs e)
        {
            if (Session["auth"].ToString() == "Supervisor")
            {
                Response.Redirect("design_supervisor_user_page_ar.aspx");
            }
        }

        protected void btn_lang_Click(object sender, EventArgs e)
        {
            Response.Redirect("designer_user_page.aspx");
        }
    }
}