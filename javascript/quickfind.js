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
	        })		  
           .fail(function(jqHXR, textStats, errorThrown){
             alert ("Error Saving Search Time " + $('#inputcoursecode').val());
           });
   });           
    
   $('#inputcoursecode').on('keypress paste', function(e) {
	   var keyCode = !e.charCode ? e.which : e.charCode;
       if (e.which === 13) {
           $('#quickfindbutton').click();
       } else {
	       var allowedChars = new RegExp("[a-zA-Z0-9]");
           var text = String.fromCharCode(keyCode);
		   console.log(keyCode);
           // allow backspace, left arrow, right arrow, f5, alt, tab		   
           var keyCodes = [8, 46, 116, 18, 9];		   
		   
		   if (allowedChars.test(text) || ((e.ctrlKey || e.altKey || e.shiftKey) && $.inArray(keyCode, [37, 39]) > -1) || $.inArray(keyCode, keyCodes) > -1) {
		       return true;
		   } 
		   return false;
	   }	    
   });
   
   $('#inputcoursecode').on('change paste keyup', function(e) {
        var $button = $('#quickfindbutton');
        var input = $(this).val().trim();
        var lengthInput = input.length;
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
                    code: $('#inputcoursecode').val()
                 }           
       })
       .done(function(data){
           if (data.match("ERROR_EXECUTING_STATEMENT")) {
              alert("Error Executing Statment");
           } else if (data.match("ERROR_PREPARING_STATEMENT")) {
              alert("Error Preparing Statment");
           } else if (data.match("NO RESULT")) {
		        $('#containerresult').html("<label id='resultsLabel'> No Results </label>");
		   } else {
               $('#containerresult').html(data);
           }
       })
       .fail(function(jqHXR, textStats, errorThrown){
           alert ("Error Retrieving Course Code " + $('#inputcoursecode').val());
       });
   });
});