using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GitamManagement.PL
{
    public partial class UserDashboard : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["UserId"] = Session["UserId"].ToString();
            DataTable dtSson = (DataTable)Session["ActiveMember"];
            SessionUserName.Text = dtSson.Rows[0]["Name"].ToString();


        }
    }
}