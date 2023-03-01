using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GELA_DB.pages
{
    public partial class WebForm17 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["auth"] !=null && Session["auth"].ToString() == "Supervisor") { 
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
                if (!IsPostBack)
                {
                    con.Open();
                    SqlCommand cmd_verti_pos = new SqlCommand("SELECT * FROM dbo.fxd_tbl_cabinet_vertical_location", con);
                    SqlDataAdapter da_verti_pos = new SqlDataAdapter(cmd_verti_pos);
                    DataTable dt_verti_pos = new DataTable();
                    da_verti_pos.Fill(dt_verti_pos);
                    dlst_verti_pos.DataSource = dt_verti_pos;
                    dlst_verti_pos.DataBind();
                    dlst_verti_pos.DataTextField = "location_disc_ar";
                    dlst_verti_pos.DataValueField = "cabinet_vertical_location_ID";
                    dlst_verti_pos.DataBind();
                    con.Close();
                    con.Open();
                    SqlCommand cmd_hori_pos = new SqlCommand("SELECT * FROM dbo.fxd_tbl_cabinet_horizontal_location", con);
                    SqlDataAdapter da_hori_pos = new SqlDataAdapter(cmd_hori_pos);
                    DataTable dt_hori_pos = new DataTable();
                    da_hori_pos.Fill(dt_hori_pos);
                    dlst_hori_pos.DataSource = dt_hori_pos;
                    dlst_hori_pos.DataBind();
                    dlst_hori_pos.DataTextField = "cabinet_horizontal_location_ar";
                    dlst_hori_pos.DataValueField = "cabinet_horizontal_location_ID";
                    dlst_hori_pos.DataBind();
                    con.Close();
                    con.Open();
                    SqlCommand cmd_covers = new SqlCommand("SELECT * FROM dbo.fxd_tbl_cabinet_cover_type", con);
                    SqlDataAdapter da_covers = new SqlDataAdapter(cmd_covers);
                    DataTable dt_covers = new DataTable();
                    da_covers.Fill(dt_covers);
                    dlst_cover.DataSource = dt_covers;
                    dlst_cover.DataBind();
                    dlst_cover.DataTextField = "cabinet_cover_count_ar";
                    dlst_cover.DataValueField = "cabinet_cover_type_ID";
                    dlst_cover.DataBind();
                    con.Close();
                    con.Open();
                    SqlCommand cover_and_count = new SqlCommand("SELECT * FROM dbo.fxd_tbl_cabinet_cover_type WHERE cabinet_cover_count_ar=@type",con);
                    cover_and_count.Parameters.AddWithValue("@type", dlst_cover.SelectedItem.Text);
                    SqlDataReader dr_cover_and_count = cover_and_count.ExecuteReader();
                    if (dr_cover_and_count.Read()) { 
                        SqlCommand cmd_cover_count = new SqlCommand("SELECT * FROM dbo.fxd_tbl_cabinet_cover_count WHERE cover_type=@cover or cover_type_1=@cover", con);
                        cmd_cover_count.Parameters.AddWithValue("@cover", dr_cover_and_count[1].ToString());
                        dr_cover_and_count.Close();
                        SqlDataAdapter da_cover_count = new SqlDataAdapter(cmd_cover_count);
                        DataTable dt_cover_count = new DataTable();
                        da_cover_count.Fill(dt_cover_count);
                        dlst_cover_count.DataSource = dt_cover_count;
                        dlst_cover_count.DataBind();
                        dlst_cover_count.DataTextField = "door_count_ar";
                        dlst_cover_count.DataValueField = "cabinet_door_count_ID";
                        dlst_cover_count.DataBind();
                    }
                    con.Close();
                    con.Open();
                    SqlCommand cmd_devices = new SqlCommand("SELECT * FROM dbo.fxd_tbl_built_in_devices", con);
                    SqlDataAdapter da_devices = new SqlDataAdapter(cmd_devices);
                    DataTable dt_devices = new DataTable();
                    da_devices.Fill(dt_devices);
                    dlst_devices.DataSource = dt_devices;
                    dlst_devices.DataBind();
                    dlst_devices.DataTextField = "device_name_ar";
                    dlst_devices.DataValueField = "devices_ID";
                    dlst_devices.DataBind();
                    con.Close();
                    con.Open();
                    SqlCommand cmd_isdouble = new SqlCommand("SELECT * FROM dbo.fxd_tbl_double_status", con);
                    SqlDataAdapter da_isdouble = new SqlDataAdapter(cmd_isdouble);
                    DataTable dt_isdouble = new DataTable();
                    da_isdouble.Fill(dt_isdouble);
                    dlst_isdouble.DataSource = dt_isdouble;
                    dlst_isdouble.DataBind();
                    dlst_isdouble.DataTextField = "double_status_ar";
                    dlst_isdouble.DataValueField = "double_status_ID";
                    dlst_isdouble.DataBind();
                    con.Close();
                }
            }
        }

        protected void btn_multipliers_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
            
            con.Open();
            SqlCommand cmd_insert_base = new SqlCommand("INSERT INTO dbo.fxd_tbl_cabinet_full_names (cabinet_full_name,device_status) VALUES(@fuln,@devices)", con);
            string fuln = "خزانة" + " " + dlst_verti_pos.SelectedItem.Text + " " + dlst_cover.SelectedItem.Text + " " + dlst_cover_count.SelectedItem.Text + " " + dlst_devices.SelectedItem.Text + " " + dlst_hori_pos.SelectedItem.Text ;
            string dev = "Y";
            if (dlst_devices.SelectedItem.Text.IsNullOrWhiteSpace() || dlst_devices.SelectedItem.Text == "مجلى")
            {
                dev = "N";
            }
            cmd_insert_base.Parameters.AddWithValue("@fuln", fuln);
            cmd_insert_base.Parameters.AddWithValue("@devices", dev);
            cmd_insert_base.ExecuteNonQuery();
            con.Close();
          
            con.Open();
            SqlCommand cmd_verti_pos = new SqlCommand("SELECT * FROM dbo.fxd_tbl_cabinet_vertical_location WHERE location_disc_ar=@verloc", con);
            cmd_verti_pos.Parameters.AddWithValue("@verloc", dlst_verti_pos.SelectedItem.Text);
            SqlDataReader dr_verti_pos = cmd_verti_pos.ExecuteReader();
            string verti_code = "";
            if (dr_verti_pos.Read()) { 
            verti_code = dr_verti_pos[1].ToString();
            dr_verti_pos.Close();
            }
            con.Close();

            con.Open();
            SqlCommand cmd_hori_pos = new SqlCommand("SELECT * FROM dbo.fxd_tbl_cabinet_horizontal_location WHERE cabinet_horizontal_location_ar=@horloc", con);
            cmd_hori_pos.Parameters.AddWithValue("@horloc", dlst_hori_pos.SelectedItem.Text);
            SqlDataReader dr_hori_loc = cmd_hori_pos.ExecuteReader();
            string hori_code = "";
            if (dr_hori_loc.Read()) { 
            hori_code = dr_hori_loc[1].ToString();
            dr_hori_loc.Close();
            }
            con.Close();

            con.Open();
            SqlCommand cmd_isdouble = new SqlCommand("SELECT * FROM dbo.fxd_tbl_double_status WHERE double_status_ar=@isdouble", con);
            cmd_isdouble.Parameters.AddWithValue("@isdouble", dlst_isdouble.SelectedItem.Text);
            SqlDataReader dr_isdouble = cmd_isdouble.ExecuteReader();
            string double_code = "";
            if (dr_isdouble.Read()) { 
            double_code = dr_isdouble[3].ToString();
            dr_isdouble.Close();
            }
            con.Close();

            con.Open();
            SqlCommand cmd_covers = new SqlCommand("SELECT * FROM dbo.fxd_tbl_cabinet_cover_type WHERE cabinet_cover_count_ar=@covertype", con);
            cmd_covers.Parameters.AddWithValue("@covertype", dlst_cover.SelectedItem.Text);
            SqlDataReader dr_covers = cmd_covers.ExecuteReader();
            string cover_code = "";
            if (dr_covers.Read()) { 
            cover_code = dr_covers[1].ToString();
            dr_covers.Close();
            }
            con.Close();

            con.Open();
            SqlCommand cmd_cover_count = new SqlCommand("SELECT * FROM dbo.fxd_tbl_cabinet_cover_count WHERE door_count_ar=@covercount", con);
            cmd_cover_count.Parameters.AddWithValue("@covercount", dlst_cover_count.SelectedItem.Text);
            SqlDataReader dr_cover_count = cmd_cover_count.ExecuteReader();
            string cover_count_code = "";
            if (dr_cover_count.Read()) { 
            cover_count_code = dr_cover_count[1].ToString();
            dr_cover_count.Close();
            }
            con.Close();

            con.Open();
            SqlCommand cmd_devices = new SqlCommand("SELECT * FROM dbo.fxd_tbl_built_in_devices WHERE device_name_ar=@dev", con);
            cmd_devices.Parameters.AddWithValue("@dev", dlst_devices.SelectedItem.Text);
            SqlDataReader dr_devices = cmd_devices.ExecuteReader();
            string devices_code = "";
            if (dr_devices.Read()) { 
            devices_code = dr_devices[1].ToString();
            dr_devices.Close();
            }
            con.Close();
            string ful_code = verti_code + double_code + cover_code + cover_count_code + devices_code + hori_code;
            con.Open();
            SqlCommand cmd_validate = new SqlCommand("SELECT * FROM dbo.fxd_tbl_cabinet_full_names_and_specs_STD WHERE cabinet_full_name=@FULLN", con);
            cmd_validate.Parameters.AddWithValue("@FULLN", fuln);
            SqlDataReader dr_validate = cmd_validate.ExecuteReader();
            if (dr_validate.Read())
            {
                lbl_err.Visible = true;
                con.Close();
            }
            else {
                con.Close();
                con.Open();
            SqlCommand cmd_insert_std = new SqlCommand("INSERT INTO dbo.fxd_tbl_cabinet_full_names_and_specs_STD (cabinet_full_name,cabinet_vertical_pos_code,cabinet_horizontal_pos_code,is_double,cabinet_cover_type_code,cabinet_cover_count_code,cabinet_built_in_device_ID,cabinet_analysis_code) VALUES(@cabinet_full_name,@cabinet_vertical_pos_code,@cabinet_horizontal_pos_code,@is_double,@cabinet_cover_type_code,@cabinet_cover_count_code,@cabinet_built_in_device_ID,@cabinet_analysis_code)", con);
            cmd_insert_std.Parameters.AddWithValue("@cabinet_full_name",fuln);
            cmd_insert_std.Parameters.AddWithValue("@cabinet_vertical_pos_code", verti_code);
            cmd_insert_std.Parameters.AddWithValue("@cabinet_horizontal_pos_code", hori_code);
            cmd_insert_std.Parameters.AddWithValue("@is_double", double_code);
            cmd_insert_std.Parameters.AddWithValue("@cabinet_cover_type_code", cover_code);
            cmd_insert_std.Parameters.AddWithValue("@cabinet_cover_count_code", cover_count_code);
            cmd_insert_std.Parameters.AddWithValue("@cabinet_built_in_device_ID", devices_code);
            cmd_insert_std.Parameters.AddWithValue("@cabinet_analysis_code",ful_code);
            cmd_insert_std.ExecuteNonQuery();
            con.Close();
       
            con.Open();
            SqlCommand cmd_insert_dtc = new SqlCommand("INSERT INTO dbo.fxd_tbl_cabinet_full_names_and_specs_DTC (cabinet_full_name,cabinet_vertical_pos_code,cabinet_horizontal_pos_code,is_double,cabinet_cover_type_code,cabinet_cover_count_code,cabinet_built_in_device_ID,cabinet_analysis_code) VALUES(@cabinet_full_name,@cabinet_vertical_pos_code,@cabinet_horizontal_pos_code,@is_double,@cabinet_cover_type_code,@cabinet_cover_count_code,@cabinet_built_in_device_ID,@cabinet_analysis_code)", con);
            cmd_insert_dtc.Parameters.AddWithValue("@cabinet_full_name", fuln);
            cmd_insert_dtc.Parameters.AddWithValue("@cabinet_vertical_pos_code", verti_code);
            cmd_insert_dtc.Parameters.AddWithValue("@cabinet_horizontal_pos_code", hori_code);
            cmd_insert_dtc.Parameters.AddWithValue("@is_double", double_code);
            cmd_insert_dtc.Parameters.AddWithValue("@cabinet_cover_type_code", cover_code);
            cmd_insert_dtc.Parameters.AddWithValue("@cabinet_cover_count_code", cover_count_code);
            cmd_insert_dtc.Parameters.AddWithValue("@cabinet_built_in_device_ID", devices_code);
            cmd_insert_dtc.Parameters.AddWithValue("@cabinet_analysis_code", ful_code);
            cmd_insert_dtc.ExecuteNonQuery();
            con.Close();
       
            con.Open();
            SqlCommand cmd_insert_dtcd = new SqlCommand("INSERT INTO dbo.fxd_tbl_cabinet_full_names_and_specs_DTCD (cabinet_full_name,cabinet_vertical_pos_code,cabinet_horizontal_pos_code,is_double,cabinet_cover_type_code,cabinet_cover_count_code,cabinet_built_in_device_ID,cabinet_analysis_code) VALUES(@cabinet_full_name,@cabinet_vertical_pos_code,@cabinet_horizontal_pos_code,@is_double,@cabinet_cover_type_code,@cabinet_cover_count_code,@cabinet_built_in_device_ID,@cabinet_analysis_code)", con);
            cmd_insert_dtcd.Parameters.AddWithValue("@cabinet_full_name", fuln);
            cmd_insert_dtcd.Parameters.AddWithValue("@cabinet_vertical_pos_code", verti_code);
            cmd_insert_dtcd.Parameters.AddWithValue("@cabinet_horizontal_pos_code", hori_code);
            cmd_insert_dtcd.Parameters.AddWithValue("@is_double", double_code);
            cmd_insert_dtcd.Parameters.AddWithValue("@cabinet_cover_type_code", cover_code);
            cmd_insert_dtcd.Parameters.AddWithValue("@cabinet_cover_count_code", cover_count_code);
            cmd_insert_dtcd.Parameters.AddWithValue("@cabinet_built_in_device_ID", devices_code);
            cmd_insert_dtcd.Parameters.AddWithValue("@cabinet_analysis_code", ful_code);
            cmd_insert_dtcd.ExecuteNonQuery();
            con.Close();
           
            con.Open();
            SqlCommand cmd_insert_ful = new SqlCommand("INSERT INTO dbo.fxd_tbl_cabinet_full_names_and_specs_FUL (cabinet_full_name,cabinet_vertical_pos_code,cabinet_horizontal_pos_code,is_double,cabinet_cover_type_code,cabinet_cover_count_code,cabinet_built_in_device_ID,cabinet_analysis_code) VALUES(@cabinet_full_name,@cabinet_vertical_pos_code,@cabinet_horizontal_pos_code,@is_double,@cabinet_cover_type_code,@cabinet_cover_count_code,@cabinet_built_in_device_ID,@cabinet_analysis_code)", con);
            cmd_insert_ful.Parameters.AddWithValue("@cabinet_full_name", fuln);
            cmd_insert_ful.Parameters.AddWithValue("@cabinet_vertical_pos_code", verti_code);
            cmd_insert_ful.Parameters.AddWithValue("@cabinet_horizontal_pos_code", hori_code);
            cmd_insert_ful.Parameters.AddWithValue("@is_double", double_code);
            cmd_insert_ful.Parameters.AddWithValue("@cabinet_cover_type_code", cover_code);
            cmd_insert_ful.Parameters.AddWithValue("@cabinet_cover_count_code", cover_count_code);
            cmd_insert_ful.Parameters.AddWithValue("@cabinet_built_in_device_ID", devices_code);
            cmd_insert_ful.Parameters.AddWithValue("@cabinet_analysis_code", ful_code);
            cmd_insert_ful.ExecuteNonQuery();
            con.Close();
         
            con.Open();
            SqlCommand cmd_insert_fuld = new SqlCommand("INSERT INTO dbo.fxd_tbl_cabinet_full_names_and_specs_FULD (cabinet_full_name,cabinet_vertical_pos_code,cabinet_horizontal_pos_code,is_double,cabinet_cover_type_code,cabinet_cover_count_code,cabinet_built_in_device_ID,cabinet_analysis_code) VALUES(@cabinet_full_name,@cabinet_vertical_pos_code,@cabinet_horizontal_pos_code,@is_double,@cabinet_cover_type_code,@cabinet_cover_count_code,@cabinet_built_in_device_ID,@cabinet_analysis_code)", con);
            cmd_insert_fuld.Parameters.AddWithValue("@cabinet_full_name", fuln);
            cmd_insert_fuld.Parameters.AddWithValue("@cabinet_vertical_pos_code", verti_code);
            cmd_insert_fuld.Parameters.AddWithValue("@cabinet_horizontal_pos_code", hori_code);
            cmd_insert_fuld.Parameters.AddWithValue("@is_double", double_code);
            cmd_insert_fuld.Parameters.AddWithValue("@cabinet_cover_type_code", cover_code);
            cmd_insert_fuld.Parameters.AddWithValue("@cabinet_cover_count_code", cover_count_code);
            cmd_insert_fuld.Parameters.AddWithValue("@cabinet_built_in_device_ID", devices_code);
            cmd_insert_fuld.Parameters.AddWithValue("@cabinet_analysis_code", ful_code);
            cmd_insert_fuld.ExecuteNonQuery();
            con.Close();
            Session["cabinet_code"] = ful_code;
            string popup = "window.open ('add_multipliers.aspx', 'popup_window', 'width=300,height=100,left=100,top=100,resizable=yes');";
            ClientScript.RegisterStartupScript(GetType(), "script", popup, true);
            }
        }

        protected void dlst_cover_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
            con.Open();
            SqlCommand cover_and_count = new SqlCommand("SELECT * FROM dbo.fxd_tbl_cabinet_cover_type WHERE cabinet_cover_count_ar=@type", con);
            cover_and_count.Parameters.AddWithValue("@type", dlst_cover.SelectedItem.Text);
            SqlDataReader dr_cover_and_count = cover_and_count.ExecuteReader();
            if (dr_cover_and_count.Read())
            {
                SqlCommand cmd_cover_count = new SqlCommand("SELECT * FROM dbo.fxd_tbl_cabinet_cover_count WHERE cover_type=@cover or cover_type_1=@cover", con);
                cmd_cover_count.Parameters.AddWithValue("@cover", dr_cover_and_count[1].ToString());
                dr_cover_and_count.Close();
                SqlDataAdapter da_cover_count = new SqlDataAdapter(cmd_cover_count);
                DataTable dt_cover_count = new DataTable();
                da_cover_count.Fill(dt_cover_count);
                dlst_cover_count.DataSource = dt_cover_count;
                dlst_cover_count.DataBind();
                dlst_cover_count.DataTextField = "door_count_ar";
                dlst_cover_count.DataValueField = "cabinet_door_count_ID";
                dlst_cover_count.DataBind();
            }
            con.Close();
        }

        protected void btn_cancel_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "CloseScriptKey", "CloseScript();</script>", true);
            Response.Write("<script>window.close();</" + "script>");
            Response.End();
        }
    }
}