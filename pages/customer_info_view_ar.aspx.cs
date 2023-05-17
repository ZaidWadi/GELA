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
    public partial class WebForm53 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["auth"] != null && Session["cust_id"] != null)
            {
                if (!IsPostBack)
                {
                    lbl_customer_ID.Text = Session["cust_id"].ToString();
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
                    con.Open();
                    SqlCommand cmd_customer_data = new SqlCommand("SELECT * FROM dbo.entry_tbl_customers WHERE customer_ID=@ID", con);
                    cmd_customer_data.Parameters.AddWithValue("@ID", lbl_customer_ID.Text);
                    SqlDataAdapter da_customer = new SqlDataAdapter(cmd_customer_data);
                    DataTable dr_customer = new DataTable();
                    da_customer.Fill(dr_customer);
                    con.Close();
                    con.Open();
                    txtbx_name.Text = dr_customer.Rows[0]["customer_name"].ToString();
                    txtbx_phone_1.Text = dr_customer.Rows[0]["customer_phone_1"].ToString();
                    txtbx_phone_2.Text = dr_customer.Rows[0]["customer_phone_2"].ToString();
                    txtbx_address.Text = dr_customer.Rows[0]["address_line"].ToString();
                    txtbx_botes.Text = dr_customer.Rows[0]["notes"].ToString();
                    SqlCommand prefixes = new SqlCommand("SELECT * from dbo.fxd_tbl_prefixes", con);
                    SqlDataAdapter px = new SqlDataAdapter(prefixes);
                    DataTable p_x = new DataTable();
                    px.Fill(p_x);
                    dlst_title.DataSource = p_x;
                    dlst_title.DataBind();
                    dlst_title.DataTextField = "prefix_ar";
                    dlst_title.DataValueField = "prefix_ID";
                    dlst_title.DataBind();
                    con.Close();
                    dlst_title.ClearSelection();
                    dlst_title.Items.FindByText(dr_customer.Rows[0]["prefix"].ToString()).Selected = true;
                    con.Open();
                    SqlCommand showroom = new SqlCommand("SELECT * from dbo.fxd_tbl_showrooms", con);
                    SqlDataAdapter sr = new SqlDataAdapter(showroom);
                    DataTable s_r = new DataTable();
                    sr.Fill(s_r);
                    dlst_showroom.DataSource = s_r;
                    dlst_showroom.DataBind();
                    dlst_showroom.DataTextField = "showroom_ar";
                    dlst_showroom.DataValueField = "showrooms_ID";
                    dlst_showroom.DataBind();
                    con.Close();
                    dlst_showroom.ClearSelection();
                    dlst_showroom.Items.FindByText(dr_customer.Rows[0]["showroom"].ToString()).Selected = true;
                    con.Open();
                    SqlCommand city = new SqlCommand("SELECT * from dbo.fxd_tbl_cities", con);
                    SqlDataAdapter ct = new SqlDataAdapter(city);
                    DataTable c_t = new DataTable();
                    ct.Fill(c_t);
                    dlst_city.DataSource = c_t;
                    dlst_city.DataBind();
                    dlst_city.DataTextField = "cty_name_ar";
                    dlst_city.DataValueField = "cities_ID";
                    dlst_city.DataBind();
                    con.Close();
                    dlst_city.ClearSelection();
                    dlst_city.Items.FindByText(dr_customer.Rows[0]["city"].ToString()).Selected = true;
                    con.Open();
                    SqlCommand city_area = new SqlCommand("SELECT cty_code FROM dbo.fxd_tbl_cities WHERE cty_name_ar=@name", con);
                    city_area.Parameters.AddWithValue("@name", dlst_city.SelectedItem.Text);
                    SqlDataReader dr_city_area = city_area.ExecuteReader();
                    if (dr_city_area.Read())
                    {
                        SqlCommand area = new SqlCommand("SELECT * from dbo.fxd_tbl_areas WHERE area_code = @code", con);
                        area.Parameters.AddWithValue("@code", dr_city_area[0].ToString());
                        dr_city_area.Close();
                        SqlDataAdapter are = new SqlDataAdapter(area);
                        DataTable a_r_e = new DataTable();
                        are.Fill(a_r_e);
                        dlst_area.Enabled = true;
                        dlst_area.DataSource = a_r_e;
                        dlst_area.DataBind();
                        dlst_area.DataTextField = "area_name_ar";
                        dlst_area.DataValueField = "areas_ID";
                        dlst_area.DataBind();
                        con.Close();
                    }
                    dlst_area.ClearSelection();
                    dlst_area.Items.FindByText(dr_customer.Rows[0]["area"].ToString()).Selected = true;
                }
            }
            else
            {
                Response.Redirect("buffer_page.aspx");
            }
        }


        protected void btn_edit_Click(object sender, EventArgs e)
        {
            txtbx_name.Enabled = true;
            txtbx_phone_1.Enabled = true;
            txtbx_phone_2.Enabled = true;
            txtbx_address.Enabled = true;
            txtbx_botes.Enabled = true;
            dlst_area.Enabled = true;
            dlst_city.Enabled = true;
            dlst_showroom.Enabled = true;
            dlst_title.Enabled = true;
            btn_save.Visible = true;
        }

        protected void projects_grid_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void btn_new_project_Click(object sender, EventArgs e)
        {

        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
            con.Open();
            SqlCommand save = new SqlCommand("UPDATE dbo.entry_tbl_customers SET showroom=@showroom, prefix=@prefix, customer_name=@customer_name, customer_phone_1=@customer_phone_1, customer_phone_2=@customer_phone_2, city=@city, area=@area, address_line=@address_line, national_id=@national_id, notes=@notes WHERE customer_ID = @id", con);
            save.Parameters.AddWithValue("@id", lbl_customer_ID.Text);
            save.Parameters.AddWithValue("@showroom", dlst_showroom.SelectedItem.Text);
            save.Parameters.AddWithValue("@prefix", dlst_title.SelectedItem.Text);
            save.Parameters.AddWithValue("@customer_name", txtbx_name.Text);
            save.Parameters.AddWithValue("@customer_phone_1", txtbx_phone_1.Text);
            save.Parameters.AddWithValue("@customer_phone_2", txtbx_phone_2.Text);
            save.Parameters.AddWithValue("@city", dlst_city.SelectedItem.Text);
            save.Parameters.AddWithValue("@area", dlst_area.SelectedItem.Text);
            save.Parameters.AddWithValue("@address_line", txtbx_address.Text);
            save.Parameters.AddWithValue("@national_id", txtbx_nat_id.Text);
            save.Parameters.AddWithValue("@notes", txtbx_botes.Text);
            save.ExecuteNonQuery();
            con.Close();
            con.Open();
            SqlCommand cmd_customer_data = new SqlCommand("SELECT * FROM dbo.entry_tbl_customers WHERE customer_ID=@ID", con);
            cmd_customer_data.Parameters.AddWithValue("@ID", lbl_customer_ID.Text);
            SqlDataAdapter da_customer = new SqlDataAdapter(cmd_customer_data);
            DataTable dr_customer = new DataTable();
            da_customer.Fill(dr_customer);
            con.Close();

            txtbx_name.Enabled = false;
            txtbx_phone_1.Enabled = false;
            txtbx_phone_2.Enabled = false;
            txtbx_address.Enabled = false;
            txtbx_botes.Enabled = false;
            dlst_area.Enabled = false;
            dlst_city.Enabled = false;
            dlst_showroom.Enabled = false;
            dlst_title.Enabled = false;
            btn_save.Visible = false;
        }
    }
}