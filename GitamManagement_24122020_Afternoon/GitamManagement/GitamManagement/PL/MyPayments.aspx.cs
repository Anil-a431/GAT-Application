using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GitamManagement.PL
{
    public partial class MyPayments1 : System.Web.UI.Page
    {
        GitamManagementService objgitamService = new GitamManagementService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                success.Visible = false;
                failure.Visible = false;
                var UserId = Request.QueryString["APPNO"].ToString();
                var TransId = Request.QueryString["TXNID"].ToString();
                var status = Request.QueryString["STATUS"].ToString();
                var TransDate = Request.QueryString["TXNDATE"].ToString();
                var TransAmount = Request.QueryString["TXNAMT"].ToString();
                if (status == "0300")
                {
                    objgitamService.insertTransactionDetails(UserId, TransId, status, TransAmount);
                    success.Visible = true;
                    failure.Visible = false;

                }
                else
                {
                    objgitamService.insertTransactionDetails(UserId, TransId, status, TransAmount);
                    failure.Visible = true;
                    success.Visible = false;
                }
            }
        
           

        }
        protected void nxtPage_Click(object sender, EventArgs e)
        {
            Response.Redirect("/PersonalDetailsPage");
        }

        protected void btnRepay_Click(object sender, EventArgs e)
        {
            Response.Redirect("/AllApplications");
        }
    }
}