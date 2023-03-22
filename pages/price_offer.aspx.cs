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
    public partial class WebForm9 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var auth = "Design";
            if (Session["auth"] != null)
            {
                auth = Session["auth"].ToString();
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
                con.Open();
                if (!IsPostBack)
                {

                    if (auth != "Supervisor")
                    {
                        SqlCommand discount = new SqlCommand("SELECT * from dbo.fxd_tbl_discounts WHERE auth = @auth", con);
                        discount.Parameters.AddWithValue("@auth", "Employee");
                        SqlDataAdapter dsc = new SqlDataAdapter(discount);
                        DataTable d_s_c = new DataTable();
                        dsc.Fill(d_s_c);
                        dlst_discount.DataSource = d_s_c;
                        dlst_discount.DataBind();
                        dlst_discount.DataTextField = "discount";
                        dlst_discount.DataValueField = "discounts_ID";
                        dlst_discount.DataBind();
                        con.Close();
                    }
                    else if (auth == "Supervisor")
                    {
                        SqlCommand discount = new SqlCommand("SELECT * from dbo.fxd_tbl_discounts", con);
                        SqlDataAdapter dsc = new SqlDataAdapter(discount);
                        DataTable d_s_c = new DataTable();
                        dsc.Fill(d_s_c);
                        dlst_discount.DataSource = d_s_c;
                        dlst_discount.DataBind();
                        dlst_discount.DataTextField = "discount";
                        dlst_discount.DataValueField = "discounts_ID";
                        dlst_discount.DataBind();
                        con.Close();
                    }
                }
                con.Close();
                con.Open();
                SqlCommand cmd_cabs = new SqlCommand("SELECT * FROM dbo.entry_tbl_order WHERE project_no=@ID", con);
                cmd_cabs.Parameters.AddWithValue("@ID", Session["price_offer_ID"].ToString());
                SqlDataAdapter da_cabs = new SqlDataAdapter(cmd_cabs);
                DataTable dt_cabs = new DataTable();
                da_cabs.Fill(dt_cabs);
                con.Close();
                decimal final_pr = 0;
                con.Open();
                SqlCommand cmd_ktype = new SqlCommand("SELECT kitchen_type FROM dbo.entry_tbl_project_data WHERE project_ID=@ID", con);
                cmd_ktype.Parameters.AddWithValue("@ID", Session["price_offer_ID"].ToString());
                SqlDataReader dr_ktype = cmd_ktype.ExecuteReader();
                var k_id = "";
                if (dr_ktype.Read())
                {
                    k_id = dr_ktype["kitchen_type"].ToString(); ///getting kitchen type to determine the multipliers
                    dr_ktype.Close();
                }
                SqlCommand kitchen = new SqlCommand("SELECT * FROM dbo.fxd_tbl_kitchen_types WHERE kitchen_type_ar=@type", con);
                kitchen.Parameters.AddWithValue("@type", k_id);
                SqlDataReader kid = kitchen.ExecuteReader();
                var k_code = "";
                if (kid.Read()) {
                k_code = kid["kitchen_type_code"].ToString();
                kid.Close(); ///grabing the code for the kitchen type
                }
                con.Close();
                con.Open();
                foreach (DataRow dr in dt_cabs.Rows)
                {
                    decimal pr = 0; ///this will be the final price for the cabinet
                    SqlCommand load_project = new SqlCommand("SELECT * FROM dbo.entry_tbl_project_data WHERE project_ID = @ID", con);
                    load_project.Parameters.AddWithValue("@ID", Session["price_offer_ID"].ToString());
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
                        if (u_upper_wood_price_dr.Read())
                        {
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
                        if (l_upper_wood_price_dr.Read())
                        {
                            l_pr_upper = decimal.Parse(l_upper_wood_price_dr["wood_granite_price"].ToString());
                            l_upper_wood_price_dr.Close(); ///look up wood name in the prices table and fetch its price
                        }
                        con.Close();
                    }
                    decimal pr_lower = 0;
                    if (!project_data_dt.Rows[0]["lower_cabinets_wood_type"].ToString().IsNullOrWhiteSpace())
                    {
                        con.Open();
                        SqlCommand lower_wood_prices = new SqlCommand("SELECT * FROM dbo.fxd_tbl_wood_granite_prices WHERE wood_granite_name = @name", con);
                        lower_wood_prices.Parameters.AddWithValue("@name", project_data_dt.Rows[0]["lower_cabinets_wood_type"].ToString());
                        SqlDataReader lower_wood_price_dr = lower_wood_prices.ExecuteReader();
                        if (lower_wood_price_dr.Read())
                        {
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
                        if (pantry_wood_price_dr.Read())
                        {
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
                        granite_price_dr.Read();
                        pr_granite = decimal.Parse(granite_price_dr["wood_granite_price"].ToString());
                        granite_price_dr.Close(); ///look up granite name in the prices table and fetch its price

                    }
                    con.Close();
                    con.Open();
                    decimal pr_lower_hood = 0;
                    if (!project_data_dt.Rows[0]["lower_cabinets_wood_type"].ToString().IsNullOrWhiteSpace())
                    {
                        SqlCommand lower_hood_prices = new SqlCommand("SELECT * FROM dbo.fxd_tbl_lower_hood_prices WHERE wood_type = @name", con);
                        lower_hood_prices.Parameters.AddWithValue("@name", project_data_dt.Rows[0]["lower_cabinets_wood_type"].ToString());
                        SqlDataReader lower_hood_prices_dr = lower_hood_prices.ExecuteReader();
                        lower_hood_prices_dr.Read();
                        pr_lower_hood = decimal.Parse(lower_hood_prices_dr["price"].ToString());
                        lower_hood_prices_dr.Close(); ///look up wood name in the lower hood table and fetch its price
                    }
                    con.Close();
                    con.Open();
                    decimal pr_upper_hood = 0;
                    if (!project_data_dt.Rows[0]["lower_cabinets_wood_type"].ToString().IsNullOrWhiteSpace())
                    {
                        SqlCommand upper_hood_prices = new SqlCommand("SELECT * FROM dbo.fxd_tbl_upper_hood_prices WHERE wood_type = @name", con);
                        upper_hood_prices.Parameters.AddWithValue("@name", project_data_dt.Rows[0]["lower_cabinets_wood_type"].ToString());
                        SqlDataReader upper_hood_prices_dr = upper_hood_prices.ExecuteReader();
                        upper_hood_prices_dr.Read();
                        pr_upper_hood = decimal.Parse(upper_hood_prices_dr["price"].ToString());
                        upper_hood_prices_dr.Close(); ///look up wood name in the upper hood table and fetch its price
                    }
                    con.Close();
                    con.Open();
                    decimal pr_lower_panel = 0;
                    if (!project_data_dt.Rows[0]["lower_panel_granite"].ToString().IsNullOrWhiteSpace())
                    {
                        SqlCommand lower_panel_prices = new SqlCommand("SELECT * FROM dbo.fxd_tbl_lower_panel_granite_prices WHERE granite_type = @name", con);
                        lower_panel_prices.Parameters.AddWithValue("@name", project_data_dt.Rows[0]["lower_panel_granite"].ToString());
                        SqlDataReader lower_panel_prices_dr = lower_panel_prices.ExecuteReader();
                        lower_panel_prices_dr.Read();
                        pr_lower_panel = decimal.Parse(lower_panel_prices_dr["price"].ToString());
                        lower_panel_prices_dr.Close(); ///look up wood name in the lower panel table and fetch its price
                    }
                    con.Close();
                    con.Open();
                    decimal pr_upper_panel = 0;
                    if (!project_data_dt.Rows[0]["upper_panel_granite"].ToString().IsNullOrWhiteSpace())
                    {
                        SqlCommand upper_panel_prices = new SqlCommand("SELECT * FROM dbo.fxd_tbl_lower_panel_granite_prices WHERE granite_type = @name", con);
                        upper_panel_prices.Parameters.AddWithValue("@name", project_data_dt.Rows[0]["upper_panel_granite"].ToString());
                        SqlDataReader upper_panel_prices_dr = upper_panel_prices.ExecuteReader();
                        upper_panel_prices_dr.Read();
                        pr_upper_panel = decimal.Parse(upper_panel_prices_dr["price"].ToString());
                        upper_panel_prices_dr.Close(); ///look up wood name in the upper panel table and fetch its price
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
                    if (k_code == "STD")
                    {
                        con.Open();
                        SqlCommand std = new SqlCommand("SELECT * FROM dbo.fxd_tbl_cabinet_full_names_and_specs_STD WHERE cabinet_full_name = @name", con);
                        std.Parameters.AddWithValue("@name", dr["product"].ToString());
                        SqlDataReader std_dr = std.ExecuteReader();
                        std_dr.Read();
                        if (std_dr["cabinet_vertical_pos_code"].ToString() == "B")
                        {
                            pr_wood = pr_lower;
                        }
                        else if (std_dr["cabinet_vertical_pos_code"].ToString() == "H" && (std_dr["is_double"].ToString() != "LD" && std_dr["is_double"].ToString() != "UD"))
                        {
                            pr_wood = pr_upper;
                        }
                        else if (std_dr["cabinet_vertical_pos_code"].ToString() == "H" && (std_dr["is_double"].ToString() == "LD"))
                        {
                            pr_wood = l_pr_upper;
                        }
                        else if (std_dr["cabinet_vertical_pos_code"].ToString() == "H" && (std_dr["is_double"].ToString() == "UD"))
                        {
                            pr_wood = u_pr_upper;
                        }
                        else if (std_dr["cabinet_vertical_pos_code"].ToString() == "T")
                        {
                            pr_wood = pr_pantry;
                        }
                        pr = ((decimal.Parse(dr["width"].ToString()) * decimal.Parse(std_dr["constant_body"].ToString()) * pr_wood) + (decimal.Parse(dr["width"].ToString()) * decimal.Parse(std_dr["constant_upper_hood"].ToString()) * pr_upper_hood) + (decimal.Parse(dr["width"].ToString()) * decimal.Parse(std_dr["constant_lower_hood"].ToString()) * pr_lower_hood) + (decimal.Parse(dr["width"].ToString()) * decimal.Parse(std_dr["constant_top_granite"].ToString()) * pr_granite) + (decimal.Parse(dr["width"].ToString()) * decimal.Parse(std_dr["constant_upper_panel"].ToString()) * pr_upper_panel) + (decimal.Parse(dr["width"].ToString()) * decimal.Parse(std_dr["constant_lower_panel"].ToString()) * pr_lower_panel) + (decimal.Parse(std_dr["constant_holes"].ToString()) * pr_holes)) * decimal.Parse(dr["quantity"].ToString());
                        std_dr.Close();
                        con.Close();
                    } /// if kitchen is american height
                    else if (k_code == "DTC")
                    {
                        con.Open();
                        SqlCommand dtc = new SqlCommand("SELECT * FROM dbo.fxd_tbl_cabinet_full_names_and_specs_DTC WHERE cabinet_full_name = @name", con);
                        dtc.Parameters.AddWithValue("@name", dr["product"].ToString());
                        SqlDataReader dtc_dr = dtc.ExecuteReader();
                        dtc_dr.Read();
                        if (dtc_dr["cabinet_vertical_pos_code"].ToString() == "B")
                        {
                            pr_wood = pr_lower;
                        }
                        else if (dtc_dr["cabinet_vertical_pos_code"].ToString() == "H" && (dtc_dr["is_double"].ToString() != "LD" && dtc_dr["is_double"].ToString() != "UD"))
                        {
                            pr_wood = pr_upper;
                        }
                        else if (dtc_dr["cabinet_vertical_pos_code"].ToString() == "H" && (dtc_dr["is_double"].ToString() == "LD"))
                        {
                            pr_wood = l_pr_upper;
                        }
                        else if (dtc_dr["cabinet_vertical_pos_code"].ToString() == "H" && (dtc_dr["is_double"].ToString() == "UD"))
                        {
                            pr_wood = u_pr_upper;
                        }
                        else if (dtc_dr["cabinet_vertical_pos_code"].ToString() == "T")
                        {
                            pr_wood = pr_pantry;
                        }
                        pr = ((decimal.Parse(dr["width"].ToString()) * decimal.Parse(dtc_dr["constant_body"].ToString()) * pr_wood) + (decimal.Parse(dr["width"].ToString()) * decimal.Parse(dtc_dr["constant_upper_hood"].ToString()) * pr_upper_hood) + (decimal.Parse(dr["width"].ToString()) * decimal.Parse(dtc_dr["constant_lower_hood"].ToString()) * pr_lower_hood) + (decimal.Parse(dr["width"].ToString()) * decimal.Parse(dtc_dr["constant_top_granite"].ToString()) * pr_granite) + (decimal.Parse(dr["width"].ToString()) * decimal.Parse(dtc_dr["constant_upper_panel"].ToString()) * pr_upper_panel) + (decimal.Parse(dr["width"].ToString()) * decimal.Parse(dtc_dr["constant_lower_panel"].ToString()) * pr_lower_panel) + (decimal.Parse(dtc_dr["constant_holes"].ToString()) * pr_holes)) * decimal.Parse(dr["quantity"].ToString());
                        dtc_dr.Close();
                        con.Close();
                    } /// if kitchen is german height
                    else if (k_code == "DTCD")
                    {
                        con.Open();
                        SqlCommand dtcd = new SqlCommand("SELECT * FROM dbo.fxd_tbl_cabinet_full_names_and_specs_DTCD WHERE cabinet_full_name = @name", con);
                        dtcd.Parameters.AddWithValue("@name", dr["product"].ToString());
                        SqlDataReader dtcd_dr = dtcd.ExecuteReader();
                        dtcd_dr.Read();
                        if (dtcd_dr["cabinet_vertical_pos_code"].ToString() == "B")
                        {
                            pr_wood = pr_lower;
                        }
                        else if (dtcd_dr["cabinet_vertical_pos_code"].ToString() == "H" && (dtcd_dr["is_double"].ToString() != "LD" && dtcd_dr["is_double"].ToString() != "UD"))
                        {
                            pr_wood = pr_upper;
                        }
                        else if (dtcd_dr["cabinet_vertical_pos_code"].ToString() == "H" && (dtcd_dr["is_double"].ToString() == "LD"))
                        {
                            pr_wood = l_pr_upper;
                        }
                        else if (dtcd_dr["cabinet_vertical_pos_code"].ToString() == "H" && (dtcd_dr["is_double"].ToString() == "UD"))
                        {
                            pr_wood = u_pr_upper;
                        }
                        else if (dtcd_dr["cabinet_vertical_pos_code"].ToString() == "T")
                        {
                            pr_wood = pr_pantry;
                        }
                        pr = ((decimal.Parse(dr["width"].ToString()) * decimal.Parse(dtcd_dr["constant_body"].ToString()) * pr_wood) + (decimal.Parse(dr["width"].ToString()) * decimal.Parse(dtcd_dr["constant_upper_hood"].ToString()) * pr_upper_hood) + (decimal.Parse(dr["width"].ToString()) * decimal.Parse(dtcd_dr["constant_lower_hood"].ToString()) * pr_lower_hood) + (decimal.Parse(dr["width"].ToString()) * decimal.Parse(dtcd_dr["constant_top_granite"].ToString()) * pr_granite) + (decimal.Parse(dr["width"].ToString()) * decimal.Parse(dtcd_dr["constant_upper_panel"].ToString()) * pr_upper_panel) + (decimal.Parse(dr["width"].ToString()) * decimal.Parse(dtcd_dr["constant_lower_panel"].ToString()) * pr_lower_panel) + (decimal.Parse(dtcd_dr["constant_holes"].ToString()) * pr_holes)) * decimal.Parse(dr["quantity"].ToString());
                        dtcd_dr.Close();
                        con.Close();
                    } /// if kitchen is german double height
                    else if (k_code == "FUL")
                    {
                        con.Open();
                        SqlCommand ful = new SqlCommand("SELECT * FROM dbo.fxd_tbl_cabinet_full_names_and_specs_FUL WHERE cabinet_full_name = @name", con);
                        ful.Parameters.AddWithValue("@name", dr["product"].ToString());
                        SqlDataReader ful_dr = ful.ExecuteReader();
                        ful_dr.Read();
                        if (ful_dr["cabinet_vertical_pos_code"].ToString() == "B")
                        {
                            pr_wood = pr_lower;
                        }
                        else if (ful_dr["cabinet_vertical_pos_code"].ToString() == "H" && (ful_dr["is_double"].ToString() != "LD" && ful_dr["is_double"].ToString() != "UD"))
                        {
                            pr_wood = pr_upper;
                        }
                        else if (ful_dr["cabinet_vertical_pos_code"].ToString() == "H" && (ful_dr["is_double"].ToString() == "LD"))
                        {
                            pr_wood = l_pr_upper;
                        }
                        else if (ful_dr["cabinet_vertical_pos_code"].ToString() == "H" && (ful_dr["is_double"].ToString() == "UD"))
                        {
                            pr_wood = u_pr_upper;
                        }
                        else if (ful_dr["cabinet_vertical_pos_code"].ToString() == "T")
                        {
                            pr_wood = pr_pantry;
                        }
                        pr = ((decimal.Parse(dr["width"].ToString()) * decimal.Parse(ful_dr["constant_body"].ToString()) * pr_wood) + (decimal.Parse(dr["width"].ToString()) * decimal.Parse(ful_dr["constant_upper_hood"].ToString()) * pr_upper_hood) + (decimal.Parse(dr["width"].ToString()) * decimal.Parse(ful_dr["constant_lower_hood"].ToString()) * pr_lower_hood) + (decimal.Parse(dr["width"].ToString()) * decimal.Parse(ful_dr["constant_top_granite"].ToString()) * pr_granite) + (decimal.Parse(dr["width"].ToString()) * decimal.Parse(ful_dr["constant_upper_panel"].ToString()) * pr_upper_panel) + (decimal.Parse(dr["width"].ToString()) * decimal.Parse(ful_dr["constant_lower_panel"].ToString()) * pr_lower_panel) + (decimal.Parse(ful_dr["constant_holes"].ToString()) * pr_holes)) * decimal.Parse(dr["quantity"].ToString());
                        ful_dr.Close();
                        con.Close();
                    } /// if kitchen is full height
                    else if (k_code == "FULD")
                    {
                        con.Open();
                        SqlCommand fuld = new SqlCommand("SELECT * FROM dbo.fxd_tbl_cabinet_full_names_and_specs_FULD WHERE cabinet_full_name = @name", con);
                        fuld.Parameters.AddWithValue("@name", dr["product"].ToString());
                        SqlDataReader fuld_dr = fuld.ExecuteReader();
                        fuld_dr.Read();
                        if (fuld_dr["cabinet_vertical_pos_code"].ToString() == "B")
                        {
                            pr_wood = pr_lower;
                        }
                        else if (fuld_dr["cabinet_vertical_pos_code"].ToString() == "H" && (fuld_dr["is_double"].ToString() != "LD" && fuld_dr["is_double"].ToString() != "UD"))
                        {
                            pr_wood = pr_upper;
                        }
                        else if (fuld_dr["cabinet_vertical_pos_code"].ToString() == "H" && (fuld_dr["is_double"].ToString() == "LD"))
                        {
                            pr_wood = l_pr_upper;
                        }
                        else if (fuld_dr["cabinet_vertical_pos_code"].ToString() == "H" && (fuld_dr["is_double"].ToString() == "UD"))
                        {
                            pr_wood = u_pr_upper;
                        }
                        else if (fuld_dr["cabinet_vertical_pos_code"].ToString() == "T")
                        {
                            pr_wood = pr_pantry;
                        }
                        fuld_dr.Close();
                        pr = ((decimal.Parse(dr["width"].ToString()) * decimal.Parse(fuld_dr["constant_body"].ToString()) * pr_wood) + (decimal.Parse(dr["width"].ToString()) * decimal.Parse(fuld_dr["constant_upper_hood"].ToString()) * pr_upper_hood) + (decimal.Parse(dr["width"].ToString()) * decimal.Parse(fuld_dr["constant_lower_hood"].ToString()) * pr_lower_hood) + (decimal.Parse(dr["width"].ToString()) * decimal.Parse(fuld_dr["constant_top_granite"].ToString()) * pr_granite) + (decimal.Parse(dr["width"].ToString()) * decimal.Parse(fuld_dr["constant_upper_panel"].ToString()) * pr_upper_panel) + (decimal.Parse(dr["width"].ToString()) * decimal.Parse(fuld_dr["constant_lower_panel"].ToString()) * pr_lower_panel) + (decimal.Parse(fuld_dr["constant_holes"].ToString()) * pr_holes)) * decimal.Parse(dr["quantity"].ToString());
                        DataTable dt_debug = new DataTable();
                        
                    }
                    final_pr += pr;
                }
                con.Close();
                con.Open();
                    SqlCommand cmd_accessories_grid = new SqlCommand("SELECT dbo.entry_tbl_order.project_no ,dbo.entry_tbl_order.accessories, dbo.fxd_tbl_accessories.accessory_price FROM dbo.entry_tbl_order INNER JOIN dbo.fxd_tbl_accessories ON dbo.entry_tbl_order.accessories = dbo.fxd_tbl_accessories.fullacc WHERE project_no = @id  and accessories != @NA and accessories != @none", con);
                    cmd_accessories_grid.Parameters.AddWithValue("@none", "لا يوجد  X  ");
                    cmd_accessories_grid.Parameters.AddWithValue("@NA", "N/A");
                    cmd_accessories_grid.Parameters.AddWithValue("id", Session["price_offer_ID"].ToString());
                    SqlDataReader dr_acc = cmd_accessories_grid.ExecuteReader();
                    accessories_grid.DataSource = dr_acc;
                    accessories_grid.DataBind();
                    dr_acc.Close();
                    con.Close();
                    con.Open();
                    SqlCommand cmd_devices_grid = new SqlCommand("SELECT dbo.entry_tbl_order.project_no ,dbo.entry_tbl_order.devices, dbo.fxd_tbl_devices.price FROM dbo.entry_tbl_order INNER JOIN dbo.fxd_tbl_devices ON dbo.entry_tbl_order.devices = dbo.fxd_tbl_devices.fulldev WHERE project_no = @id and devices != @NA", con);
                    cmd_devices_grid.Parameters.AddWithValue("@NA", "N/A");
                    cmd_devices_grid.Parameters.AddWithValue("id", Session["price_offer_ID"].ToString());
                    SqlDataReader dr_dev = cmd_devices_grid.ExecuteReader();
                    devices_grid.DataSource = dr_dev;
                    devices_grid.DataBind();
                    dr_dev.Close();
                    con.Close();
                    lbl_project_ID.Text = Session["price_offer_ID"].ToString();
                    lbl_customer_id.Text = Session["cust_id"].ToString();
                    con.Open();
                    SqlCommand cmd_customer = new SqlCommand("SELECT * FROM dbo.entry_tbl_customers WHERE customer_ID = @ID", con);
                    cmd_customer.Parameters.AddWithValue("@ID", lbl_customer_id.Text);
                    SqlDataReader dr_customer = cmd_customer.ExecuteReader();
                    if (dr_customer.Read())
                    {
                        lbl_prefix.Text = dr_customer["prefix"].ToString();
                        lbl_name.Text = dr_customer["customer_name"].ToString();
                        lbl_phone_no.Text = dr_customer["customer_phone_1"].ToString();
                        lbl_address.Text = dr_customer["city"].ToString() + "-" + dr_customer["area"].ToString() + "-" + dr_customer["address_line"].ToString();
                        dr_customer.Close();
                    }
                    con.Close();
                    con.Open();
                    SqlCommand cmd_project = new SqlCommand("SELECT * FROM dbo.entry_tbl_project_data WHERE project_ID = @ID", con);
                    cmd_project.Parameters.AddWithValue("@ID", lbl_project_ID.Text);
                    SqlDataReader dr_project = cmd_project.ExecuteReader();
                    if (dr_project.Read())
                    {
                        lbl_kitchen_design.Text = dr_project["kitchen_design"].ToString();
                        lbl_kitchen_type.Text = dr_project["kitchen_type"].ToString();
                        lbl_kitchen_height.Text = dr_project["kitchen_height"].ToString();
                        lbl_inner_body_wood.Text = dr_project["inner_body_wood"].ToString();
                        lbl_upper_cabinet_wood.Text = dr_project["classic_upper_cabinets_wood_type"].ToString();
                        lbl_upper_cabinet_color.Text = dr_project["classic_upper_cabinets_color"].ToString();
                        lbl_lower_cabinet_wood.Text = dr_project["lower_cabinets_wood_type"].ToString(); ;
                        lbl_lower_cabinet_color.Text = dr_project["lower_cabinets_color"].ToString(); ;
                        lbl_u_upper_cabinet_wood.Text = dr_project["double_kitchen_high_upper_cabinets_wood_type"].ToString();
                        lbl_u_upper_cabinet_color.Text = dr_project["double_kitchen_high_upper_cabinets_color"].ToString();
                        lbl_l_upper_cabinet_wood.Text = dr_project["double_kitchen_low_upper_cabinets_wood_type"].ToString();
                        lbl_l_upper_cabinet_color.Text = dr_project["double_kitchen_low_upper_cabinets_color"].ToString();
                        lbl_pantry_cabinet_wood.Text = dr_project["pantry_cabinets_wood_type"].ToString();
                        lbl_pantry_cabinet_color.Text = dr_project["pantry_cabinets_color"].ToString();
                        lbl_granite.Text = dr_project["granite_type"].ToString();
                        lbl_granite_name.Text = dr_project["granite_name"].ToString();
                        lbl_hands.Text = dr_project["hands_type"].ToString();
                        lbl_rails_hinges.Text = dr_project["hinges_trademark"].ToString();
                        lbl_duct_status.Text = dr_project["duct_opening"].ToString();
                        lbl_lighting.Text = dr_project["lighting_type"].ToString();
                        lbl_faucet.Text = dr_project["faucet"].ToString();
                        lbl_sink.Text = dr_project["sink"].ToString();
                        dr_project.Close();
                    }
                    con.Close();
                    con.Open();
                    SqlCommand com_lighting_price = new SqlCommand("SELECT * FROM dbo.fxd_tbl_general_prices WHERE item_name=@light", con);
                    com_lighting_price.Parameters.AddWithValue("@light", lbl_lighting.Text);
                    SqlDataReader dr_lighting_price = com_lighting_price.ExecuteReader();
                    if (dr_lighting_price.Read())
                    {
                        lbl_lighting_price.Text = dr_lighting_price["price"].ToString();
                        dr_lighting_price.Close();
                    }
                    else
                    {
                        lbl_lighting_price.Text = "0";
                    }
                    con.Close();
                    con.Open();
                    SqlCommand com_duct_price = new SqlCommand("SELECT * FROM dbo.fxd_tbl_general_prices WHERE item_name=@duct", con);
                    com_duct_price.Parameters.AddWithValue("@duct", lbl_duct_status.Text);
                    SqlDataReader dr_duct_price = com_duct_price.ExecuteReader();
                    if (dr_duct_price.Read())
                    {
                        lbl_duct_price.Text = dr_duct_price["price"].ToString();
                        dr_duct_price.Close();
                    }
                    else
                    {
                        lbl_duct_price.Text = "0";
                    }
                    con.Close();
                    con.Open();
                    SqlCommand com_rails_price = new SqlCommand("SELECT * FROM dbo.fxd_tbl_general_prices WHERE item_name=@rails", con);
                    com_rails_price.Parameters.AddWithValue("@rails", lbl_rails_hinges.Text);
                    SqlDataReader dr_rails_price = com_rails_price.ExecuteReader();
                    if (dr_rails_price.Read())
                    {
                        lbl_rails_hinges_price.Text = dr_rails_price["price"].ToString();
                        dr_rails_price.Close();
                    }
                    else
                    {
                        lbl_rails_hinges_price.Text = "0";
                    }
                    con.Close();
                    con.Open();
                    SqlCommand com_hands_price = new SqlCommand("SELECT * FROM dbo.fxd_tbl_general_prices WHERE item_name=@hands", con);
                    com_hands_price.Parameters.AddWithValue("@hands", lbl_hands.Text);
                    SqlDataReader dr_hands_price = com_hands_price.ExecuteReader();
                    if (dr_hands_price.Read())
                    {
                        lbl_hands_price.Text = dr_hands_price["price"].ToString();
                        dr_hands_price.Close();
                    }
                    else
                    {
                        lbl_hands_price.Text = "0";
                    }
                    con.Close();
                    con.Open();
                    SqlCommand com_faucet_price = new SqlCommand("SELECT * FROM dbo.fxd_tbl_faucets WHERE faucet_name=@faucet", con);
                    com_faucet_price.Parameters.AddWithValue("@faucet", lbl_faucet.Text);
                    SqlDataReader dr_faucet_price = com_faucet_price.ExecuteReader();
                    if (dr_faucet_price.Read())
                    {
                        lbl_faucet_price.Text = dr_faucet_price["faucet_price"].ToString();
                        dr_faucet_price.Close();
                    }
                    else
                    {
                        lbl_faucet_price.Text = "0";
                    }
                    con.Close();
                    con.Open();
                    SqlCommand com_sink_price = new SqlCommand("SELECT * FROM dbo.fxd_tbl_sinks_list WHERE sink_name=@sink", con);
                    com_sink_price.Parameters.AddWithValue("@sink", lbl_sink.Text);
                    SqlDataReader dr_sink_price = com_sink_price.ExecuteReader();
                    if (dr_sink_price.Read())
                    {
                        lbl_sink_price.Text = dr_sink_price["sink_price"].ToString();
                        dr_sink_price.Close();
                    }
                    else
                    {
                        lbl_sink_price.Text = "0";
                    }
                    con.Close();
                    con.Open();
                    double woodword_price = Math.Round(Convert.ToDouble(final_pr));
                    lbl_woodwork_price.Text = woodword_price.ToString();
                    con.Close();
                    lbl_basic_adds_price.Text = (decimal.Parse(lbl_lighting_price.Text) + decimal.Parse(lbl_duct_price.Text) + decimal.Parse(lbl_hands_price.Text) + decimal.Parse(lbl_rails_hinges_price.Text) + decimal.Parse(lbl_faucet_price.Text) + decimal.Parse(lbl_sink_price.Text)).ToString();
                    con.Open();
                    SqlCommand cmd_acc_price = new SqlCommand("SELECT accessories FROM dbo.entry_tbl_order WHERE project_no = @ID", con);
                    cmd_acc_price.Parameters.AddWithValue("@ID", lbl_project_ID.Text);
                    SqlDataAdapter da_acc_price = new SqlDataAdapter(cmd_acc_price);
                    DataTable dt_acc_price = new DataTable();
                    da_acc_price.Fill(dt_acc_price);
                    con.Close();
                    decimal accessories_price = 0;
                    foreach (DataRow dr_a in dt_acc_price.Rows)
                    {
                        con.Open();
                        SqlCommand cmd_accs_price = new SqlCommand("SELECT accessory_price FROM dbo.fxd_tbl_accessories WHERE fullacc=@acc", con);
                        cmd_accs_price.Parameters.AddWithValue("@acc", dr_a["accessories"].ToString());
                        SqlDataReader dr_accs_price = cmd_accs_price.ExecuteReader();
                        if (dr_accs_price.Read())
                        {
                            accessories_price += decimal.Parse(dr_accs_price["accessory_price"].ToString());
                        }
                        else
                        {
                            accessories_price = 0;
                        }
                        con.Close();
                    }
                    lbl_accessories_price.Text = accessories_price.ToString();
                    con.Close();
                    con.Open();
                    SqlCommand cmd_dev_price = new SqlCommand("SELECT devices FROM dbo.entry_tbl_order WHERE project_no = @ID", con);
                    cmd_dev_price.Parameters.AddWithValue("@ID", lbl_project_ID.Text);
                    SqlDataAdapter da_dev_price = new SqlDataAdapter(cmd_dev_price);
                    DataTable dt_dev_price = new DataTable();
                    da_dev_price.Fill(dt_dev_price);
                    con.Close();
                    decimal devices_price = 0;
                    foreach (DataRow dr_d in dt_dev_price.Rows)
                    {
                        con.Open();
                        SqlCommand cmd_devs_price = new SqlCommand("SELECT price FROM dbo.fxd_tbl_devices WHERE fulldev=@dev", con);
                        cmd_devs_price.Parameters.AddWithValue("@dev", dr_d["devices"].ToString());
                        SqlDataReader dr_devs_price = cmd_devs_price.ExecuteReader();
                        if (dr_devs_price.Read())
                        {
                            devices_price += decimal.Parse(dr_devs_price["price"].ToString());
                        }
                        else
                        {
                            devices_price = 0;
                        }
                        con.Close();
                    }

                    lbl_devices_price.Text = devices_price.ToString();
                    decimal final_price = decimal.Parse(lbl_woodwork_price.Text) + decimal.Parse(lbl_basic_adds_price.Text) + decimal.Parse(lbl_accessories_price.Text) + decimal.Parse(lbl_devices_price.Text);
                    lbl_final_price.Text = Math.Round(Convert.ToDouble(final_price)).ToString();
                    txtbx_post_discount_price.Enabled = true;
                    txtbx_post_discount_price.Text = Math.Round((decimal.Parse(lbl_final_price.Text) * (1 - (decimal.Parse(dlst_discount.SelectedItem.Text) / 100)))).ToString();
                    decimal first_install = decimal.Parse((50.00 / 100.00).ToString());
                    decimal second_install = decimal.Parse((30.00 / 100.00).ToString());
                    decimal third_install = decimal.Parse((20.00 / 100.00).ToString());
                    txtbx_first_install_amount.Enabled = true;
                    txtbx_second_install_amount.Enabled = true;
                    txtbx_third_install_amount.Enabled = true;
                    txtbx_first_install_amount.Text = Math.Round((decimal.Parse(txtbx_post_discount_price.Text) * first_install)).ToString();
                    txtbx_second_install_amount.Text = Math.Round((decimal.Parse(txtbx_post_discount_price.Text) * second_install)).ToString();
                    txtbx_third_install_amount.Text = Math.Round((decimal.Parse(txtbx_post_discount_price.Text) * third_install)).ToString();
                    txtbx_first_install_amount.Enabled = false;
                    txtbx_second_install_amount.Enabled = false;
                    txtbx_third_install_amount.Enabled = false;
                    txtbx_post_discount_price.Enabled = false;
                    con.Open();
                    SqlCommand cmd_price_entry = new SqlCommand("UPDATE dbo.entry_tbl_project_data SET price = @price WHERE project_ID=@pid", con);
                    cmd_price_entry.Parameters.AddWithValue("@price", txtbx_post_discount_price.Text);
                    cmd_price_entry.Parameters.AddWithValue("@pid", lbl_project_ID.Text);
                    cmd_price_entry.ExecuteNonQuery();
                
            }
            else
            {
                Response.Redirect("buffer_page.aspx");
            }
            }  

    protected void dlst_discount_SelectedIndexChanged(object sender, EventArgs e)
    {
            txtbx_post_discount_price.Enabled = true;
            txtbx_post_discount_price.Text = Math.Round((decimal.Parse(lbl_final_price.Text) * (1-(decimal.Parse(dlst_discount.SelectedItem.Text) / 100)))).ToString();
            decimal first_install = decimal.Parse((50.00 / 100.00).ToString());
            decimal second_install = decimal.Parse((30.00 / 100.00).ToString());
            decimal third_install = decimal.Parse((20.00 / 100.00).ToString());
                txtbx_first_install_amount.Enabled = true;
                txtbx_second_install_amount.Enabled = true;
                txtbx_third_install_amount.Enabled = true;
                txtbx_first_install_amount.Text = Math.Round((decimal.Parse(txtbx_post_discount_price.Text) * first_install)).ToString();
                txtbx_second_install_amount.Text = Math.Round((decimal.Parse(txtbx_post_discount_price.Text) * second_install)).ToString();
                txtbx_third_install_amount.Text = Math.Round((decimal.Parse(txtbx_post_discount_price.Text) * third_install)).ToString();
                txtbx_first_install_amount.Enabled = false;
                txtbx_second_install_amount.Enabled = false;
                txtbx_third_install_amount.Enabled = false;
                txtbx_post_discount_price.Enabled = false;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
            con.Open();
            SqlCommand cmd_price_entry = new SqlCommand("UPDATE dbo.entry_tbl_project_data SET price = @price WHERE project_ID=@pid",con);
            cmd_price_entry.Parameters.AddWithValue("@price",txtbx_post_discount_price.Text);
            cmd_price_entry.Parameters.AddWithValue("@pid", lbl_project_ID.Text);
            cmd_price_entry.ExecuteNonQuery();
        }
    }
}
