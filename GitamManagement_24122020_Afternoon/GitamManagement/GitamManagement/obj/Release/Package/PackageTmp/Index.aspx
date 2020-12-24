<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="GitamManagement.Index" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>GAT Online Application 2021 | GITAM Deemed to be University</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="robots" content="all,follow">
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
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.min.css" id="theme-styles">
    <!-- Favicon-->
    <link rel="shortcut icon" href="img/favicon.ico">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
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
    <div class="page login-page">
        <div class="container d-flex align-items-center">
            <div class="form-holder has-shadow">
                <div class="row">
                    <!-- Logo & Information Panel-->
                    <div class="col-lg-7">
                        <div class="info d-flex">
                            <div class="content">

                                <h2 style="font-size:30px;" class="text-center">GAT Online Application 2021</h2>
                                <h4 class="mb-5" >Application for admission to  UG & PG Programs of Architecture, Basic Sciences, Engineering, Humanities, Law, Management, Nursing, Paramedical and Pharmacy offered at GITAM Campuses</h4>
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
                            <img src="Assets/Images/GITAM-logo.png">
                            <!--  <hr> -->
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#login" role="tab" aria-controls="home" aria-selected="true">Login</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#register" role="tab" aria-controls="profile" aria-selected="false">Register</a>
                                </li>

                            </ul>
                            <div class="tab-content" id="myTabContent">
                                <div class="tab-pane fade show active" id="login" role="tabpanel" aria-labelledby="home-tab">
                                    <div class="content">
                                        <form method="post" runat="server" class="form-validate mb-2">
                                            <div class="form-group">
                                                <asp:TextBox ID="loginEmail" runat="server" data-msg="Please enter your username" class="input-material"></asp:TextBox>
                                                <label for="login-username" class="label-material">User Name</label>
                                            </div>
                                            <div class="form-group">
                                                <asp:TextBox ID="loginPassword" runat="server" TextMode="Password" data-msg="Please enter your password" class="input-material"></asp:TextBox>
                                                <label for="login-password" class="label-material">Password</label>
                                            </div>
                                            <asp:Button runat="server" ID="loginBtn" OnClick="validateUser" Text="Login" class="btn btn-primary" />
                                            <!-- This should be submit button but I replaced it with <a> for demo purposes-->
                                        </form>
                                        <a href="ForgotPassword" class="forgot-pass">Forgot Password?</a>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="register" role="tabpanel" aria-labelledby="profile-tab">

                                    <div class="content">
                                        <form method="post" class="form-validate mb-2" id="reg-form-Validate">
                                            <div class="form-group">
                                                <input type="text" name="name" pattern="^[a-zA-Z]{2,35}$" id="Name" 
                                                    autocomplete="off" class="input-material" required data-msg="Please Enter Only Alphabets" />
                                                <label for="login-username" class="label-material">Full Name(As Per 10th Memo)*</label>
                                            </div>
                                            <div class="form-group">
                                                <input type="text" name="Email" id="Email"

                                                    required data-msg="Please enter your EmailID" class="input-material" />
                                                <label for="login-password" class="label-material">Email Address*(Ex:abc@abc.com)</label>
                                            </div>
                                                <div class="mb-4">
                                                   
                                                    <div class="radio md-radio-inline mr-4" >
                                                        <input id="resident" type="radio" runat="server" onchange="show2()" value="1" name="g2" checked>
                                                        <label for="resident">Resident Indian</label>
                                                    </div>
                                                    <div class="radio md-radio-inline">
                                                        <input id="nonresident" runat="server" onchange="show1()" type="radio" value="2" name="g2">
                                                        <label for="nonresident">Non-Resident Indian</label>
                                                    </div>
                                                </div>
                                                
                                            <div class="form-group">
                                                 <label for="Mobile" class="label-material">Mobile number*</label>
                                                <input type="tel" pattern="^[6-9][0-9]{9}$" name="mobile" id="Mobile" 
                                                    data-msg="Please Enter 10 Digit Mobile Number"required  class="input-material outofIndia" />
                                                <%--<input id="login-mobile" type="text" name="loginmobile" required data-msg="Please enter your password" class="input-material">--%>
                                               
                                            </div>
                                            
                                            <div style="position:relative;" class="mb-3 residentIndian">
                                                <div class="wrap">
                                                    <div class="select">
                                                        <select name="state_id" id="stateID" class="select-text"
                                                             data-label="Select State*">
                                                            <option selected="selected">Select State*</option>
                                                        </select>
                                                        <span class="select-highlight"></span>
                                                        <span class="select-bar"></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div style="position: relative;" class="mb-4 residentIndian" >
                                                <div class="wrap">
                                                    <div class="select">

                                                        <select name="city_id" id="CityId" class="select-text"
                                                            data-label="Select City*">
                                                            <option value="" selected="selected">Select City*</option>
                                                        </select>
                                                        <span class="select-highlight"></span>
                                                        <span class="select-bar"></span>

                                                    </div>
                                                </div>
                                                </div>
                                            <div class="form-group form-check">
                                                <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                                
                                                <p style="overflow:scroll;height:75px;"><small>By clicking the 'Submit' button, 
                                                    you consent to receive communication from us such as our newsletters, updates, 
                                                    well as new programme releases, etc and GITAM University is committed to protecting the privacy of the visitor and user's personal
                                                    information to the GITAM website. The information you provide will not be sold, 
                                                    rented, given away or traded to any third party not engaged by GITAM to perform 
                                                    authorized services. 
                                                   You may opt-out at any time</small></p>
                                            </div>
                                                <button type="button" id="registerBtn" class="btn btn-primary">Register</button>
                                           
                                        </form>
                                        <%--<a href="#" class="forgot-pass">Forgot Password?</a>--%>
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.min.js"></script>
    <!-- Main File-->
    
  <script src="intl-tel-input-master/build/js/intlTelInput.min.js"></script>
    <script>
        var input = document.querySelector("#Mobile");
        window.intlTelInput(input, {
            initialCountry: "auto",
            geoIpLookup: function (callback) {
                $.get('https://ipinfo.io', function () { }, "jsonp").always(function (resp) {
                    var countryCode = (resp && resp.country) ? resp.country : "IN";
                    callback(countryCode);
                });
            },
            // allowDropdown: false,
            // autoHideDialCode: false,
            // autoPlaceholder: "off",
            // dropdownContainer: document.body,
            // excludeCountries: ["us"],
            // formatOnDisplay: false,
            // geoIpLookup: function(callback) {
            //   $.get("http://ipinfo.io", function() {}, "jsonp").always(function(resp) {
            //     var countryCode = (resp && resp.country) ? resp.country : "";
            //     callback(countryCode);
            //   });
            // },
            // hiddenInput: "full_number",
            // initialCountry: "auto",
            // localizedCountries: { 'de': 'Deutschland' },
            // nationalMode: false,
            // onlyCountries: ['us', 'gb', 'ch', 'ca', 'do'],
            // placeholderNumberType: "MOBILE",
            // preferredCountries: ['cn', 'jp'],
             separateDialCode: true,
            utilsScript: "intl-tel-input-master/build/js/utils.js",
        });

        $(document).ready(function () {
            //debugger;
            $.ajax({
                type: "POST",
                url: "../GitamManagementService.asmx/GetStateLists1",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    //console.log(data.d);
                    for (var i = 0; i < data.d.length; i++) {
                        var row_State = data.d[i];
                        $("#stateID").append(new Option(row_State.StateName, row_State.ID));
                    }
                }
            });
        });
        $('#stateID').change(function () {
            if ($(this).val() != "") {
                $.ajax({
                    type: "POST",
                    url: "../GitamManagementService.asmx/GetDistrictLists",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ 'stateID': $('#stateID :selected').val() }),
                    success: function (data) {
                        $('#CityId').empty();
                        for (var i = 0; i < data.d.length; i++) {
                            var row_District = data.d[i];
                            $("#CityId").append(new Option(row_District.DistrictName, row_District.ID));
                        }
                    }
                });
            }
        });

        $("#registerBtn").click(function () {
            if ($("#Name").val() != "" && $("#Email").val() != "" && $("#Mobile").val() != "") {
                $.ajax({
                    type: "POST",
                    url: "GitamManagementService.asmx/RegisterUserDetails",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        'Name': $('#Name').val(),
                        'Email': $('#Email').val(),
                        'Mobile': $('#Mobile').val(),
                        'residentVal': $('input[name=g2]:checked', '#reg-form-Validate').val(),
                        'stateID': $('#stateID :selected').val(),
                        'CityId': $('#CityId :selected').val()
                    }),
                    success: function (data) {
                        if (data.d == "Successful") {
                            //swal("Here's a message!");
                            alert("Your Registration is Completed Successfully "+"\r\n"+"Check Your details on Reg Email");
                            window.location.href = window.location.href;
                        }
                        else {
                            alert("User Details are already Exists!!!" + "\r\n" + "Give New EmailID and Mobile Number");
                        }
                    }
                });
            }
            else {
                alert("Please Enter all the Required Fields" + "\r\n");
            }
        });
      
       
        function show1() {
            
            $(".residentIndian").hide();
        }
        function show2() {
            
            $(".residentIndian").show();
        }
    </script>
</body>
</html>

