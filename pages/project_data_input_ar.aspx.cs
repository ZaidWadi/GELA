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
    public partial class WebForm50 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ID"] != null)
            {
                var customer_ID = Session["ID"].ToString();
                var customer_name = Session["Name"].ToString();
                lbl_customer_no.Text = customer_ID;
                lbl_customer_name.Text = customer_name;
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
                if (!IsPostBack)
                {
                    if (lbl_customer_no.Text != null)
                    {

                        con.Open();
                        SqlCommand cmd_read_second = new SqlCommand("SELECT * FROM dbo.entry_tbl_project_data where project_data_ID=(SELECT MAX(project_data_ID) from dbo.entry_tbl_project_data)", con);
                        cmd_read_second.Parameters.AddWithValue("@ID", lbl_customer_no.Text);
                        SqlDataReader customer_id = cmd_read_second.ExecuteReader();
                        customer_id.Read();
                        lbl_OrderID.Text = (Convert.ToInt32(lbl_customer_no.Text + customer_id[0].ToString()) + 1).ToString();
                        con.Close();
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
                        dlst_DesignerName.DataSource = e_n;
                        dlst_DesignerName.DataBind();
                        dlst_DesignerName.DataTextField = "eng_name_ar";
                        dlst_DesignerName.DataValueField = "engineers_ID";
                        dlst_DesignerName.DataBind();
                        dlst_QAEng.DataSource = e_n;
                        dlst_QAEng.DataBind();
                        dlst_QAEng.DataTextField = "eng_name_ar";
                        dlst_QAEng.DataValueField = "engineers_ID";
                        dlst_QAEng.DataBind();
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
                        con.Open();
                        if (Session["auth"].ToString() == "Design")
                        {
                            SqlCommand cmd_des = new SqlCommand("SELECT * FROM dbo.fxd_tbl_engineers WHERE eng_name_en=@eng_name_en", con);
                            cmd_des.Parameters.AddWithValue("@eng_name_en", Session["username"].ToString());
                            SqlDataReader dr_des = cmd_des.ExecuteReader();
                            if (dr_des.Read())
                            {
                                dlst_DesignerName.SelectedItem.Text = dr_des[2].ToString();
                                dlst_DesignerName.Enabled = false;
                            }
                        }
                        con.Close();
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
                    }
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
            SqlCommand cmd_post_init = new SqlCommand("INSERT INTO dbo.entry_tbl_project_data (customer_no, customer, project_ID) VALUES(@customer_no, @customer_name, @project_ID)", con);
            cmd_post_init.Parameters.AddWithValue("@customer_no", lbl_customer_no.Text);
            cmd_post_init.Parameters.AddWithValue("@customer_name", lbl_customer_name.Text);
            cmd_post_init.Parameters.AddWithValue("@project_ID", lbl_OrderID.Text);
            cmd_post_init.ExecuteNonQuery();
            con.Close();
            con.Open();
            string project_data_cmd = "UPDATE dbo.entry_tbl_project_data SET project=@project,project_status=@project_status,measuring_eng_name=@measuring_eng_name,measuring_eng_phone_no=@measuring_eng_phone_no,measurements_scan=@measurements_scan,initiation_date=@initiation_date,designer_name=@designer_name,designer_phone_no=@designer_phone_no,QA_eng_name=QA_eng_name,production_order=@production_order,production_manager=@production_manager,notes=@notes WHERE project_ID=@project_id";
            SqlCommand cmd = new SqlCommand(project_data_cmd, con);
            cmd.Parameters.AddWithValue("@project_id", lbl_OrderID.Text);
            cmd.Parameters.AddWithValue("@project", dlst_project.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@project_status", "بانتظار المقاس");
            cmd.Parameters.AddWithValue("@measuring_eng_name", dlst_MeasuringEngName.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@measuring_eng_phone_no", txtbx_MeasuringEngPhone.Text);
            cmd.Parameters.AddWithValue("@measurements_scan", dlst_MeasuringEngName.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@initiation_date", DateTime.Today);
            cmd.Parameters.AddWithValue("@designer_name", dlst_DesignerName.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@designer_phone_no", txtbx_DesignerPhone.Text);
            cmd.Parameters.AddWithValue("@QA_eng_name", dlst_QAEng.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@production_order", dlst_ProdManger.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@production_manager", dlst_ProdManger.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@notes", txtbx_Notes.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("customer_info_view_ar.aspx");
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
    }
}