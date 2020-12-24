$(document).ready(function () {
    $.ajax({
        type: "POST",
        url: "GitamManagementService.asmx/GelRequiredData",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        // data: JSON.stringfy({'mobno': val}),
        success: function (data) {
            for (var i = 0; i < data.d.MasterProgramList.length; i++)
            {
                var row_Mstr = data.d.MasterProgramList[i];
                
                $("#DdlCEQ").append(new Option(row_Mstr.ProgramName, row_Mstr.ID));
            }
            /*
            for (var i = 0; i < data.d.StateList.length; i++) {
                var row_State = data.d.StateList[i];
               /// $("#StateId").append(new Option(row_State.StateName, row_State.ID));
            }*/

            for (var i = 0; i < data.d.CampusList.length; i++) {
                var row_Campus = data.d.CampusList[i];
                $("#CAmpus").append(new Option(row_Campus.CampusLocation, row_Campus.ID));
            }

        }
    });
});

    

    $('#UniversityId').change(function () {
        if ($(this).val() != "")
        {
            $.ajax({
                type: "POST",
                url: "GitamManagementService.asmx/GetSubProgramDetails",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ 'MasterProgarmID': $('#UniversityId :selected').val() }),
                success: function (data) {
                    $('#CourseId').empty();
                    $("#CourseId").append(new Option("Select Stream *", ""));
                    for (var i = 0; i < data.d.length; i++) {
                        var row_Mstr = data.d[i];
                        $("#CourseId").append(new Option(row_Mstr.ProgramName, row_Mstr.ID));
                    }
                }
            });
        }
    });

    

    $('#UniversityId1').change(function (e) {
        if ($(this).val() != "") {
            getSubProgramDetails();
            
        }
    });

    $('#DdlCEQ').change(function () {
        if ($(this).val() != "") {
            getSubProgramList($("#DdlCEQ").val());
        }
    });

function getSubProgramList(masterProgramID) {
    $.ajax({
        type: "POST",
        url: "GitamManagementService.asmx/GetSubProgramDetails",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: JSON.stringify({ 'MasterProgarmID': masterProgramID }),
        success: function (data) {
            $('#GP').empty();
            $("#GP").append(new Option("Select Group *", ""));
            for (var i = 0; i < data.d.length; i++) {
                var row_Mstr = data.d[i];
                $("#GP").append(new Option(row_Mstr.ProgramName, row_Mstr.ID));
            }
        }
    });
}


   
   
$('#Sec1').click(function () {
    debugger;
    $("#btnUpdate").hide();
        $.ajax({
            type: "POST",
            url: "GitamManagementService.asmx/Section1Details",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            data: JSON.stringify({
                'EDetails': $('#DdlCEQ :selected').val(),
                'Group': $('#GP :selected').val(),
                'Campus': $('#CAmpus').val().toString()
                
            }),
            success: function (data) {
                if (data.d == "Successfull")
                {
                    setTimeout(function () { alert('Your Current Details are submitted'); }, 3000);
                    window.location.href = '/AllApplications';
                }
                else {
                    setTimeout(function () { alert("Something Went Wrong"); }, 3000);
                    
                }
            }
        });
    });