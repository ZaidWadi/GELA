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
    public partial class WebForm41 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ID"] != null)
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
                con.Open();
                SqlCommand cmd_customer_data = new SqlCommand("SELECT * FROM dbo.entry_tbl_customers WHERE customer_ID=@ID", con);
                cmd_customer_data.Parameters.AddWithValue("@ID", Session["customer_edit_ID"].ToString());
                SqlDataAdapter da_customer = new SqlDataAdapter(cmd_customer_data);
                DataTable dr_customer = new DataTable();
                da_customer.Fill(dr_customer);
                con.Close();
                con.Open();
                if (!IsPostBack)
                {
                    txtbx_PhoneNo_1.Text = dr_customer.Rows[0]["customer_phone_1"].ToString();
                    txtbx_PhoneNo_2.Text = dr_customer.Rows[0]["customer_phone_2"].ToString();
                    txtbx_Name.Text = dr_customer.Rows[0]["customer_name"].ToString();
                    txtbx_AddressLine.Text = dr_customer.Rows[0]["address_line"].ToString();
                    txtbx_NationalID.Text = dr_customer.Rows[0]["national_id"].ToString();
                    txtbx_DocumentNo.Text = dr_customer.Rows[0]["national_id_card_no"].ToString();
                    txtbx_KeeperPhoneNo.Text = dr_customer.Rows[0]["building_keeper_phone_no"].ToString();
                    txtbx_Notes.Text = dr_customer.Rows[0]["notes"].ToString();
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
                    dlst_title.Items.FindByText(dr_customer.Rows[0]["prefix"].ToString()).Selected = true;
                    con.Open();
                    SqlCommand city = new SqlCommand("SELECT * from dbo.fxd_tbl_cities", con);
                    SqlDataAdapter ct = new SqlDataAdapter(city);
                    DataTable c_t = new DataTable();
                    ct.Fill(c_t);
                    dlst_City.DataSource = c_t;
                    dlst_City.DataBind();
                    dlst_City.DataTextField = "cty_name_ar";
                    dlst_City.DataValueField = "cities_ID";
                    dlst_City.DataBind();
                    con.Close();
                    dlst_City.Items.FindByText(dr_customer.Rows[0]["city"].ToString()).Selected = true;
                    con.Open();
                    SqlCommand city_area = new SqlCommand("SELECT cty_code FROM dbo.fxd_tbl_cities WHERE cty_name_ar=@name", con);
                    city_area.Parameters.AddWithValue("@name", dlst_City.SelectedItem.Text);
                    SqlDataReader dr_city_area = city_area.ExecuteReader();
                    if (dr_city_area.Read())
                    {
                        SqlCommand area = new SqlCommand("SELECT * from dbo.fxd_tbl_areas WHERE area_code = @code", con);
                        area.Parameters.AddWithValue("@code", dr_city_area[0].ToString());
                        dr_city_area.Close();

                        SqlDataAdapter are = new SqlDataAdapter(area);
                        DataTable a_r_e = new DataTable();
                        are.Fill(a_r_e);
                        dlst_Area.Enabled = true;
                        dlst_Area.DataSource = a_r_e;
                        dlst_Area.DataBind();
                        dlst_Area.DataTextField = "area_name_ar";
                        dlst_Area.DataValueField = "areas_ID";
                        dlst_Area.DataBind();
                        con.Close();

                        dlst_Area.Items.FindByText(dr_customer.Rows[0]["area"].ToString()).Selected = true;
                    }
                }
            }
            else
            {
                Response.Redirect("buffer_page.aspx");
            }
            ///j



        }

        protected void dlst_City_SelectedIndexChanged(object sender, EventArgs e)
        {
            dlst_Area.Enabled = true;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
            con.Open();
            SqlCommand city_area = new SqlCommand("SELECT cty_code FROM dbo.fxd_tbl_cities WHERE cty_name_ar=@name", con);
            city_area.Parameters.AddWithValue("@name", dlst_City.SelectedItem.Text);
            SqlDataReader dr_city_area = city_area.ExecuteReader();
            dr_city_area.Read();
            SqlCommand area = new SqlCommand("SELECT * from dbo.fxd_tbl_areas WHERE area_code = @code", con);
            area.Parameters.AddWithValue("@code", dr_city_area[0].ToString());
            dr_city_area.Close();
            SqlDataAdapter are = new SqlDataAdapter(area);
            DataTable a_r_e = new DataTable();
            are.Fill(a_r_e);
            dlst_Area.Enabled = true;
            dlst_Area.DataSource = a_r_e;
            dlst_Area.DataBind();
            dlst_Area.DataTextField = "area_name_ar";
            dlst_Area.DataValueField = "areas_ID";
            dlst_Area.DataBind();
            con.Close();
        }

        protected void btn_NextPage_Click(object sender, EventArgs e)
        {
            var customer_ID_out = Session["ID"].ToString();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("UPDATE dbo.entry_tbl_customers SET prefix=@title,customer_name=@Name,customer_phone_1=@PhoneNo_1,customer_phone_2=@PhoneNo_2,city=@City,area=@Area,address_line=@AddressLine,national_id=@NationalID,national_id_card_no=@DocumentNo,building_keeper_phone_no=@KeeperPhoneNo,notes=@Notes WHERE customer_ID=@ID", con);
            cmd.Parameters.AddWithValue("@ID", customer_ID_out);
            cmd.Parameters.AddWithValue("@title", dlst_title.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Name", txtbx_Name.Text);
            cmd.Parameters.AddWithValue("@PhoneNo_1", txtbx_PhoneNo_1.Text);
            cmd.Parameters.AddWithValue("@PhoneNo_2", txtbx_PhoneNo_2.Text);
            cmd.Parameters.AddWithValue("@City", dlst_City.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Area", dlst_Area.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@AddressLine", txtbx_AddressLine.Text);
            cmd.Parameters.AddWithValue("@NationalID", txtbx_NationalID.Text);
            cmd.Parameters.AddWithValue("@DocumentNo", txtbx_DocumentNo.Text);
            cmd.Parameters.AddWithValue("@KeeperPhoneNo", txtbx_KeeperPhoneNo.Text);
            cmd.Parameters.AddWithValue("@Notes", txtbx_Notes.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            con.Open();
            SqlCommand cmd_pr = new SqlCommand("UPDATE dbo.entry_tbl_project_data SET customer=@Name WHERE customer_no=@ID", con);
            cmd_pr.Parameters.AddWithValue("@ID", customer_ID_out);
            cmd_pr.Parameters.AddWithValue("@Name", txtbx_Name.Text);
            cmd_pr.ExecuteNonQuery();
            con.Close();
            Response.Write("<script>window.close();</" + "script>");
            Response.End();
        }

        protected void dlst_City_DataBound(object sender, EventArgs e)
        {

        }
    }
}