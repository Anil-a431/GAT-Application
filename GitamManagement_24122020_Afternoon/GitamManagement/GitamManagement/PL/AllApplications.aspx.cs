using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GitamManagement.PL
{
    public partial class AllApplications : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GitamManagementService obj = new GitamManagementService();
            if (!Page.IsPostBack)
            {
                hdnUserID1.Value = Session["UserId"].ToString();
                
               // grdCouseDetails.DataSource = obj.GetUserCourses(hdnUserID1.Value,"1");
               // grdCouseDetails.DataBind();



            }
        }
    }
}