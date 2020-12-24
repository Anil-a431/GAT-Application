using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;

namespace GitamManagement.PL
{
    public partial class Report : System.Web.UI.Page
    {
        GitamManagementService objService = new GitamManagementService();
        GitDAl gitDAl = new GitDAl();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                UserInfoBind();
            }
        }

        private void UserInfoBind()
        {

            DataSet ds = objService.getUserDataReporting(Convert.ToInt32(Session["UserId"].ToString()));
            DataTable dtbasic = new DataTable();
            dtbasic = ds.Tables[0];
            lblRegID.Text = ds.Tables[0].Rows[0]["RegistrationID"].ToString();
            lblFirstName.Text = dtbasic.Rows[0]["FirstName"].ToString();
            lblLastName.Text = dtbasic.Rows[0]["LastName"].ToString();
            lblEmailID.Text = dtbasic.Rows[0]["EmailID"].ToString();
            lblMobileNumber.Text = dtbasic.Rows[0]["Mobile_Number"].ToString();
            lblDob.Text = dtbasic.Rows[0]["Date_Of_Birth"].ToString();
            lblAadhar.Text = dtbasic.Rows[0]["AadharNumber"].ToString();
            lblgender.Text = dtbasic.Rows[0]["Gender"].ToString();
            lblcategory.Text = dtbasic.Rows[0]["Category"].ToString();

            DataTable dtcontactData = new DataTable();
            dtcontactData = ds.Tables[1];
            lblFatherName.Text = dtcontactData.Rows[0]["FatherName"].ToString();
            lblMotherName.Text = dtcontactData.Rows[0]["MotherName"].ToString();
            lblEmailIDParent.Text = dtcontactData.Rows[0]["EmailID"].ToString();
            lblAddress.Text = dtcontactData.Rows[0]["Address1"].ToString() + "," +
             dtcontactData.Rows[0]["Address2"].ToString();
            lblCountry.Text = dtcontactData.Rows[0]["CountryName"].ToString();
            lblState.Text = dtcontactData.Rows[0]["StateName"].ToString();
            lblCity.Text = dtcontactData.Rows[0]["CityName"].ToString();

            DataTable prevEduDetails = new DataTable();
            prevEduDetails = ds.Tables[2];
            lblQualification.Text = prevEduDetails.Rows[0]["ProgramName"].ToString();
            lblInstitue.Text = prevEduDetails.Rows[0]["Name_Of_the_Institue"].ToString();
            lblboard.Text = prevEduDetails.Rows[0]["Board"].ToString();
            lblpass.Text = prevEduDetails.Rows[0]["YearofPass"].ToString();

            DataTable dtcampus = new DataTable();
            dtcampus = ds.Tables[3];
            string tblContent = ConvertDataTableToHTML(dtcampus);
            Tbody1.InnerHtml = tblContent;

            DataTable dtAppData = new DataTable();
            dtAppData = ds.Tables[4];
            string table = ConvertDataTableToHTML(dtAppData);
            tblTBody.InnerHtml = table;

            DataTable dtUserImage = new DataTable();
            dtUserImage = ds.Tables[5];
            imgUserPhoto.ImageUrl = dtUserImage.Rows[0]["UserImage"].ToString();
        }

        public static string ConvertDataTableToHTML(DataTable dt)
        {
            string html = "";
            //add header row
           
            //add rows
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                html += "<tr>";
                for (int j = 0; j < dt.Columns.Count; j++)
                {
                    html += "<td>" + dt.Rows[i][j].ToString() + "</td>";
                }
                    
                html += "</tr>";
            }
          
            return html;
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
               server control at run time. */
        }
        protected void btnDownload_Click(object sender, EventArgs e)
        {
            ServicePointManager.Expect100Continue = true;
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
            DataTable dtSson = (DataTable)Session["ActiveMember"];
            string name = dtSson.Rows[0]["Name"].ToString();
            using (StringWriter sw = new StringWriter())
            {
                using (HtmlTextWriter hw = new HtmlTextWriter(sw))
                {
                    ////To Export all pages
                    //PrintDiv.AllowPaging = false;
                    //this.UserInfoBind();

                    PrintDiv.RenderControl(hw);
                    StringReader sr = new StringReader(sw.ToString());
                    Document pdfDoc = new Document(PageSize.A2, 10f, 10f, 10f, 0f);
                    HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
                    PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
                    pdfDoc.Open();
                    htmlparser.Parse(sr);
                    pdfDoc.Close();

                    Response.ContentType = "application/pdf";
                    Response.AddHeader("content-disposition", "attachment;filename="+name+".pdf");
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    Response.Write(pdfDoc);
                    Response.End();
                }
            }
        }
    }
}