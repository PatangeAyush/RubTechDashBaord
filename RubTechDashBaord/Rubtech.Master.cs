using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RubTechDashBaord
{
    public partial class Rubtech : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserRegistered"] == null)
            {
                Response.Redirect("index.aspx");
            }
        }

        protected void btn_Logout(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon(); 
            Response.Redirect("index.aspx"); // 🔄 Register Page pe bhejna
        }
    }
}