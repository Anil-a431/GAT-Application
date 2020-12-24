using GitamManagement.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;

namespace GitamManagement.PL
{
    public partial class PersonalDetails : System.Web.UI.Page
    {
        GitamManagementService objInsert = new GitamManagementService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
                DataSet ds = new DataSet();
                GitDAl objGitam = new GitDAl();
                ds = objGitam.GetPersonalDetailsPage();
                
                
                gender.DataSource = ds.Tables[0];
                gender.DataTextField = "gender";
                gender.DataValueField = "Id";
                gender.DataBind();

                category.DataSource = ds.Tables[1];
                category.DataTextField = "category";
                category.DataValueField = "Id";
                category.DataBind();

                aboutgitam.DataSource = ds.Tables[2];
                aboutgitam.DataTextField = "fromresource";
                aboutgitam.DataValueField = "Id";
                aboutgitam.DataBind();

                List<CountryList> countryLists = new List<CountryList>();
                countryLists = objInsert.GetCountryLists();

                country.DataSource = countryLists;
                country.DataTextField = "CountryName";
                country.DataValueField = "ID";
                country.DataBind();


                country1.DataSource = countryLists;
                country1.DataTextField = "CountryName";
                country1.DataValueField = "ID";
                country1.DataBind();

              getUserPersonalDetails(Convert.ToInt32(Session["UserId"].ToString()));

            }
        }
        
        public void getUserPersonalDetails(int UserId)
        {

            DataTable dt = new DataTable();
            dt = objInsert.getUserPersonalDetails(UserId);
            if (dt.Rows.Count > 0)
            {
                Button1.Visible = false;
                btnUpdate.Visible = true;
                txtFirstName.Text = dt.Rows[0]["FirstName"].ToString();
                txtLastName.Text = dt.Rows[0]["LastName"].ToString();
                gender.SelectedValue = dt.Rows[0]["Gender"].ToString(); 
                dob.Text = dt.Rows[0]["DateofBirth"].ToString();
                aadharNumber.Text = dt.Rows[0]["AadharCardNumber"].ToString();
                category.SelectedValue = dt.Rows[0]["Category"].ToString();
                country.Items.FindByValue(dt.Rows[0]["Nationality"].ToString());
                country1.Items.FindByValue(dt.Rows[0]["PermenantResidence"].ToString());
                aboutgitam.SelectedValue = dt.Rows[0]["AboutGitam"].ToString();
                //AboutGitam
            }
            else
            {
                Button1.Visible = true;
                btnUpdate.Visible = false;
            }
            
        }

        protected  void Button1_Click(object sender, EventArgs e)
        {
            DataTable dtSson = (DataTable)Session["ActiveMember"];
            Session["Name"] = dtSson.Rows[0]["Name"].ToString();
            Session["UserId"]= dtSson.Rows[0]["Id"].ToString();
            string gender1 = gender.SelectedValue;
            string dateofbirth = dob.Text;
            string Adnumber = aadharNumber.Text;
            string cat = category.SelectedValue;
            string nat = country.SelectedValue ;
            string perAdd = country1.SelectedValue;
            string aboutGitam = aboutgitam.SelectedValue;
            string FirstName = txtFirstName.Text;
            string LastName = txtLastName.Text;
            string fileName = string.Empty;

            if (fileUploadInput.HasFile)
            {
                string destinationPath = Server.MapPath("~/Images/");
                if (!Directory.Exists(destinationPath))
                {
                    Directory.CreateDirectory(destinationPath);
                }
                fileName = Path.GetFileName(fileUploadInput.PostedFile.FileName);
                string filextension = Path.GetExtension(fileUploadInput.PostedFile.FileName);
                fileUploadInput.SaveAs(Server.MapPath("~/Images/" + Session["UserId"] + filextension));
                string status = objInsert.InsertUserPersonalDetails(gender1, dateofbirth, Adnumber, cat, nat, perAdd, "/Images/" + Session["UserId"] + filextension, aboutGitam, FirstName, LastName,0);
                if (status == "Successful")
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Your Personal Data Successfully Submitted')", true);
                    Response.Redirect("/ContactDetails");
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Your Details are not inserted...')", true);
                    return;
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please Upload Image(png,jpg,jpeg) format')", true);
                return;
            }

            
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            GitamManagementService objService = new GitamManagementService();
           
            DataTable dtSson = (DataTable)Session["ActiveMember"];
            Session["Name"] = dtSson.Rows[0]["Name"].ToString();
            Session["UserId"] = dtSson.Rows[0]["Id"].ToString();
            
            string gender1 = gender.SelectedValue;
            string dateofbirth = dob.Text;
            string Adnumber = aadharNumber.Text;
            string cat = category.SelectedValue;
            string nat = country.SelectedValue;
            string perAdd = country1.SelectedValue;
            string aboutGitam = aboutgitam.SelectedValue;
            string FirstName = txtFirstName.Text;
            string LastName = txtLastName.Text;

            if (fileUploadInput.HasFile)
            {
                string destinationPath = Server.MapPath("~/Images/");
                if (!Directory.Exists(destinationPath))
                {
                    Directory.CreateDirectory(destinationPath);
                }
                string fileName = Path.GetFileNameWithoutExtension(fileUploadInput.PostedFile.FileName);
                string filextension = Path.GetExtension(fileUploadInput.PostedFile.FileName);
                DataTable dt = new DataTable();
                dt = objService.getImagePath(Session["UserId"].ToString());
                string databaseimgPath = dt.Rows[0]["UserPhoto"].ToString();
                databaseimgPath = databaseimgPath.Replace("/Images/", "");
                string ext = databaseimgPath.Replace("/Images/","").Replace(Session["UserId"].ToString(), "").Replace(".","");
                int pos = databaseimgPath.IndexOf(".");
                if (pos >= 0)
                {
                    databaseimgPath = databaseimgPath.Remove(pos);
                }
                if (Session["UserId"].ToString()  == databaseimgPath)
                {
                    System.IO.File.Delete(Server.MapPath("~/Images/"+Session["UserId"]+"."+ext));
                }
                fileUploadInput.SaveAs(Server.MapPath("~/Images/" + Session["UserId"] + filextension));
                string status = objInsert.InsertUserPersonalDetails(gender1, dateofbirth, Adnumber, cat, nat, perAdd, "/Images/" + Session["UserId"] + filextension, aboutGitam,FirstName, LastName,1);
                if (status == "Successful")
                {
                    Thread.Sleep(2000);
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Details are Updated')", true);
                    Thread.Sleep(2000);
                    Response.Redirect("/ContactDetails");
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error in Updating')", true);
                    return;
                    //lblMsg.Text = "Error in Updating";
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please Upload Image(png,jpg,jpeg) format')", true);
                return;
            }
        }

        
    }
}