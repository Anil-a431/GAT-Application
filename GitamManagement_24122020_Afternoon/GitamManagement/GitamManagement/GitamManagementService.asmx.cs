using GitamManagement.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Services;

namespace GitamManagement
{
    /// <summary>
    /// Summary description for GitamManagementService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class GitamManagementService : System.Web.Services.WebService
    {

        [System.Web.Services.WebMethod(EnableSession = true)]
        public GetOnloadDetails GelRequiredData()
        {
            GetOnloadDetails LoadData = new GetOnloadDetails();
            List<_MasterProgramList> MPDataList = new GitDAl().GetMasterProgramList();
            LoadData.MasterProgramList= MPDataList;

            List<_StateList> StateDataList = new GitDAl().GetStateList();
            LoadData.StateList = StateDataList;

            List<_CampusList>CampusDataList = new GitDAl().GetCampusList();
            LoadData.CampusList = CampusDataList;
            return LoadData;
        }
        [System.Web.Services.WebMethod(EnableSession = true)]
        public List<CountryList> GetCountryLists()
        {
            List<CountryList> countryLists = new GitDAl().GetCountryLists();
            return countryLists;
        }

        [System.Web.Services.WebMethod(EnableSession = true)]
        public List<StateList> GetStateLists(string countryID)
        {
            List<StateList> stateLists = new GitDAl().GetStateLists(Convert.ToInt32(countryID.ToString()));
            return stateLists;
        }

        [System.Web.Services.WebMethod(EnableSession = true)]
        public List<StateList> GetStateLists1()
        {
            List<StateList> stateLists = new GitDAl().GetStateLists1();
            return stateLists;
        }

        [System.Web.Services.WebMethod(EnableSession = true)]
        public List<DistrictList> GetDistrictLists(string stateID)
        {
            List<DistrictList> districtLists = new GitDAl().GetDistrictLists(Convert.ToInt32(stateID.ToString()));
            return districtLists;
        }

        [System.Web.Services.WebMethod(EnableSession = true)]
        public DataSet getUserDataReporting(int UserId)
        {
            DataSet ds = new GitDAl().getUserDataReporting(UserId);
            return ds;
        }

        [System.Web.Services.WebMethod(EnableSession = true)]
        public List<_SubProgramDetails> GetSubProgramDetails(string MasterProgarmID)
        {
            List<_SubProgramDetails> SubProgramList = new GitDAl().GetSubProgramList(Convert.ToInt32(MasterProgarmID));
            return SubProgramList;
        }

        [System.Web.Services.WebMethod(EnableSession = true)]
        public List<_SubProgramDetails1> GetSubProgramDetails1(string MasterProgarmID,string UserId)
        {
            List<_SubProgramDetails1> SubProgramList = new GitDAl().GetSubProgramList1(Convert.ToInt32(MasterProgarmID),
                                                                                       Convert.ToInt32(UserId));
            return SubProgramList;
        }

        [System.Web.Services.WebMethod(EnableSession = true)]
        public DataSet GetUserCourses(string UserId,string PaymentStatus)
        {
            DataSet dt = new GitDAl().GetUserCourses(Convert.ToInt32(UserId),Convert.ToInt32(PaymentStatus));
            return dt;
        }

        [System.Web.Services.WebMethod(EnableSession = true)]
        public List<ApplicationCourseDetails> GetUserUnPaidCourses(string UserId)
        {
            List<ApplicationCourseDetails>  objAppUnPaidCourses= new GitDAl().GetUserUnPaidCourses(Convert.ToInt32(UserId));
            return objAppUnPaidCourses;
        }
        [System.Web.Services.WebMethod(EnableSession = true)]
        public List<ApplicationCourseDetails> deleteUserCourse(string ApplicationID,string UserId)
        {
            List <ApplicationCourseDetails> courseDetails = new GitDAl().deleteUserCourse(ApplicationID, Convert.ToInt32(UserId));
            return courseDetails;
        }
        [System.Web.Services.WebMethod(EnableSession = true)]
        public List<_ProgramStreamDetails> GetProgramStreamDetails(string SubProgarmID)
        {
            List<_ProgramStreamDetails> SubProgramList = new GitDAl().GetProgramStreamList(Convert.ToInt32(SubProgarmID));
            return SubProgramList;
        }
        [System.Web.Services.WebMethod(EnableSession = true)]
        public bool insertTransactionDetails(string UserId, string TransId, string status, string TransAmount)
        {
            bool response = new GitDAl().insertTransactionDetails(UserId, TransId, status, Convert.ToDouble(TransAmount));
            return response;
        }

        [System.Web.Services.WebMethod(EnableSession = true)]
        public List<_CityDetails> GetCityDetails(string StateID)
        {
            List<_CityDetails> CityList = new GitDAl().GetGetCityDetailsList(Convert.ToInt32(StateID));
            return CityList;
        }
        [System.Web.Services.WebMethod(EnableSession = true)]
        public DataTable getImagePath(string UserId)
        {
            DataTable reponseDt = new GitDAl().getImagePath(Convert.ToInt32(UserId));
            return reponseDt;
        }

        [System.Web.Services.WebMethod(EnableSession = true)]
        public string RegisterUserDetails(string Name, string Email, string Mobile, string residentVal, string stateID, string CityId)
        {
            Common objemail = new Common();
            EmailModel objemailModel = new EmailModel();
            string emailStatus = string.Empty;
            string Password = new Common().PasswordGenerator();
            string AuthCode = new Common().GetMD5Hash(Name + DateTime.Now.ToString() + Password);
            DataTable dt = new GitDAl().RegistrationProcess(Name, Email, Password, Mobile, Convert.ToInt32(residentVal), stateID, CityId, AuthCode);
            if(dt == null)
            {
                return "Failed";
            }
            var Id = dt.Rows[0]["Id"];
            var regName = dt.Rows[0]["Name"].ToString();
            var regemailID = dt.Rows[0]["emailID"].ToString();
            var regPassword = dt.Rows[0]["Password"].ToString();
            var emailSwitch = ConfigurationManager.AppSettings["emailSwitch"];
            if (Id != null && emailSwitch == "ON")
            {
                objemailModel.templateName = "Registration";
                objemailModel.Username = regName;
                objemailModel.Password = regPassword;
                objemailModel.toEmail = dt.Rows[0]["emailID"].ToString();
                objemailModel.mailHeader = "Registration Successful For GAT Online Application 2021";
                objemailModel.mailContent = "Thank you for Registering For GAT Online Application 2021 <br/> You may now directly login and start filling your application by clicking on button.";
                /*objemailModel.toEmail = dt.Rows[0]["emailID"].ToString();
                objemailModel.mailHeader = "Registration Successful with Gitam";
                objemailModel.mailContent = "Hi " + regName + "!!!,<br/> <br/>" +" Here Your EmailID : " + regemailID + "<br/>Password : " + regPassword;*/
                emailStatus = objemail.SendEmailUser(objemailModel);
            }
           Session["ActiveMember"] = dt;
           
            if (Id != null && emailStatus == "Successful")
            {
                return "Successful";
            }
            else
            {
                return "Failed";
            }
        }
        [WebMethod]
        public string getUserPassword(string EmailID)
        {
            Common objemail = new Common();
            EmailModel objemailModel = new EmailModel();
            string emailStatus = string.Empty;
            DataTable dtforgotDetails = new GitDAl().getUserPassword(EmailID);
            if (dtforgotDetails == null)
            {
                return "Failed";
            }
            var Id = dtforgotDetails.Rows[0]["Id"];
            var regName = dtforgotDetails.Rows[0]["Name"].ToString();
            var regPassword = dtforgotDetails.Rows[0]["Password"].ToString();
            var emailSwitch = ConfigurationManager.AppSettings["emailSwitch"];
            if (regName!="" && emailSwitch == "ON")
            {
                objemailModel.templateName = "ForgotPassword";
                objemailModel.Username = regName;
                objemailModel.Password = regPassword;
                objemailModel.toEmail = EmailID;
                objemailModel.mailHeader = "GAT Online Application Password Request";
                objemailModel.mailContent = " You have requested password for your GAT Online Application Account.<br/> ";
                emailStatus = objemail.SendEmailUser(objemailModel);
            }
            if (Id != null && emailStatus == "Successful")
            {
                return "Successful";
            }
            else
            {
                return "Failed";
            }

        }

        [WebMethod(EnableSession = true)]
        public int UpdatePassword(string newPassword)
        {
            int status = 0;
            Common objemail = new Common();
            EmailModel objemailModel = new EmailModel();
            string emailStatus = string.Empty;
            DataTable dt = new DataTable();

            status = new GitDAl().UpdatePassword(Session["UserId"], newPassword);
            //dt = new GitDAl().getUserInfo(Convert.ToInt32(Session["UserId"].ToString()));

            //var emailSwitch = ConfigurationManager.AppSettings["emailSwitch"];
            //var Id = dt.Rows[0]["Id"];
            //var regName = dt.Rows[0]["Name"].ToString();
            //var regemailID = dt.Rows[0]["emailID"].ToString();
            //var regPassword = dt.Rows[0]["Password"].ToString();

            //if (status != 0 && emailSwitch == "ON")
            //{
            //    objemailModel.templateName = "Registration";
            //    objemailModel.Username = regName;
            //    objemailModel.Password = regPassword;
            //    objemailModel.toEmail = dt.Rows[0]["emailID"].ToString();
            //    objemailModel.mailHeader = "Registration Successful with Gitam";
            //    objemailModel.mailContent = "Thank you for applying at Gitam University <br/> You may now directly login and start filling your application by clicking on button.";
            //    /*objemailModel.toEmail = dt.Rows[0]["emailID"].ToString();
            //    objemailModel.mailHeader = "Registration Successful with Gitam";
            //    objemailModel.mailContent = "Hi " + regName + "!!!,<br/> <br/>" +" Here Your EmailID : " + regemailID + "<br/>Password : " + regPassword;*/
            //    emailStatus = objemail.SendEmailUser(objemailModel);
            //}
            return status;
        }

        [System.Web.Services.WebMethod(EnableSession = true)]
        public DataTable getUserPersonalDetails(int UserId)
        {
            DataTable dt = new GitDAl().getUserPersonalDetails(UserId);
            return dt;
        }

        [System.Web.Services.WebMethod(EnableSession = true)]
        public List<ContactDetails> getUserContactDetails()
        {
            List<ContactDetails> CD_list = new List<ContactDetails>();
            ContactDetails CD_Data = new ContactDetails();
           DataTable dt = new GitDAl().getUserContactDetails(Convert.ToInt32(Session["UserId"].ToString()));


            if(dt.Rows.Count == 0)
            {
                return CD_list;
            }
            else
            {
                    CD_Data = new ContactDetails()
                        {
                            ID = Convert.ToString(dt.Rows[0]["ID"]),
                            UserId = dt.Rows[0]["UserId"].ToString(),
                            FatherName = dt.Rows[0]["FatherName"].ToString(),
                            MotherName = dt.Rows[0]["MotherName"].ToString(),
                            Occupation = dt.Rows[0]["Occupation"].ToString(),
                            MobileNumber = dt.Rows[0]["MobileNumber"].ToString(),
                            EmailID = dt.Rows[0]["EmailID"].ToString(),
                            Address1 = dt.Rows[0]["Address1"].ToString(),
                            Address2 = dt.Rows[0]["Address2"].ToString(),
                            Country = dt.Rows[0]["Country"].ToString(),
                            State = dt.Rows[0]["State"].ToString(),
                            District = dt.Rows[0]["District"].ToString(),
                            Pincode = dt.Rows[0]["Pincode"].ToString()

                        };
                        CD_list.Add(CD_Data);
                return CD_list;
            }
            
        }


        [System.Web.Services.WebMethod(EnableSession = true)]
        public string InsertUserPersonalDetails(string gender,string dob,string adharnum,string category,string nationality,
            string PR,string UP,string AboutGitam,string FirstName, string LastName,int update = 0)
        {
            string userId = Session["UserId"].ToString();
            
            bool response = new GitDAl().InsertUserPersonalDetails(userId, gender, dob, adharnum, category,
                nationality, PR, UP, AboutGitam, FirstName, LastName, update);
            
                if (response)
                {
                    return "Successful";
                }
                else
                {
                    return "Failed";
                }
           
        }
        [System.Web.Services.WebMethod(EnableSession = true)]

        public string InsertUserContactDetails(string fathersname,string mothersname,string occupation,string mobilenumber,
            string email,string addr1,string addr2,string countryID,string stateID,string districtID,string pincode,int update = 0)
        {
            string userId = Session["UserId"].ToString();
            DataTable response = new GitDAl().InsertUserContactDetails(userId, fathersname, mothersname, occupation,
                mobilenumber, email, addr1, addr2, countryID, stateID, districtID, pincode,update);
            if (response!=null && response.Rows.Count>0)
            { 
                return response.Rows[0][0].ToString();
            }
            else
            {
                return null;
            }

        }

        [System.Web.Services.WebMethod(EnableSession = true)]
        public string InsertUserCourseSelection(string institue, string study,string yop,string university)
        {

            Common objemail = new Common();
            EmailModel objemailModel = new EmailModel();
            string emailStatus = string.Empty;
            string userId = Session["UserId"].ToString();
            DataTable dt = new GitDAl().InsertUserCourseSelection(userId, institue, study, yop, university);
            if (dt == null)
            {
                return "Failed";
            }
            var emailSwitch = ConfigurationManager.AppSettings["emailSwitch"];
            DataTable dtSson = (DataTable)Session["ActiveMember"];
            var Id = Session["UserId"].ToString();
            var regEmail = Session["emailID"].ToString();
            var regName = dtSson.Rows[0]["Name"].ToString();
            if (regName != "" && emailSwitch == "ON")
            {
                objemailModel.templateName = "Confirmation";
                objemailModel.Id = Convert.ToString(Id);
                objemailModel.toEmail = regEmail;
                objemailModel.Username = regName;
                objemailModel.mailHeader = "Application Submitted Successfully";
                objemailModel.mailContent = "Your GAT Online Application 2021 has been Successfully Submitted";
                emailStatus = objemail.SendEmailUser(objemailModel);
            }
            if (Id != null && emailStatus == "Successful")
            {
                return "Successful";
            }
            else
            {
                return "Failed";
            }
            if (Id != null)
            {

                return "Successful";
            }
            else
            {
                return "Failed";
            }

        }


        [System.Web.Services.WebMethod(EnableSession = true)]
        public DataTable ValidateLogin(string UserName, string Password)
        {
            DataTable Dt = new GitDAl().ValidateLogin(UserName, Password);
            if(Dt!=null && Dt.Rows.Count>0)
            {
                if(Dt.Rows[0]["emailID"].ToString() == UserName && Dt.Rows[0]["Password"].ToString() == Password)
                {
                    Session["ActiveMember"] = Dt;
                    Session["UserId"] = Dt.Rows[0]["Id"];
                    Session["emailID"] = Dt.Rows[0]["emailID"];
                    Session["Qualification"] = Dt.Rows[0]["Qualification"];
                    Session["QGroup"] = Dt.Rows[0]["QGroup"];
                    Session["CampusLocation"] = Dt.Rows[0]["CampusLocation"];
                    Session["CheckPasswordUpdate"] = Dt.Rows[0]["CheckPasswordUpdate"];
                    return Dt;
                }
                else
                {
                    return null;
                }
            }
            else
            {
                return null;
            }
        }

        [System.Web.Services.WebMethod(EnableSession = true)]
        public CurrentEduDetailsDisplay getUserCurrentEducationDetails()
        {
            CurrentEduDetailsDisplay objCurrEdu = new CurrentEduDetailsDisplay();
            objCurrEdu = new GitDAl().getUserCurrentEducationDetails(Convert.ToInt32(Session["UserId"]));
            return objCurrEdu;
        }

        [System.Web.Services.WebMethod(EnableSession = true)]
        public string Section1Details(string EDetails, string Group, string Campus)
        {
            DataTable dt = (DataTable)Session["ActiveMember"];
            Session["UserId"] = dt.Rows[0]["Id"];
            Session["emailID"] = dt.Rows[0]["emailID"];
            Session["Qualification"] = EDetails;
            Session["QGroup"] = Group;
            Session["CampusLocation"] = Campus;
            bool IsInsert = new GitDAl().Section1Details(EDetails, Group, Campus, Convert.ToInt32(Session["UserId"]));
            if (IsInsert)
            {
                    return "Successfull";
            }
            else
            {
                return "Fail";
            }
        }
        [System.Web.Services.WebMethod(EnableSession = true)]
        public string Section2Details(string MasterProgram, string Course, string Stream)
        {
            DataTable dt = (DataTable)Session["ActiveMember"];

            bool IsInsert = new GitDAl().Section2Details(MasterProgram, Course, Stream, dt.Rows[0]["id"].ToString());
            if (IsInsert)
            {

                return "Successfull";

            }
            else
            {
                return "Fail";
            }
        }
        [WebMethod(EnableSession = true)]
        public string GetCurrentPassword()
        {
            string currPassword = string.Empty;
            currPassword = new GitDAl().GetCurrentPassword(Session["UserId"]);
            return currPassword;
        }
        

        [WebMethod(EnableSession = true)]
        public List<_MasterProgramList> GetHigherQualificationDetails()
        {
            List<_MasterProgramList> MpdataList = new List<_MasterProgramList>();
            int qId = Session["Qualification"] == null ? 0 : Convert.ToInt32(Session["Qualification"]);
            MpdataList = new GitDAl().GetHigherQualificationDetails(qId);
            return MpdataList;
        }

        [WebMethod(EnableSession = true)]
        public List<BoardsList> getBoards()
        {
            List<BoardsList> boardsList = new List<BoardsList>();
            boardsList = new GitDAl().getBoards(Convert.ToInt32(Convert.ToInt32(Session["UserId"])));
            return boardsList;
        }

        /*[WebMethod(EnableSession = true)]
        public List<_MasterProgramList> InsertCourseDetails(string courseids)
        {
            
        }*/
        [WebMethod(EnableSession = true)]
        public List<ApplicationCourseDetails> InsertCourseDetails(string courseids)
        {
            List<ApplicationCourseDetails> MpdataList = new List<ApplicationCourseDetails>();
            MpdataList = new GitDAl().InsertCourseDetails(Convert.ToInt32(Session["UserId"]), Session["emailID"].ToString(), courseids);
          //  MpdataList = new GitDAl().GetHigherQualificationDetails(Convert.ToInt32(Session["Qualification"].ToString()));
            return MpdataList;
        }
    }
}
