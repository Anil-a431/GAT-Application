<%@ Page Title="" Language="C#" MasterPageFile="~/PL/UserDashboard.Master" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="GitamManagement.PL.Report" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        /*@media print {
            table{
                border-color:#C60021;
                border-width: 4px;
                border-style:Solid;
                border-collapse:collapse;
            }
        }*/
        @media print {
            #btnPrint,#ContentPlaceHolder1_btnDownload{
				display:none;
            }



            #ContentPlaceHolder1_PrintDiv table {
                border: solid #000 !important;
                border-width: 1pt 0 0 1pt !important;
            }

            #ContentPlaceHolder1_PrintDiv th, #ContentPlaceHolder1_PrintDiv td {
                border: solid #000 !important;
                border-width: 0 1pt 1pt 0 !important;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container" id="PrintDiv" runat="server">
        <div class="text-center mt-5">
            <img src="https://www.gitam.edu/assets/images/GITAM-logo.png" width="250px;">
        </div>
        <h5 class="mt-5">Application Details</h5>

        <div class="row mt-3">
            <div class="col-md-6">
                <div class="row mt-2">
                    <div class="col-md-4">
                        <span>Registration ID </span>
                    </div>
                    <div class="col-md-8">
                        : <span class="ml-3">
                            <asp:Label ID="lblRegID" runat="server"></asp:Label></span>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-md-4">
                        <span>First Name</span>
                    </div>
                    <div class="col-md-8">
                        : <span class="ml-3">
                            <asp:Label ID="lblFirstName" runat="server"></asp:Label></span>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-md-4">
                        <span>Last Name</span>
                    </div>
                    <div class="col-md-8">
                        : <span class="ml-3">
                            <asp:Label ID="lblLastName" runat="server"></asp:Label></span>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-md-4">
                        <span>Email ID</span>
                    </div>
                    <div class="col-md-8">
                        : <span class="ml-3">
                            <asp:Label ID="lblEmailID" runat="server"></asp:Label></span>
                    </div>
                </div>

                <div class="row mt-2">
                    <div class="col-md-4">
                        <span>Mobile Number</span>
                    </div>
                    <div class="col-md-8">
                        : <span class="ml-3">
                            <asp:Label runat="server" ID="lblMobileNumber"></asp:Label></span>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-md-4">
                        <span>Date of Birth </span>
                    </div>
                    <div class="col-md-8">
                        : <span class="ml-3">
                            <asp:Label runat="server" ID="lblDob"></asp:Label></span>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-md-4">
                        <span>Aadhaar Card </span>
                    </div>
                    <div class="col-md-8">
                        : <span class="ml-3">
                            <asp:Label runat="server" ID="lblAadhar"></asp:Label></span>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-md-4">
                        <span>Gender </span>
                    </div>
                    <div class="col-md-8">
                        : <span class="ml-3">
                            <asp:Label runat="server" ID="lblgender"></asp:Label></span>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-md-4">
                        <span>Category </span>
                    </div>
                    <div class="col-md-8">
                        : <span class="ml-3">
                            <asp:Label runat="server" ID="lblcategory"></asp:Label></span>
                    </div>
                </div>

            </div>
            <div class="col-md-6 text-right">
                <%--<img src="https://cdn.pixabay.com/photo/2015/03/04/22/35/head-659652_1280.png" style="height:auto;width:150px;">--%>
                <asp:Image runat="server" ID="imgUserPhoto" Style="height: auto; width: 150px;" />
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-md-12">
                <div class="row mt-2">
                    <div class="col-md-2">
                        <span>Father Name </span>
                    </div>
                    <div class="col-md-10">
                        : <span class="ml-3">
                            <asp:Label runat="server" ID="lblFatherName"></asp:Label></span>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-md-2">
                        <span>Mother Name</span>
                    </div>
                    <div class="col-md-10">
                        : <span class="ml-3">
                            <asp:Label runat="server" ID="lblMotherName"></asp:Label></span>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-md-2">
                        <span>Email ID</span>
                    </div>
                    <div class="col-md-10">
                        : <span class="ml-3">
                            <asp:Label runat="server" ID="lblEmailIDParent"></asp:Label></span>
                    </div>
                </div>

                <div class="row mt-2">
                    <div class="col-md-2">
                        <span>Address</span>
                    </div>
                    <div class="col-md-10">
                        : <span class="ml-3">
                            <asp:Label runat="server" ID="lblAddress"></asp:Label></span>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-md-2">
                        <span>Country </span>
                    </div>
                    <div class="col-md-10">
                        : <span class="ml-3">
                            <asp:Label ID="lblCountry" runat="server"></asp:Label></span>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-md-2">
                        <span>State </span>
                    </div>
                    <div class="col-md-10">
                        : <span class="ml-3">
                            <asp:Label runat="server" ID="lblState"></asp:Label></span>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-md-2">
                        <span>City </span>
                    </div>
                    <div class="col-md-10">
                        : <span class="ml-3">
                            <asp:Label runat="server" ID="lblCity"></asp:Label></span>
                    </div>
                </div>


            </div>

        </div>
        <div class="row mt-5">
            <div class="col-md-12">
                <h5>Education Details: </h5>
                <table class="mt-3 table table-bordered">
                    <tr>
                        <td>Qualification</td>
                        <td>Name of institute</td>
                        <td>Board/University</td>
                        <td>Year of pass</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" ID="lblQualification"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="lblInstitue"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="lblboard"></asp:Label></td>
                        <td>
                            <asp:Label runat="server" ID="lblpass"></asp:Label></td>
                    </tr>
                </table>
            </div>
            <div class="col-md-12 mt-4">
                <h5>Campus selected: </h5>
                <table class="mt-3 table table-bordered">

                    <tbody id="Tbody1" runat="server">
                    </tbody>
                </table>
            </div>
        </div>

        <div class="col-md-12 mt-4">
            <h5>Applied for: </h5>
            <table class="mt-3 table table-bordered">
                <thead>
                    <tr>
                        <td>Application No.</td>
                        <td>Program</td>
                        <td>Amount</td>
                        <td>Status</td>
                        <td>Transaction ID</td>
                        <td>Payment Date</td>
                    </tr>
                </thead>
                <tbody id="tblTBody" runat="server">
                </tbody>
            </table>
        </div>
        <div class="row">
            <div class="col-lg-12 text-center">
                <asp:Button runat="server" Text="Download PDF" Visible="false" class="btn btn-primary" ID="Button1" OnClick="btnDownload_Click" />
                <button type="button" id="btnPrint" class="btn btn-primary">Print/Download</button>
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

       <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sprintf/1.1.2/sprintf.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.2.0/jspdf.umd.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Base64/1.1.0/base64.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/TableExport/5.2.0/js/tableexport.min.js"></script>
    <script>
		$(function () {
			$("#btnPrint").click(function () {
				debugger;
                var divContents  = $("#ContentPlaceHolder1_PrintDiv").html();

                var printWindow = window.open('', '', 'height=800,width=1000');
                printWindow.document.write('<html><head><title></title> <link rel="stylesheet" href="/Assets/Css/bootstrap.min.css">');
                printWindow.document.write('</head><body >');
                printWindow.document.write(divContents);
                printWindow.document.write('</body></html>');
                printWindow.document.close();
                //printWindow.print();
			});
    
        });
    </script>
</asp:Content>
