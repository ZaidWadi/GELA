///wanderers beware, reading this code may cause headaches, aneurysm, stroke, and/or sudden death
using Microsoft.Ajax.Utilities;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace GELA_DB.pages
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
            con.Open();
            if (Session["project_id"] != null)
            {
                project_id.Text = Session["project_id"].ToString();
                k_t.Text = Session["kitchen_type"].ToString();
                ///to determine which project the cabinets are for
                SqlCommand cab_grid = new SqlCommand("SELECT * FROM dbo.entry_tbl_order WHERE project_no = @project_ID", con);
                cab_grid.Parameters.AddWithValue("@project_ID", project_id.Text);
                SqlDataReader cab_dr = cab_grid.ExecuteReader();
                cabinets_grid.DataSource = cab_dr;
                cabinets_grid.DataBind();
                con.Close();
                if (!IsPostBack)
                {
                    con.Open();
                    SqlCommand cab_names = new SqlCommand("SELECT * FROM dbo.fxd_tbl_cabinet_full_names", con);
                    SqlDataAdapter cfn = new SqlDataAdapter(cab_names);
                    DataTable c_f_n = new DataTable();
                    cfn.Fill(c_f_n);
                    dlst_product.DataSource = c_f_n;
                    dlst_product.DataBind();
                    dlst_product.DataTextField = "cabinet_full_name";
                    dlst_product.DataValueField = "cabinets_ID";
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
            else
            {
                Response.Redirect("buffer_page.aspx");
            }
        } /// bind fixed cabinet info from tables to drop down lists
    

        

        protected void btn_add_cabinet_Click(object sender, EventArgs e)
        {
            
                if (txtbx_width.Text.IsNullOrWhiteSpace() || txtbx_quantity.Text.IsNullOrWhiteSpace())
                {
                    lbl_required.Visible = true;
                }
                else
                {
                decimal width = decimal.Parse(txtbx_width.Text);
                    if (decimal.Parse(txtbx_width.Text) >= 20) 
                {
                    width = decimal.Parse(txtbx_width.Text) / 100;
                }
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
                    con.Open();
                    var k_id = Session["kitchen_type"].ToString(); ///getting kitchen type to determine the multipliers
                    SqlCommand kitchen = new SqlCommand("SELECT * FROM dbo.fxd_tbl_kitchen_types WHERE kitchen_type_ar=@type", con);
                    kitchen.Parameters.AddWithValue("@type", k_id);
                    SqlDataReader kid = kitchen.ExecuteReader();
                    kid.Read();
                    var k_code = kid["kitchen_type_code"].ToString();
                    kid.Close(); ///grabing the code for the kitchen type
                    con.Close();
                    con.Open();
                    decimal pr = 0; ///this will be the final price for the cabinet
                    SqlCommand load_project = new SqlCommand("SELECT * FROM dbo.entry_tbl_project_data WHERE project_ID = @ID", con);
                    load_project.Parameters.AddWithValue("@ID", Session["project_id"].ToString());
                    SqlDataAdapter project_data_da = new SqlDataAdapter(load_project);
                    DataTable project_data_dt = new DataTable();
                    project_data_da.Fill(project_data_dt);
                    con.Close();

                ///get the wood and granite types from project data
                decimal pr_upper = 0;
                if (!project_data_dt.Rows[0]["classic_upper_cabinets_wood_type"].ToString().IsNullOrWhiteSpace())
                {
                    con.Open();
                    SqlCommand upper_wood_prices = new SqlCommand("SELECT * FROM dbo.fxd_tbl_wood_granite_prices WHERE wood_granite_name = @name", con);
                    upper_wood_prices.Parameters.AddWithValue("@name", project_data_dt.Rows[0]["classic_upper_cabinets_wood_type"].ToString());
                    SqlDataReader upper_wood_price_dr = upper_wood_prices.ExecuteReader();
                    upper_wood_price_dr.Read();
                    pr_upper = decimal.Parse(upper_wood_price_dr["wood_granite_price"].ToString());
                    upper_wood_price_dr.Close(); ///look up wood name in the prices table and fetch its price
                    con.Close();
                }
                decimal u_pr_upper = 0;
                if (!project_data_dt.Rows[0]["double_kitchen_high_upper_cabinets_wood_type"].ToString().IsNullOrWhiteSpace())
                {
                    con.Open();
                    SqlCommand u_upper_wood_prices = new SqlCommand("SELECT * FROM dbo.fxd_tbl_wood_granite_prices WHERE wood_granite_name = @name", con);
                    u_upper_wood_prices.Parameters.AddWithValue("@name", project_data_dt.Rows[0]["double_kitchen_high_upper_cabinets_wood_type"].ToString());
                    SqlDataReader u_upper_wood_price_dr = u_upper_wood_prices.ExecuteReader();
                    if (u_upper_wood_price_dr.Read()) { 
                    u_pr_upper = decimal.Parse(u_upper_wood_price_dr["wood_granite_price"].ToString());
                    u_upper_wood_price_dr.Close(); ///look up wood name in the prices table and fetch its price
                    }
                    con.Close();
                }
                decimal l_pr_upper = 0;
                if (!project_data_dt.Rows[0]["double_kitchen_low_upper_cabinets_wood_type"].ToString().IsNullOrWhiteSpace())
                {
                    con.Open();
                    SqlCommand l_upper_wood_prices = new SqlCommand("SELECT * FROM dbo.fxd_tbl_wood_granite_prices WHERE wood_granite_name = @name", con);
                    l_upper_wood_prices.Parameters.AddWithValue("@name", project_data_dt.Rows[0]["double_kitchen_low_upper_cabinets_wood_type"].ToString());
                    SqlDataReader l_upper_wood_price_dr = l_upper_wood_prices.ExecuteReader();
                    if (l_upper_wood_price_dr.Read()) { 
                    l_pr_upper = decimal.Parse(l_upper_wood_price_dr["wood_granite_price"].ToString());
                    l_upper_wood_price_dr.Close(); ///look up wood name in the prices table and fetch its price
                    }
                    con.Close();
                }
                decimal  pr_lower = 0;
                if (!project_data_dt.Rows[0]["lower_cabinets_wood_type"].ToString().IsNullOrWhiteSpace())
                {
                    con.Open();
                    SqlCommand lower_wood_prices = new SqlCommand("SELECT * FROM dbo.fxd_tbl_wood_granite_prices WHERE wood_granite_name = @name", con);
                    lower_wood_prices.Parameters.AddWithValue("@name", project_data_dt.Rows[0]["lower_cabinets_wood_type"].ToString());
                    SqlDataReader lower_wood_price_dr = lower_wood_prices.ExecuteReader();
                    if (lower_wood_price_dr.Read()) { 
                    pr_lower = decimal.Parse(lower_wood_price_dr["wood_granite_price"].ToString());
                    lower_wood_price_dr.Close(); ///look up wood name in the prices table and fetch its price
                    }
                    con.Close();
                }
                decimal pr_pantry = 0;
                if (!project_data_dt.Rows[0]["pantry_cabinets_wood_type"].ToString().IsNullOrWhiteSpace())
                {
                    con.Open();
                    SqlCommand pantry_wood_prices = new SqlCommand("SELECT * FROM dbo.fxd_tbl_wood_granite_prices WHERE wood_granite_name = @name", con);
                    pantry_wood_prices.Parameters.AddWithValue("@name", project_data_dt.Rows[0]["pantry_cabinets_wood_type"].ToString());
                    SqlDataReader pantry_wood_price_dr = pantry_wood_prices.ExecuteReader();
                    if (pantry_wood_price_dr.Read()) { 
                    pr_pantry = decimal.Parse(pantry_wood_price_dr["wood_granite_price"].ToString());
                    pantry_wood_price_dr.Close(); ///look up wood name in the prices table and fetch its price
                    }
                    con.Close();
                }
                decimal pr_wood = 0;
                    con.Open();
                    decimal pr_granite = 0;
                    if (!project_data_dt.Rows[0]["granite_type"].ToString().IsNullOrWhiteSpace())
                    {
                        SqlCommand granite_prices = new SqlCommand("SELECT * FROM dbo.fxd_tbl_wood_granite_prices WHERE wood_granite_name = @name", con);
                        granite_prices.Parameters.AddWithValue("@name", project_data_dt.Rows[0]["granite_type"].ToString());
                        SqlDataReader granite_price_dr = granite_prices.ExecuteReader();
                        if (granite_price_dr.Read()) { 
                        pr_granite = decimal.Parse(granite_price_dr["wood_granite_price"].ToString());
                        granite_price_dr.Close(); ///look up granite name in the prices table and fetch its price
                    }
                }
                    con.Close();
                    con.Open();
                    decimal pr_lower_hood = 0;
                    if (!project_data_dt.Rows[0]["lower_cabinets_wood_type"].ToString().IsNullOrWhiteSpace())
                    {
                        SqlCommand lower_hood_prices = new SqlCommand("SELECT * FROM dbo.fxd_tbl_lower_hood_prices WHERE wood_type = @name", con);
                        lower_hood_prices.Parameters.AddWithValue("@name", project_data_dt.Rows[0]["lower_cabinets_wood_type"].ToString());
                        SqlDataReader lower_hood_prices_dr = lower_hood_prices.ExecuteReader();
                        if (lower_hood_prices_dr.Read()) { 
                        pr_lower_hood = decimal.Parse(lower_hood_prices_dr["price"].ToString());
                        lower_hood_prices_dr.Close(); ///look up wood name in the lower hood table and fetch its price
                    }
                }
                    con.Close();
                    con.Open();
                    decimal pr_upper_hood = 0;
                    if (!project_data_dt.Rows[0]["lower_cabinets_wood_type"].ToString().IsNullOrWhiteSpace())
                    {
                        SqlCommand upper_hood_prices = new SqlCommand("SELECT * FROM dbo.fxd_tbl_upper_hood_prices WHERE wood_type = @name", con);
                        upper_hood_prices.Parameters.AddWithValue("@name", project_data_dt.Rows[0]["lower_cabinets_wood_type"].ToString());
                        SqlDataReader upper_hood_prices_dr = upper_hood_prices.ExecuteReader();
                        if (upper_hood_prices_dr.Read())
                    {
                        pr_upper_hood = decimal.Parse(upper_hood_prices_dr["price"].ToString());
                        upper_hood_prices_dr.Close(); ///look up wood name in the upper hood table and fetch its price
                    }
                }
                    con.Close();
                    con.Open();
                    decimal pr_lower_panel = 0;
                    if (!project_data_dt.Rows[0]["lower_panel_granite"].ToString().IsNullOrWhiteSpace())
                    {
                        SqlCommand lower_panel_prices = new SqlCommand("SELECT * FROM dbo.fxd_tbl_lower_panel_granite_prices WHERE granite_type = @name", con);
                        lower_panel_prices.Parameters.AddWithValue("@name", project_data_dt.Rows[0]["lower_panel_granite"].ToString());
                        SqlDataReader lower_panel_prices_dr = lower_panel_prices.ExecuteReader();
                    if (lower_panel_prices_dr.Read()) 
                    { 
                        pr_lower_panel = decimal.Parse(lower_panel_prices_dr["price"].ToString());
                        lower_panel_prices_dr.Close(); ///look up wood name in the lower panel table and fetch its price
                    }
                }
                    con.Close();
                    con.Open();
                    decimal pr_upper_panel = 0;
                    if (!project_data_dt.Rows[0]["upper_panel_granite"].ToString().IsNullOrWhiteSpace())
                    {
                        SqlCommand upper_panel_prices = new SqlCommand("SELECT * FROM dbo.fxd_tbl_lower_panel_granite_prices WHERE granite_type = @name", con);
                        upper_panel_prices.Parameters.AddWithValue("@name", project_data_dt.Rows[0]["upper_panel_granite"].ToString());
                        SqlDataReader upper_panel_prices_dr = upper_panel_prices.ExecuteReader();
                        if (upper_panel_prices_dr.Read())
                        {
                            pr_upper_panel = decimal.Parse(upper_panel_prices_dr["price"].ToString());
                            upper_panel_prices_dr.Close(); ///look up wood name in the upper panel table and fetch its price
                        }
                    }
                    con.Close();
                    con.Open();
                    SqlCommand holes_prices = new SqlCommand("SELECT * FROM dbo.fxd_tbl_wood_granite_prices WHERE wood_granite_name = @name", con);
                    string holes = "فتحات";
                    holes_prices.Parameters.AddWithValue("@name", holes);
                    SqlDataReader holes_price_dr = holes_prices.ExecuteReader();
                    holes_price_dr.Read();
                    decimal pr_holes = decimal.Parse(holes_price_dr["wood_granite_price"].ToString());
                    holes_price_dr.Close(); ///get the price for holes from prices table
                    con.Close();
                    con.Open();
                    decimal pr_accessories = 0;
                    if (dlst_accessories.SelectedItem.Text.IsNullOrWhiteSpace())
                    {
                        SqlCommand accessories_prices = new SqlCommand("SELECT * FROM dbo.fxd_tbl_accessories WHERE fullacc = @acc", con);
                        accessories_prices.Parameters.AddWithValue("@acc", dlst_accessories.SelectedItem.Text);
                        SqlDataReader accessories_prices_dr = accessories_prices.ExecuteReader();
                        accessories_prices_dr.Read();
                        pr_accessories = decimal.Parse(accessories_prices_dr["accessory_price"].ToString());
                        accessories_prices_dr.Close(); ///look up wood name in the upper panel table and fetch its price
                    }
                    con.Close();
                    con.Open();
                    decimal pr_devices = 0;
                    if (dlst_devices.Enabled == true && dlst_devices.SelectedItem.Text != null)
                    {
                        SqlCommand devices_prices = new SqlCommand("SELECT * FROM dbo.fxd_tbl_devices WHERE fulldev = @dev", con);
                        devices_prices.Parameters.AddWithValue("@dev", dlst_devices.SelectedItem.Text);
                        SqlDataReader devices_prices_dr = devices_prices.ExecuteReader();
                        devices_prices_dr.Read();
                        pr_devices = decimal.Parse(devices_prices_dr["price"].ToString());
                        devices_prices_dr.Close(); ///look up wood name in the upper panel table and fetch its price
                    }
                    con.Close();
                    con.Open();
                    decimal pr_lighting = 0;
                    if (!dlst_lighting.SelectedItem.Text.IsNullOrWhiteSpace())
                    {
                        SqlCommand lighting_prices = new SqlCommand("SELECT * FROM dbo.fxd_tbl_general_prices WHERE item_name=@lighting", con);
                        lighting_prices.Parameters.AddWithValue("@lighting", dlst_lighting.SelectedItem.Text);
                        SqlDataReader lighting_prices_dr = lighting_prices.ExecuteReader();
                        lighting_prices_dr.Read();
                        pr_lighting = decimal.Parse(lighting_prices_dr["price"].ToString());
                        lighting_prices_dr.Close();
                    }
                    con.Close();
                    if (k_code == "STD")
                    {
                        con.Open();
                        SqlCommand std = new SqlCommand("SELECT * FROM dbo.fxd_tbl_cabinet_full_names_and_specs_STD WHERE cabinet_full_name = @name", con);
                        std.Parameters.AddWithValue("@name", dlst_product.SelectedItem.Text);
                        SqlDataReader std_dr = std.ExecuteReader();
                        std_dr.Read();
                        pr = (((width * decimal.Parse(std_dr["constant_body"].ToString()) * pr_wood) + (width * decimal.Parse(std_dr["constant_upper_hood"].ToString()) * pr_upper_hood) + (width * decimal.Parse(std_dr["constant_lower_hood"].ToString()) * pr_lower_hood) + (width * decimal.Parse(std_dr["constant_top_granite"].ToString()) * pr_granite) + (width * decimal.Parse(std_dr["constant_upper_panel"].ToString()) * pr_upper_panel) + (width * decimal.Parse(std_dr["constant_lower_panel"].ToString()) * pr_lower_panel) + (decimal.Parse(std_dr["constant_holes"].ToString()) * pr_holes) + pr_accessories + pr_devices)) * decimal.Parse(txtbx_quantity.Text);
                        std_dr.Close();
                        con.Close();
                    } /// if kitchen is american height
                    else if (k_code == "DTC")
                    {
                        con.Open();
                        SqlCommand dtc = new SqlCommand("SELECT * FROM dbo.fxd_tbl_cabinet_full_names_and_specs_DTC WHERE cabinet_full_name = @name", con);
                        dtc.Parameters.AddWithValue("@name", dlst_product.SelectedItem.Text);
                        SqlDataReader dtc_dr = dtc.ExecuteReader();
                        dtc_dr.Read();
                        pr = (((width * decimal.Parse(dtc_dr["constant_body"].ToString()) * pr_wood) + (width * decimal.Parse(dtc_dr["constant_upper_hood"].ToString()) * pr_upper_hood) + (width * decimal.Parse(dtc_dr["constant_lower_hood"].ToString()) * pr_lower_hood) + (width * decimal.Parse(dtc_dr["constant_top_granite"].ToString()) * pr_granite) + (width * decimal.Parse(dtc_dr["constant_upper_panel"].ToString()) * pr_upper_panel) + (width * decimal.Parse(dtc_dr["constant_lower_panel"].ToString()) * pr_lower_panel) + (decimal.Parse(dtc_dr["constant_holes"].ToString()) * pr_holes) + pr_accessories + pr_devices)) * decimal.Parse(txtbx_quantity.Text);
                        dtc_dr.Close();
                        con.Close();
                    } /// if kitchen is german height
                    else if (k_code == "DTCD")
                    {
                        con.Open();
                        SqlCommand dtcd = new SqlCommand("SELECT * FROM dbo.fxd_tbl_cabinet_full_names_and_specs_DTCD WHERE cabinet_full_name = @name", con);
                        dtcd.Parameters.AddWithValue("@name", dlst_product.SelectedItem.Text);
                        SqlDataReader dtcd_dr = dtcd.ExecuteReader();
                        dtcd_dr.Read();
                        pr = (((width * decimal.Parse(dtcd_dr["constant_body"].ToString()) * pr_wood) + (width * decimal.Parse(dtcd_dr["constant_upper_hood"].ToString()) * pr_upper_hood) + (width * decimal.Parse(dtcd_dr["constant_lower_hood"].ToString()) * pr_lower_hood) + (width * decimal.Parse(dtcd_dr["constant_top_granite"].ToString()) * pr_granite) + (width * decimal.Parse(dtcd_dr["constant_upper_panel"].ToString()) * pr_upper_panel) + (width * decimal.Parse(dtcd_dr["constant_lower_panel"].ToString()) * pr_lower_panel) + (decimal.Parse(dtcd_dr["constant_holes"].ToString()) * pr_holes) + pr_accessories + pr_devices)) * decimal.Parse(txtbx_quantity.Text);
                        dtcd_dr.Close();
                        con.Close();
                    } /// if kitchen is german double height
                    else if (k_code == "FUL")
                    {
                        con.Open();
                        SqlCommand ful = new SqlCommand("SELECT * FROM dbo.fxd_tbl_cabinet_full_names_and_specs_FUL WHERE cabinet_full_name = @name", con);
                        ful.Parameters.AddWithValue("@name", dlst_product.SelectedItem.Text);
                        SqlDataReader ful_dr = ful.ExecuteReader();
                        ful_dr.Read();
                        pr = (((width * decimal.Parse(ful_dr["constant_body"].ToString()) * pr_wood) + (width * decimal.Parse(ful_dr["constant_upper_hood"].ToString()) * pr_upper_hood) + (width * decimal.Parse(ful_dr["constant_lower_hood"].ToString()) * pr_lower_hood) + (width * decimal.Parse(ful_dr["constant_top_granite"].ToString()) * pr_granite) + (width * decimal.Parse(ful_dr["constant_upper_panel"].ToString()) * pr_upper_panel) + (width * decimal.Parse(ful_dr["constant_lower_panel"].ToString()) * pr_lower_panel) + (decimal.Parse(ful_dr["constant_holes"].ToString()) * pr_holes) + pr_accessories + pr_devices)) * decimal.Parse(txtbx_quantity.Text);
                        ful_dr.Close();
                        con.Close();
                    } /// if kitchen is full height
                    else if (k_code == "FULD")
                    {
                        con.Open();
                        SqlCommand fuld = new SqlCommand("SELECT * FROM dbo.fxd_tbl_cabinet_full_names_and_specs_FULD WHERE cabinet_full_name = @name", con);
                        fuld.Parameters.AddWithValue("@name", dlst_product.SelectedItem.Text);
                        SqlDataReader fuld_dr = fuld.ExecuteReader();
                        fuld_dr.Read();
                        pr = (((width * decimal.Parse(fuld_dr["constant_body"].ToString()) * pr_wood) + (width * decimal.Parse(fuld_dr["constant_upper_hood"].ToString()) * pr_upper_hood) + (width * decimal.Parse(fuld_dr["constant_lower_hood"].ToString()) * pr_lower_hood) + (width * decimal.Parse(fuld_dr["constant_top_granite"].ToString()) * pr_granite) + (width * decimal.Parse(fuld_dr["constant_upper_panel"].ToString()) * pr_upper_panel) + (width * decimal.Parse(fuld_dr["constant_lower_panel"].ToString()) * pr_lower_panel) + (decimal.Parse(fuld_dr["constant_holes"].ToString()) * pr_holes) + pr_accessories + pr_devices)) * decimal.Parse(txtbx_quantity.Text);
                        fuld_dr.Close();
                        con.Close();
                    } /// if kitchen is double full height
                    if (dlst_devices.Enabled == false || dlst_devices.SelectedItem.Text == null)
                    {
                        selected_device.Text = "N/A";
                    }
                    else
                    {
                        selected_device.Text = dlst_devices.SelectedItem.Text;
                    }
                    if (dlst_accessories.Enabled == false || dlst_accessories.SelectedItem.Text == null)
                    {
                        selected_accessory.Text = "N/A";
                    }
                    else
                    {
                        selected_accessory.Text = dlst_accessories.SelectedItem.Text;
                    }
                string light_pos = "";
                string light_loc = "";
                if (dlst_lighting.SelectedItem.Text == "لا يوجد إنارة")
                {
                    light_pos = "N/A";
                    light_loc = "N/A";
                }
                else
                {
                    light_pos = dlst_lighting_pos.SelectedItem.Text;
                    light_loc = dlst_lighting_place.SelectedItem.Text;
                }
                con.Open();
                    SqlCommand cmd_add = new SqlCommand("INSERT INTO dbo.entry_tbl_order (project_no,product,width,accessories,devices,lighting,lighting_position,lighting_location_type,quantity,price) VALUES(@project_ID,@product,@width,@accessories,@devices,@lighting,@lighting_position,@lighting_location,@quantity,@price)", con);
                    cmd_add.Parameters.AddWithValue("@project_ID", project_id.Text);
                    cmd_add.Parameters.AddWithValue("@product", dlst_product.SelectedItem.Text);
                    cmd_add.Parameters.AddWithValue("@width", width);
                    cmd_add.Parameters.AddWithValue("@accessories", selected_accessory.Text);
                    cmd_add.Parameters.AddWithValue("@devices", selected_device.Text);
                    cmd_add.Parameters.AddWithValue("@lighting", dlst_lighting.SelectedItem.Text);
                    cmd_add.Parameters.AddWithValue("@lighting_position", light_pos);
                    cmd_add.Parameters.AddWithValue("@lighting_location", light_loc);
                    cmd_add.Parameters.AddWithValue("@quantity", txtbx_quantity.Text);
                    cmd_add.Parameters.AddWithValue("@price", pr);
                    cmd_add.ExecuteNonQuery(); ///posts the cabinet info to the cabinets table
                    con.Close();
                    con.Open();
                    SqlCommand cab_grid = new SqlCommand("SELECT * FROM dbo.entry_tbl_order WHERE project_no = @project_ID", con);
                    cab_grid.Parameters.AddWithValue("@project_ID", project_id.Text);
                    SqlDataReader cab_dr = cab_grid.ExecuteReader();
                    cabinets_grid.DataSource = cab_dr;
                    cabinets_grid.DataBind();
                    con.Close();
                }
            }
            
        protected void btn_done_Click(object sender, EventArgs e)
        {
            Response.Write("<script>window.close();</" + "script>");
            Response.End();
        }

        protected void dlst_product_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.fxd_tbl_cabinet_full_names WHERE cabinet_full_name = @name", con);
            cmd.Parameters.AddWithValue("name", dlst_product.SelectedItem.Text);
            SqlDataReader dr = cmd.ExecuteReader();
            ///grabs cabinet device status from table
            if (dr.Read()) { 
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

        protected void debug_Click(object sender, EventArgs e)
        {
            
        }

        protected void btn_delete_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
            con.Open();
            SqlCommand cmd_delete = new SqlCommand("DELETE FROM dbo.entry_tbl_order WHERE cabinet_entry_ID = @id",con);
            cmd_delete.Parameters.AddWithValue("@id", txbx_selected_row.Text);
            cmd_delete.ExecuteNonQuery();
            con.Close();
            con.Open();
            SqlCommand cab_grid = new SqlCommand("SELECT * FROM dbo.entry_tbl_order WHERE project_no = @project_ID", con);
            cab_grid.Parameters.AddWithValue("@project_ID", project_id.Text);
            SqlDataReader cab_dr = cab_grid.ExecuteReader();
            cabinets_grid.DataSource = cab_dr;
            cabinets_grid.DataBind();
            con.Close();
        }

        protected void cabinets_grid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(this.cabinets_grid, "Select$" + e.Row.RowIndex.ToString());
            }
        }

        protected void cabinets_grid_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = cabinets_grid.SelectedRow;
            txbx_selected_row.Text = row.Cells[0].Text;
        }
    }
}