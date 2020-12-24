using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using GitamManagement.Models;

namespace GitamManagement
{
    public class GitDAl
    {
        public string conString = ConfigurationManager.ConnectionStrings["LocalConStr"].ToString();
        public List<_MasterProgramList> GetMasterProgramList()
        {
            _MasterProgramList MpData = new _MasterProgramList();
            List<_MasterProgramList> MpdataList = new List<_MasterProgramList>();
            DataSet Dset = new DataSet();
            try
            {
                using (SqlConnection Con = new SqlConnection(conString))
                {
                    SqlCommand Cmd = new SqlCommand("GetMasterCollegeProgramsDetails", Con);
                    Cmd.CommandType = CommandType.StoredProcedure;
                    using (SqlDataAdapter SDA = new SqlDataAdapter(Cmd))
                    {
                        SDA.Fill(Dset);
                    }
                }
                if(Dset != null && Dset.Tables.Count > 0)
                {
                    if(Dset.Tables[0] != null && Dset.Tables[0].Rows.Count > 0)
                    {
                        foreach(DataRow dr in Dset.Tables[0].Rows)
                        {
                            MpData = new _MasterProgramList()
                            {
                                ID = Convert.ToString(dr["ID"]),
                                ProgramName = Convert.ToString(dr["ProgramName"])

                            };
                            MpdataList.Add(MpData);
                        }
                    }
                
                }
                return MpdataList;
            }
            catch(Exception ex)
            {
                return null;
            }
        }

        public DataTable getImagePath(int UserId)
        {
            DataTable dt = new DataTable();
            try
            {
                using (SqlConnection Con = new SqlConnection(conString))
                {
                    SqlCommand Cmd = new SqlCommand("USP_getImagePath", Con);
                    Cmd.CommandType = CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("@UserId", UserId);
                    using (SqlDataAdapter SDA = new SqlDataAdapter(Cmd))
                    {
                        SDA.Fill(dt);
                    }
                }
                return dt;
            }
            catch(Exception ex)
            {
                return null;
            }

        }
        public List<_StateList> GetStateList()
        {
            _StateList StateData = new _StateList();
            List<_StateList> StateDataList = new List<_StateList>();
            DataSet Dset = new DataSet();
            try
            {
                using (SqlConnection Con = new SqlConnection(conString))
                {
                    SqlCommand Cmd = new SqlCommand("GetStateList", Con);
                    Cmd.CommandType = CommandType.StoredProcedure;
                    using (SqlDataAdapter SDA = new SqlDataAdapter(Cmd))
                    {
                        SDA.Fill(Dset);
                    }
                }
                if (Dset != null && Dset.Tables.Count > 0)
                {
                    if (Dset.Tables[0] != null && Dset.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow dr in Dset.Tables[0].Rows)
                        {
                            StateData = new _StateList()
                            {
                                ID = Convert.ToString(dr["ID"]),
                                StateName = Convert.ToString(dr["StateName"])

                            };
                            StateDataList.Add(StateData);
                        }
                    }

                }
                return StateDataList;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public List<CountryList> GetCountryLists()
        {
            CountryList CountryData = new CountryList();
            List<CountryList> countryLists = new List<CountryList>();
            DataSet Dset = new DataSet();
            try
            {
                using (SqlConnection Con = new SqlConnection(conString))
                {
                    SqlCommand Cmd = new SqlCommand("GetCountryList", Con);
                    Cmd.CommandType = CommandType.StoredProcedure;
                    using (SqlDataAdapter SDA = new SqlDataAdapter(Cmd))
                    {
                        SDA.Fill(Dset);
                    }
                }
                if (Dset != null && Dset.Tables.Count > 0)
                {
                    if (Dset.Tables[0] != null && Dset.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow dr in Dset.Tables[0].Rows)
                        {
                            CountryData = new CountryList()
                            {
                                ID = Convert.ToString(dr["ID"]),
                                CountryName = Convert.ToString(dr["Name"])

                            };
                            countryLists.Add(CountryData);
                        }
                    }

                }
                return countryLists;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public List<StateList> GetStateLists(int countryID)
        {
            StateList stateData = new StateList();
            List<StateList> stateLists = new List<StateList>();
            DataSet Dset = new DataSet();
            try
            {
                using (SqlConnection Con = new SqlConnection(conString))
                {
                    SqlCommand Cmd = new SqlCommand("Usp_GetStateList", Con);
                    Cmd.CommandType = CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("@CountryID", Convert.ToInt32(countryID));
                    using (SqlDataAdapter SDA = new SqlDataAdapter(Cmd))
                    {
                        SDA.Fill(Dset);
                    }
                }
                if (Dset != null && Dset.Tables.Count > 0)
                {
                    if (Dset.Tables[0] != null && Dset.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow dr in Dset.Tables[0].Rows)
                        {
                            stateData = new StateList()
                            {
                                ID = Convert.ToString(dr["ID"]),
                                StateName = Convert.ToString(dr["Name"])

                            };
                            stateLists.Add(stateData);
                        }
                    }

                }
                return stateLists;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public List<StateList> GetStateLists1()
        {
            StateList stateData = new StateList();
            List<StateList> stateLists = new List<StateList>();
            DataSet Dset = new DataSet();
            try
            {
                using (SqlConnection Con = new SqlConnection(conString))
                {
                    SqlCommand Cmd = new SqlCommand("Usp_GetStateListLoginPage", Con);
                    Cmd.CommandType = CommandType.StoredProcedure;
                    using (SqlDataAdapter SDA = new SqlDataAdapter(Cmd))
                    {
                        SDA.Fill(Dset);
                    }
                }
                if (Dset != null && Dset.Tables.Count > 0)
                {
                    if (Dset.Tables[0] != null && Dset.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow dr in Dset.Tables[0].Rows)
                        {
                            stateData = new StateList()
                            {
                                ID = Convert.ToString(dr["ID"]),
                                StateName = Convert.ToString(dr["Name"])

                            };
                            stateLists.Add(stateData);
                        }
                    }

                }
                return stateLists;
            }
            catch (Exception ex)
            {
                return null;
            }
        }


        public List<DistrictList> GetDistrictLists(int stateID)
        {
            DistrictList districtData = new DistrictList();
            List<DistrictList> districtLists = new List<DistrictList>();
            DataSet Dset = new DataSet();
            try
            {
                using (SqlConnection Con = new SqlConnection(conString))
                {
                    SqlCommand Cmd = new SqlCommand("Usp_GetDistrictList", Con);
                    Cmd.CommandType = CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("@StateID", Convert.ToInt32(stateID));
                    using (SqlDataAdapter SDA = new SqlDataAdapter(Cmd))
                    {
                        SDA.Fill(Dset);
                    }
                }
                if (Dset != null && Dset.Tables.Count > 0)
                {
                    if (Dset.Tables[0] != null && Dset.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow dr in Dset.Tables[0].Rows)
                        {
                            districtData = new DistrictList()
                            {
                                ID = Convert.ToString(dr["ID"]),
                                DistrictName = Convert.ToString(dr["Name"])

                            };
                            districtLists.Add(districtData);
                        }
                    }

                }
                return districtLists;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public List<DistNames> getDistNames(int stateID)
        {
            List<DistNames> objDNames= new List<DistNames>();
            DistNames objD = new DistNames();
            DataSet Dset = new DataSet();
            try
            {
                using (SqlConnection Con = new SqlConnection(conString))
                {
                    SqlCommand Cmd = new SqlCommand("Usp_GetDistrictListByStateID", Con);
                    Cmd.CommandType = CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("@StateID",stateID);
                    using (SqlDataAdapter SDA = new SqlDataAdapter(Cmd))
                    {
                        SDA.Fill(Dset);
                    }
                }
                if (Dset != null && Dset.Tables.Count > 0)
                {
                    if (Dset.Tables[0] != null && Dset.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow dr in Dset.Tables[0].Rows)
                        {
                            objD = new DistNames()
                            {
                                DistID = Convert.ToString(dr["ID"]),
                                DNames = Convert.ToString(dr["DistName"])

                            };
                            objDNames.Add(objD);
                        }
                    }
                }
                return objDNames;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        
        public List<CityDetailsDistID> getCityDetailsByDist(int distID)
        {
            List<CityDetailsDistID> objCityData1 = new List<CityDetailsDistID>();
            CityDetailsDistID dataAdd = new CityDetailsDistID();
            DataSet Dset = new DataSet();
            try
            {
                using (SqlConnection Con = new SqlConnection(conString))
                {
                    SqlCommand Cmd = new SqlCommand("USP_getCityDetailsByDist", Con);
                    Cmd.CommandType = CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("@distID", distID);
                    using (SqlDataAdapter SDA = new SqlDataAdapter(Cmd))
                    {
                        SDA.Fill(Dset);
                    }
                }
                if (Dset != null && Dset.Tables.Count > 0)
                {
                    if (Dset.Tables[0] != null && Dset.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow dr in Dset.Tables[0].Rows)
                        {
                            dataAdd = new CityDetailsDistID()
                            {
                                cityID = Convert.ToString(dr["ID"]),
                                cityNames = Convert.ToString(dr["CityName"])

                            };
                            objCityData1.Add(dataAdd);
                        }
                    }
                }
                return objCityData1;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public List<_CampusList> GetCampusList()
        {
            _CampusList CampusData = new _CampusList();
            List<_CampusList> CampusDataList = new List<_CampusList>();
            DataSet Dset = new DataSet();
            try
            {
                using (SqlConnection Con = new SqlConnection(conString))
                {
                    SqlCommand Cmd = new SqlCommand("GetCampusList", Con);
                    Cmd.CommandType = CommandType.StoredProcedure;
                    using (SqlDataAdapter SDA = new SqlDataAdapter(Cmd))
                    {
                        SDA.Fill(Dset);
                    }
                }
                if (Dset != null && Dset.Tables.Count > 0)
                {
                    if (Dset.Tables[0] != null && Dset.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow dr in Dset.Tables[0].Rows)
                        {
                            CampusData = new _CampusList()
                            {
                                ID = Convert.ToString(dr["ID"]),
                                CampusLocation = Convert.ToString(dr["CampusLocation"])

                            };
                            CampusDataList.Add(CampusData);
                        }
                    }

                }
                return CampusDataList;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public List<_SubProgramDetails> GetSubProgramList(int MasterProgarmID)
        {
            _SubProgramDetails SubProgData = new _SubProgramDetails();
            List<_SubProgramDetails> SubProgDataList = new List<_SubProgramDetails>();
            DataSet Dset = new DataSet();
            try
            {
                using (SqlConnection Con = new SqlConnection(conString))
                {
                    SqlCommand Cmd = new SqlCommand("GetSubProgramDetails", Con);
                    Cmd.CommandType = CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("@MasterProgramID",Convert.ToInt32(MasterProgarmID));
                    using (SqlDataAdapter SDA = new SqlDataAdapter(Cmd))
                    {
                        SDA.Fill(Dset);
                    }
                }
                if (Dset != null && Dset.Tables.Count > 0)
                {
                    if (Dset.Tables[0] != null && Dset.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow dr in Dset.Tables[0].Rows)
                        {
                            SubProgData = new _SubProgramDetails()
                            {
                                ID = Convert.ToString(dr["ID"]),
                                MasterProgramId = Convert.ToString(dr["MasterProgramId"]),
                                ProgramName = Convert.ToString(dr["ProgramName"])

                            };
                            SubProgDataList.Add(SubProgData);
                        }
                    }

                }
                return SubProgDataList;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public bool insertTransactionDetails(string UserId, string TransId, string status, double TransAmount)
        {
            DataTable dt = new DataTable();
            try
            {
                using (SqlConnection Con = new SqlConnection(conString))
                {
                    SqlCommand Cmd = new SqlCommand("USP_insertTransactionDetails", Con);
                    Cmd.CommandType = CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("@UserId",Convert.ToInt32(UserId));
                    Cmd.Parameters.AddWithValue("@TransId", TransId);
                    Cmd.Parameters.AddWithValue("@Status", Convert.ToInt32(status));
                    //Cmd.Parameters.AddWithValue("@TransDate", Convert.ToDateTime(TransDate));
                    Cmd.Parameters.AddWithValue("@TransAmount",Convert.ToInt32(TransAmount));
                    using (SqlDataAdapter SDA = new SqlDataAdapter(Cmd))
                    {
                        SDA.Fill(dt);
                    }
                }
                if (dt != null)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch(Exception ex)
            {
                return false;
            }
        }

        public DataSet GetUserCourses(int userId,int PaymentStatus)
        {
            List<ApplicationCourseDetails> objCourseDetails = new List<ApplicationCourseDetails>();
            DataSet Dset = new DataSet();
            try
            {
                using (SqlConnection Con = new SqlConnection(conString))
                {
                    SqlCommand Cmd = new SqlCommand("sp_getCourses", Con);
                    Cmd.CommandType = CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("@UserId", Convert.ToInt32(userId));
                    Cmd.Parameters.AddWithValue("@payment", Convert.ToInt32(PaymentStatus));
                    using (SqlDataAdapter SDA = new SqlDataAdapter(Cmd))
                    {
                        SDA.Fill(Dset);
                    }
                }
                
                return Dset;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public List<ApplicationCourseDetails> GetUserUnPaidCourses(int userId)
        {
            List<ApplicationCourseDetails> objCourseDetails = new List<ApplicationCourseDetails>();
            DataSet Dset = new DataSet();
            try
            {
                using (SqlConnection Con = new SqlConnection(conString))
                {
                    SqlCommand Cmd = new SqlCommand("sp_getCourses", Con);
                    Cmd.CommandType = CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("@UserId", Convert.ToInt32(userId));
                    Cmd.Parameters.AddWithValue("@payment", 0);
                    using (SqlDataAdapter SDA = new SqlDataAdapter(Cmd))
                    {
                        SDA.Fill(Dset);
                    }
                }
                if (Dset != null && Dset.Tables.Count > 0)
                {
                    if (Dset.Tables[0] != null && Dset.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow dr in Dset.Tables[0].Rows)
                        {
                            ApplicationCourseDetails AppIdData = new ApplicationCourseDetails()
                            {
                                ApplicationID = Convert.ToString(dr["Appid"]),
                                CourseName = Convert.ToString(dr["ProgramName"]),
                                Amount = Convert.ToDouble(dr["amount"])
                            };
                            objCourseDetails.Add(AppIdData);
                        }
                    }

                }
                return objCourseDetails;

            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public List<_SubProgramDetails1> GetSubProgramList1(int MasterProgarmID,int UserId)
        {
            _SubProgramDetails1 SubProgData = new _SubProgramDetails1();
            List<_SubProgramDetails1> SubProgDataList = new List<_SubProgramDetails1>();
            DataSet Dset = new DataSet();
            try
            {
                using (SqlConnection Con = new SqlConnection(conString))
                {
                    SqlCommand Cmd = new SqlCommand("GetSubProgramDetails1", Con);
                    Cmd.CommandType = CommandType.StoredProcedure; 
                    Cmd.Parameters.AddWithValue("@UserId", Convert.ToInt32(UserId));
                    Cmd.Parameters.AddWithValue("@MasterProgramID", Convert.ToInt32(MasterProgarmID));
                    using (SqlDataAdapter SDA = new SqlDataAdapter(Cmd))
                    {
                        SDA.Fill(Dset);
                    }
                }
                if (Dset != null && Dset.Tables.Count > 0)
                {
                    if (Dset.Tables[0] != null && Dset.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow dr in Dset.Tables[0].Rows)
                        {
                            SubProgData = new _SubProgramDetails1()
                            {
                                ID = Convert.ToString(dr["ID"]),
                                MasterProgramId = Convert.ToString(dr["MasterProgramId"]),
                                ProgramName = Convert.ToString(dr["ProgramName"])

                            };
                            SubProgDataList.Add(SubProgData);
                        }
                    }

                }
                return SubProgDataList;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public List<_ProgramStreamDetails> GetProgramStreamList(int SubProgarmID)
        {
            _ProgramStreamDetails ProgData = new _ProgramStreamDetails();
            List<_ProgramStreamDetails> ProgDataList = new List<_ProgramStreamDetails>();
            DataSet Dset = new DataSet();
            try
            {
                using (SqlConnection Con = new SqlConnection(conString))
                {
                    SqlCommand Cmd = new SqlCommand("GetProgramStreamDetails", Con);
                    Cmd.CommandType = CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("@SubProgramId", Convert.ToInt32(SubProgarmID));
                    using (SqlDataAdapter SDA = new SqlDataAdapter(Cmd))
                    {
                        SDA.Fill(Dset);
                    }
                }
                if (Dset != null && Dset.Tables.Count > 0)
                {
                    if (Dset.Tables[0] != null && Dset.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow dr in Dset.Tables[0].Rows)
                        {
                            ProgData = new _ProgramStreamDetails()
                            {
                                ID = Convert.ToString(dr["ID"]),
                                SubProgramId = Convert.ToString(dr["SubProgramId"]),
                                ProgramName = Convert.ToString(dr["ProgramName"])

                            };
                            ProgDataList.Add(ProgData);
                        }
                    }

                }
                return ProgDataList;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public List<_MasterProgramList> GetHigherQualificationDetails(int Qualification)
        {
            DataTable dt = new DataTable();
            _MasterProgramList MpData = new _MasterProgramList();
            List<_MasterProgramList> MpdataList = new List<_MasterProgramList>();
          
            try
            {
                using (SqlConnection Con = new SqlConnection(conString))
                {
                    SqlCommand Cmd = new SqlCommand("GetHigherQualificationDetails", Con);
                    Cmd.CommandType = CommandType.StoredProcedure;
                    using (SqlDataAdapter SDA = new SqlDataAdapter(Cmd))
                    {
                        SDA.Fill(dt);
                    }

                }
               
                switch (Qualification)
                {
                    case 5:
                        DataTable filteredData = new DataTable();
                        List<int> course = new List<int>();
                        List<DataRow> rowsToDelete = new List<DataRow>();
                        course.Add(2);
                        course.Add(3);
                        course.Add(4);
                        course.Add(Qualification);
                        course.Add(6);
                        course.Add(7);
                        foreach (DataRow orow in dt.Rows)
                        {
                            int key = Convert.ToInt32(orow["Id"].ToString());
                            if (course.Contains(key))
                            {
                                rowsToDelete.Add(orow);
                            }
                        }

                        foreach (DataRow row in rowsToDelete)
                        {
                            dt.Rows.Remove(row);
                        }

                        dt.AcceptChanges();

                        break;
                    case 1:
                        DataTable filteredData1 = new DataTable();
                        List<int> course1 = new List<int>();
                        List<DataRow> rowsToDelete1 = new List<DataRow>();
                        course1.Add(1);
                        course1.Add(3);
                        course1.Add(4);
                        course1.Add(5);
                        course1.Add(6);
                        course1.Add(7);
                        foreach (DataRow orow in dt.Rows)
                        {
                            int key = Convert.ToInt32(orow["Id"].ToString());
                            if (course1.Contains(key))
                            {
                                rowsToDelete1.Add(orow);
                            }
                        }

                        foreach (DataRow row in rowsToDelete1)
                        {
                            dt.Rows.Remove(row);
                        }

                        dt.AcceptChanges();
                        break;
                }
                foreach (DataRow dr in dt.Rows)
                {
                    
                    MpData = new _MasterProgramList()
                    {
                        ID = Convert.ToString(dr["ID"]),
                        ProgramName = Convert.ToString(dr["ProgramName"])

                    };
                    MpdataList.Add(MpData);
                }
                return MpdataList;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        
        public List<BoardsList> getBoards(int UserID)
        {
            BoardsList boardsList = new BoardsList();
            List<BoardsList> boardsLists = new List<BoardsList>();
            DataSet Dset = new DataSet();
            try
            {
                using (SqlConnection Con = new SqlConnection(conString))
                {
                    SqlCommand Cmd = new SqlCommand("Usp_getBoardNames", Con);
                    Cmd.CommandType = CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("@UserID", Convert.ToInt32(UserID));
                    using (SqlDataAdapter SDA = new SqlDataAdapter(Cmd))
                    {
                        SDA.Fill(Dset);
                    }
                }
                if (Dset != null && Dset.Tables.Count > 0)
                {
                    if (Dset.Tables[0] != null && Dset.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow dr in Dset.Tables[0].Rows)
                        {
                            boardsList = new BoardsList()
                            {
                                ID = Convert.ToString(dr["Id"]),
                                BoardName = Convert.ToString(dr["BoardName"])

                            };
                            boardsLists.Add(boardsList);
                        }
                    }

                }
                return boardsLists;
            }
            catch (Exception ex)
            {
                return null;
            }
        }


        public List<_CityDetails> GetGetCityDetailsList(int StateID)
        {
            _CityDetails CityData = new _CityDetails();
            List<_CityDetails> CityDataList = new List<_CityDetails>();
            DataSet Dset = new DataSet();
            try
            {
                using (SqlConnection Con = new SqlConnection(conString))
                {
                    SqlCommand Cmd = new SqlCommand("GetCityDetailsByStateID", Con);
                    Cmd.CommandType = CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("@StateId", Convert.ToInt32(StateID));
                    using (SqlDataAdapter SDA = new SqlDataAdapter(Cmd))
                    {
                        SDA.Fill(Dset);
                    }
                }
                if (Dset != null && Dset.Tables.Count > 0)
                {
                    if (Dset.Tables[0] != null && Dset.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow dr in Dset.Tables[0].Rows)
                        {
                            CityData = new _CityDetails()
                            {
                                ID = Convert.ToString(dr["ID"]),
                                StateID = Convert.ToString(dr["StateID"]),
                                CityName = Convert.ToString(dr["CityName"])

                            };
                            CityDataList.Add(CityData);
                        }
                    }

                }
                return CityDataList;
            }
            catch (Exception ex)
            {
                return null;
            }
        }


        public DataSet getUserDataReporting(int UserId)
        {
            DataSet ds = new DataSet();

            try
            {
                using (SqlConnection Con = new SqlConnection(conString))
                {
                    SqlCommand Cmd = new SqlCommand("USP_userBasicInformation", Con);
                    Cmd.CommandType = CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("@UserID", Convert.ToInt32(UserId));
                    Con.Open();
                    //res = Cmd.ExecuteNonQuery();

                    using (SqlDataAdapter SDA = new SqlDataAdapter(Cmd))
                    {
                        SDA.Fill(ds);
                    }
                    //res = Convert.ToInt32(Response);
                }

                return ds;
            }
            catch (Exception ex)
            {
                return null;
            }
        }


       public DataTable InsertUserCourseSelection(string UserId,string institue, string study, string yop, 
           string university,string StateID,string DistID,string CityID, int update)
        {
            DataTable dt = new DataTable();

            try
            {
                using (SqlConnection Con = new SqlConnection(conString))
                {
                    SqlCommand Cmd = new SqlCommand("Usp_InsertUserCourseSelection", Con);
                    Cmd.CommandType = CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("@UserID", Convert.ToInt32(UserId));
                    Cmd.Parameters.AddWithValue("@NameoftheInstitue", Convert.ToString(institue));
                    Cmd.Parameters.AddWithValue("@BoardofStudy", Convert.ToString(study));
                    Cmd.Parameters.AddWithValue("@YOP", Convert.ToString(yop));
                    Cmd.Parameters.AddWithValue("@University", Convert.ToString(university));
                    Cmd.Parameters.AddWithValue("@StateID", Convert.ToInt32(StateID));
                    Cmd.Parameters.AddWithValue("@DistID ", Convert.ToInt32(DistID));
                    Cmd.Parameters.AddWithValue("@CityID ", Convert.ToInt32(CityID));
                    Cmd.Parameters.AddWithValue("@update", update);
                    Con.Open();
                    //res = Cmd.ExecuteNonQuery();

                    using (SqlDataAdapter SDA = new SqlDataAdapter(Cmd))
                    {
                        SDA.Fill(dt);
                    }
                    //res = Convert.ToInt32(Response);
                }
                return dt;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public DataTable InsertUserContactDetails(string UserId, string fathersname, string mothersname, string occupation, string mobilenumber,
            string email, string addr1, string addr2, string countryID, string stateID, string districtID, string pincode,int update)
        {
            DataTable dt = new DataTable();
            int res;
            try
            {
                using (SqlConnection Con = new SqlConnection(conString))
                {
                    SqlCommand Cmd = new SqlCommand("Usp_UserContactDetails1", Con);
                    Cmd.CommandType = CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("@UserID", Convert.ToInt32(UserId));
                    Cmd.Parameters.AddWithValue("@FatherName", Convert.ToString(fathersname));
                    Cmd.Parameters.AddWithValue("@MotherName", Convert.ToString(mothersname));
                    Cmd.Parameters.AddWithValue("@Occupation", Convert.ToString(occupation));
                    Cmd.Parameters.AddWithValue("@MobileNumber", Convert.ToString(mobilenumber));
                    Cmd.Parameters.AddWithValue("@EmailID", Convert.ToString(email));
                    Cmd.Parameters.AddWithValue("@Address1", Convert.ToString(addr1));
                    Cmd.Parameters.AddWithValue("@Address2", Convert.ToString(addr2));
                    Cmd.Parameters.AddWithValue("@CountryID", Convert.ToInt32(countryID));
                    Cmd.Parameters.AddWithValue("@StateID", Convert.ToInt32(stateID));
                    Cmd.Parameters.AddWithValue("@DistrictID", Convert.ToInt32(districtID));
                    Cmd.Parameters.AddWithValue("@Pincode", Convert.ToString(pincode));
                    Cmd.Parameters.AddWithValue("@Update", update);
                    Con.Open();
                    res = Cmd.ExecuteNonQuery();
                    using (SqlDataAdapter sda = new SqlDataAdapter(Cmd))
                    {
                        sda.Fill(dt);
                    }
                        Con.Close();
                }
                
            }
            catch (Exception ex)
            {
                return null;
            }
            return dt;
        }

        public PrevEduDetails getPrevDetails(string UserId)
        {
            PrevEduDetails objPrvDetails = new PrevEduDetails();
            DataTable dt = new DataTable();
            try
            {
                using (SqlConnection Con = new SqlConnection(conString))
                {
                    SqlCommand Cmd = new SqlCommand("USP_getPrevDetails", Con);
                    Cmd.CommandType = CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("@UserID", UserId);
                    Con.Open();
                    using (SqlDataAdapter SDA = new SqlDataAdapter(Cmd))
                    {
                        SDA.Fill(dt);
                    }

                }
                objPrvDetails.CollegeName = dt.Rows[0]["CollegeName"].ToString();
                objPrvDetails.BoardID = Convert.ToInt32(dt.Rows[0]["BoardName"].ToString());
                objPrvDetails.yop = dt.Rows[0]["YOP"].ToString();
                objPrvDetails.StateID = Convert.ToInt32(dt.Rows[0]["StateID"].ToString());
                objPrvDetails.DistID = Convert.ToInt32(dt.Rows[0]["DistID"].ToString());
                objPrvDetails.CityID = Convert.ToInt32(dt.Rows[0]["CityID"].ToString());
                return objPrvDetails;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public bool InsertUserPersonalDetails(string UserId,string gender, string dob, string adharnum,
            string category, string nationality, string PR, string UP, string AboutGitam,string FirstName,string LastName, int update)
        {
            
            int res = 0;
          
            try
            {
                using (SqlConnection Con = new SqlConnection(conString))
                {
                    SqlCommand Cmd = new SqlCommand("USP_UserPersonalDetails", Con);
                    Cmd.CommandType = CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("@UserID", Convert.ToInt32(UserId));
                    Cmd.Parameters.AddWithValue("@Gender", Convert.ToString(gender));
                    Cmd.Parameters.AddWithValue("@DateofBirth", Convert.ToString(dob));
                    Cmd.Parameters.AddWithValue("@AadharCardNumber", Convert.ToString(adharnum));
                    Cmd.Parameters.AddWithValue("@Category", Convert.ToString(category));
                    Cmd.Parameters.AddWithValue("@Nationality", Convert.ToInt32(nationality));
                    Cmd.Parameters.AddWithValue("@PermenantResidence", Convert.ToInt32(PR));
                    Cmd.Parameters.AddWithValue("@UserPhoto", Convert.ToString(UP));
                    Cmd.Parameters.AddWithValue("@AboutGitam", Convert.ToString(AboutGitam));
                    Cmd.Parameters.AddWithValue("@FirstName", FirstName);
                        Cmd.Parameters.AddWithValue("@LastName", LastName);
                    Cmd.Parameters.AddWithValue("@Update", update);
                    Con.Open();
                    res = Cmd.ExecuteNonQuery();
                    /*
                    using (SqlDataAdapter SDA = new SqlDataAdapter(Cmd))
                    {
                        SDA.Fill(dt);
                    }*/
                    //res = Convert.ToInt32(Response);
                }

                
            }
            catch (Exception ex)
            {
                return false;
            }

            if(res>0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public DataTable RegistrationProcess(string Name, string Email, string Password, string Mobile,int residentVal, string StateID, string CityID, string AuthCode)
        {
            DataTable dt = new DataTable();
            int res = 0;
            try
            {
                using (SqlConnection Con = new SqlConnection(conString))
                {
                    SqlCommand Cmd = new SqlCommand("Usp_InsertUserDetails", Con);
                    Cmd.CommandType = CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("@Name", Convert.ToString(Name));
                    Cmd.Parameters.AddWithValue("@Email", Convert.ToString(Email));
                    Cmd.Parameters.AddWithValue("@Password", Convert.ToString(Password));
                    Cmd.Parameters.AddWithValue("@Mobile", Convert.ToString(Mobile));
                    Cmd.Parameters.AddWithValue("@ResidentType", residentVal);
                    Cmd.Parameters.AddWithValue("@StateID", Convert.ToInt32(StateID));
                    Cmd.Parameters.AddWithValue("@CityID", Convert.ToInt32(CityID));
                    Cmd.Parameters.AddWithValue("@AuthCode", Convert.ToString(AuthCode));
                    Cmd.Parameters.AddWithValue("@Role", "user");
                    Cmd.Parameters.AddWithValue("@IsActive", 1);
                    Con.Open();
                    //res = Cmd.ExecuteNonQuery();

                    using (SqlDataAdapter SDA = new SqlDataAdapter(Cmd))
                    {
                        SDA.Fill(dt);
                    }
                    //res = Convert.ToInt32(Response);
                }
                
                return dt;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public DataTable ValidateLogin(string UserName, string Password)
        {
            DataTable Dt = new DataTable();
            try
            {
                using (SqlConnection Con = new SqlConnection(conString))
                {
                    SqlCommand Cmd = new SqlCommand("USP_ValidateLogin", Con);
                    Cmd.CommandType = CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("@UserName", Convert.ToString(UserName));
                    Cmd.Parameters.AddWithValue("@Password", Convert.ToString(Password));
                    using (SqlDataAdapter SDA = new SqlDataAdapter(Cmd))
                    {
                        SDA.Fill(Dt);
                    }
                }
                return Dt;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public CurrentEduDetailsDisplay getUserCurrentEducationDetails(int UserId)
        {
            //List<CurrentEduDetailsDisplay> objCurrE = new List<CurrentEduDetailsDisplay>();
            CurrentEduDetailsDisplay Curredudata = new CurrentEduDetailsDisplay();
            DataTable Dt = new DataTable();
            try
            {
                using (SqlConnection Con = new SqlConnection(conString))
                {
                    SqlCommand Cmd = new SqlCommand("USP_getUserCurrentEducationDetails", Con);
                    Cmd.CommandType = CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("@UserID", UserId);
                    Con.Open();
                    using (SqlDataAdapter SDA = new SqlDataAdapter(Cmd))
                    {
                        SDA.Fill(Dt);
                    }

                }
                Curredudata.ProgramName= Convert.ToString(Dt.Rows[0]["MasterProgram"].ToString());
                Curredudata.SubProgramName = Convert.ToString(Dt.Rows[0]["SubProgram"].ToString());
                Curredudata.CampusLocation = Convert.ToString(Dt.Rows[0]["CampusLocation"].ToString());
                      

                return Curredudata;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public DataTable getUserPassword(string EmailID)
        {
            DataTable dt = new DataTable();
            try
            {
                using (SqlConnection Con = new SqlConnection(conString))
                {
                    SqlCommand Cmd = new SqlCommand("USP_getUserPassword", Con);
                    Cmd.CommandType = CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("@EmailID", EmailID);
                    Con.Open();
                    using (SqlDataAdapter SDA = new SqlDataAdapter(Cmd))
                    {
                        SDA.Fill(dt);
                    }
                    Con.Close();
                }
                if(dt.Rows[0]["Password"].ToString() != "")
                {
                    return dt;
                }
                else
                {
                    return null;
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public bool Section1Details(string EDetails, string Group, string Campus, int UserID)
        {
            int res = 0;
            try
            {
                using (SqlConnection Con = new SqlConnection(conString))
                {
                    SqlCommand Cmd = new SqlCommand("Usp_UpdateSec1UserDetails", Con);
                    Cmd.CommandType = CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("@ID", UserID);
                    Cmd.Parameters.AddWithValue("@EDetails", Convert.ToInt32(EDetails));
                    Cmd.Parameters.AddWithValue("@Group", Convert.ToInt32(Group));
                    Cmd.Parameters.AddWithValue("@Campus", Campus);
                    Con.Open();
                    res = Cmd.ExecuteNonQuery();
                    Con.Close();
                }

                if(res>0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public bool Section2Details(string MasterProgram, string Course, string Stream, string ID)
        {
            int res = 0;
            try
            {
                using (SqlConnection Con = new SqlConnection(conString))
                {
                    SqlCommand Cmd = new SqlCommand("Usp_UpdateSec2UserDetails", Con);
                    Cmd.CommandType = CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("@ID", Convert.ToInt32(ID));
                    Cmd.Parameters.AddWithValue("@MasterProgram", Convert.ToInt32(MasterProgram));
                    Cmd.Parameters.AddWithValue("@Course", Convert.ToInt32(Course));
                    Cmd.Parameters.AddWithValue("@Stream", Convert.ToInt32(Stream));
                    Con.Open();
                    res = Cmd.ExecuteNonQuery();
                    //res = Convert.ToInt32(Response);
                }

                if (res > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        public DataTable AutoAuthentication(string AuthKey)
        {
            DataTable Dt = new DataTable();
            try
            {
                using (SqlConnection Con = new SqlConnection(conString))
                {
                    SqlCommand Cmd = new SqlCommand("USP_AutoAuthentication", Con);
                    Cmd.CommandType = CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("@AuthKey", Convert.ToString(AuthKey));
                    using (SqlDataAdapter SDA = new SqlDataAdapter(Cmd))
                    {
                        SDA.Fill(Dt);
                    }
                }
                return Dt;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public string GetCurrentPassword(dynamic UserId)
        {
            DataTable Dt = new DataTable();
            try
            {
                using (SqlConnection Con = new SqlConnection(conString))
                {
                    SqlCommand Cmd = new SqlCommand("Usp_GetCurrentPassword", Con);
                    Cmd.CommandType = CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("@UseId", Convert.ToString(UserId));
                    using (SqlDataAdapter SDA = new SqlDataAdapter(Cmd))
                    {
                        SDA.Fill(Dt);
                    }
                }
                return Dt.Rows[0]["Password"].ToString();
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public DataTable getUserInfo(int UserId)
        {
            DataTable dt = new DataTable();
            try
            {
                using (SqlConnection Con = new SqlConnection(conString))
                {
                    SqlCommand Cmd = new SqlCommand("Usp_UpdatePassword", Con);
                    Cmd.CommandType = CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("@UseId", UserId);
                    Con.Open();
                    using (SqlDataAdapter SDA = new SqlDataAdapter(Cmd))
                    {
                        SDA.Fill(dt);
                    }
                    Con.Close();
                }
                return dt;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public int UpdatePassword(dynamic UserId,string newPassword)
        {
            int status = 0;
            try
            {
                using (SqlConnection Con = new SqlConnection(conString))
                {
                    SqlCommand Cmd = new SqlCommand("Usp_UpdatePassword", Con);
                    Cmd.CommandType = CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("@UseId", UserId);
                    Cmd.Parameters.AddWithValue("@newPassword", Convert.ToString(newPassword));
                    Con.Open();
                   status = Cmd.ExecuteNonQuery();
                    Con.Close();
                }
                return status;
            }
            catch (Exception ex)
            {
                return status;
            }
        }

        public List<ApplicationCourseDetails> deleteUserCourse(string ApplicationID,int UserId)
        {
            List<ApplicationCourseDetails> courseDetails = new List<ApplicationCourseDetails>();
            DataSet Dset = new DataSet();
            try
            {
                using (SqlConnection Con = new SqlConnection(conString))
                {
                    SqlCommand Cmd = new SqlCommand("deleteCourse", Con);
                    Cmd.CommandType = CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("@appid", Convert.ToString(ApplicationID));
                    Cmd.Parameters.AddWithValue("@UserId", UserId);
                    using (SqlDataAdapter SDA = new SqlDataAdapter(Cmd))
                    {
                        SDA.Fill(Dset);
                    }
                }
                if (Dset != null && Dset.Tables.Count > 0)
                {
                    if (Dset.Tables[0] != null && Dset.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow dr in Dset.Tables[0].Rows)
                        {
                            ApplicationCourseDetails AppIdData = new ApplicationCourseDetails()
                            {
                                ApplicationID = Convert.ToString(dr["Appid"]),
                                CourseName = Convert.ToString(dr["ProgramName"]),
                                Amount = Convert.ToDouble(dr["amount"])
                            };
                            courseDetails.Add(AppIdData);
                        }
                    }

                }
                return courseDetails;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public List<ApplicationCourseDetails> InsertCourseDetails(dynamic UserId, string emailID,string courseids)
        {
            List<ApplicationCourseDetails> objCourseDetails = new List<ApplicationCourseDetails>();
            DataSet Dset = new DataSet();
            try
            {
                using (SqlConnection Con = new SqlConnection(conString))
                {
                    SqlCommand Cmd = new SqlCommand("InsertCourseDetails", Con);
                    Cmd.CommandType = CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("@UserId", UserId);
                    Cmd.Parameters.AddWithValue("@EmailID", emailID);
                    Cmd.Parameters.AddWithValue("@CourseIds", courseids);
                    Con.Open();
                    using(SqlDataAdapter SDA = new SqlDataAdapter(Cmd))
                    {
                        SDA.Fill(Dset);
                    }
                    Con.Close();
                }
                if (Dset != null && Dset.Tables.Count > 0)
                {
                    if (Dset.Tables[0] != null && Dset.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow dr in Dset.Tables[0].Rows)
                        {
                            ApplicationCourseDetails AppIdData = new ApplicationCourseDetails()
                            {
                                ApplicationID = Convert.ToString(dr["Appid"]),
                                CourseName = Convert.ToString(dr["ProgramName"]),
                                Amount = Convert.ToDouble(dr["amount"])
                            };
                            objCourseDetails.Add(AppIdData);
                        }
                    }

                }
                return objCourseDetails;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public DataSet GetPersonalDetailsPage()
        {
            DataSet ds = new DataSet();
            try
            {
                using (SqlConnection Con = new SqlConnection(conString))
                {
                    SqlCommand Cmd = new SqlCommand("Usp_GetAllPersonalPageDetails", Con);
                    Cmd.CommandType = CommandType.StoredProcedure;
                    Con.Open();
                    using (SqlDataAdapter SDA = new SqlDataAdapter(Cmd))
                    {
                        SDA.Fill(ds);
                    }
                    Con.Close();
                }
                return ds;
            }
            catch(Exception ex)
            {
                return null;
            }
            
        }

        public DataTable getUserPersonalDetails(int Userid)
        {
            DataTable dt = new DataTable();
            try
            {
                using (SqlConnection Con = new SqlConnection(conString))
                {
                    SqlCommand Cmd = new SqlCommand("USP_getPersonalDetails", Con);
                    Cmd.CommandType = CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("@UserId", Userid);
                    Con.Open();
                    using (SqlDataAdapter SDA = new SqlDataAdapter(Cmd))
                    {
                        SDA.Fill(dt);
                    }
                    Con.Close();
                }
                return dt;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public DataTable getUserContactDetails(int Userid)
        {
            DataTable dt = new DataTable();
            try
            {
                using (SqlConnection Con = new SqlConnection(conString))
                {
                    SqlCommand Cmd = new SqlCommand("USP_getContactDetails", Con);
                    Cmd.CommandType = CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("@UserId", Userid);
                    Con.Open();
                    using (SqlDataAdapter SDA = new SqlDataAdapter(Cmd))
                    {
                        SDA.Fill(dt);
                    }
                    Con.Close();
                }
                return dt;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public int UpdateUserPersonalDetails(int UserId)
        {
            DataTable dt = new DataTable();
            int status;
            try
            {
                using (SqlConnection Con = new SqlConnection(conString))
                {
                    SqlCommand Cmd = new SqlCommand("USP_getPersonalDetails", Con);
                    Cmd.CommandType = CommandType.StoredProcedure;
                    Cmd.Parameters.AddWithValue("@UserId", UserId);
                    Con.Open();
                    status = Cmd.ExecuteNonQuery();
                    Con.Close();
                }
                return status;
            }
            catch (Exception ex)
            {
                return -1;
            }
        }

    }
}