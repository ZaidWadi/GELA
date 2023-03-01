using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using Microsoft.Ajax.Utilities;

namespace GELA_DB.pages
{
    public partial class WebForm14 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Im_running_out_of_session_names"] != null) { 
            var project_id = Session["Im_running_out_of_session_names"].ToString();
            lbl_OrderID.Text = project_id;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
            if (!IsPostBack)
            {
                con.Open();
                SqlCommand kitchen_types = new SqlCommand("SELECT * from dbo.fxd_tbl_kitchen_types", con);
                SqlDataAdapter kt = new SqlDataAdapter(kitchen_types);
                DataTable k_t = new DataTable();
                kt.Fill(k_t);
                dlst_KitchenType.DataSource = k_t;
                dlst_KitchenType.DataBind();
                dlst_KitchenType.DataTextField = "kitchen_type_ar";
                dlst_KitchenType.DataValueField = "kitchen_types_ID";
                dlst_KitchenType.DataBind();
                con.Close();
                try
                {
                    con.Open();
                    string selectquery = "SELECT * from dbo.fxd_tbl_kitchen_types WHERE kitchen_type_ar=@KitchenTypeAR";
                    SqlCommand cmd = new SqlCommand(selectquery, con);
                    cmd.Parameters.AddWithValue("@KitchenTypeAR", dlst_KitchenType.SelectedItem.Text);
                    SqlDataReader da = cmd.ExecuteReader();
                    while (da.Read())
                    {
                        txtbx_KitchenHeight.Enabled = true;
                        txtbx_KitchenHeight.Text = da["height"].ToString();
                        txtbx_KitchenHeight.Enabled = false;
                        if (da["isdouble"].ToString() == "double")
                        {
                            dlst_DKHUCabinets.Enabled = true;
                            dlst_DKLUCabinets.Enabled = true;
                            txtbx_DKHUCabinetsColor.Enabled = true;
                            txtbx_DKLUCabinetsColor.Enabled = true;
                        }
                        else
                        {
                            dlst_DKHUCabinets.Enabled = false;
                            dlst_DKLUCabinets.Enabled = false;
                            txtbx_DKHUCabinetsColor.Enabled = false;
                            txtbx_DKLUCabinetsColor.Enabled = false;
                        }
                    }
                }
                catch (Exception ex)
                {
                    throw ex;
                }
                finally
                {
                    con.Close();
                }
            
            SqlCommand kitchen_designs = new SqlCommand("SELECT * from dbo.fxd_tbl_kitchen_designs", con);
            SqlDataAdapter kd = new SqlDataAdapter(kitchen_designs);
            DataTable k_d = new DataTable();
            kd.Fill(k_d);
            dlst_Design.DataSource = k_d;
            dlst_Design.DataBind();
            dlst_Design.DataTextField = "design_ar";
            dlst_Design.DataValueField = "kitchen_design_ID";
            dlst_Design.DataBind();
                con.Close();
                con.Open();
                SqlCommand inner_body_wood_type = new SqlCommand("SELECT * from dbo.fxd_tbl_cbnt_wood_type WHERE wood_place=@place", con);
                    inner_body_wood_type.Parameters.AddWithValue("@place", "بودي");
            SqlDataAdapter ibw = new SqlDataAdapter(inner_body_wood_type);
            DataTable i_b_w = new DataTable();
            ibw.Fill(i_b_w);
            dlst_InnerBodyWood.DataSource = i_b_w;
            dlst_InnerBodyWood.DataBind();
            dlst_InnerBodyWood.DataTextField = "cbnt_wood_type";
            dlst_InnerBodyWood.DataValueField = "cbnt_wood_types_ID";
            dlst_InnerBodyWood.DataBind();
                con.Close();
                con.Open();
                SqlCommand cabinet_wood_type = new SqlCommand("SELECT * from dbo.fxd_tbl_cbnt_wood_type WHERE wood_place=@place_1", con);
                    cabinet_wood_type.Parameters.AddWithValue("@place_1", "درف");
                    SqlDataAdapter cw = new SqlDataAdapter(cabinet_wood_type);
            DataTable c_w = new DataTable();
            cw.Fill(c_w);
            dlst_DKHUCabinets.DataSource = c_w;
            dlst_DKHUCabinets.DataBind();
            dlst_DKHUCabinets.DataTextField = "cbnt_wood_type";
            dlst_DKHUCabinets.DataValueField = "cbnt_wood_types_ID";
            dlst_DKHUCabinets.DataBind();
            dlst_DKLUCabinets.DataSource = c_w;
            dlst_DKLUCabinets.DataBind();
            dlst_DKLUCabinets.DataTextField = "cbnt_wood_type";
            dlst_DKLUCabinets.DataValueField = "cbnt_wood_types_ID";
            dlst_DKLUCabinets.DataBind();
            dlst_ClassicUpperCabinets.DataSource = c_w;
            dlst_ClassicUpperCabinets.DataBind();
            dlst_ClassicUpperCabinets.DataTextField = "cbnt_wood_type";
            dlst_ClassicUpperCabinets.DataValueField = "cbnt_wood_types_ID";
            dlst_ClassicUpperCabinets.DataBind();
            ///b
            dlst_LowerCabinets.DataSource = c_w;
            dlst_LowerCabinets.DataBind();
            dlst_LowerCabinets.DataTextField = "cbnt_wood_type";
            dlst_LowerCabinets.DataValueField = "cbnt_wood_types_ID";
            dlst_LowerCabinets.DataBind();
            dlst_PantryCabinets.DataSource = c_w;
            dlst_PantryCabinets.DataBind();
            dlst_PantryCabinets.DataTextField = "cbnt_wood_type";
            dlst_PantryCabinets.DataValueField = "cbnt_wood_types_ID";
            dlst_PantryCabinets.DataBind();
                con.Close();
                con.Open();
                SqlCommand hinges = new SqlCommand("SELECT * from dbo.fxd_tbl_hinges", con);
            SqlDataAdapter hn = new SqlDataAdapter(hinges);
            DataTable h_n = new DataTable();
            hn.Fill(h_n);
            dlst_HingesTrademark.DataSource = h_n;
            dlst_HingesTrademark.DataBind();
            dlst_HingesTrademark.DataTextField = "hinge_trademark";
            dlst_HingesTrademark.DataValueField = "hinges_ID";
            dlst_HingesTrademark.DataBind();

            con.Close();
            try
            {
                con.Open();
                string selectquery = "SELECT * from dbo.fxd_tbl_hinges WHERE hinge_trademark=@HingeTrademark";
                SqlCommand cmd = new SqlCommand(selectquery, con);
                cmd.Parameters.AddWithValue("@HingeTrademark", dlst_HingesTrademark.SelectedItem.Text);
                SqlDataReader da = cmd.ExecuteReader();
                while (da.Read())
                {
                    txtbx_HingesOrigin.Enabled = true;
                    txtbx_HingesOrigin.Text = da["hinge_origin_ar"].ToString();
                    txtbx_HingesOrigin.Enabled = false;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
            }
            con.Open();
            SqlCommand granite_types = new SqlCommand("SELECT * from dbo.fxd_tbl_granite_types", con);
            SqlDataAdapter gt = new SqlDataAdapter(granite_types);
            DataTable g_t = new DataTable();
            gt.Fill(g_t);
            dlst_GraniteType.DataSource = g_t;
            dlst_GraniteType.DataBind();
            dlst_GraniteType.DataTextField = "granite_type_ar";
            dlst_GraniteType.DataValueField = "granite_ID";
            dlst_GraniteType.DataBind();
            txtbx_LowerPanel.Enabled = true;
            txtbx_UpperPanel.Enabled = true;
            txtbx_LowerPanel.Text = dlst_GraniteType.SelectedItem.Text;
            txtbx_UpperPanel.Text = dlst_GraniteType.SelectedItem.Text;
            txtbx_LowerPanel.Enabled = false;
            txtbx_UpperPanel.Enabled = false;
                con.Close();
                con.Open();
                SqlCommand thick = new SqlCommand("SELECT * from dbo.fxd_tbl_granite_top_thickness", con);
            SqlDataAdapter th = new SqlDataAdapter(thick);
            DataTable t_h = new DataTable();
            th.Fill(t_h);
            dlst_GraniteTopThickness.DataSource = t_h;
            dlst_GraniteTopThickness.DataBind();
            dlst_GraniteTopThickness.DataTextField = "top_status";
            dlst_GraniteTopThickness.DataValueField = "top_ID";
            dlst_GraniteTopThickness.DataBind();
                con.Close();
                con.Open();
                SqlCommand lighting_types = new SqlCommand("SELECT * from dbo.fxd_tbl_lighting_types", con);
            SqlDataAdapter lt = new SqlDataAdapter(lighting_types);
            DataTable l_t = new DataTable();
            lt.Fill(l_t);
            dlst_LightingType.DataSource = l_t;
            dlst_LightingType.DataBind();
            dlst_LightingType.DataTextField = "lighting_type_ar";
            dlst_LightingType.DataValueField = "lighting_type_ID";
            dlst_LightingType.DataBind();
                con.Close();
                con.Open();
                SqlCommand hands = new SqlCommand("SELECT * from dbo.fxd_tbl_hands", con);
            SqlDataAdapter ha = new SqlDataAdapter(hands);
            DataTable h_a = new DataTable();
            ha.Fill(h_a);
            dlst_HandsType.DataSource = h_a;
            dlst_HandsType.DataBind();
            dlst_HandsType.DataTextField = "hand_name_ar";
            dlst_HandsType.DataValueField = "hands_ID";
            dlst_HandsType.DataBind();
                con.Close();
                con.Open();
                SqlCommand duct_status = new SqlCommand("SELECT * from dbo.fxd_tbl_duct_status", con);
            SqlDataAdapter ds = new SqlDataAdapter(duct_status);
            DataTable d_s = new DataTable();
            ds.Fill(d_s);
            dlst_DuctOpening.DataSource = d_s;
            dlst_DuctOpening.DataBind();
            dlst_DuctOpening.DataTextField = "duct_status_ar";
            dlst_DuctOpening.DataValueField = "duct_status_ID";
            dlst_DuctOpening.DataBind();
            con.Close();
            con.Open();
            SqlCommand sinkhole = new SqlCommand("SELECT * from dbo.fxd_tbl_sinkhole", con);
            SqlDataAdapter sh = new SqlDataAdapter(sinkhole);
            DataTable s_h = new DataTable();
            sh.Fill(s_h);
            dlst_SinkHole.DataSource = s_h;
            dlst_SinkHole.DataBind();
            dlst_SinkHole.DataTextField = "sinkhole_type_ar";
            dlst_SinkHole.DataValueField = "sinkhole_ID";
            dlst_SinkHole.DataBind();
                con.Close();
                con.Open();
                SqlCommand layout_status = new SqlCommand("SELECT * from dbo.fxd_tbl_layout_status", con);
            SqlDataAdapter ls = new SqlDataAdapter(layout_status);
            DataTable l_s = new DataTable();
            ls.Fill(l_s);
            dlst_ElectricLayout.DataSource = l_s;
            dlst_ElectricLayout.DataBind();
            dlst_ElectricLayout.DataTextField = "layout_status_ar";
            dlst_ElectricLayout.DataValueField = "layout_status_ID";
            dlst_ElectricLayout.DataBind();
            dlst_SanitaryLayout.DataSource = l_s;
            dlst_SanitaryLayout.DataBind();
            dlst_SanitaryLayout.DataTextField = "layout_status_ar";
            dlst_SanitaryLayout.DataValueField = "layout_status_ID";
            dlst_SanitaryLayout.DataBind();
            con.Close();
                con.Open();
                SqlCommand granite_corners = new SqlCommand("SELECT * from dbo.fxd_tbl_granite_corners", con);
            SqlDataAdapter gc = new SqlDataAdapter(granite_corners);
            DataTable g_c = new DataTable();
            gc.Fill(g_c);
            dlst_GraniteCorners.DataSource = g_c;
            dlst_GraniteCorners.DataBind();
            dlst_GraniteCorners.DataTextField = "corner_type";
            dlst_GraniteCorners.DataValueField = "corners_ID";
            dlst_GraniteCorners.DataBind();
            con.Close();
                con.Open();
                SqlCommand sink = new SqlCommand("SELECT * from dbo.fxd_tbl_sinks_list", con);
            SqlDataAdapter sk = new SqlDataAdapter(sink);
            DataTable s_k = new DataTable();
            sk.Fill(s_k);
            dlst_sink.DataSource = s_k;
            dlst_sink.DataBind();
            dlst_sink.DataTextField = "sink_name";
            dlst_sink.DataValueField = "sinks_ID";
            dlst_sink.DataBind();
            con.Close();
                con.Open();
                SqlCommand faucets = new SqlCommand("SELECT * from dbo.fxd_tbl_faucets", con);
            SqlDataAdapter fc = new SqlDataAdapter(faucets);
            DataTable f_c = new DataTable();
            fc.Fill(f_c);
            dlst_faucet.DataSource = f_c;
            dlst_faucet.DataBind();
            dlst_faucet.DataTextField = "faucet_name";
            dlst_faucet.DataValueField = "faucets_ID";
            dlst_faucet.DataBind();
            con.Close();
                }
            }
            else
            {
                Response.Redirect("buffer_page.aspx");
            }
        }


        protected void btn_Done_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
            con.Open();
            string project_data_cmd = "UPDATE dbo.entry_tbl_project_data SET sink=@sink,faucet=@faucet,kitchen_type=@kitchen_type,kitchen_height=@kitchen_height,kitchen_design=@kitchen_design,inner_body_wood=@inner_body_wood,double_kitchen_high_upper_cabinets_wood_type=@double_kitchen_high_upper_cabinets_wood_type,double_kitchen_high_upper_cabinets_color=@double_kitchen_high_upper_cabinets_color,double_kitchen_low_upper_cabinets_wood_type=@double_kitchen_low_upper_cabinets_wood_type,double_kitchen_low_upper_cabinets_color=@double_kitchen_low_upper_cabinets_color,classic_upper_cabinets_wood_type=@classic_upper_cabinets_wood_type,classic_upper_cabinets_color=@classic_upper_cabinets_color,lower_cabinets_wood_type=@lower_cabinets_wood_type,lower_cabinets_color=@lower_cabinets_color,pantry_cabinets_wood_type=@pantry_cabinets_wood_type,pantry_cabinets_color=@pantry_cabinets_color,hinges_trademark=@hinges_trademark,hinges_origin=@hinges_origin,granite_type=@granite_type,granite_name=@granite_name,electric_layout=@electric_layout,sanitary_layout=@sanitary_layout,lower_panel_granite=@lower_panel_granite,upper_panel_granite=@upper_panel_granite,lighting_type=@lighting_type,top_granite_thickness=@top_granite_thickness,hands_type=@hands_type,duct_opening=@duct_opening,sink_hole_type=@sink_hole_type,granite_corners=@granite_corners,notes=@notes WHERE project_ID=@project_id";
            SqlCommand cmd = new SqlCommand(project_data_cmd, con);
            cmd.Parameters.AddWithValue("@sink", dlst_sink.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@faucet", dlst_faucet.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@project_id", lbl_OrderID.Text);
            cmd.Parameters.AddWithValue("@kitchen_type", dlst_KitchenType.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@kitchen_height", txtbx_KitchenHeight.Text);
            cmd.Parameters.AddWithValue("@kitchen_design", dlst_Design.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@inner_body_wood", dlst_InnerBodyWood.SelectedItem.Text);
            string unavailable_dkuh = "";
            string unavailable_dluh = "";
            if ((dlst_DKHUCabinets.Enabled != false && dlst_DKLUCabinets.Enabled != false) && (dlst_DKHUCabinets.SelectedItem.Text != null && dlst_DKLUCabinets.SelectedItem.Text != null))
            {
                unavailable_dkuh = dlst_DKHUCabinets.SelectedItem.Text;
                unavailable_dluh = dlst_DKLUCabinets.SelectedItem.Text;
            }
            else
            {
                unavailable_dkuh = "لا يوجد";
                unavailable_dluh = "لا يوجد";
            }
            cmd.Parameters.AddWithValue("@double_kitchen_high_upper_cabinets_wood_type", unavailable_dkuh);
            cmd.Parameters.AddWithValue("@double_kitchen_high_upper_cabinets_color", txtbx_DKHUCabinetsColor.Text);
            cmd.Parameters.AddWithValue("@double_kitchen_low_upper_cabinets_wood_type", unavailable_dluh);
            cmd.Parameters.AddWithValue("@double_kitchen_low_upper_cabinets_color", txtbx_DKLUCabinetsColor.Text);
            cmd.Parameters.AddWithValue("@classic_upper_cabinets_wood_type", dlst_ClassicUpperCabinets.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@classic_upper_cabinets_color", txtbx_ClassicUpperCabinetsColor.Text);
            cmd.Parameters.AddWithValue("@lower_cabinets_wood_type", dlst_LowerCabinets.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@lower_cabinets_color", txtbx_LowerCabinetsColor.Text);
            cmd.Parameters.AddWithValue("@pantry_cabinets_wood_type", dlst_PantryCabinets.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@pantry_cabinets_color", txtbx_PantyCabinetsColor.Text);
            cmd.Parameters.AddWithValue("@hinges_trademark", dlst_HingesTrademark.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@hinges_origin", txtbx_HingesOrigin.Text);
            cmd.Parameters.AddWithValue("@granite_type", dlst_GraniteType.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@granite_name", txtbx_GraniteName.Text);
            cmd.Parameters.AddWithValue("@electric_layout", dlst_ElectricLayout.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@sanitary_layout", dlst_SanitaryLayout.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@lower_panel_granite", txtbx_LowerPanel.Text);
            cmd.Parameters.AddWithValue("@upper_panel_granite", txtbx_UpperPanel.Text);
            cmd.Parameters.AddWithValue("@lighting_type", dlst_LightingType.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@top_granite_thickness", dlst_GraniteTopThickness.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@hands_type", dlst_HandsType.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@duct_opening", dlst_DuctOpening.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@sink_hole_type", dlst_SinkHole.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@granite_corners", dlst_GraniteCorners.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@notes", txtbx_Notes.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("<script>window.close();</" + "script>");
            Response.End();
        }

        protected void dlst_KitchenType_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);

            try
            {
                con.Open();
                string selectquery = "SELECT * from dbo.fxd_tbl_kitchen_types WHERE kitchen_type_ar=@KitchenTypeAR";
                SqlCommand cmd = new SqlCommand(selectquery, con);
                cmd.Parameters.AddWithValue("@KitchenTypeAR", dlst_KitchenType.SelectedItem.Text);
                SqlDataReader da = cmd.ExecuteReader();
                while (da.Read())
                {
                    txtbx_KitchenHeight.Enabled = true;
                    txtbx_KitchenHeight.Text = da["height"].ToString();
                    txtbx_KitchenHeight.Enabled = false;
                    if (da["isdouble"].ToString() == "double")
                    {
                        dlst_DKHUCabinets.Enabled = true;
                        dlst_DKLUCabinets.Enabled = true;
                        txtbx_DKHUCabinetsColor.Enabled = true;
                        txtbx_DKLUCabinetsColor.Enabled = true;
                    }
                    else
                    {
                        dlst_DKHUCabinets.Enabled = false;
                        dlst_DKLUCabinets.Enabled = false;
                        txtbx_DKHUCabinetsColor.Enabled = false;
                        txtbx_DKLUCabinetsColor.Enabled = false;
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
            }
        }
        protected void dlst_GraniteType_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtbx_LowerPanel.Enabled = true;
            txtbx_UpperPanel.Enabled = true;
            txtbx_LowerPanel.Text = dlst_GraniteType.SelectedItem.Text;
            txtbx_UpperPanel.Text = dlst_GraniteType.SelectedItem.Text;
            txtbx_LowerPanel.Enabled = false;
            txtbx_UpperPanel.Enabled = false;
        }
        protected void dlst_HingesTrademark_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);

            try
            {
                con.Open();
                string selectquery = "SELECT * from dbo.fxd_tbl_hinges WHERE hinge_trademark=@HingeTrademark";
                SqlCommand cmd = new SqlCommand(selectquery, con);
                cmd.Parameters.AddWithValue("@HingeTrademark", dlst_HingesTrademark.SelectedItem.Text);
                SqlDataReader da = cmd.ExecuteReader();
                while (da.Read())
                {
                    txtbx_HingesOrigin.Enabled = true;
                    txtbx_HingesOrigin.Text = da["hinge_origin_ar"].ToString();
                    txtbx_HingesOrigin.Enabled = false;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
            }
        }

        protected void btn_AddCabinets_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
            con.Open();
            string project_data_cmd = "UPDATE dbo.entry_tbl_project_data SET sink=@sink,faucet=@faucet,kitchen_type=@kitchen_type,kitchen_height=@kitchen_height,kitchen_design=@kitchen_design,inner_body_wood=@inner_body_wood,double_kitchen_high_upper_cabinets_wood_type=@double_kitchen_high_upper_cabinets_wood_type,double_kitchen_high_upper_cabinets_color=@double_kitchen_high_upper_cabinets_color,double_kitchen_low_upper_cabinets_wood_type=@double_kitchen_low_upper_cabinets_wood_type,double_kitchen_low_upper_cabinets_color=@double_kitchen_low_upper_cabinets_color,classic_upper_cabinets_wood_type=@classic_upper_cabinets_wood_type,classic_upper_cabinets_color=@classic_upper_cabinets_color,lower_cabinets_wood_type=@lower_cabinets_wood_type,lower_cabinets_color=@lower_cabinets_color,pantry_cabinets_wood_type=@pantry_cabinets_wood_type,pantry_cabinets_color=@pantry_cabinets_color,hinges_trademark=@hinges_trademark,hinges_origin=@hinges_origin,granite_type=@granite_type,granite_name=@granite_name,electric_layout=@electric_layout,sanitary_layout=@sanitary_layout,lower_panel_granite=@lower_panel_granite,upper_panel_granite=@upper_panel_granite,lighting_type=@lighting_type,top_granite_thickness=@top_granite_thickness,hands_type=@hands_type,duct_opening=@duct_opening,sink_hole_type=@sink_hole_type,granite_corners=@granite_corners,notes=@notes WHERE project_ID=@project_id";
            SqlCommand cmd = new SqlCommand(project_data_cmd, con);
            cmd.Parameters.AddWithValue("@sink", dlst_sink.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@faucet", dlst_faucet.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@project_id", lbl_OrderID.Text);
            cmd.Parameters.AddWithValue("@kitchen_type", dlst_KitchenType.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@kitchen_height", txtbx_KitchenHeight.Text);
            cmd.Parameters.AddWithValue("@kitchen_design", dlst_Design.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@inner_body_wood", dlst_InnerBodyWood.SelectedItem.Text);
            string unavailable_dkuh = "";
            string unavailable_dluh = "";
            if ((dlst_DKHUCabinets.Enabled != false && dlst_DKLUCabinets.Enabled != false) && (dlst_DKHUCabinets.SelectedItem.Text != null && dlst_DKLUCabinets.SelectedItem.Text != null))
            {
                unavailable_dkuh = dlst_DKHUCabinets.SelectedItem.Text;
                unavailable_dluh = dlst_DKLUCabinets.SelectedItem.Text;
            }
            else
            {
                unavailable_dkuh = "لا يوجد";
                unavailable_dluh = "لا يوجد";
            }
            cmd.Parameters.AddWithValue("@double_kitchen_high_upper_cabinets_wood_type", unavailable_dkuh);
            cmd.Parameters.AddWithValue("@double_kitchen_high_upper_cabinets_color", txtbx_DKHUCabinetsColor.Text);
            cmd.Parameters.AddWithValue("@double_kitchen_low_upper_cabinets_wood_type", unavailable_dluh);
            cmd.Parameters.AddWithValue("@double_kitchen_low_upper_cabinets_color", txtbx_DKLUCabinetsColor.Text);
            cmd.Parameters.AddWithValue("@classic_upper_cabinets_wood_type", dlst_ClassicUpperCabinets.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@classic_upper_cabinets_color", txtbx_ClassicUpperCabinetsColor.Text);
            cmd.Parameters.AddWithValue("@lower_cabinets_wood_type", dlst_LowerCabinets.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@lower_cabinets_color", txtbx_LowerCabinetsColor.Text);
            cmd.Parameters.AddWithValue("@pantry_cabinets_wood_type", dlst_PantryCabinets.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@pantry_cabinets_color", txtbx_PantyCabinetsColor.Text);
            cmd.Parameters.AddWithValue("@hinges_trademark", dlst_HingesTrademark.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@hinges_origin", txtbx_HingesOrigin.Text);
            cmd.Parameters.AddWithValue("@granite_type", dlst_GraniteType.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@granite_name", txtbx_GraniteName.Text);
            cmd.Parameters.AddWithValue("@electric_layout", dlst_ElectricLayout.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@sanitary_layout", dlst_SanitaryLayout.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@lower_panel_granite", txtbx_LowerPanel.Text);
            cmd.Parameters.AddWithValue("@upper_panel_granite", txtbx_UpperPanel.Text);
            cmd.Parameters.AddWithValue("@lighting_type", dlst_LightingType.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@top_granite_thickness", dlst_GraniteTopThickness.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@hands_type", dlst_HandsType.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@duct_opening", dlst_DuctOpening.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@sink_hole_type", dlst_SinkHole.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@granite_corners", dlst_GraniteCorners.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@notes", txtbx_Notes.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            Session["project_id"] = lbl_OrderID.Text;
            Session["kitchen_type"] = dlst_KitchenType.SelectedItem.Text;
            string popup = "window.open ('order_details_input.aspx', 'popup_window', 'width=300,height=100,left=100,top=100,resizable=yes');";
            ClientScript.RegisterStartupScript(GetType(), "script", popup, true);
        }

    }
}

