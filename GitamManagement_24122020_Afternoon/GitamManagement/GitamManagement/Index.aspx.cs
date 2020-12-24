using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GitamManagement
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    StatesFillingDDList();
            //}
            if(!string.IsNullOrEmpty(Request.QueryString["AuthTkn"]))
            {
                string LoginToken = Request.QueryString["AuthTkn"].ToString();
                DataTable dt = new GitDAl().AutoAuthentication(LoginToken);
                if (dt != null && dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["AuthCode"].ToString() == LoginToken && dt.Rows[0]["IsActive"].ToString() == "1")
                    {
                        Session["ActiveMember"] = dt;
                        Response.Redirect("Home.aspx");
                    }
                    else
                    {
                        //Invalid Page
                        Response.Redirect("InvalidPage.html");
                    }
                }
                else
                {
                    //Invalid Page
                    Response.Redirect("InvalidPage.html");
                }
            }
        }


        protected void validateUser(object sender,EventArgs e)
        {
            string EmailID = loginEmail.Text;
            string Password = loginPassword.Text;
            if(EmailID != "" && Password != "")
            {
                GitamManagementService obj = new GitamManagementService();
                DataTable dt = obj.ValidateLogin(EmailID, Password);
                if (dt != null)
                {
                    string pwdStatus = Session["CheckPasswordUpdate"].ToString();
                    string Qualification = Session["Qualification"].ToString();
                    string QGroup = Session["QGroup"].ToString();
                    string CampusLocation = Session["CampusLocation"].ToString();
                    if (pwdStatus == "1" && Qualification != "" && QGroup != "" && CampusLocation != "")
                    {
                        Response.Redirect("/AllApplications");
                    }
                    else if (pwdStatus == "1" && Qualification == "" && QGroup == "" && CampusLocation == "")
                    {
                        Response.Redirect("/EducationalDetails");
                    }
                    else if (pwdStatus == "")
                    {
                        Response.Redirect("/UpdatePassword");
                    }
                    else
                    {
                        Response.Redirect("/EducationalDetails");
                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please Check Your EmailID and Password')", true);
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please Enter EmailID and Password')", true);
            }
            
        }
    }
}