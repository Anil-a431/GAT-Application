using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GitamManagement.Models;

namespace GitamManagement.PL
{
    public partial class UserPersonalDetails : System.Web.UI.Page
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
            }
        }

        protected void btnInert_Click(object sender, EventArgs e)
        {

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {

        }
    }
}