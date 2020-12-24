<%@ Page Title="" Language="C#" MasterPageFile="~/PL/UserDashboard.Master" AutoEventWireup="true" CodeBehind="CourseSelection.aspx.cs" Inherits="GitamManagement.PL.CourseSelection" %>
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
                      <h3 class="h4">Previous Education Details</h3>
                    </div>
                    <div class="card-body">
                      <p>Your Previous Education Details</p>
                        <div class="form-group">
                          <label class="form-control-label">Full Name of the Institute (Currently Studying / Passed out)</label>
                          <input type="text" id="institue" required ="required" placeholder="Enter Institute Name"  class="form-control">
                        </div>
                        <div class="form-group">
                          <label class="form-control-label">Board of Study</label>
                           <select id="study"  class="form-control" required ="required"></select>
                        </div>
                       
                        <div class="form-group">
                          <label class="form-control-label">State</label>
                          <select name="state" id="stateID" class="form-control mb-3">
                              <option selected="selected">Select State</option>
                           </select>
                        </div>
                        <div class="form-group">
                          <label class="form-control-label">District</label>
                          <select name="district" id="districtID" class="form-control mb-3">
                              <option selected="selected">Select District</option>
                           </select>
                        </div>
                        <div class="form-group">
                          <label class="form-control-label">City</label>
                          <select name="district" id="cityID" class="form-control mb-3">
                              <option selected="selected">Select City</option>
                           </select>
                        </div>
                         <div class="form-group">
                          <label class="form-control-label">Year of Passing</label>
                          <input type="text" pattern="^[1-2][0-9]{3}$"  id="yop" required ="required"  placeholder="Enter Year Of Passing" class="form-control">
                        </div>
                        <div class="form-group univ">
                          <label class="form-control-label" >University / Institution</label>
                            <select id="university"  class="form-control" required ="required"></select>
                        </div>
                        
                        <div class="form-group">       
                          <input type="submit" id="btnSubmit" value="Submit" class="btn btn-primary">
                            <input type="submit" id="btnUpdate" value="Update" class="btn btn-primary" />
                        </div>
                      
                    </div>
               </div>
        </div>
    <script>
        $(document).ready(function () {
            $("#btnSubmit").hide();
            $("#btnUpdate").hide();
            debugger;
            $.ajax({
                type: "POST",
                url: "../GitamManagementService.asmx/getBoards",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({
                }),
                success: function (data) {
                    if (data.d) {
                        for (var i = 0; i < data.d.length; i++) {
                            var row_State = data.d[i];
                            $("#study").append(new Option(row_State.BoardName, row_State.ID));
                        }
                        $(".univ").hide();
                    }
                   
                }
            });
            $.ajax({
                type: "POST",
                url: "../GitamManagementService.asmx/getPrevDetails",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({
                }),
                success: function (data) {
                    if (data.d) {
                        $("#institue").val(data.d.CollegeName);
                        $("#study").val(data.d.BoardID);
                        $("#yop").val(data.d.yop);
                        setTimeout(function () { $("#stateID").val(data.d.StateID); }, 1000);
                        getDistList(data.d.StateID);
                        setTimeout(function () { $("#districtID").val(data.d.DistID); }, 1000);
                        getCityListByDist(data.d.DistID);
                        setTimeout(function () { $("#cityID").val(data.d.CityID); }, 1000);
                        $("#btnSubmit").hide();
                        $("#btnUpdate").show();
                    } else {
                        $("#btnSubmit").show();
                        $("#btnUpdate").hide();
                    }
                }
            });
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

        })
        $('#stateID').change(function () {
            if ($(this).val() != "") {
                debugger;
                getDistList($('#stateID').val());
            }
        });
        function getDistList(stateID) {
            debugger;
            $.ajax({
                type: "POST",
                url: "../GitamManagementService.asmx/getDistNames",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ 'stateID': stateID }),
                success: function (data) {
                    $('#districtID').empty();
                    $("#districtID").append(new Option("Select District *", ""));
                    for (var i = 0; i < data.d.length; i++) {
                        var row_District = data.d[i];
                        $("#districtID").append(new Option(row_District.DNames, row_District.DistID));
                    }
                }
            });
        }
        $('#districtID').change(function () {
            if ($(this).val() != "") {
                debugger;
                getCityListByDist($('#districtID').val());
            }
        });
        function getCityListByDist(distID) {
            debugger;
            $.ajax({
                type: "POST",
                url: "../GitamManagementService.asmx/getCityDetailsByDist",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ 'distID': distID }),
                success: function (data) {
                    $('#cityID').empty();
                    $("#cityID").append(new Option("Select District *", ""));
                    for (var i = 0; i < data.d.length; i++) {
                        var row_City = data.d[i];
                        $("#cityID").append(new Option(row_City.cityNames, row_City.cityID));
                    }
                }
            });
        }
        
        $("#btnSubmit").click(function () {
            debugger;
            var board, univ;
            if ($('#study').val() != "") {
                board = $('#study').val();
                univ = "";
            }
            else {
                univ = $("#university").val();
                board = "";
            }
            $.ajax({
                type: "POST",
                url: "../GitamManagementService.asmx/InsertUserCourseSelection",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({
                    'institue': $('#institue').val(),
                    'study': board,
                    'yop': $('#yop').val(),
                    'university': univ,
                    'StateID': $("#stateID").val(),
                    'DistID': $("#districtID").val(),
                    'CityID': $("#cityID").val(),
                    'update':0
                }),
                success: function (data) {
                    if (data.d) {
                        setTimeout(function () { alert("Your Previous Education Details are Inserted Successfully"); },2000);
                        window.location.href = "/CourseDisplayPage";
                    }
                    else {
                        alert(data.d);
                    }
                }
            });
        })

        $("#btnUpdate").click(function () {
            debugger;
            var board, univ;
            if ($('#study').val() != "") {
                board = $('#study').val();
                univ = "";
            }
            else {
                univ = $("#university").val();
                board = "";
            }
            $.ajax({
                type: "POST",
                url: "../GitamManagementService.asmx/InsertUserCourseSelection",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({
                    'institue': $('#institue').val(),
                    'study': board,
                    'yop': $('#yop').val(),
                    'university': univ,
                    'StateID': $("#stateID").val(),
                    'DistID': $("#districtID").val(),
                    'CityID': $("#cityID").val(),
                    'update': 1
                }),
                success: function (data) {
                    if (data.d) {
                        setTimeout(function () { alert("Your Previous Education Details are updated"); }, 2000);
                        window.location.href = "/CourseDisplayPage";
                    }
                    else {
                        alert(data.d);
                    }
                }
            });
        })
    </script>

    
</asp:Content>
