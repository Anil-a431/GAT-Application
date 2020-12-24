<%@ Page Title="" Language="C#" MasterPageFile="~/PL/UserDashboard.Master" AutoEventWireup="true" CodeBehind="NewUpdatePassword.aspx.cs" Inherits="GitamManagement.PL.NewUpdatePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!-- Page Header-->
          <header class="page-header">
            <div class="container-fluid">
              <h2 class="no-margin-bottom">Update Password</h2>
            </div>
          </header>
          
       
          <!-- Forms Section-->
    
          <section class="forms"> 
            <div class="container-fluid">
              <div class="row">
    
       
        <div class="col-lg-6">
                  <div class="card">
                   
                    <div class="card-header d-flex align-items-center">
                      <h3 class="h4">Update Password Form</h3>
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                          <label class="form-control-label">Current Password</label>
                          <input type="text"  id="currentPassword" class="form-control" readonly>
                        </div>
                        <div class="form-group">       
                          <label class="form-control-label">New Password</label>
                          <input type="text" id="newPwd" placeholder="Password" class="form-control">
                        </div>
                          <div class="form-group">       
                          <label class="form-control-label">Re Enter Password</label>
                          <input type="text" id="re_enterPwd" placeholder="Password" class="form-control">
                        </div>
                        <div class="form-group">       
                          <input type="button" id="validateSubmit"  value="Update Password" class="btn btn-primary">
                        </div>
                     <span id='message'></span>
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
            $.ajax({
                type: "POST",
                url: "../GitamManagementService.asmx/GetCurrentPassword",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.d != '') {
                        $('#currentPassword').val(data.d);

                    }
                }
            });
            $('#newPwd, #re_enterPwd').on('keyup', function () {
                if ($('#newPwd').val() == $('#re_enterPwd').val()) {
                    $('#message').html('Matching').css('color', 'green');
                } else
                    $('#message').html('Not Matching').css('color', 'red');
            });
        });
        
        $('#validateSubmit').click(function () {
            if ($('#newPwd').val() == $('#re_enterPwd').val()) {
                $.ajax({
                    type: "POST",
                    url: "../GitamManagementService.asmx/UpdatePassword",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        'newPassword': $('#newPwd').val(),
                     }),
                    success: function (data) {
                        if (data.d) {
                            alert('Your Password is Updated Successfully!!!');
                            window.location.href = "/EducationalDetails";
                        }
                        else {
                            alert(data.d);
                        }
                    }
                });
            } else
                alert('Password does not Matched');
            
        });
     </script>
</asp:Content>
