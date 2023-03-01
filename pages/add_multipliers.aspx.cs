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
    public partial class WebForm18 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btn_done_Click(object sender, EventArgs e)
        {
            var code = Session["cabinet_code"].ToString();

                        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
                        
                        con.Open();
                        SqlCommand cmd_dtc = new SqlCommand("UPDATE dbo.fxd_tbl_cabinet_full_names_and_specs_DTC SET constant_body=@body,constant_upper_hood=@u_hood,constant_lower_hood=@l_hood,constant_top_granite=@topg,constant_upper_panel=@u_panel,constant_lower_panel=@l_panel,constant_holes=@holes WHERE cabinet_analysis_code=@code ", con);
                        cmd_dtc.Parameters.AddWithValue("@body",dtc_body_multiplier.Text);
                        cmd_dtc.Parameters.AddWithValue("@u_hood",dtc_upper_hood_multiplier.Text);
                        cmd_dtc.Parameters.AddWithValue("l_hood",dtc_lower_hood_multiplier.Text);
                        cmd_dtc.Parameters.AddWithValue("@topg",dtc_top_granite_multiplier.Text);
                        cmd_dtc.Parameters.AddWithValue("@u_panel",dtc_upper_panel_multiplier.Text);
                        cmd_dtc.Parameters.AddWithValue("@l_panel",dtc_lower_panel_multiplier.Text);
                        cmd_dtc.Parameters.AddWithValue("@holes",dtc_holes_multiplier.Text);
                        cmd_dtc.Parameters.AddWithValue("@code",code);
                        cmd_dtc.ExecuteNonQuery();
                        con.Close();

                        con.Open();
                        SqlCommand cmd_dtcd = new SqlCommand("UPDATE dbo.fxd_tbl_cabinet_full_names_and_specs_DTCD SET constant_body=@body,constant_upper_hood=@u_hood,constant_lower_hood=@l_hood,constant_top_granite=@topg,constant_upper_panel=@u_panel,constant_lower_panel=@l_panel,constant_holes=@holes WHERE cabinet_analysis_code=@code ", con);
                        cmd_dtcd.Parameters.AddWithValue("@body", dtcd_body_multiplier.Text);
                        cmd_dtcd.Parameters.AddWithValue("@u_hood", dtcd_upper_hood_multiplier.Text);
                        cmd_dtcd.Parameters.AddWithValue("l_hood", dtcd_lower_hood_multiplier.Text);
                        cmd_dtcd.Parameters.AddWithValue("@topg", dtcd_top_granite_multiplier.Text);
                        cmd_dtcd.Parameters.AddWithValue("@u_panel", dtcd_upper_panel_multiplier.Text);
                        cmd_dtcd.Parameters.AddWithValue("@l_panel", dtcd_lower_panel_multiplier.Text);
                        cmd_dtcd.Parameters.AddWithValue("@holes", dtcd_holes_multiplier.Text);
                        cmd_dtcd.Parameters.AddWithValue("@code", code);
                        cmd_dtcd.ExecuteNonQuery();
                        con.Close();

                        con.Open();
                        SqlCommand cmd_ful = new SqlCommand("UPDATE dbo.fxd_tbl_cabinet_full_names_and_specs_FUL SET constant_body=@body,constant_upper_hood=@u_hood,constant_lower_hood=@l_hood,constant_top_granite=@topg,constant_upper_panel=@u_panel,constant_lower_panel=@l_panel,constant_holes=@holes WHERE cabinet_analysis_code=@code ", con);
                        cmd_ful.Parameters.AddWithValue("@body", ful_body_multiplier.Text);
                        cmd_ful.Parameters.AddWithValue("@u_hood", ful_upper_hood_multiplier.Text);
                        cmd_ful.Parameters.AddWithValue("l_hood", ful_lower_hood_multiplier.Text);
                        cmd_ful.Parameters.AddWithValue("@topg", ful_granite_top_multiplier.Text);
                        cmd_ful.Parameters.AddWithValue("@u_panel", ful_upper_panel_multiplier.Text);
                        cmd_ful.Parameters.AddWithValue("@l_panel", ful_lower_panel_multiplier.Text);
                        cmd_ful.Parameters.AddWithValue("@holes", ful_holes_multiplier.Text);
                        cmd_ful.Parameters.AddWithValue("@code", code);
                        cmd_ful.ExecuteNonQuery();
                        con.Close();

                        con.Open();
                        SqlCommand cmd_fuld = new SqlCommand("UPDATE dbo.fxd_tbl_cabinet_full_names_and_specs_FULD SET constant_body=@body,constant_upper_hood=@u_hood,constant_lower_hood=@l_hood,constant_top_granite=@topg,constant_upper_panel=@u_panel,constant_lower_panel=@l_panel,constant_holes=@holes WHERE cabinet_analysis_code=@code ", con);
                        cmd_fuld.Parameters.AddWithValue("@body", fuld_body_multiplier.Text);
                        cmd_fuld.Parameters.AddWithValue("@u_hood", fuld_upper_hood_multiplier.Text);
                        cmd_fuld.Parameters.AddWithValue("l_hood", fuld_lower_hood_multiplier.Text);
                        cmd_fuld.Parameters.AddWithValue("@topg", fuld_top_granite_multiplier.Text);
                        cmd_fuld.Parameters.AddWithValue("@u_panel", fuld_upper_panel_multiplier.Text);
                        cmd_fuld.Parameters.AddWithValue("@l_panel", fuld_lower_panel_multiplier.Text);
                        cmd_fuld.Parameters.AddWithValue("@holes", fuld_holes_multiplier.Text);
                        cmd_fuld.Parameters.AddWithValue("@code", code);
                        cmd_fuld.ExecuteNonQuery();
                        con.Close();

                        con.Open();
                        SqlCommand cmd_std = new SqlCommand("UPDATE dbo.fxd_tbl_cabinet_full_names_and_specs_STD SET constant_body=@body,constant_upper_hood=@u_hood,constant_lower_hood=@l_hood,constant_top_granite=@topg,constant_upper_panel=@u_panel,constant_lower_panel=@l_panel,constant_holes=@holes WHERE cabinet_analysis_code=@code ", con);
                        cmd_std.Parameters.AddWithValue("@body", std_body_multiplier.Text);
                        cmd_std.Parameters.AddWithValue("@u_hood", std_upper_hood_multiplier.Text);
                        cmd_std.Parameters.AddWithValue("l_hood", std_lower_hood_multiplier.Text);
                        cmd_std.Parameters.AddWithValue("@topg", std_top_granite_multiplier.Text);
                        cmd_std.Parameters.AddWithValue("@u_panel", std_upper_panel_multiplier.Text);
                        cmd_std.Parameters.AddWithValue("@l_panel", std_lower_panel_multiplier.Text);
                        cmd_std.Parameters.AddWithValue("@holes", std_holes_multiplier.Text);
                        cmd_std.Parameters.AddWithValue("@code", code);
                        cmd_std.ExecuteNonQuery();
                        con.Close();

                        Response.Write("<script>window.close();</" + "script>");
                        Response.End();
        }
    }
}