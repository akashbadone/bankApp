using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace bankApp
{
    public partial class Report : Page
    {
        string ConString = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
        DataSet ds;
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            Title = "PACS Report";
        }

        protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
        {
            divAll.Visible = true;
            GridView1.Visible = true;
            GridView2.Visible = false;
            divBankwise.Visible = false;
            FillGrid();
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            divAll.Visible = false;
            divBankwise.Visible = true;
            GridView1.Visible = false;
            GridView2.Visible = false;
        }

        protected void FillGrid()
        {
            try
            {
                SqlConnection con = new SqlConnection(ConString);
                SqlCommand cmd = new SqlCommand("sp_PACSDetails", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@flag", SqlDbType.Int).Value = 1;

                con.Open();

                using (SqlDataAdapter adp = new SqlDataAdapter(cmd))
                {
                    ds = new DataSet();
                    adp.Fill(ds);
                }

                if (ds.Tables[0].Rows.Count > 0)
                {
                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                }

                ds.Clear();
                con.Close();
                GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
            catch (Exception ex)
            {
                lblMsg.Visible = true;
                lblMsg.Text = "Sorry! " + ex.Message.ToString();
            }
        }

        protected void FillGrid1()
        {
            try
            {
                SqlConnection con = new SqlConnection(ConString);
                SqlCommand cmd = new SqlCommand("sp_PACSDetails", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@flag", SqlDbType.Int).Value = 2;
                cmd.Parameters.Add("@bank_id", SqlDbType.Int).Value = Convert.ToInt32(ddlBanks.SelectedValue.ToString());

                con.Open();

                using (SqlDataAdapter adp = new SqlDataAdapter(cmd))
                {
                    ds = new DataSet();
                    adp.Fill(ds);
                }

                if (ds.Tables[0].Rows.Count > 0)
                {
                    GridView2.DataSource = ds;
                    GridView2.DataBind();
                }

                ds.Clear();
                con.Close();
                GridView2.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
            catch (Exception ex)
            {
                lblMsg.Visible = true;
                lblMsg.Text = "Sorry! " + ex.Message.ToString();
            }
        }

        protected void ddlBanks_Init(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConString);
            SqlCommand cmd = new SqlCommand("sp_DDL", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@flag", SqlDbType.Int).Value = 0;

            con.Open();

            using (SqlDataAdapter adp = new SqlDataAdapter(cmd))
            {
                ds = new DataSet();
                adp.Fill(ds);
            }

            if (ds.Tables[0].Rows.Count > 0)
            {
                ddlBanks.DataTextField = "bank";
                ddlBanks.DataValueField = "id";
                ddlBanks.DataSource = ds;
                ddlBanks.DataBind();
                ddlBanks.Items.Insert(0, new ListItem("Select Bank", "0"));
            }

            ds.Clear();
            con.Close();
        }

        protected void ddlBanks_SelectedIndexChanged(object sender, EventArgs e)
        {
            divAll.Visible = false;
            GridView1.Visible = false;
            GridView2.Visible = true;
            FillGrid1();
        }
    }
}