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
    public partial class WebForm54 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["project_id"] != null)
            {
                var project_id = Session["project_id"].ToString();
                lbl_customer_no.Text = project_id;
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
                con.Open();
                SqlCommand cmd_proj_data = new SqlCommand("SELECT * FROM dbo.entry_tbl_project_data WHERE project_ID=@ID", con);
                cmd_proj_data.Parameters.AddWithValue("@ID", project_id);
                SqlDataAdapter da_proj = new SqlDataAdapter(cmd_proj_data);
                DataTable dt_proj = new DataTable();
                da_proj.Fill(dt_proj);
                con.Close();
                lbl_customer_name.Text = dt_proj.Rows[0]["customer"].ToString();
                lbl_customer_no.Text = dt_proj.Rows[0]["customer_no"].ToString();
                lbl_OrderID.Text = dt_proj.Rows[0]["project_ID"].ToString();
                if (!IsPostBack)
                {
                    if (lbl_customer_no.Text != null)
                    {
                        con.Open();
                        SqlCommand engineers = new SqlCommand("SELECT * from dbo.fxd_tbl_engineers", con);
                        SqlDataAdapter en = new SqlDataAdapter(engineers);
                        DataTable e_n = new DataTable();
                        en.Fill(e_n);
                        dlst_MeasuringEngName.DataSource = e_n;
                        dlst_MeasuringEngName.DataBind();
                        dlst_MeasuringEngName.DataTextField = "eng_name_ar";
                        dlst_MeasuringEngName.DataValueField = "engineers_ID";
                        dlst_MeasuringEngName.DataBind();
                        dlst_MeasuringEngName.Items.FindByText(dt_proj.Rows[0]["measuring_eng_name"].ToString()).Selected = true;
                        dlst_DesignerName.DataSource = e_n;
                        dlst_DesignerName.DataBind();
                        dlst_DesignerName.DataTextField = "eng_name_ar";
                        dlst_DesignerName.DataValueField = "engineers_ID";
                        dlst_DesignerName.DataBind();
                        dlst_DesignerName.Items.FindByText(dt_proj.Rows[0]["designer_name"].ToString()).Selected = true;
                        dlst_QAEng.DataSource = e_n;
                        dlst_QAEng.DataBind();
                        dlst_QAEng.DataTextField = "eng_name_ar";
                        dlst_QAEng.DataValueField = "engineers_ID";
                        dlst_QAEng.DataBind();
                        dlst_QAEng.Items.FindByText(dt_proj.Rows[0]["QA_eng_name"].ToString()).Selected = true;
                        con.Close();
                        con.Open();
                        SqlCommand products = new SqlCommand("SELECT * from dbo.fxd_tbl_products", con);
                        SqlDataAdapter pr = new SqlDataAdapter(products);
                        DataTable p_r = new DataTable();
                        pr.Fill(p_r);
                        dlst_project.DataSource = p_r;
                        dlst_project.DataBind();
                        dlst_project.DataTextField = "product_ar";
                        dlst_project.DataValueField = "products_ID";
                        dlst_project.DataBind();
                        con.Close();
                        dlst_project.Items.FindByText(dt_proj.Rows[0]["project"].ToString()).Selected = true;
                        con.Open();
                        SqlCommand managers = new SqlCommand("SELECT * from dbo.fxd_tbl_managers", con);
                        SqlDataAdapter ma = new SqlDataAdapter(managers);
                        DataTable m_a = new DataTable();
                        ma.Fill(m_a);
                        dlst_ProdManger.DataSource = m_a;
                        dlst_ProdManger.DataBind();
                        dlst_ProdManger.DataTextField = "man_name_ar";
                        dlst_ProdManger.DataValueField = "man_ID";
                        dlst_ProdManger.DataBind();
                        con.Close();
                        dlst_ProdManger.Items.FindByText(dt_proj.Rows[0]["production_manager"].ToString()).Selected = true;
                        try
                        {
                            con.Open();
                            string selectquery = "SELECT * from dbo.fxd_tbl_engineers WHERE eng_name_ar=@name";
                            SqlCommand cmd = new SqlCommand(selectquery, con);
                            cmd.Parameters.AddWithValue("@name", dlst_DesignerName.SelectedItem.Text);
                            SqlDataReader da = cmd.ExecuteReader();
                            while (da.Read())
                            {
                                txtbx_DesignerPhone.Enabled = true;
                                txtbx_DesignerPhone.Text = da["eng_phone_1"].ToString();
                                txtbx_DesignerPhone.Enabled = false;
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
                        try
                        {
                            con.Open();
                            string selectquery = "SELECT * from dbo.fxd_tbl_engineers WHERE eng_name_ar=@name";
                            SqlCommand cmd = new SqlCommand(selectquery, con);
                            cmd.Parameters.AddWithValue("@name", dlst_MeasuringEngName.SelectedItem.Text);
                            SqlDataReader da = cmd.ExecuteReader();
                            while (da.Read())
                            {
                                txtbx_MeasuringEngPhone.Enabled = true;
                                txtbx_MeasuringEngPhone.Text = da["eng_phone_1"].ToString();
                                txtbx_MeasuringEngPhone.Enabled = false;
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
                }
                con.Open();
                SqlCommand cmd_grab_data = new SqlCommand("SELECT * FROM dbo.entry_tbl_project_data WHERE project_ID=@ID", con);
                cmd_grab_data.Parameters.AddWithValue("@ID", project_id);
                SqlDataAdapter da_grab = new SqlDataAdapter(cmd_grab_data);
                DataTable dt_grab = new DataTable();
                da_grab.Fill(dt_grab);
                con.Close();
                txtbx_GraniteName.Text = dt_grab.Rows[0]["granite_name"].ToString();
                txtbx_Notes.Text = dt_grab.Rows[0]["notes"].ToString();
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
                    dlst_KitchenType.Items.FindByText(dt_grab.Rows[0]["kitchen_type"].ToString()).Selected = true;
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
                    dlst_Design.Items.FindByText(dt_grab.Rows[0]["kitchen_design"].ToString()).Selected = true;
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
                    dlst_InnerBodyWood.Items.FindByText(dt_grab.Rows[0]["inner_body_wood"].ToString()).Selected = true;
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
                    dlst_DKHUCabinets.Items.FindByText(dt_grab.Rows[0]["double_kitchen_high_upper_cabinets_wood_type"].ToString()).Selected = true;
                    txtbx_DKHUCabinetsColor.Text = dt_grab.Rows[0]["double_kitchen_high_upper_cabinets_color"].ToString();
                    dlst_DKLUCabinets.DataSource = c_w;
                    dlst_DKLUCabinets.DataBind();
                    dlst_DKLUCabinets.DataTextField = "cbnt_wood_type";
                    dlst_DKLUCabinets.DataValueField = "cbnt_wood_types_ID";
                    dlst_DKLUCabinets.DataBind();
                    dlst_DKLUCabinets.Items.FindByText(dt_grab.Rows[0]["double_kitchen_low_upper_cabinets_wood_type"].ToString()).Selected = true;
                    txtbx_DKLUCabinetsColor.Text = dt_grab.Rows[0]["double_kitchen_low_upper_cabinets_color"].ToString();
                    dlst_ClassicUpperCabinets.DataSource = c_w;
                    dlst_ClassicUpperCabinets.DataBind();
                    dlst_ClassicUpperCabinets.DataTextField = "cbnt_wood_type";
                    dlst_ClassicUpperCabinets.DataValueField = "cbnt_wood_types_ID";
                    dlst_ClassicUpperCabinets.DataBind();
                    dlst_ClassicUpperCabinets.Items.FindByText(dt_grab.Rows[0]["classic_upper_cabinets_wood_type"].ToString()).Selected = true;
                    txtbx_ClassicUpperCabinetsColor.Text = dt_grab.Rows[0]["classic_upper_cabinets_color"].ToString();
                    ///b
                    dlst_LowerCabinets.DataSource = c_w;
                    dlst_LowerCabinets.DataBind();
                    dlst_LowerCabinets.DataTextField = "cbnt_wood_type";
                    dlst_LowerCabinets.DataValueField = "cbnt_wood_types_ID";
                    dlst_LowerCabinets.DataBind();
                    dlst_LowerCabinets.Items.FindByText(dt_grab.Rows[0]["lower_cabinets_wood_type"].ToString()).Selected = true;
                    txtbx_LowerCabinetsColor.Text = dt_grab.Rows[0]["lower_cabinets_color"].ToString();
                    dlst_PantryCabinets.DataSource = c_w;
                    dlst_PantryCabinets.DataBind();
                    dlst_PantryCabinets.DataTextField = "cbnt_wood_type";
                    dlst_PantryCabinets.DataValueField = "cbnt_wood_types_ID";
                    dlst_PantryCabinets.DataBind();
                    dlst_PantryCabinets.Items.FindByText(dt_grab.Rows[0]["pantry_cabinets_wood_type"].ToString()).Selected = true;
                    txtbx_PantyCabinetsColor.Text = dt_grab.Rows[0]["pantry_cabinets_color"].ToString();
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
                    dlst_HingesTrademark.Items.FindByText(dt_grab.Rows[0]["hinges_trademark"].ToString()).Selected = true;
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
                    dlst_GraniteType.Items.FindByText(dt_grab.Rows[0]["granite_type"].ToString()).Selected = true;
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
                    dlst_GraniteTopThickness.Items.FindByText(dt_grab.Rows[0]["top_granite_thickness"].ToString()).Selected = true;
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
                    dlst_LightingType.Items.FindByText(dt_grab.Rows[0]["lighting_type"].ToString()).Selected = true;
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
                    dlst_HandsType.Items.FindByText(dt_grab.Rows[0]["hands_type"].ToString()).Selected = true;
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
                    dlst_DuctOpening.Items.FindByText(dt_grab.Rows[0]["duct_opening"].ToString()).Selected = true;
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
                    dlst_SinkHole.Items.FindByText(dt_grab.Rows[0]["sink_hole_type"].ToString()).Selected = true;
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
                    dlst_ElectricLayout.Items.FindByText(dt_grab.Rows[0]["electric_layout"].ToString()).Selected = true;
                    dlst_SanitaryLayout.DataSource = l_s;
                    dlst_SanitaryLayout.DataBind();
                    dlst_SanitaryLayout.DataTextField = "layout_status_ar";
                    dlst_SanitaryLayout.DataValueField = "layout_status_ID";
                    dlst_SanitaryLayout.DataBind();
                    dlst_SanitaryLayout.Items.FindByText(dt_grab.Rows[0]["sanitary_layout"].ToString()).Selected = true;
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
                    dlst_GraniteCorners.Items.FindByText(dt_grab.Rows[0]["granite_corners"].ToString()).Selected = true;
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
                    dlst_sink.Items.FindByText(dt_grab.Rows[0]["sink"].ToString()).Selected = true;
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
                    dlst_faucet.Items.FindByText(dt_grab.Rows[0]["faucet"].ToString()).Selected = true;
                    if (dlst_project.SelectedItem.Text == "مطبخ")
                    {
                        furniture_views.ActiveViewIndex = 0;
                    }
                    else
                    {
                        furniture_views.ActiveViewIndex = 1;
                    }
                    con.Open();
                    SqlCommand cmd_frn = new SqlCommand("SELECT * FROM dbo.entry_tbl_order WHERE project_no=@project_no", con);
                    cmd_frn.Parameters.AddWithValue("@project_no", project_id);
                    SqlDataReader dr_frn = cmd_frn.ExecuteReader();
                        cabinets_grid.DataSource = dr_frn;
                        cabinets_grid.DataBind();
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
            string project_data_cmd = "UPDATE dbo.entry_tbl_project_data SET project=@proj ,measuring_eng_name=@meas_eng ,measuring_eng_phone_no=@meas_eng_ph ,designer_name=@designer ,designer_phone_no=@des_ph ,QA_eng_name=@qa ,production_manager=@prod_man ,sink=@sink,faucet=@faucet,kitchen_type=@kitchen_type,kitchen_height=@kitchen_height,kitchen_design=@kitchen_design,inner_body_wood=@inner_body_wood,double_kitchen_high_upper_cabinets_wood_type=@double_kitchen_high_upper_cabinets_wood_type,double_kitchen_high_upper_cabinets_color=@double_kitchen_high_upper_cabinets_color,double_kitchen_low_upper_cabinets_wood_type=@double_kitchen_low_upper_cabinets_wood_type,double_kitchen_low_upper_cabinets_color=@double_kitchen_low_upper_cabinets_color,classic_upper_cabinets_wood_type=@classic_upper_cabinets_wood_type,classic_upper_cabinets_color=@classic_upper_cabinets_color,lower_cabinets_wood_type=@lower_cabinets_wood_type,lower_cabinets_color=@lower_cabinets_color,pantry_cabinets_wood_type=@pantry_cabinets_wood_type,pantry_cabinets_color=@pantry_cabinets_color,hinges_trademark=@hinges_trademark,hinges_origin=@hinges_origin,granite_type=@granite_type,granite_name=@granite_name,electric_layout=@electric_layout,sanitary_layout=@sanitary_layout,lower_panel_granite=@lower_panel_granite,upper_panel_granite=@upper_panel_granite,lighting_type=@lighting_type,top_granite_thickness=@top_granite_thickness,hands_type=@hands_type,duct_opening=@duct_opening,sink_hole_type=@sink_hole_type,granite_corners=@granite_corners,notes=@notes WHERE project_ID=@project_id";
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
                unavailable_dkuh = "";
                unavailable_dluh = "";
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
            cmd.Parameters.AddWithValue("@ID", lbl_customer_no.Text);
            cmd.Parameters.AddWithValue("@proj", dlst_project.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@meas_eng", dlst_MeasuringEngName.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@meas_eng_ph", txtbx_MeasuringEngPhone.Text);
            cmd.Parameters.AddWithValue("@designer", dlst_DesignerName.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@des_ph", txtbx_DesignerPhone.Text);
            cmd.Parameters.AddWithValue("@qa", dlst_QAEng.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@prod_man", dlst_ProdManger.SelectedItem.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            pnl_form.Enabled = false;
            btn_done.Visible = false;
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

        protected void dlst_DesignerName_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);

            try
            {
                con.Open();
                string selectquery = "SELECT * from dbo.fxd_tbl_engineers WHERE eng_name_ar=@name";
                SqlCommand cmd = new SqlCommand(selectquery, con);
                cmd.Parameters.AddWithValue("@name", dlst_DesignerName.SelectedItem.Text);
                SqlDataReader da = cmd.ExecuteReader();
                while (da.Read())
                {
                    txtbx_DesignerPhone.Enabled = true;
                    txtbx_DesignerPhone.Text = da["eng_phone_1"].ToString();
                    txtbx_DesignerPhone.Enabled = false;
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

        protected void dlst_MeasuringEngName_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);

            try
            {
                con.Open();
                string selectquery = "SELECT * from dbo.fxd_tbl_engineers WHERE eng_name_ar=@name";
                SqlCommand cmd = new SqlCommand(selectquery, con);
                cmd.Parameters.AddWithValue("@name", dlst_MeasuringEngName.SelectedItem.Text);
                SqlDataReader da = cmd.ExecuteReader();
                while (da.Read())
                {
                    txtbx_MeasuringEngPhone.Enabled = true;
                    txtbx_MeasuringEngPhone.Text = da["eng_phone_1"].ToString();
                    txtbx_MeasuringEngPhone.Enabled = false;
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

        protected void btn_edit_Click(object sender, EventArgs e)
        {
            pnl_form.Enabled = true;
            btn_done.Visible = true;
        }

        protected void cabinets_grid_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void cabinets_grid_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btn_done_cabinets_Click(object sender, EventArgs e)
        {
            pnl_furniture.Enabled = false;
        }

        protected void dlst_piece_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void view_kitchen_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
            if (!IsPostBack) { 
            con.Open();
            SqlCommand cmd_kitchen = new SqlCommand("SELECT * FROM dbo.fxd_tbl_furniture WHERE room_code_1=@k or room_code_2=@k or room_code_3=@k", con);
            cmd_kitchen.Parameters.AddWithValue("@k", "k");
            SqlDataAdapter da_kitchen = new SqlDataAdapter(cmd_kitchen);
            DataTable dt_kitchen = new DataTable();
            da_kitchen.Fill(dt_kitchen);
            dlst_product.DataSource = dt_kitchen;
            dlst_product.DataBind();
            dlst_product.DataTextField = "piece_ar";
            dlst_product.DataValueField = "pieces_ID";
            dlst_product.DataBind();
            con.Close();
            con.Open();
            SqlCommand accessories = new SqlCommand("SELECT * FROM dbo.fxd_tbl_accessories", con);
            SqlDataAdapter acc = new SqlDataAdapter(accessories);
            DataTable a_c_c = new DataTable();
            acc.Fill(a_c_c);
            dlst_accessories.DataSource = a_c_c;
            dlst_accessories.DataBind();
            dlst_accessories.DataTextField = "fullacc";
            dlst_accessories.DataValueField = "accessories_ID";
            dlst_accessories.DataBind();
            con.Close();
            con.Open();
            SqlCommand lighting = new SqlCommand("SELECT * FROM dbo.fxd_tbl_lighting_types", con);
            SqlDataAdapter lig = new SqlDataAdapter(lighting);
            DataTable l_i_g = new DataTable();
            lig.Fill(l_i_g);
            dlst_lighting.DataSource = l_i_g;
            dlst_lighting.DataBind();
            dlst_lighting.DataTextField = "lighting_type_ar";
            dlst_lighting.DataValueField = "lighting_type_ID";
            dlst_lighting.DataBind();
            con.Close();
            con.Open();
            SqlCommand lighting_pos = new SqlCommand("SELECT * FROM dbo.fxd_tbl_lighting_position", con);
            SqlDataAdapter lp = new SqlDataAdapter(lighting_pos);
            DataTable l_p = new DataTable();
            lp.Fill(l_p);
            dlst_lighting_pos.DataSource = l_p;
            dlst_lighting_pos.DataBind();
            dlst_lighting_pos.DataTextField = "lighting_pos_ar";
            dlst_lighting_pos.DataValueField = "lighting_pos_ID";
            dlst_lighting_pos.DataBind();
            con.Close();
            con.Open();
            SqlCommand lighting_place = new SqlCommand("SELECT * FROM dbo.fxd_tbl_lighting_cab_type", con);
            SqlDataAdapter lpl = new SqlDataAdapter(lighting_place);
            DataTable l_p_l = new DataTable();
            lpl.Fill(l_p_l);
            dlst_lighting_place.DataSource = l_p_l;
            dlst_lighting_place.DataBind();///o
            dlst_lighting_place.DataTextField = "lighting_cab_type_ar";
            dlst_lighting_place.DataValueField = "lighting_cab_type_ID";
            dlst_lighting_place.DataBind();
            con.Close();
            }
        }

        protected void view_furnature_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
            if (!IsPostBack) { 
                con.Open();
                SqlCommand cmd_furniture = new SqlCommand("SELECT * FROM dbo.fxd_tbl_furniture WHERE (room_code_1=@f or room_code_1=@d) or (room_code_2=@f or room_code_2=@d) or (room_code_3=@f or room_code_3=@d)", con);
                cmd_furniture.Parameters.AddWithValue("@f", "f");
                cmd_furniture.Parameters.AddWithValue("@d", "d");
                SqlDataAdapter da_furniture = new SqlDataAdapter(cmd_furniture);
                DataTable dt_furniture = new DataTable();
                da_furniture.Fill(dt_furniture);
                dlst_piece.DataSource = dt_furniture;
                dlst_piece.DataBind();
                dlst_piece.DataTextField = "piece_ar";
                dlst_piece.DataValueField = "pieces_ID";
                dlst_piece.DataBind();
                con.Close();
                con.Open();
                SqlCommand lighting = new SqlCommand("SELECT * FROM dbo.fxd_tbl_lighting_types", con);
                SqlDataAdapter lig = new SqlDataAdapter(lighting);
                DataTable l_i_g = new DataTable();
                lig.Fill(l_i_g);
                dlst_lighting_frn.DataSource = l_i_g;
                dlst_lighting_frn.DataBind();
                dlst_lighting_frn.DataTextField = "lighting_type_ar";
                dlst_lighting_frn.DataValueField = "lighting_type_ID";
                dlst_lighting_frn.DataBind();
                con.Close();

            }
        }
        protected void dlst_product_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.fxd_tbl_cabinet_full_names WHERE cabinet_full_name = @name", con);
            cmd.Parameters.AddWithValue("name", dlst_product.SelectedItem.Text);
            SqlDataReader dr = cmd.ExecuteReader();
            ///grabs cabinet device status from table
            if (dr.Read())
            {
                if (dr["device_status"].ToString() == "Y")
                {
                    dr.Close();
                    dlst_devices.Enabled = true;
                    SqlCommand devices = new SqlCommand("SELECT * FROM dbo.fxd_tbl_devices", con);
                    SqlDataAdapter dev = new SqlDataAdapter(devices);
                    DataTable d_e_v = new DataTable();
                    dev.Fill(d_e_v);
                    dlst_devices.DataSource = d_e_v;
                    dlst_devices.DataBind();
                    dlst_devices.DataTextField = "fulldev";
                    dlst_devices.DataValueField = "devices_ID";
                    dlst_devices.DataBind();
                    con.Close();
                } ///unlocks device selection if the cabinet has devices
                else
                {
                    dlst_devices.SelectedIndex = -1;
                    dlst_devices.Enabled = false;
                }
            }
        }

        protected void btn_delete_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;
            int rowindex = gvr.RowIndex;
            GridViewRow row = cabinets_grid.Rows[rowindex];
            var cab_id = row.Cells[1].Text;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
            con.Open();
            SqlCommand cmd_delete = new SqlCommand("DELETE FROM dbo.entry_tbl_order WHERE cabinet_entry_ID = @id", con);
            cmd_delete.Parameters.AddWithValue("@id", cab_id);
            cmd_delete.ExecuteNonQuery();
            con.Close();
            con.Open();
            SqlCommand cmd_frn = new SqlCommand("SELECT * FROM dbo.entry_tbl_order WHERE project_no=@project_no", con);
            cmd_frn.Parameters.AddWithValue("@project_no", Session["project_id"].ToString());
            SqlDataReader dr_frn = cmd_frn.ExecuteReader();
                cabinets_grid.DataSource = dr_frn;
                cabinets_grid.DataBind();
        }

        protected void btn_edit_cabs_Click(object sender, EventArgs e)
        {
            pnl_furniture.Enabled = true;
        }

        protected void btn_add_frn_Click(object sender, EventArgs e)
        {
            decimal width = decimal.Parse(txtbx_width_frn.Text);
            if (decimal.Parse(txtbx_width_frn.Text) >= 20)
            {
                width = decimal.Parse(txtbx_width_frn.Text) / 100;
            }
            decimal length = decimal.Parse(txtbx_length.Text);
            if (decimal.Parse(txtbx_length.Text) >= 20)
            {
                length = decimal.Parse(txtbx_length.Text) / 100;
            }
            string light = "";
            if (dlst_lighting_frn.SelectedItem.Text != null && dlst_lighting_frn.Enabled != false && dlst_lighting_frn.SelectedItem.Text != "لا يوجد إنارة")
            {
                light = dlst_lighting_frn.SelectedItem.Text;
            }
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
            con.Open();
            SqlCommand cmd_add = new SqlCommand("INSERT INTO dbo.entry_tbl_order (project_no,product,width,length,lighting,quantity) VALUES(@project_no,@product,@width,@length,@lighting,@quantity)", con);
            cmd_add.Parameters.AddWithValue("@project_no", Session["project_id"].ToString());
            cmd_add.Parameters.AddWithValue("@product", dlst_piece.SelectedItem.Text);
            cmd_add.Parameters.AddWithValue("@width", width);
            cmd_add.Parameters.AddWithValue("@length", length);
            cmd_add.Parameters.AddWithValue("@lighting", light);
            cmd_add.Parameters.AddWithValue("@quantity", txtbx_quantity_frn.Text);
            cmd_add.ExecuteNonQuery();
            con.Close();
            con.Open();
            SqlCommand cmd_frn = new SqlCommand("SELECT * FROM dbo.entry_tbl_order WHERE project_no=@project_no", con);
            cmd_frn.Parameters.AddWithValue("@project_no", Session["project_id"].ToString());
            SqlDataReader dr_frn = cmd_frn.ExecuteReader();
                cabinets_grid.DataSource = dr_frn;
                cabinets_grid.DataBind();
            con.Close();
        }

        protected void btn_add_cab_Click(object sender, EventArgs e)
        {
            string device = "";
            if (dlst_devices.Enabled != false && dlst_devices.SelectedItem.Text != null)
            {
                device = dlst_devices.SelectedItem.Text;
            }
            string accessory = "";
            if (dlst_accessories.Enabled != false && dlst_accessories.SelectedItem.Text != null)
            {
                accessory = dlst_accessories.SelectedItem.Text;
            }
            decimal width = decimal.Parse(txtbx_width.Text);
            if (decimal.Parse(txtbx_width.Text) >= 20)
            {
                width = decimal.Parse(txtbx_width.Text) / 100;
            }
            string light_pos = "";
            string light_loc = "";
            if (dlst_lighting.SelectedItem.Text != "لا يوجد إنارة")
            {
                light_pos = dlst_lighting_pos.SelectedItem.Text;
                light_loc = dlst_lighting_place.SelectedItem.Text;
            }
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
            con.Open();
            SqlCommand cmd_add = new SqlCommand("INSERT INTO dbo.entry_tbl_order (project_no,product,width,accessories,devices,lighting,lighting_position,lighting_location_type,quantity) VALUES(@project_no,@product,@width,@accessories,@devices,@lighting,@lighting_position,@lighting_location_type,@quantity)", con);
            cmd_add.Parameters.AddWithValue("@project_no", Session["project_id"].ToString());
            cmd_add.Parameters.AddWithValue("@product", dlst_product.SelectedItem.Text);
            cmd_add.Parameters.AddWithValue("@width", width);
            cmd_add.Parameters.AddWithValue("@accessories", accessory);
            cmd_add.Parameters.AddWithValue("@devices", device);
            cmd_add.Parameters.AddWithValue("@lighting", dlst_lighting.SelectedItem.Text);
            cmd_add.Parameters.AddWithValue("@lighting_position", light_pos);
            cmd_add.Parameters.AddWithValue("@lighting_location_type", light_loc);
            cmd_add.Parameters.AddWithValue("@quantity", txtbx_quantity.Text);
            cmd_add.ExecuteNonQuery();
            con.Close();
            con.Open();
            SqlCommand cmd_frn = new SqlCommand("SELECT * FROM dbo.entry_tbl_order WHERE project_no=@project_no", con);
            cmd_frn.Parameters.AddWithValue("@project_no", Session["project_id"].ToString());
            SqlDataReader dr_frn = cmd_frn.ExecuteReader();
                cabinets_grid.DataSource = dr_frn;
                cabinets_grid.DataBind();
            con.Close();

        }
    }
}