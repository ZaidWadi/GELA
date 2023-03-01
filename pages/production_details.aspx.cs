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
    public partial class WebForm16 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["another_project_id_sess"].ToString() != null) { 
                var project_id = Session["another_project_id_sess"].ToString();
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
                con.Open();
                SqlCommand cmd_grid = new SqlCommand("SELECT * FROM dbo.entry_tbl_order WHERE project_no=@id",con);
                cmd_grid.Parameters.AddWithValue("@id", project_id);
                SqlDataAdapter da_grid = new SqlDataAdapter(cmd_grid);
                DataTable dt_grid = new DataTable();
                da_grid.Fill(dt_grid);
                if (dt_grid.Rows.Count > 0)
                {
                    cabinets_grid.DataSource = dt_grid;
                    cabinets_grid.DataBind();
                }
                con.Close();
                con.Open();
                SqlCommand cmd_details = new SqlCommand("SELECT * FROM dbo.entry_tbl_project_data WHERE project_ID=@id", con);
                cmd_details.Parameters.AddWithValue("@id", project_id);
                SqlDataReader dr_details = cmd_details.ExecuteReader();
                dr_details.Read();
                lbl_customer.Text = dr_details["customer"].ToString();
                lbl_prod_manager.Text = dr_details["production_manager"].ToString();
                lbl_sink.Text = dr_details["sink"].ToString();
                lbl_faucet.Text = dr_details["faucet"].ToString();
                lbl_hinges.Text = dr_details["hinges_trademark"].ToString();
                string granite = dr_details["granite_type"].ToString() + "/" + dr_details["granite_name"].ToString();
                lbl_granite.Text = granite;
                lbl_hands.Text = dr_details["hands_type"].ToString();
                lbl_top_thickness.Text = dr_details["top_granite_thickness"].ToString();
                lbl_granite_corners.Text = dr_details["granite_corners"].ToString();
                lbl_sinkhole.Text = dr_details["sink_hole_type"].ToString();
                lbl_electric_layout.Text = dr_details["electric_layout"].ToString();
                lbl_sanitary_layout.Text = dr_details["sanitary_layout"].ToString();
                lbl_duct.Text = dr_details["duct_opening"].ToString();
                lbl_inner_body_wood.Text = dr_details["inner_body_wood"].ToString();
                lbl_lower_cabinets_wood.Text = dr_details["lower_cabinets_wood_type"].ToString(); ;
                lbl_lower_cabinets_color.Text = dr_details["lower_cabinets_color"].ToString(); ;
                lbl_upper_cabinets_wood.Text = dr_details["classic_upper_cabinets_wood_type"].ToString(); ;
                lbl_upper_cabinets_color.Text = dr_details["classic_upper_cabinets_color"].ToString(); ;
                lbl_dklh_wood.Text = dr_details["double_kitchen_low_upper_cabinets_wood_type"].ToString(); ;
                lbl_dklh_color.Text = dr_details["double_kitchen_low_upper_cabinets_color"].ToString(); ;
                lbl_dkuh_wood.Text = dr_details["double_kitchen_high_upper_cabinets_wood_type"].ToString(); ;
                lbl_dkuh_color.Text = dr_details["double_kitchen_high_upper_cabinets_color"].ToString(); ;
                lbl_pantry_wood.Text = dr_details["pantry_cabinets_wood_type"].ToString(); ;
                lbl_pantry_color.Text = dr_details["pantry_cabinets_color"].ToString(); ;
                dr_details.Close();
                con.Close();
            }
            else
            {
                Response.Redirect("buffer_page.aspx");
            }

        }
    }
}