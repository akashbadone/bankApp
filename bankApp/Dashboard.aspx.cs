using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Drawing;

namespace bankApp
{
    public partial class Dashboard : Page
    {
        string ConString = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
        DataSet ds;
        DataTable dt = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            Title = "PACS Details";
            divSave.Visible = false;
            lblSuccess.Visible = false;
        }

        protected void ddlBank_Init(object sender, EventArgs e)
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
                ddlBank.DataTextField = "bank";
                ddlBank.DataValueField = "id";
                ddlBank.DataSource = ds;
                ddlBank.DataBind();
                ddlBank.Items.Insert(0, new ListItem("Select", "0"));
            }

            ds.Clear();
            con.Close();
        }

        protected void ddlBank_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConString);
            SqlCommand cmd = new SqlCommand("sp_DDL", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@flag", SqlDbType.Int).Value = 1;
            cmd.Parameters.Add("@bank_id", SqlDbType.Int).Value = ddlBank.SelectedValue.ToString();

            con.Open();

            using (SqlDataAdapter adp = new SqlDataAdapter(cmd))
            {
                ds = new DataSet();
                adp.Fill(ds);
            }

            if (ds.Tables[0].Rows.Count > 0)
            {
                ddlBranch.DataTextField = "branch";
                ddlBranch.DataValueField = "id";
                ddlBranch.DataSource = ds;
                ddlBranch.DataBind();
                ddlBranch.Items.Insert(0, new ListItem("Select", "0"));
            }
            ds.Clear();
            con.Close();
        }

        protected void ddlBranch_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConString);
            SqlCommand cmd = new SqlCommand("sp_DDL", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@flag", SqlDbType.Int).Value = 2;
            cmd.Parameters.Add("@branch_id", SqlDbType.Int).Value = ddlBranch.SelectedValue.ToString();

            con.Open();
            using (SqlDataAdapter adp = new SqlDataAdapter(cmd))
            {
                ds = new DataSet();
                adp.Fill(ds);
            }

            if (ds.Tables[0].Rows.Count > 0)
            {
                ddlPACS.DataTextField = "pacsname";
                ddlPACS.DataValueField = "id";
                ddlPACS.DataSource = ds;
                ddlPACS.DataBind();
                ddlPACS.Items.Insert(0, new ListItem("Select", "0"));
            }
            ds.Clear();
            con.Close();
        }

        protected void ddlPACS_SelectedIndexChanged(object sender, EventArgs e)
        {
            divSave.Visible = true;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            //if (Convert.ToInt32(ddlPACS.SelectedValue.ToString()) > 0)
            //{
            //    if (!string.IsNullOrEmpty(txtPACSID.Text.ToString()))
            //    {
            //        if (Convert.ToInt32(txtNoMember.Text.ToString()) > 0)
            //        {
            //            if (Convert.ToInt64(txtAnnualDeposit.Text.ToString()) > 0)
            //            {
            SqlConnection con = new SqlConnection(ConString);
            SqlCommand cmd = new SqlCommand("sp_PACSDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@flag", SqlDbType.Int).Value = 0;
            cmd.Parameters.Add("@pacsname_id", SqlDbType.Int).Value = Convert.ToInt32(ddlPACS.SelectedValue.ToString());
            cmd.Parameters.Add("@pacs_id", SqlDbType.NChar).Value = txtPACSID.Text.ToString();
            cmd.Parameters.Add("@members", SqlDbType.Int).Value = Convert.ToInt32(txtNoMember.Text.ToString());
            cmd.Parameters.Add("@deposits", SqlDbType.BigInt).Value = Convert.ToInt64(txtAnnualDeposit.Text.ToString());

            con.Open();
            using (SqlDataAdapter adp = new SqlDataAdapter(cmd))
            {
                ds = new DataSet();
                adp.Fill(ds);
            }

            if (ds.Tables[0].Rows.Count > 0)
            {
                divSave.Visible = false;
                lblSuccess.Visible = true;
                lblSuccess.Text = "Details saved Successfully.";
            }
            ds.Clear();
            con.Close();
            //                }
            //                else
            //                {
            //                    lblSuccess.Visible = true;
            //                    lblSuccess.Style.Remove("background-color");
            //                    lblSuccess.Style.Add("background-color", "red");
            //                    lblSuccess.Text = "Please Enter Annual Deposits";
            //                }
            //            }
            //            else
            //            {
            //                lblSuccess.Visible = true;
            //                lblSuccess.Style.Remove("background-color");
            //                lblSuccess.Style.Add("background-color", "red");
            //                lblSuccess.Text = "Please Enter No of Members";
            //            }
            //        }
            //        else
            //        {
            //            lblSuccess.Visible = true;
            //            lblSuccess.Style.Remove("background-color");
            //            lblSuccess.Style.Add("background-color", "red");
            //            lblSuccess.Text = "Please Enter PACS ID";
            //        }
            //    }
            //    else
            //    {
            //        lblSuccess.Visible = true;
            //        lblSuccess.Style.Remove("background-color");
            //        lblSuccess.Style.Add("background-color", "red");
            //        lblSuccess.Text = "Please Select PACS";
            //    }
            //}

            //protected void btnClear_Click(object sender, EventArgs e)
            //{
            //    txtAnnualDeposit.Text = "";
            //    txtNoMember.Text = "";
            //    txtPACSID.Text = "";
            //}
        }
    }
}