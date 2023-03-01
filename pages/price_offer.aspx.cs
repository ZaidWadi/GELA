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
                if (dr_customer.Read()) { 
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
                if (dr_duct_price.Read()) { 
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
                if (dr_rails_price.Read()) { 
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
                if (dr_hands_price.Read()) { 
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
                SqlCommand cmd_woodword_price = new SqlCommand("SELECT * FROM dbo.entry_tbl_order WHERE project_no = @ID", con);
                cmd_woodword_price.Parameters.AddWithValue("@ID", lbl_project_ID.Text);
                SqlDataAdapter da_woodowrk_price = new SqlDataAdapter(cmd_woodword_price);
                DataTable dt_woodwork_price = new DataTable();
                da_woodowrk_price.Fill(dt_woodwork_price);
                double woodword_price = 0;
                if (dt_woodwork_price.Rows.Count > 0) {
                    woodword_price = Math.Round(Convert.ToDouble(dt_woodwork_price.Compute("sum(price)", string.Empty)));
                }
                lbl_woodwork_price.Text = woodword_price.ToString();
                con.Close();
                lbl_basic_adds_price.Text = (float.Parse(lbl_lighting_price.Text) + float.Parse(lbl_duct_price.Text) + float.Parse(lbl_hands_price.Text) + float.Parse(lbl_rails_hinges_price.Text) + float.Parse(lbl_faucet_price.Text) + float.Parse(lbl_sink_price.Text)).ToString();
                con.Open();
                SqlCommand cmd_acc_price = new SqlCommand("SELECT accessories FROM dbo.entry_tbl_order WHERE project_no = @ID", con);
                cmd_acc_price.Parameters.AddWithValue("@ID", lbl_project_ID.Text);
                SqlDataAdapter da_acc_price = new SqlDataAdapter(cmd_acc_price);
                DataTable dt_acc_price = new DataTable();
                da_acc_price.Fill(dt_acc_price);
                con.Close();
                float accessories_price = 0;
                foreach (DataRow dr_a in dt_acc_price.Rows)
                {
                    con.Open();
                    SqlCommand cmd_accs_price = new SqlCommand("SELECT accessory_price FROM dbo.fxd_tbl_accessories WHERE fullacc=@acc", con);
                    cmd_accs_price.Parameters.AddWithValue("@acc", dr_a["accessories"].ToString());
                    SqlDataReader dr_accs_price = cmd_accs_price.ExecuteReader();
                    if (dr_accs_price.Read())
                    {
                        accessories_price += float.Parse(dr_accs_price["accessory_price"].ToString());
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
                float devices_price = 0;
                foreach (DataRow dr_d in dt_dev_price.Rows)
                {
                    con.Open();
                    SqlCommand cmd_devs_price = new SqlCommand("SELECT price FROM dbo.fxd_tbl_devices WHERE fulldev=@dev", con);
                    cmd_devs_price.Parameters.AddWithValue("@dev", dr_d["devices"].ToString());
                    SqlDataReader dr_devs_price = cmd_devs_price.ExecuteReader();
                    if (dr_devs_price.Read())
                    {
                        devices_price += float.Parse(dr_devs_price["price"].ToString());
                    }
                    else
                    {
                        devices_price = 0;
                    }
                    con.Close();
                }
                
                lbl_devices_price.Text = devices_price.ToString();
                float final_price = float.Parse(lbl_woodwork_price.Text) + float.Parse(lbl_basic_adds_price.Text) + float.Parse(lbl_accessories_price.Text) + float.Parse(lbl_devices_price.Text);
                lbl_final_price.Text = Math.Round(Convert.ToDouble(final_price)).ToString();
                txtbx_post_discount_price.Enabled = true;
                txtbx_post_discount_price.Text = Math.Round((float.Parse(lbl_final_price.Text) * (1 - (float.Parse(dlst_discount.SelectedItem.Text) / 100)))).ToString();
                float first_install = float.Parse((50.00 / 100.00).ToString());
                float second_install = float.Parse((30.00 / 100.00).ToString());
                float third_install = float.Parse((20.00 / 100.00).ToString());
                txtbx_first_install_amount.Enabled = true;
                txtbx_second_install_amount.Enabled = true;
                txtbx_third_install_amount.Enabled = true;
                txtbx_first_install_amount.Text = Math.Round((float.Parse(txtbx_post_discount_price.Text) * first_install)).ToString();
                txtbx_second_install_amount.Text = Math.Round((float.Parse(txtbx_post_discount_price.Text) * second_install)).ToString();
                txtbx_third_install_amount.Text = Math.Round((float.Parse(txtbx_post_discount_price.Text) * third_install)).ToString();
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
            txtbx_post_discount_price.Text = Math.Round((float.Parse(lbl_final_price.Text) * (1-(float.Parse(dlst_discount.SelectedItem.Text) / 100)))).ToString();
            float first_install = float.Parse((50.00 / 100.00).ToString());
            float second_install = float.Parse((30.00 / 100.00).ToString());
            float third_install = float.Parse((20.00 / 100.00).ToString());
                txtbx_first_install_amount.Enabled = true;
                txtbx_second_install_amount.Enabled = true;
                txtbx_third_install_amount.Enabled = true;
                txtbx_first_install_amount.Text = Math.Round((float.Parse(txtbx_post_discount_price.Text) * first_install)).ToString();
                txtbx_second_install_amount.Text = Math.Round((float.Parse(txtbx_post_discount_price.Text) * second_install)).ToString();
                txtbx_third_install_amount.Text = Math.Round((float.Parse(txtbx_post_discount_price.Text) * third_install)).ToString();
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
