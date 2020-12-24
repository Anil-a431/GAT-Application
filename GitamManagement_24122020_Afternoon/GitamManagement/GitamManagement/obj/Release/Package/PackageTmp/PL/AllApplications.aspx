<%@ Page Title="" Language="C#" MasterPageFile="~/PL/UserDashboard.Master" AutoEventWireup="true" CodeBehind="AllApplications.aspx.cs" Inherits="GitamManagement.PL.AllApplications" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../Assets/Css/multiselect.css"  />
    <style>
       span.selection{
           width:100%;
       }
    </style>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HiddenField ID="hdnUserID1" runat="server" />
    <asp:HiddenField ID="hdnUserAmount" runat="server" />
    <header class="page-header">
        <div class="container-fluid">
            <h2 class="no-margin-bottom">Course Selection</h2>
        </div>
    </header>
    <section class="forms">
        <div class="container-fluid">
            <div class="row Hdn">
                <div class="col-lg-8">
                    <div class="card " id="CD"">
                        <div class="card-header d-flex align-items-center">
                            <h3 class="h4">Select Course</h3>
                        </div>
                        <div class="card-body" >
                            <div class="form-group">
                                
                                <select name="university_id1" id="UniversityId1" class="form-control select-arrow-cust widget_input" data-label="Select Program Level Applying For *" >
                                            
                                </select>
                            </div>
                            <div class="form-group">
                                <p class="text-left"><small><strong>Note: You Can Select Multiple Courses</strong></small></p>
                                <select multiple data-placeholder="Select Multiple Courses" id="CourseId1"  data-allow-clear="1" class="form-control select-arrow-cust widget_input">
                    
                </select>
                                
                            </div>
                            <div class="form-group">
                                <button id="Sec2"  class="btn btn-primary" align="center">Next</button>
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>
            <div class="row">
                <%--<div class="">
            <div class="row">
                <header class="page-header">
                    <div class="container-fluid">
                        <h2 class="no-margin-bottom">Applied Courses - Paid</h2>
                    </div>
                </header>
                <div class="col-lg-12">
                    <asp:GridView ID="grdCouseDetails" runat="server" AutoGenerateColumns="False" Width="422px" BackColor="#99CCFF" BorderColor="#FF3300" BorderStyle="Double" BorderWidth="15px" Font-Bold="True" ForeColor="White" CellSpacing="5" Font-Size="Large">
                        <Columns>
                            <asp:BoundField DataField="Appid" HeaderText="Application ID" />
                            <asp:BoundField DataField="ProgramName" HeaderText="Course Name" />
                            <asp:BoundField DataField="amount" HeaderText="Amount Paid" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
                </div>--%>
                <div class="col-md-7">
                    <div class="row">
                <header class="page-header">
                    <div class="container-fluid">
                        <h2 class="no-margin-bottom">Applying Courses</h2>
                    </div>
                </header>
                <div class="table-responsive">
                    <table id="tbDetails" cellpadding="0" cellspacing="0" class="table table-striped">
                        <thead style="background-color: #DC5807; color: White; font-weight: bold">
                            <tr style="border: solid 1px #000000">
                                <td>Application ID</td>
                                <td>Course Name</td>
                                <td>Amount(INR)</td>
                                <td>Status</td>
                                <td>Remove/Delete</td>
                                
                            </tr>
                        </thead>

                    </table>
                </div>
            </div>
                    <div class="row">
                <div class="col-lg-12 text-right" >
                    <button runat="server" id="btnPayment" class="btn btn-primary" ></button>
                </div>
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
    <script>
        $(document).ready(function (e) {
            var red = "";
            debugger;
            $.ajax({
                type: "POST",
                url: "GitamManagementService.asmx/GetHigherQualificationDetails",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                // data: JSON.stringfy({'mobno': val}),
                success: function (data) {
                    //console.log(data.d);
                    for (var i = 0; i < data.d.length; i++) {
                        var row_Mstr = data.d[i];
                        if (i == 0)
                            red = row_Mstr.ID;
                        $("#UniversityId1").append(new Option(row_Mstr.ProgramName, row_Mstr.ID));


                    }

                    $.ajax({
                        type: "POST",
                        url: "GitamManagementService.asmx/GetSubProgramDetails1",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({
                            'MasterProgarmID': red,
                            'UserId': userid
                        }),
                        success: function (data) {
                            $('#CourseId1').empty();

                            for (var i = 0; i < data.d.length; i++) {
                                var row_Mstr = data.d[i];
                                $("#CourseId1").append(new Option(row_Mstr.ProgramName, row_Mstr.ID));
                            }
                            $("#CourseId1").multiSelect();
                        }
                    });

                }
            });


            var userid = $("#ContentPlaceHolder1_hdnUserID1").val();

            $.ajax({
                type: "POST",
                url: "../GitamManagementService.asmx/GetUserUnPaidCourses",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({
                    'UserId': userid,
                }),
                success: function (data) {
                    Successreturn(data);
                }
            });
        });

        $('#ContentPlaceHolder1_btnPayment').click(function (e) {
            debugger;
            e.preventDefault();
            var UserId = $("#ContentPlaceHolder1_hdnUserID1").val();
            var Amount = $("#ContentPlaceHolder1_hdnUserAmount").val();
            //alert(UserId);
            //alert(Amount);
            window.location.href = "https://onlinepay.gitam.edu/adm/gpaystudent?APPNO="+UserId+"&FEECATEGORY=E&FEEPURPOSE=Application fee&FEEAMOUNT="+Amount;

            //window.location.href = '/PersonalDetails';
            //window.location.href = "https://onlinepay.gitam.edu/ecounselling/test";
        });

        $('#Sec2').click(function (e) {
            var selectedCourses = JSON.stringify($('#CourseId1').val());
            selectedCourses = selectedCourses.replaceAll('[', '').replaceAll('"', '').replaceAll(']', '');
            e.preventDefault();
            $.ajax({
                type: "POST",
                url: "GitamManagementService.asmx/InsertCourseDetails",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ 'courseids': selectedCourses }),

                success: function (data) {
                    Successreturn(data);
                    getSubProgramDetails();
                }

            });
        });

        function deletecousre(ApplicationID) {
            var userid1 = $("#ContentPlaceHolder1_hdnUserID1").val();
            debugger;
            $.ajax({

                type: "POST",
                url: "GitamManagementService.asmx/deleteUserCourse",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({
                    'ApplicationID': ApplicationID,
                    'UserId': userid1,
                }),
                success: function (data) {
                    debugger;
                    Successreturn(data);
                    getSubProgramDetails();
                }
            });
        }

        function Successreturn(data) {
            debugger;
            $("#tbDetails tbody").empty();
            var payAmount = 0;

            for (var i = 0; i < data.d.length; i++) {
                payAmount = payAmount + data.d[i].Amount;
                $("#tbDetails").append(" <tbody>< tr > <td>" + data.d[i].ApplicationID +
                    "</td><td>" + data.d[i].CourseName +
                    "</td><td>" + data.d[i].Amount +
                    "</td><td>" + "Status" +
                    "</td><td>" +
                    "<span class='btn-group'>" +
                    "<button  onclick='deletecousre(" + data.d[i].ApplicationID + ")' class='btn btn-sm btn-primary'><i class='fa fa-trash' aria-hidden='true'></i></button>" +
                    " </span ></td></tr></tbody>"
                );

            }
            $("#ContentPlaceHolder1_btnPayment").html('Pay ' + payAmount);
            $("#ContentPlaceHolder1_hdnUserAmount").val(payAmount);
            //getSubProgramDetails();
        }

        function getSubProgramDetails() {
            var userid = $("#ContentPlaceHolder1_hdnUserID1").val();
            $.ajax({
                type: "POST",
                url: "GitamManagementService.asmx/GetSubProgramDetails1",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({
                    'MasterProgarmID': $('#UniversityId1 :selected').val(),
                    'UserId': userid
                }),
                success: function (data) {
                    $('#CourseId1').empty();

                    for (var i = 0; i < data.d.length; i++) {
                        var row_Mstr = data.d[i];
                        $("#CourseId1").append(new Option(row_Mstr.ProgramName, row_Mstr.ID));
                    }
                    $("#CourseId1").multiSelect();
                }
            });
        }
    </script>
    
<script>
    $(function () {
        $("#CourseId1").select2({
            theme: 'bootstrap4',
            width: $("#CourseId1").data('width') ? $("#CourseId1").data('width') : $("#CourseId1").hasClass('w-100') ? '100%' : 'style',
            placeholder: "Select Multiple Courses",
            allowClear: Boolean($("#CourseId1").data('allow-clear')),
        });
    });
</script>
</asp:Content>
