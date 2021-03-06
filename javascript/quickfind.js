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
	   var code = $('#inputcoursecode').val();
       $.ajax({
           type: 'GET',
           url: 'findCourse.php',
           cache: false,
           data: { code: code }           
       })
       .done(function(data){
		   if(data.indexOf("ERROR") === 0) {
			   var message = data.split(':');
			   alert("Error " + $message[0]);
		   } else if (data.match("NO_RESULT")) {
			    $('#containerresult').html("<label id='noresultlabel'> No Result For Code:</label> <label id='noresultcode'> " + code + "</label>");
		   } else {
               $('#containerresult').html(data);
           }
       })
       .fail(function(jqHXR, textStats, errorThrown){
           alert ("Error Retrieving Course Code " + $('#inputcoursecode').val());
       });
   });
   
   $('.toggleenroll').on('click', function(event) {
	   // Must Create an array because addCourse.php accepts multiple codes
	   var code = $('#inputcoursecode').val();
	   var codeArr = [];
	   codeArr.push(code);
       var mode = $(this).text(); 
	   
	   if (mode === 'Enroll') {
            $.ajax({  
			    type: 'POST',
				url: 'checkCourseCapacity.php',
				data: {code: code}
			})
			.done(function(data){			   
               if (data.indexOf("SEATS_AVAILABLE")) {
					$.ajax({
						 type: 'POST',
						 url: 'addCourses.php',
						 data: {codes: json.stringify(codeArr)}
					})
					.done(function(data){
						if(data.indexOf("SUCCESS") === 0) {
							$(this).text('Unenroll');
						}
						displayMessage(data);
					})
					.fail(function(jqHXR, textStats, errorThrown) {
					  displayMessage("Error Enrolling in " + $code);
					});		
			   } else if (data.indexOf("MAX_CAPACITY")) {
			      displayMessage("The Course " + $code + "is at Maximum Capacity");
				  var $enrolled = $('#enrolled').text();
				  var $capacity = $('#capacity').text();
				  if ($enrolled < $capacity) {
				      $enrolled.text($capacity);
				  }
               } else if (data.indexOf('NO_CODE_FOUND')) {
			     displayMessage(data);				 
			   } else if (data.indexOf("ERROR")) {
			     displayMessage(data);
			   }
			})
            .fail(function(jqHXR, textStats, errorThrown) {
				displayMessage("Error Enrolling in " + $code);
			});				
	   } else {
	     $.ajax({
                 type: 'POST',
				 url: 'removeCourses.php',
				 data: {codes: json.stringify(codeArr)}
		    })
			.done(function(data){
				if(data.indexOf("SUCCESS") === 0) {
					$(this).text('Enroll');
				}
				displayMessage(data);
			})
            .fail(function(jqHXR, textStats, errorThrown) {
			  displayMessage("Error Unenrolling in " + $code);
			});
	   }
   });
});

function displayMessage(messageNotParsed) {
     $message = (messageNotParsed.indexOf(':') === -1) ? messageNotParsed : messageNotParsed.split(':')[1];
	 $('#enrollmessage').text($message);
}