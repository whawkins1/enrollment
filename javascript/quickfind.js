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
   $('#inputcoursecode').on('keypress', function(e) {
	   var keyCode = e.charCode;
	   
       if (e.which === 13) {
           $('#quickfindbutton').click();
       } else {
	       var allowedChars = new RegExp("[a-zA-Z0-9]");
           var text = String.fromCharCode(keyCode);

		   if ((allowedChars.test(text) || keyCode === 0)) {
		       return true;
		   }
		   alert("Only Letters and Numbers Allowed, Please Try Again");
           return false;  		     
	   }	    
   });
   
   $('#inputcoursecode').on('paste', function(e) {
	      var allowedChars = new RegExp("[a-zA-Z0-9]");
		  var letterNumberRegEx = /^[0-9a-zA-Z]+$/;
          var pastedText = e.originalEvent.clipboardData.getData('text');
        		  
          if(pastedText.match(letterNumberRegEx)) {
             return true;		  
		  }
		  alert("Only Letters and Numbers Allowed, Please Try Again");
          return false;		  
   });
   
   $('#inputcoursecode').on('keyup', function(e) {
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
           url: 'findCourse.php',
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