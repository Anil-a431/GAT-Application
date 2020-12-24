<%@ Page Title="" Language="C#" MasterPageFile="~/PL/UserDashboard.Master" AutoEventWireup="true" CodeBehind="CourseDisplayPage.aspx.cs" Inherits="GitamManagement.PL.CourseDisplayPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../Assets/Css/example-styles.css" />
    <link rel="stylesheet" href="../Assets/Css/style.default.css" />
    <link rel="stylesheet" href="../Assets/Css/font-awesome.min.css">
       <!-- Bootstrap Js -->
        <script src="../Assets/Js/jquery-3.5.1.min.js"></script>
        <script src="../Assets/Js/bootstrap.min.js"></script>
         <script src="../Assets/Js/Custom.js"></script>
         <script src="../Assets/Js/jquery.multi-select.min.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,700">
    <link rel="shortcut icon" href="img/favicon.ico">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-lg-10">
                  <div class="card">
                   
                    <div class="card-header d-flex align-items-center">
                      <h3 class="h4" style="text-align:center">Your Details are Submitted Successfully</h3>
                    </div>
                    <div class="card-body">
                      <div class="form-group" style="text-align:center">       
                          <input type="submit" id="btnViewDetails" value="View Application Form" class="btn btn-primary">
                        </div>
               </div>
              </div>
        </div>
    <script>
      
    </script>
</asp:Content>
