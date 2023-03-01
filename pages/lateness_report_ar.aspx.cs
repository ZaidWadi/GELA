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
    public partial class WebForm45 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["auth"] != null)
            {
                if (Session["auth"].ToString() == "Supervisor")
                {
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.entry_tbl_project_data", con);
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);
                    dt.Columns.Add("measurement_lateness", typeof(int));
                    dt.Columns.Add("design_lateness", typeof(int));
                    dt.Columns.Add("contact_lateness", typeof(int));
                    dt.Columns.Add("contract_lateness", typeof(int));
                    dt.Columns.Add("prod_lateness", typeof(int));
                    dt.Columns.Add("prod_fin_lateness", typeof(int));
                    dt.Columns.Add("install_lateness_prod", typeof(int));
                    dt.Columns.Add("install_lateness_contract", typeof(int));
                    foreach (DataRow dr in dt.Rows)
                    {
                        if (!dr["date_of_measurement"].ToString().IsNullOrWhiteSpace() && !dr["initiation_date"].ToString().IsNullOrWhiteSpace())
                        {
                            dr["measurement_lateness"] = Convert.ToDateTime(dr["date_of_measurement"]).Subtract(Convert.ToDateTime(dr["initiation_date"])).Days;
                        }
                        else
                        {
                            dr["measurement_lateness"] = 0;
                        }
                        if (!dr["design_lateness"].ToString().IsNullOrWhiteSpace() && !dr["date_of_measurement"].ToString().IsNullOrWhiteSpace())
                        {
                            dr["design_lateness"] = (Convert.ToDateTime(dr["design_finish_date"]).Subtract(Convert.ToDateTime(dr["date_of_measurement"])).Days);
                        }
                        else
                        {
                            dr["design_lateness"] = 0;
                        }
                        if (!dr["contact_lateness"].ToString().IsNullOrWhiteSpace() && !dr["design_finish_date"].ToString().IsNullOrWhiteSpace())
                        {
                            dr["contact_lateness"] = (Convert.ToDateTime(dr["customer_contact_date"]).Subtract(Convert.ToDateTime(dr["design_finish_date"])).Days);
                        }
                        else
                        {
                            dr["contact_lateness"] = 0;
                        }
                        if (!dr["contract_lateness"].ToString().IsNullOrWhiteSpace() && !dr["customer_contact_date"].ToString().IsNullOrWhiteSpace())
                        {
                            dr["contract_lateness"] = (Convert.ToDateTime(dr["contract_sign_date"]).Subtract(Convert.ToDateTime(dr["customer_contact_date"])).Days);
                        }
                        else
                        {
                            dr["contract_lateness"] = 0;
                        }
                        if (!dr["prod_lateness"].ToString().IsNullOrWhiteSpace() && !dr["contract_sign_date"].ToString().IsNullOrWhiteSpace())
                        {
                            dr["prod_lateness"] = (Convert.ToDateTime(dr["production_order_date"]).Subtract(Convert.ToDateTime(dr["contract_sign_date"])).Days);
                        }
                        else
                        {
                            dr["prod_lateness"] = 0;
                        }
                        if (!dr["prod_fin_lateness"].ToString().IsNullOrWhiteSpace() && !dr["production_order_date"].ToString().IsNullOrWhiteSpace())
                        {
                            dr["prod_fin_lateness"] = (Convert.ToDateTime(dr["production_finish_date"]).Subtract(Convert.ToDateTime(dr["production_order_date"])).Days);
                        }
                        else
                        {
                            dr["prod_fin_lateness"] = 0;
                        }
                        if (!dr["install_lateness_prod"].ToString().IsNullOrWhiteSpace() && !dr["production_finish_date"].ToString().IsNullOrWhiteSpace())
                        {
                            dr["install_lateness_prod"] = (Convert.ToDateTime(dr["real_delivery_date"]).Subtract(Convert.ToDateTime(dr["production_finish_date"])).Days);
                        }
                        else
                        {
                            dr["install_lateness_prod"] = 0;
                        }
                        if (!dr["install_lateness_contract"].ToString().IsNullOrWhiteSpace() && !dr["agreed_on_delivery_date"].ToString().IsNullOrWhiteSpace())
                        {
                            dr["install_lateness_contract"] = (Convert.ToDateTime(dr["real_delivery_date"]).Subtract(Convert.ToDateTime(dr["agreed_on_delivery_date"])).Days);
                        }
                        else
                        {
                            dr["install_lateness_contract"] = 0;
                        }
                        reports_grid.DataSource = dt;
                        reports_grid.DataBind();
                    }
                    con.Close();
                }
            }
            else
            {
                Response.Redirect("buffer_page.aspx");
            }

        }
    }
}