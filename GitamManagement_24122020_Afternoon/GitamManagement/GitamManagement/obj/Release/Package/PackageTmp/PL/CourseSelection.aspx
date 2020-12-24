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
                          <label class="form-control-label">Year of Passing</label>
                          <input type="number" id="yop" required ="required"  placeholder="Enter Year Of Passing" class="form-control">
                        </div>
                        <div class="form-group univ">
                          <label class="form-control-label" >University / Institution</label>
                            <select id="university"  class="form-control" required ="required"></select>
                        </div>
                        
                        <div class="form-group">       
                          <input type="submit" id="btnSubmit" value="Submit" class="btn btn-primary">
                        </div>
                      
                    </div>
               </div>
        </div>
    <script>
        $(document).ready(function () {
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
        })
        
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
                }),
                success: function (data) {
                    if (data.d) {
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
