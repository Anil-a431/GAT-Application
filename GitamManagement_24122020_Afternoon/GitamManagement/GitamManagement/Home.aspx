<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="GitamManagement.Home" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Bootstrap Admin Template : Insight</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link href="Assets/Css/font-awesome.min.css" rel="stylesheet" />
    <link href="Assets/Css/Home.css" rel="stylesheet" />
    <link rel="stylesheet" href="Assets/Css/Form.css" />
    <link rel="stylesheet" href="Assets/Css/Style.css" />
    <link rel="stylesheet" href="Assets/Css/Custom.css" />


    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

    <script>
        function openCity(evt, cityName) {
          var i, tabcontent, tablinks;
          tabcontent = document.getElementsByClassName("tabcontent");
          for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
          }
          tablinks = document.getElementsByClassName("tablinks");
          for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
          }
          document.getElementById(cityName).style.display = "block";
          evt.currentTarget.className += " active";
        }
    </script>
</head>
<body>
    <div class="Container">
    <div class="header">
       <asp:Label ID="UsernameLabel" Text=""  runat="server"></asp:Label>
    </div>
    <div id="">
        
    <div class="tab">
        <button class="tablinks" onclick="openCity(event, 'DashBoard')" id="defaultOpen">Dashboard</button>
        <button class="tablinks" onclick="openCity(event, 'Empty')">Empty</button>
    </div>

        <div id="DashBoard" class="tabcontent">
            <h3>DashBoard</h3>
            <p>Your Content here</p> 
        </div>

        <div id="Empty" class="tabcontent">
          <h3>Empty</h3>
          <p>Your Content here</p> 
        </div>

            
        <div id="myModal" class="modal">
            <!-- Modal content -->
            <div class="modal-content_Gitam">
                <!--<span class="close">&times;</span>-->
                <div class="row" id="CEQ">
                    <h6>Current Educational Qualification</h6>
                    <div class="form-group label-floating  field-select" style="">
                        <select name="DdlCEQ_id" id="DdlCEQ" class="form-control select-arrow-cust widget_input" data-label="Current Educational Qualification" >
                        <option value="" selected="selected">Select Current Educational Qualification *</option>
                        </select>
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group label-floating  field-select" style="">
                        <select name="GP" id="GP" class="form-control select-arrow-cust widget_input" data-label="Group" >
                        <option value="" selected="selected">Select Group *</option>
                        </select>
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group label-floating reg_university_id_div UniversityId field-select" style="">
                        <select name="CAmpus" id="CAmpus" class="form-control select-arrow-cust widget_input" data-label="Intrested Campus *" >
                        <option value="" selected="selected">Intrested Campus *</option>
                        </select>
                        <span class="help-block"></span>
                    </div>
                    <button id="Sec1" class="btn btn-primary">Next</button>
                </div>
                <!--phase I_Data-->
                  <div class="row Hdn" id="CEQ_Data">
                        <table id="t1" class="t">
                          <tr>
                            <th>Qualification</th>
                            <th>Group</th> 
                            <th>CAmpus</th>
                          </tr>
                        </table>
                      <button id="Ok" class="btn btn-primary">Ok</button>
                    <button id="Cancel" class="btn btn-primary">Cancel</button>
                  </div>
                <!--phase II-->
                <div class="row Hdn" id="CD" >
                    <h6>Course Details</h6>
            <div class="clearfix"></div>
            <div class="form-group label-floating reg_university_id_div UniversityId field-select" style="">
            <select name="university_id" id="UniversityId" class="form-control select-arrow-cust widget_input" data-label="Select Program Level Applying For *" >
            <option value="" selected="selected">Select Program Level Applying For *</option>
            </select>
            <span class="help-block"></span>
            </div>
            <div class="form-group label-floating reg_course_id_div CourseId field-select" style="">
            <select name="course_id" id="CourseId" class="form-control select-arrow-cust widget_input" onchange="GetChildByMachineKey(this.value,'SpecializationId');" data-label="Select Stream *" >
            <option value="" selected="selected">Select Stream *</option>
            </select>
            <span class="help-block"></span>
            </div>
            <div class="form-group label-floating field-select reg_specialization_id_div" style="">
            <select name="specialization_id" id="SpecializationId" data-label="Select Program *" class="form-control select-arrow-cust widget_input">
            <option value="" selected="selected">Select Program *</option>
            </select>
            <span class="help-block"></span>
            </div>
                    <button id="Sec2" class="btn btn-primary">Next</button>
            </div>

                <div class="row Hdn" id="CD_Data" >
                         <table id="t2" class="t">
                          <tr>
                            <th>Program Applied for</th>
                            <th>Stream</th> 
                            <th>Stream</th>
                          </tr>
                        </table>
                    <button id="Ok1" class="btn btn-primary">Ok</button>
                    <button id="Cancel1" class="btn btn-primary">Cancel</button>
                </div>

            </div>
            </div>   
            </div>
        </div>
      <!-- Bootstrap Js -->
    <script src="Assets/Js/jquery-3.5.1.min.js"></script>
        <script src="Assets/Js/bootstrap.min.js"></script>

        <script src="Assets/Js/Custom.js"></script>
    <script>
        $(document).ready(function () {
            var Qualification = '<%=Session["Qualification"]%>';
            var QGroup = '<%=Session["QGroup"]%>';
            var CampusLocation = '<%=Session["CampusLocation"]%>';
            if (Qualification != "" && QGroup != "" && CampusLocation != "") {
                $('#CEQ').hide();
                $('#CD').show();
            }
            else {
                $('#CD').hide();
                $('#CEQ').show();
            }
        });
    </script>
</body>
</html>
