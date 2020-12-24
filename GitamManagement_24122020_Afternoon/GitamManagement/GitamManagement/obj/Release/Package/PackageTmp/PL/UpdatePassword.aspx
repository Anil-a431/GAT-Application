<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdatePassword.aspx.cs" Inherits="GitamManagement.PL.UpdatePassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
       <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

</head>
<body>
    <form id="form1" runat="server">
       
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
    </form>
      <!-- Bootstrap Js -->
    <script src="../assets/js/bootstrap.min.js"></script>
    <script src="../Assets/Js/jquery-3.5.1.min.js"></script>
 

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
                        if (data.d)
                            window.location.href = "/EducationalDetails";
                        else {
                            alert(data.d);
                        }
                    }
                });
            } else
                alert('Password does not Matched');
            
        });
    </script>
</body>
</html>
