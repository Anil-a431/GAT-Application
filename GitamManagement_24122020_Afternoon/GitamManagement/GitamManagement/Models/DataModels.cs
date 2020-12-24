using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GitamManagement.Models
{
    public class GetOnloadDetails
    {
        public List<_StateList> StateList { get; set; }
        public List<_MasterProgramList> MasterProgramList { get; set; }
        public List<_CampusList> CampusList { get; set; }
    }

    public class PrevEduDetails
    {
        public string CollegeName;
        public int BoardID;
        public string yop;
        public int StateID;
        public int DistID;
        public int CityID;
    }


    public class CurrentEduDetailsDisplay
    {
        public string ProgramName;
        public string SubProgramName;
        public string CampusLocation;
    }

    public class DistNames
    {
        public string DistID;
        public string DNames;
    }

    public class CityDetailsDistID
    {
        public string cityID;
        public string cityNames;
    }

    public class ContactDetails
    {
        public string ID { get; set; }
        public string UserId { get; set; }
        public string FatherName { get; set; }
        public string MotherName { get; set; }
        public string Occupation { get; set; }
        public string MobileNumber { get; set; }
        public string EmailID { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string Country { get; set; }
        public string State { get; set; }
        public string District { get; set; }
        public string Pincode { get; set; }
    }
    public class _MasterProgramList
    {
        public string ID { get; set; }
        public string ProgramName { get; set; }
    }
    public class _StateList
    {
        public string ID { get; set; }
        public string StateName { get; set; }
    }
    public class _CampusList
    {
        public string ID { get; set; }
        public string CampusLocation { get; set; }
    }

    public class _SubProgramDetails
    {
        public string ID { get; set; }
        public string MasterProgramId { get; set; }
        public string ProgramName { get; set; }
    }
    public class _SubProgramDetails1
    {
        public string ID { get; set; }
        public string MasterProgramId { get; set; }
        public string ProgramName { get; set; }

        public List<ApplicationCourseDetails> Courses { get; set; }
    }

    public class _ProgramStreamDetails
    {
        public string ID { get; set; }
        public string SubProgramId { get; set; }
        public string ProgramName { get; set; }
    }

    public class _CityDetails
    {
        public string ID { get; set; }
        public string StateID { get; set; }
        public string CityName { get; set; }
    }

    public class ApplicationCourseDetails
    {
        public string ApplicationID { get; set; }
        public string CourseName { get; set; }
        public double Amount { get; set; }
        public int CourseId { get; set; }

    }
    public class CountryList
    {
        public string ID { get; set; }
        public string CountryName { get; set; }
    }

    public class BoardsList
    {
        public string ID { get; set; }
        public string BoardName { get; set; }
    }
    public class StateList
    {
        public string ID { get; set; }
        public string StateName { get; set; }
    }

    public class DistrictList
    {
        public string ID { get; set; }
        public string DistrictName { get; set; }
    }
    public class DataModels
    {
    }
}