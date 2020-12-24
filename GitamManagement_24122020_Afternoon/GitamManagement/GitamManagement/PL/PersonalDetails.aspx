<%@ Page Title="" Language="C#" MasterPageFile="~/PL/UserDashboard.Master" AutoEventWireup="true" CodeBehind="PersonalDetails.aspx.cs" Inherits="GitamManagement.PL.PersonalDetails" %>
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
                      <h3 class="h4">Personal Details</h3>
                    </div>
                    <div class="card-body">
                      <p>Enter Your Personal Details</p>
                      <div class="form-group">
                          <label class="form-control-label">First Name</label>
                              <asp:TextBox ID="txtFirstName" runat="server" placeholder="Enter First Name" class="form-control mb-3" AutoPostBack="false"></asp:TextBox>

                          </div>

                        <div class="form-group">
                          <label class="form-control-label">Last Name</label>
                              <asp:TextBox ID="txtLastName" runat="server" placeholder="Enter Last Name" class="form-control mb-3" AutoPostBack="false"></asp:TextBox>

                          </div>
                          <div class="form-group">
                          <label class="form-control-label">Select</label>
                              <asp:DropDownList runat="server" ID="gender" class="form-control mb-3" AutoPostBack="false"></asp:DropDownList>

                          </div>

                          <div class="form-group">
                          <label class="form-control-label">Date of Birth</label>
                              <asp:TextBox ID="dob" runat="server" class="form-control" TextMode="Date"></asp:TextBox>
                          <%--<input type="date" id="dob" runat="server" placeholder="Date of Birth"  >--%>
                        </div>
                        <div class="form-group">
                          <label class="form-control-label">Aadhar Number</label>
                            <asp:TextBox ID="aadharNumber" runat="server" required ="required" pattern="^[0-9]{12}$" placeholder="Aadhar Number" class="form-control"></asp:TextBox>
                        
                        </div>
                        <div class="form-group">       
                          <label class="form-control-label">Category</label>
                            <asp:DropDownList runat="server" id="category" class="form-control mb-3" AutoPostBack="false"></asp:DropDownList> 
                          
                        </div>
                          <div class="form-group">
                          <label class="form-control-label">Nationality</label>
                              <asp:DropDownList runat="server" id="country" AutoPostBack="false" class="form-control mb-3"></asp:DropDownList>
                      
                        </div>
                          <div class="form-group">
                          <label class="form-control-label">Country of Permenant Residence</label>
                              <asp:DropDownList runat="server" id="country1"  AutoPostBack="false" class="form-control mb-3"></asp:DropDownList>
                          
                        </div>
                          <div class="form-group">
                          <label class="form-control-label">Photograph</label>
                              <asp:FileUpload runat="server" ID="fileUploadInput"  />
                              <p><small> <strong>Note:</strong> The photograph should be Passport Size and in color. Max size of the photo is : 500KB
                                                                                  </small></p>
                              <%--<asp:RegularExpressionValidator ID="rgImageValidate" runat="server" 
                                  ControlToValidate="fileUploadInput" 
                                  ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.png|.jpg|.jpeg)$"
                                  ForeColor="Red" ErrorMessage ="Please Select Only Image file"></asp:RegularExpressionValidator>--%>
                         
                          </div>
                        
                           <div class="form-group">
                          <label class="form-control-label">How did you hear about GITAM?</label>
                               <asp:DropDownList runat="server" class="form-control mb-3" AutoPostBack="false" id="aboutgitam"></asp:DropDownList>
                     
                        </div>
                        <div class="form-group">       
                            <%--<button runat="server" ID="btnPersonalDetails">Save</button>--%>
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:Button runat="server" ID="Button1" OnClick="Button1_Click" class="btn btn-primary" Text="Save and Next"/>

                                    <asp:Button runat="server" ID="btnUpdate" OnClick="btnUpdate_Click" class="btn btn-primary" Text="Update"/>

                                    
                                </div>
                               
                            </div>
                            
                          
                            <%--<asp:Button runat="server" ID="btnPersonalDetails" Text="Save"/>--%>
                        </div>
                      <asp:Label runat="server" ID="lblMsg"></asp:Label>
                    </div>
               </div>
        </div>
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
                $('#ContentPlaceHolder1_country  option:contains("India"),#ContentPlaceHolder1_country1  option:contains("India")').
                    attr('selected', 'selected'); 
        })
    </script>
</asp:Content>
