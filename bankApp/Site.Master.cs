using System;
using System.Web.UI;

namespace bankApp
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Session["userid"] as string))
            {
                Session.Abandon();
                Response.Redirect("Default");
            }
        }


        protected void Logout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.RemoveAll();
            Session.Abandon();
        }

    }
}