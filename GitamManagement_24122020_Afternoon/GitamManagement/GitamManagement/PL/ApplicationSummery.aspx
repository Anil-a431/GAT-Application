<%@ Page Title="" Language="C#" MasterPageFile="~/PL/UserDashboard.Master" AutoEventWireup="true" CodeBehind="ApplicationSummery.aspx.cs" Inherits="GitamManagement.PL.MyPayments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        
#example {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#example td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#example tr:nth-child(even){background-color: #f2f2f2;}

#example tr:hover {background-color: #ddd;}

#example th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}
     </style>
    


     
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <h1>
            Payment Should be done here
        </h1>
        <table id="example"  class="display" style="width:100%"></table>

        <button id="nextPage" runat="server" value="Next">NextPage</button>
    </center>
     
    <script>
        $('#ContentPlaceHolder1_nextPage').click(function (e) {
            e.preventDefault();
            window.location.href = '/PersonalDetails';
        });
    </script>
     
 
    
    <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.22/js/dataTables.jqueryui.min.js"></script>
<script src="https://cdn.datatables.net/rowgroup/1.1.2/js/dataTables.rowGroup.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.6.5/js/dataTables.buttons.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/1.6.5/js/buttons.html5.min.js"></script>

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
        $(document).ready(function () {
            $.ajax({
                type: "POST",
                url: "../GitamManagementService.asmx/getUserContactDetails",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    debugger;
                    console.log(data);
                    alert(data.d.ContactDetails);
                    if (data.d) {
                        $("#fathersname").val(data.d[0].FatherName);
                        $("#mothersname").val(data.d[0].MotherName);
                        $("#occupation").val(data.d[0].Occupation);
                        $("#mobilenumber").val(data.d[0].MobileNumber);
                        $("#email").val(data.d[0].EmailID);
                        $("#addr1").val(data.d[0].Address1);
                        $("#addr2").val(data.d[0].Address2);
                        // $("#countryID").val(data.d[0].Country);
                        //$("#stateID").val(data.d[0].District);
                        $("#pincode").val(data.d[0].Pincode);
                        alert('YES');
                        $("#example").DataTable({
                                bLengthChange: true,
                                lengthMenu: [[5, 10, -1], [5, 10, "All"]],
                                bFilter: true,
                                bSort: true,
                                bPaginate: true,
                                data: data.d[0],
                                columns: [{ 'data': 'MotherName' },
                                { 'data': 'FatherName' }],
                                dom: 'Bfrtip',
                                buttons: [
                                    {
                                        extend: 'pdfHtml5',
                                        orientation: 'landscape',
                                        pageSize: 'LEGAL'
                                    }
                                ]
                            });
                    }
                    else {
                        alert('NO');
                    }


                }
            });
        });
    </script>
</asp:Content>
