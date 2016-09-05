var holdCourseCode;
var holdTableCode;
var holdTableTitle;
var holdTableDepartment;
var holdTableProfessorName;
var holdTableTime;
var holdTableLocation;
var holdTableCredits; 

$(function() {
   $(window).on('unload', function() {
       $.ajax({
                type: 'POST',
                url: 'saveQuickfind.php',
                data:
                      {
                          courseCode: holdCourseCode,
                          tableCode: holdTableCode,
                          tableTitle: holdTableTitle,
                          tableDepartment: holdTableDepartment,
                          tableProfessorName: holdTableProfessorName,
                          tableTime: holdTableTime,
                          tableLocation: holdTableLocation,
                          tableCredits: holdTableCredits
                      }
   });       
    
    
   $('#inputcoursecode').on('keypress', function(e) {
       if (e.which === 13) {
           $('#quickfindbutton').click();
       } else {
           var allowedChars = new RegExp("^[a-zA-Z0-9\-]+$");
           var text = String.fromCharCode(e.which);
           var keyCodes = [8, 37, 39, 46, 116];
           var code = e.keyCode;
           
           if (allowedChars.test(text) || $.inArray(code, keyCodes) > -1 || e.ctrlKey || e.shiftKey) {
               return true;           
           }
           return false;
       }
   });
   
   $('#inputcoursecode').on('keyup', function(e) {
        var $button = $('#quickfindbutton');
        var input = $(this).val().trim();
        var lengthInput = $(this).val().trim().length();
        var disableButton;
        if ($button.prop('disabled') && lengthInput > 0) {
            disableButton = false;
        } else if((!($button.prop('disabled'))) && lengthInput === 0) {
            disableButton = true;
        }
        if (input > 0) {
            holdCourseCode = input;
        }
        $button.prop('disabled', disableButton);
   });
   
   $('#quickfindbutton').on('click', function() {
       $.ajax({
           type: 'GET',
           url: 'quickfind.php',
           cache: false,
           data: {
                    code: $('#inputcoursecode').val();
                 }           
       })
       .done(function(data){
           if (data.match("ERROR_EXECUTING_STATEMENT")) {
              alert("Error Executing Statment");
           } else if (data.match("ERROR_PREPARING_STATEMENT")) {
              alert("Error Preparing Statment");
           } else {
               $('#containerresult').html(data);
               
               if ($('#tableresults').length) {
                   holdCourseCode = $('#inputcoursecode').text();
                   holdTableCode = $table.find('#code').text();
                   holdTableTitle = $table.find('#title').text();
                   holdTableDepartment = $table.find('#department').text();
                   holdTableProfessorName = $table.find('#professorname').text();
                   holdTableTime = $table.find('#time').text();
                   holdTableLocation = $table.find('#location').text();
                   holdTableCredits = $table.find('#credits').text();
               }
           }
       })
       .fail(function(jqHXR, textStats, errorThrown){
           alert ("Error Retrieving Course Code " + $('#inputcoursecode').val();
       });
   });
});