using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RubTechDashBaord
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            try
            {
                if (txtUsername.Text == null || txtUsername.Text == "")
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "Swal.fire('Please enter Username!')", true);
                }
                else if (txtPassword.Text == null || txtPassword.Text == "")
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "Swal.fire('Please enter password!')", true);
                }
                else if (txtUsername.Text == "rubtech" && txtPassword.Text == "rubtech@#2025")
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Swal.fire({ title: 'Successful!', text: 'Logged in!', icon: 'success' }).then(()=>location.href='DashBoard.aspx')", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Swal.fire({ title: 'Sorry!', text: 'Invalid login attempt!', icon: 'error' });", true);
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }
    }
}
