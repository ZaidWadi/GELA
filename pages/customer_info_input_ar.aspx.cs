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
    public partial class WebForm38 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String code = Globals.cor_status;
            code += "z";
            if (Session["auth"] != null)
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
                con.Open();
                if (!IsPostBack)
                {
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
                    con.Open();
                    SqlCommand prefixes = new SqlCommand("SELECT * from dbo.fxd_tbl_prefixes", con); ///u
                    SqlDataAdapter px = new SqlDataAdapter(prefixes);
                    DataTable p_x = new DataTable();
                    px.Fill(p_x);
                    dlst_title.DataSource = p_x;
                    dlst_title.DataBind();
                    dlst_title.DataTextField = "prefix_ar";
                    dlst_title.DataValueField = "prefix_ID";
                    dlst_title.DataBind();
                    con.Close();
                    con.Open();
                    SqlCommand city = new SqlCommand("SELECT * from dbo.fxd_tbl_cities", con);
                    SqlDataAdapter ct = new SqlDataAdapter(city);
                    DataTable c_t = new DataTable();
                    ct.Fill(c_t);
                    dlst_City.DataSource = c_t;
                    dlst_City.DataBind();
                    dlst_City.DataTextField = "cty_name_ar";
                    dlst_City.DataValueField = "cities_ID";
                    dlst_City.DataBind(); ///c
                    con.Close();

                    con.Close();
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
                    dlst_Area.DataSource = a_r_e;///k
                    dlst_Area.DataBind();
                    dlst_Area.DataTextField = "area_name_ar";
                    dlst_Area.DataValueField = "areas_ID";
                    dlst_Area.DataBind();
                    con.Close();
                }

            }
            else
            {
                Response.Redirect("buffer_page.aspx");
            }
        }

        protected void btn_NextPage_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO entry_tbl_customers (showroom,prefix,customer_name,customer_phone_1,customer_phone_2,city,area,address_line,national_id,national_id_card_no,building_keeper_phone_no,notes) VALUES(@showroom , @Title , @Name ,  @PhoneNo_1  ,  @PhoneNo_2 ,  @City,  @Area , @AddressLine , @NationalID , @DocumentNo , @KeeperPhoneNo , @Notes)", con);
            cmd.Parameters.AddWithValue("@showroom", dlst_showroom.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Title", dlst_title.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Name", txtbx_Name.Text);
            cmd.Parameters.AddWithValue("@PhoneNo_1", txtbx_PhoneNo_1.Text);
            cmd.Parameters.AddWithValue("@PhoneNo_2", txtbx_PhoneNo_2.Text);
            cmd.Parameters.AddWithValue("@City", dlst_City.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Area", dlst_Area.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@AddressLine", txtbx_AddressLine.Text);
            cmd.Parameters.AddWithValue("@NationalID", txtbx_NationalID.Text);
            ///c
            cmd.Parameters.AddWithValue("@DocumentNo", txtbx_DocumentNo.Text);
            cmd.Parameters.AddWithValue("@KeeperPhoneNo", txtbx_KeeperPhoneNo.Text);
            cmd.Parameters.AddWithValue("@Notes", txtbx_Notes.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            ClientScript.RegisterStartupScript(this.GetType(), "CloseScriptKey", "CloseScript();</script>", true);
            Response.Write("<script>window.close();</" + "script>");
            Response.End();

        }

        protected void dlst_City_SelectedIndexChanged(object sender, EventArgs e)
        {
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
            dlst_Area.DataSource = a_r_e;///k
            dlst_Area.DataBind();
            dlst_Area.DataTextField = "area_name_ar";
            dlst_Area.DataValueField = "areas_ID";
            dlst_Area.DataBind();
            con.Close();
        }
    }
}