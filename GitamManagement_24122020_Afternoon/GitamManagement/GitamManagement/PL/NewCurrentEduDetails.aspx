<%@ Page Title="" Language="C#" MasterPageFile="~/PL/UserDashboard.Master" AutoEventWireup="true" CodeBehind="NewCurrentEduDetails.aspx.cs" Inherits="GitamManagement.PL.NewCurrentEduDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
       span.selection{
           width:100%;
       }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <header class="page-header">
            <div class="container-fluid">
              <h2 class="no-margin-bottom">Current Education Details</h2>
            </div>
          </header>
    <section class="forms">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-6">
                    <div class="card">
                        <div class="form-group">
                            <label class="form-control-label">Current Educational Qualification</label>
                            <select name="DdlCEQ_id" id="DdlCEQ" class="form-control select-arrow-cust widget_input" data-label="Current Educational Qualification">
                                <option value="" selected="selected">Select Current Educational Qualification *</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class="form-control-label">Select Group *</label>
                            <select name="GP" id="GP" class="form-control select-arrow-cust widget_input" data-label="Group">
                                <option value="" selected="selected">Select Group *</option>
                            </select>

                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-4">
                                    <label class="form-control-label">Intersted Campus</label>
                                </div>
                                <div class="col-md-8 ">
                                    <p class="text-right"><small><strong>Note: You Can Select Multiple Campuses</strong></small></p>
                                </div>
                            </div>
                            
                            
                            <select multiple data-placeholder="Select Preferred Campus" name="CAmpus" id="CAmpus"  data-allow-clear="1" class="form-control select-arrow-cust widget_input">
                    
                </select>

                        </div>
                        <div class="form-group">
                            <button id="Sec1" type="button" class="btn btn-primary">Save and Next</button>
                            <%--<button id="btnUpdate" type="button" class="btn btn-primary">Update</button>--%>
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
    <!-- Main File-->
    <script src="../Assets/Js/front.js"></script>
    <script>
        $(document).ready(function () {
            <%--var UserId = '<%=Session["UserId"]%>'
            var Qualification = '<%=Session["Qualification"]%>';
            var QGroup = '<%=Session["QGroup"]%>';
            var CampusLocation = '<%=Session["CampusLocation"]%>';
            if (Qualification != "" && QGroup != "" && CampusLocation != "") {
                //window.location.href = '/AllApplications';
            }
            else {
                //window.location.href = '/EducationalDetails';
            }--%>
            debugger;
            $.ajax({
                
                type: "POST",
                url: "../GitamManagementService.asmx/getUserCurrentEducationDetails",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    data = data.d;
                    $("#DdlCEQ").val(data.ProgramName);
                    getSubProgramList(data.ProgramName);
                    setTimeout(function () { $("#GP").val(data.SubProgramName); },1000);
                    $("#CAmpus").val(data.CampusLocation.split(',')).trigger('change');
                }
            });

        });
    </script>
    <script>
        $(function () {
            $("#CAmpus").select2({
                theme: 'bootstrap4',
                width: $("#CAmpus").data('width') ? $("#CAmpus").data('width') : $("#CAmpus").hasClass('w-100') ? '100%' : 'style',
                placeholder: "Select Preferred Campus",
                allowClear: Boolean($("#CAmpus").data('allow-clear')),
            });
        });
    </script>
</asp:Content>
