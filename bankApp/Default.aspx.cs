using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace bankApp
{
    public partial class Default : System.Web.UI.Page
    {
        string ConString = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
        DataTable dt = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Session["userid"] as string))
            {
                Response.Redirect("Dashboard");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtusername.Text.ToString();
            string password = txtPass.Text.ToString();

            SqlConnection con = new SqlConnection(ConString);

            SqlCommand cmd = new SqlCommand("sp_user", con);

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@username", SqlDbType.NChar).Value = username;
            cmd.Parameters.Add("@password", SqlDbType.NChar).Value = password;

            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader != null)
            {
                dt.Columns.Add("id", typeof(System.Int32));
                dt.Columns.Add("dbusername", typeof(System.String));
                dt.Columns.Add("dbpassword", typeof(System.String));
                while (reader.Read())
                {
                    DataRow dr = dt.NewRow();
                    dt.Rows.Add(dr);
                    dr["id"] = reader.GetInt32(0);
                    dr["dbusername"] = reader.GetString(1);
                    dr["dbpassword"] = reader.GetString(2);
                }
            }
            if (dt.Rows.Count == 1)
            {
                Session["userid"] = dt.Rows[0]["id"].ToString();
                Session["username"] = username;
                Response.Redirect("Dashboard.aspx");
            }
            else
            {
                lblmsg.Text = "Please check credentials";
                lblmsg.Visible = true;
            }
            dt.Columns.Remove("id");
            dt.Columns.Remove("dbusername");
            dt.Columns.Remove("dbpassword");
            dt.Clear();
            reader.Close();
            con.Close();
        }
    }
}