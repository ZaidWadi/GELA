using Microsoft.Ajax.Utilities;
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
    public partial class WebForm13 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["contract_ID"] != null && Session["cust_id"] != null) { 
            lbl_date.Text = DateTime.Today.ToString("dd/MM/yyyy");
            lbl_project_ID.Text = Session["contract_ID"].ToString();
            lbl_customer_id.Text = Session["cust_id"].ToString();
            lbl_po_date.Text = lbl_date.Text;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
            con.Open();
            SqlCommand cmd_customer_info = new SqlCommand("SELECT * FROM dbo.entry_tbl_customers WHERE customer_ID=@ID",con);
            cmd_customer_info.Parameters.AddWithValue("@ID", lbl_customer_id.Text);
            SqlDataReader dr_customer_info = cmd_customer_info.ExecuteReader();
            dr_customer_info.Read();
            lbl_prefix.Text = dr_customer_info["prefix"].ToString();
            lbl_name.Text = dr_customer_info["customer_name"].ToString();
            lbl_phone_no.Text = dr_customer_info["customer_phone_1"].ToString();
            string address = dr_customer_info["city"].ToString() + "-" + dr_customer_info["area"].ToString() + "-" + dr_customer_info["address_line"].ToString();
            lbl_address.Text = address;
            lbl_nat_id.Text = dr_customer_info["national_id"].ToString();
            dr_customer_info.Close();
                con.Close();
                con.Open();
                SqlCommand cmd_price = new SqlCommand("SELECT price FROM dbo.entry_tbl_project_data WHERE project_ID = @pID",con);
            cmd_price.Parameters.AddWithValue("@pID", lbl_project_ID.Text);
            SqlDataReader dr_price = cmd_price.ExecuteReader();
            dr_price.Read();
            lbl_value.Text = dr_price["price"].ToString();
                con.Close();
            }
            else
            {
                Response.Redirect("buffer_page.aspx");
            }

        }
    }
}