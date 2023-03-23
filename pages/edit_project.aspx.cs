using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Ajax.Utilities;

namespace GELA_DB.pages
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["project_ID"] != null)
            {

                var project_ID = Session["project_ID"].ToString();
                lbl_customer_no.Text = project_ID;
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
                con.Open();
                SqlCommand cmd_proj_data = new SqlCommand("SELECT * FROM dbo.entry_tbl_project_data WHERE project_ID=@ID", con);
                cmd_proj_data.Parameters.AddWithValue("@ID", project_ID);
                SqlDataAdapter da_proj = new SqlDataAdapter(cmd_proj_data);
                DataTable dt_proj = new DataTable();
                da_proj.Fill(dt_proj);
                con.Close();
                txtbx_project.Text = dt_proj.Rows[0]["project"].ToString();
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
                

            }
            else
            {
                Response.Redirect("buffer_page.aspx");
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

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("UPDATE dbo.entry_tbl_project_data SET (project=@proj ,measuring_eng_name=@meas_eng ,measuring_eng_phone_no=@meas_eng_ph ,designer_name=@designer ,designer_phone_no=@des_ph ,QA_eng_name=qa ,production_manager=prod_man) WHERE project_ID=@ID", con);
            cmd.Parameters.AddWithValue("@ID", lbl_customer_no.Text);
            cmd.Parameters.AddWithValue("@proj", txtbx_project.Text);
            cmd.Parameters.AddWithValue("@meas_eng", dlst_MeasuringEngName.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@meas_eng_ph", txtbx_MeasuringEngPhone.Text);
            cmd.Parameters.AddWithValue("@designer", dlst_DesignerName.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@des_ph", txtbx_DesignerPhone.Text);
            cmd.Parameters.AddWithValue("@qa", dlst_QAEng.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@prod_man", dlst_ProdManger.SelectedItem.Text);
            cmd.ExecuteNonQuery();
            Response.Write("<script>window.close();</" + "script>");
            Response.End();
        }
    }
}
    
