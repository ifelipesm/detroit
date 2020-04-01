using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Detroit
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
 
        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            Response.Redirect("logout.aspx");
            // Invalida Sessão
            //Session.Abandon();
            //Response.Redirect("login.aspx");
        }
    }
}