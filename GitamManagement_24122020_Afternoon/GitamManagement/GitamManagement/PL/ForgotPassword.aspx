<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="GitamManagement.PL.ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>GAT Online Application 2021 | GITAM Deemed to be University</title>
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="../Assets/Css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="../Assets/Css/font-awesome.min.css">
    <!-- Fontastic Custom icon font-->
    <link rel="stylesheet" href="css/fontastic.css">
    <!-- Google fonts - Poppins -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,700">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="../Assets/Css/style.default.css">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="../Assets/Css/Custom.css">

        <link rel="stylesheet" href="../intl-tel-input-master/build/css/intlTelInput.min.css">
    <style>
            .md-radio-inline
            {
                display: inline-block;
            }
          
            .wrap {
                width: 100%;
                left: 0;
                margin: 0 auto;
            }

            /* select starting stylings ------------------------------*/
            .select {
                
                position: relative;
               width: 100%;
            }

            .select-text {
                position: relative;
               
                background-color: transparent;
                width: 100%;
                padding: 10px 10px 10px 0;
                
                border-radius: 0;
                border: none;
                border-bottom: 1px solid rgba(0,0,0, 0.12);
            }

                /* Remove focus */
                .select-text:focus {
                    outline: none;
                    border-bottom: 1px solid rgba(0,0,0, 0);
                }

            /* Use custom arrow */
            .select .select-text {
                appearance: none;
                -webkit-appearance: none
            }

            .select:after {
                position: absolute;
                top: 18px;
                right: 10px;
                /* Styling the down arrow */
                width: 0;
                height: 0;
                padding: 0;
                content: '';
                border-left: 6px solid transparent;
                border-right: 6px solid transparent;
                border-top: 6px solid rgba(0, 0, 0, 0.12);
                pointer-events: none;
            }


            /* LABEL ======================================= */
            .select-label {
                position: absolute;
                pointer-events: none;
                left: 0;
                top: 10px;
                transition: 0.2s ease all;
            }

            /* active state */
            .select-text:focus ~ .select-label, .select-text:valid ~ .select-label {
                top: -20px;
                transition: 0.2s ease all;
                font-size: 14px;
            }

            /* BOTTOM BARS ================================= */
            .select-bar {
                position: relative;
                display: block;
                width: 100%;
            }

                .select-bar:before, .select-bar:after {
                    content: '';
                    height: 1px;
                    width: 0;
                    bottom: 1px;
                    position: absolute;
                    background: #C60021;
                    transition: 0.2s ease all;
                }

                .select-bar:before {
                    left: 50%;
                }

                .select-bar:after {
                    right: 50%;
                }

            /* active state */
            .select-text:focus ~ .select-bar:before, .select-text:focus ~ .select-bar:after {
                width: 50%;
            }

            /* HIGHLIGHTER ================================== */
            .select-highlight {
                position: absolute;
                height: 60%;
                width: 100px;
                top: 25%;
                left: 0;
                pointer-events: none;
                opacity: 0.5;
            }
            .iti{
                width:100%;
            }
            

        </style>
</head>
<body>
   
        <div>
            <div class="page login-page">
        <div class="container d-flex align-items-center">
            <div class="form-holder has-shadow">
                <div class="row">
                    <!-- Logo & Information Panel-->
                    <div class="col-lg-7">
                        <div class="info d-flex">
                            <div class="content">

                                <h2 style="font-size:30px;" class="text-center">GAT Online Application 2021</h2>
                                <h4 style="line-height:1.4">Application for admission to  UG & PG Programs of Architecture, Basic Sciences, Engineering, Humanities, Law, Management, Nursing, Paramedical and Pharmacy offered at GITAM Campuses</h4>
                                <h4 >Fee:</h4>
                                <ul>
                                    <li>Application fee: <b>Rs. 800</b> (for all courses)</li>

                                   
                                </ul>
                                <p>
                                    <h4>Important Instructions</h4>
                                    <ul>
                                        <li>Carefully read GAT-2021 information, before proceeding to apply online.  Click here.</li>
                                        <li><a href="https://gat.gitam.edu/" class="text-white" target="_blank">Click here</a> to read all the instructions and eligibility criteria for admission test before proceeding to fill the online application form</li>
                                        <li>For queries call us at <b>8880884000</b> or drop a mail at <a class="text-white" href="mailto: gat@gitam.edu"><b>gat@gitam.edu</b></a> </li>
                                    </ul>

                                </p>

                                
                            </div>
                        </div>
                    </div>
                    <!-- Form Panel    -->
                    <div class="col-lg-5 bg-white right_login">

                        <div class="form  align-items-center">
                            <img src="../Assets/Images/GITAM-logo.png">
                            <!--  <hr> -->
                            <ul class="nav nav-tabs text-center" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="home-tab" data-toggle="tab" 
                                        href="#forgotPassword" role="tab"  aria-controls="home" aria-selected="true">Forgot Password</a>
                                </li>
                            </ul>
                            <div class="tab-content" id="myTabContent">
                                <div class="tab-pane fade show active" id="forgotPassword" role="tabpanel" aria-labelledby="home-tab">
                                    <div class="content">
                                        <form method="post" runat="server" class="form-validate mb-2">
                                            <div class="form-group">
                                                <%--<asp:TextBox ID="loginEmail" runat="server" data-msg="Please enter your username" 
                                                    class="input-material"></asp:TextBox>--%>
                                                <input type="text"  id="loginEmail" data-msg="Please enter your username" 
                                                    class="input-material" />
                                                <label for="login-EmailID" class="label-material">Enter Your EmailID</label>
                                            </div>
                                            <button id="btnForgotPassword" class="btn btn-primary">Forgot Password</button>
                                            <%--<asp:Button runat="server" ID="btnForgotPassword" 
                                               Text="Forgot Password" class="btn btn-primary" />--%>
                                            <!-- This should be submit button but I replaced it with <a> for demo purposes-->
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
        </div>
   
    <!-- JavaScript files-->
    <script src="../Assets/Js/jquery.min.js"></script>
    <script src="Assets/Js/bootstrap.min.js"></script>
    
    <script src="../Assets/Js/popper.min.js"> </script>
    <script src="../Assets/Js/jquery.cookie.js"> </script>

    <script src="../Assets/Js/jquery.validate.min.js"></script>
    <script src="../Assets/Js/charts-home.js"></script>
    <script src="../Assets/Js/charts-custom.js"></script>
    <!-- Main File-->
    <script src="../Assets/Js/front.js"></script>
    <script src="Assets/Js/Custom.js"></script>
    <!-- Main File-->
    
  <script src="intl-tel-input-master/build/js/intlTelInput.min.js"></script>
    <script>
        $('#btnForgotPassword').click(function () {
            debugger;
                $.ajax({
                    type: "POST",
                    url: "../GitamManagementService.asmx/getUserPassword",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        'EmailID': $('#loginEmail').val(),
                    }),
                    success: function (data) {
                        if (data.d == "Successful") {
                            setTimeout(function () { alert('Your Password has been sent to your Registered EmailID'); }, 5000);
                            window.location.href = "/Index";
                            return;
                        }   
                        else {
                            setTimeout(function () { alert('Your EmailID is not registered with GITAM'); }, 2000);
                            window.location.href = '/Index';
                            return;
                        }
                    }
                });
        });
    </script>
</body>
</html>
