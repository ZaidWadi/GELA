using Microsoft.Ajax.Utilities;
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
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["project_identifier"] == null) 
            {
                Response.Redirect("buffer_page.aspx");
            }
        }

        protected void btn_send_Click(object sender, EventArgs e)
        {
            var reason ="سبب الرفض:" + refusal_reason.Text;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["gela_database_connection"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("UPDATE dbo.entry_tbl_project_date SET notes=@reason WHERE project_ID=@ID",con);
            cmd.Parameters.AddWithValue("@reason",reason);
            cmd.Parameters.AddWithValue("ID", Session["project_identifier"].ToString());
            con.Close();
            Response.Write("<script>window.close();</" + "script>");
            Response.End();
        }
    }
}