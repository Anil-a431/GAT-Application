<%@ Page Title="" Language="C#" MasterPageFile="~/PL/UserDashboard.Master" AutoEventWireup="true" CodeBehind="MyPayments.aspx.cs" Inherits="GitamManagement.PL.MyPayments1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <header class="page-header">
        <div class="container-fluid">
            <h2 class="no-margin-bottom">Payments</h2>
        </div>
    </header>
    <section class="forms">
        <div class="container-fluid " runat="server" id="success">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="card">
                    <h1>Success</h1>
                    <p class="text-center payment"><strong>Dear Applicant We Have Recieved Your Payment For the Applied Courses<br />
                       Thank You !!!</strong></p>
                </div>
                </div>
                
            </div>
            <div>
                <div class="row">
                    <div class="col-lg-6 text-right">
                        <p><strong>Click Here to Fill the Remaining Details</strong></p>
                    </div>
                    <div class="col-lg=6 text-right" >
                        <%--<button type="button" id="btnNext" class="btn btn-primary">Next</button>--%>
                        <asp:Button runat="server" ID="btnNext" Text="Next"  class="btn btn-primary" OnClick="nxtPage_Click" />
                    </div>
                </div>
            </div>
        </div>
           <div class="container-fluid " runat="server" id="failure">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="card">
                    <h1>Failure</h1>
                    <p class="text-center payment"><strong>Dear Applicant Your Transaction has failed<br />
                       Please try again !!!<br />
                        Thank you !!!
                                                   </strong></p>
                </div>
                </div>
                
            </div>
            <div>
                <div class="row">
                    <div class="col-lg-6 text-right">
                        <p><strong></strong></p>
                    </div>
                    <div class="col-lg=6 text-right" >
                        <asp:Button ID="btnRepay" runat="server" Text="Repay" OnClick="btnRepay_Click" class="btn btn-primary" />
                       <%-- <button type="button" id="btnRepay" class="btn btn-primary">Next</button>--%>
                    </div>
                </div>
            </div>
        </div>

    </section>
    <script src="../Assets/Js/jquery.min.js"></script>
    <script src="../Assets/Js/popper.min.js"> </script>
    <script src="../Assets/Js/bootstrap.min.js"></script>
    <script src="../Assets/Js/jquery.cookie.js"> </script>
   
    <script src="../Assets/Js/jquery.validate.min.js"></script>
    <script src="../Assets/Js/charts-home.js"></script>
     <script src="../Assets/Js/charts-custom.js"></script>
    <script src="../Assets/Js/Custom.js"></script>
    <script src="../Assets/Js/multiselect.js"></script>
    <!-- Main File-->
    <script src="../Assets/Js/front.js"></script>

</asp:Content>
