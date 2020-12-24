<%@ Page Title="" Language="C#" MasterPageFile="~/PL/UserDashboard.Master" AutoEventWireup="true" CodeBehind="ContactDetails.aspx.cs" Inherits="GitamManagement.PL.ContactDetails" %>
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
     <div class="col-lg-6">
                  <div class="card">
                   
                    <div class="card-header d-flex align-items-center">
                      <h3 class="h4">Contact Details</h3>
                    </div>
                    <div class="card-body">
                      <p>Enter Your Contact Details</p>
                        <div class="form-group">
                          <label class="form-control-label">Father's Name / Guardian's Name</label>
                          <input type="text" id="fathersname" required ="required" placeholder="Enter Father's Name"  class="form-control">
                        </div>
                        <div class="form-group">
                          <label class="form-control-label">Mother's Name</label>
                          <input type="text" id="mothersname" required ="required"  placeholder="Mother's Name" class="form-control">
                        </div>
                        <div class="form-group">
                          <label class="form-control-label">Fathers's Occupation</label>
                          <input type="text" required ="required" id="occupation"  placeholder="Fathers's Occupation" class="form-control">
                        </div>
                        <div class="form-group">
                          <label class="form-control-label">Mobile Number</label>
                          <input type="tel" pattern="^[6-9][0-9]{9}$" id="mobilenumber" required ="required"  placeholder="Enter Mobile Number" class="form-control">
                        </div>
                        <div class="form-group">
                          <label class="form-control-label">Parent EMail ID</label>
                          <input type="email" id="email" pattern="^[0-9a-z][0-9a-z_.]{5,14}[@][a-z0-9]{3,18}[.][a-z]{2,4}$" required ="required"  placeholder="Enter Parent EmailID" class="form-control">
                        </div>
                        
                          <div class="form-group">
                          <label class="form-control-label">Address - 1</label>
                          <input type="text" required ="required"  id="addr1" placeholder="Enter Address" class="form-control">
                        </div>
                          <div class="form-group">
                          <label class="form-control-label">Address - 2</label>
                          <input type="text"  placeholder="Enter Second Address" id="addr2" class="form-control">
                        </div>
                           <div class="form-group">
                          <label class="form-control-label">Country</label>
                          <select name="country" id="countryID" class="form-control mb-3">
                              <option selected="selected">Select Country</option>
                           </select>
                        </div>
                          <div class="form-group">
                          <label class="form-control-label">State</label>
                          <select name="state" id="stateID" class="form-control mb-3">
                              <option selected="selected">Select State</option>
                           </select>
                        </div>
                          <div class="form-group">
                          <label class="form-control-label">City</label>
                          <select name="district" id="districtID" class="form-control mb-3">
                              <option selected="selected">Select District</option>
                           </select>
                        </div>
                         <div class="form-group">
                          <label class="form-control-label">Pincode</label>
                          <input type="text" id="pincode" pattern="^[0-9]{6}$" required ="required"  placeholder="Enter Pincode" class="form-control">
                        </div>
                        <div class="form-group">       
                          <input type="submit" id="btnContactDetails" value="Save and Next" class="btn btn-primary">
                             <input type="submit" id="btnUpdate" value="Update" class="btn btn-primary">
                        </div>
                    </div>
               </div>
        </div>
    <script>
        $(document).ready(function () {
            debugger;
            $("#btnUpdate").hide();
            $.ajax({
                type: "POST",
                url: "../GitamManagementService.asmx/GetCountryLists",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    console.log(data.d);
                    for (var i = 0; i < data.d.length; i++) {
                        var row_Country = data.d[i];
                        $("#countryID").append(new Option(row_Country.CountryName, row_Country.ID));
                    }

                }
            });
            $.ajax({
                type: "POST",
                url: "../GitamManagementService.asmx/getUserContactDetails",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    debugger;
                    //console.log(data);
                    //alert(data.d.ContactDetails);
                    if (data.d.length > 0) {
                        $("#fathersname").val(data.d[0].FatherName);
                        $("#mothersname").val(data.d[0].MotherName);
                        $("#occupation").val(data.d[0].Occupation);
                        $("#mobilenumber").val(data.d[0].MobileNumber);
                        $("#email").val(data.d[0].EmailID);
                        $("#addr1").val(data.d[0].Address1);
                        $("#addr2").val(data.d[0].Address2);
                        $("#countryID").val(data.d[0].Country);
                        getStateList(data.d[0].Country);
                        setTimeout(function () { $("#stateID").val(data.d[0].State); }, 1000);
                        getCityList(data.d[0].State);
                        setTimeout(function () { $("#districtID").val(data.d[0].District); }, 1000);
                        $("#pincode").val(data.d[0].Pincode);
                        $("#btnContactDetails").hide();
                        $("#btnUpdate").show();
                    }
                    else {
                        //alert('NO');
                        
                    }
                    

                }
            });
        });

        $('#countryID').change(function () {
            debugger
            if ($(this).val() != "") {
                getStateList($('#countryID').val());
                
            }
        });


        function getCityList(stateid) {
            $.ajax({
                type: "POST",
                url: "../GitamManagementService.asmx/GetDistrictLists",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ 'stateID': stateid }),
                success: function (data) {
                    $('#districtID').empty();
                    for (var i = 0; i < data.d.length; i++) {
                        var row_District = data.d[i];
                        $("#districtID").append(new Option(row_District.DistrictName, row_District.ID));
                    }
                }
            });
        }

        function getStateList(countryid) {
            $.ajax({
                type: "POST",
                url: "../GitamManagementService.asmx/GetStateLists",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ 'countryID': countryid }),
                success: function (data) {
                    $('#stateID').empty();
                    for (var i = 0; i < data.d.length; i++) {
                        var row_State = data.d[i];
                        $("#stateID").append(new Option(row_State.StateName, row_State.ID));
                    }
                }
            });
        }

        $('#stateID').change(function () {
            if ($(this).val() != "") {
                getCityList($('#stateID').val());
                
            }
        });

        $("#btnContactDetails").click(function (e) {
            e.preventDefault();
            $.ajax({
                type: "POST",
                url: "../GitamManagementService.asmx/InsertUserContactDetails",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({
                    'fathersname': $('#fathersname').val(),
                    'mothersname': $('#mothersname').val(),
                    'occupation': $('#occupation').val(),
                    'mobilenumber': $('#mobilenumber').val(),
                    'email': $('#email').val(),
                    'addr1': $('#addr1').val(),
                    'addr2': $('#addr2').val(),
                    'countryID': $('#countryID :selected').val(),
                    'stateID': $('#stateID :selected').val(),
                    'districtID': $('#districtID :selected').val(),
                    'pincode': $('#pincode').val(),
                    'update':"0"
                }),
                success: function (data) {
                    debugger;
                    //console.log(data);
                    if (data.d.length>0) {
                        alert('Your Contact Details are Saved Successfully!!!');
                        window.location.href = "/CourseSelection";
                        $("#btnUpdate").show();
                        $("#btnContactDetails").hide();
                    }
                    else {
                        alert(data.d);
                    }
                }
            });
        })

        $("#btnUpdate").click(function () {
            debugger;
            $.ajax({
                type: "POST",
                url: "../GitamManagementService.asmx/InsertUserContactDetails",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({
                    'fathersname': $('#fathersname').val(),
                    'mothersname': $('#mothersname').val(),
                    'occupation': $('#occupation').val(),
                    'mobilenumber': $('#mobilenumber').val(),
                    'email': $('#email').val(),
                    'addr1': $('#addr1').val(),
                    'addr2': $('#addr2').val(),
                    'countryID': $('#countryID :selected').val(),
                    'stateID': $('#stateID :selected').val(),
                    'districtID': $('#districtID :selected').val(),
                    'pincode': $('#pincode').val(),
                    'update':"1"
                }),
                success: function (data) {
                    if (data.d.length>0)
                    {
                        alert('Your Record is Updated Successfully!!!');
                        window.location.href = "/CourseSelection";
                    }
                    else {
                        alert(data.d);
                    }
                }
            });
        })
    </script>
</asp:Content>
