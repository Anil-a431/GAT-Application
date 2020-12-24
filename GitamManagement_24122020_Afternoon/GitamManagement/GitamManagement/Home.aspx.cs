using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GitamManagement
{
    public partial class Home : System.Web.UI.Page
    {
        public string Username { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["ActiveMember"]!= null)
            {
                DataTable dt = (DataTable)Session["ActiveMember"];
                Username = dt.Rows[0]["Name"].ToString();

                UsernameLabel.Text = Username;
            }
            else
            {
                Response.Redirect("Index.aspx");
            }
        }
    }
}