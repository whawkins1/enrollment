var originalFirstName;
var originalLastName;
var originalStreetAddress;
var originalCountry;
var originalState;
var originalCity;
var originalZip;
var originalHomePhone;
var originalMobilePhone;
var originalMajor;
var originalEmail;

$(function() { 
    $('#tablegrades tr:odd').css('background-color', '#D3D3D3');
            $('#tablegrades').tablesorter({
                headers: { 0: { sorter: false} } 
            });   
    //Remove all Data Fields to avoid caching previous results
    $(window).unload( function () {
      $('#firstname').val("");
      $('#lastname').val("");
      $('#streetaddress').val("");
      $('#countrydropdown option').remove();
      $('#statedropdown option').remove();
      $('#citydropdown option').remove();
      $('#majordropdown option').remove();
      $('#zipcode').val("");
      $('#homephone').val("");
      $('#mobilephone').val("");
      $('#email').val("");      
      $('#tablecourses').remove();
    });
    
    //Hold original Values to Reset Defaults
    originalFirstName = $('#firstname').val();
    originalLastName = $('#lastname').val();
    originalStreetAddress = $('#streetaddress').val();
    originalCountry = $('#countrydropdown').text();
    originalState = $('#statedropdown').text();
    originalCity = $('#citydropdown').text();
    originalZip = $('#zipcode').val();
    originalHomePhone = $('#homephone').val();
    originalMobilePhone = $('#mobilephone').val();
    originalMajor = $('majordropdown').text();
    originalEmail = $('#email').val();
    
    loadTableData();
    setDropDownFilterDepartment();
    setDropDownFilterCode();
    setDropDownFilterProfessor();
    setDropDownFilterLocation();
    setDropDownFilterPayments();
    setPaymentTypeDropDown();
    setMakePaymentAction();
    $('#tablepayments').tablesorter();
    $('#amount').autoNumeric('init');
    $('#vin').val("");
    
    $('#zipcode').on('keydown', function(e) {
       var arr = [8,9,16,17,20,35,36,37,38,39,40,45,46, 86, 88];
             
             for (var i = 48; i <= 57; i++) {
                    arr.push(i);
             }
             
             if (!(e.ctrlKey && (e.which == 90 || e.which == 86 || e.which == 88))) {
                 if ($.inArray(e.which, arr)  === -1) {
                   e.preventDefault();
                 }
             }
    });
    
    $('#zipcode').on('keypress', function() {
             var inputValue = $(this).val();
             var regexpnumbers = /[^0-9]/g;
             if (inputValue.match(regexpnumbers)) {
                inputValue( inputValue.replace(regexpnumbers, '') );
             }
    });
    
    $('.contactinput').on('keydown', function(e) {
             //Allow Keyboard Shortcuts include cut paste
             var arr = [8,9,16,20,35,36,37,38,39,40,45,46];
             
             for (var i = 65; i < 90; i++) {
                    arr.push(i);
             }
             
             if (!(e.ctrlKey && (e.which == 90 || e.which == 86 || e.which == 88))) {
                 if ($.inArray(e.which, arr)  === -1) {
                   e.preventDefault();
                 }
             }
         });
    
    $('.contactinput').on('keypress', function() {
         $('.inputfieldletters').on('keypress', function() {
           var inputValue = $(this).val;
           
               if (inputValue.match(/[^a-zA-Z]/g)) {
                  inputValue( inputValue.replace(regexpletters, ''));
               }
         });         
    });
    
    $('#companydropdown').on('change', function() {
       var type = $('#selectpaymenttype').val();
       var $credit = $('#creditvincontainer');
       var $online = $('#onlineinputcontainer');
       
       switch(type) {
         case "cc":
            if(!(($online).css('visibility') == 'hidden')) { 
                $online.css('visibility', 'hidden'); 
            }                        
            $credit.css('visibility', 'visible');
            break;
         case "op":
          if(!(($credit).css('visibility') == 'hidden')) {
             $credit.css('visibility', 'hidden');
          }
           $online.css('visibility', 'visible');             
           break;
       }
    });
    
    $('#creditcard').on('input', function() {
       if ($(this).val().length === 0 || $('#vin').val().length === 0)  {
          $('#amount').prop('disabled', true); 
       } else {
          $('#amount').prop('disabled', false);          
       }
    });
    
    $('#vin').on('input', function() {
       if ($(this).val().length === 0 || $('#creditcard').val().length === 0) {
          $('#amount').prop('disabled', true);
       } else {
          $('#amount').prop('disabled', false);
       }
    });
    
    $('#vin').on('keydown', function(e) {
        return isValidKey(e); 
    });
    
    $('#creditcard').on('keydown', function(e) {
         return isValidKey(e);
    });
    
    //Enter space After 4 digits
     $('#creditcard').on('keypress', function(e) {
      var max = $(this).attr('maxlength');
      var length = this.value.length;

      if(length < max) {  
            var val = this.value;
            if (e.which != 8 && e.which != 46 && val.length > 0) {
               if (val.replace(/\s/g,'').length % 4 === 0) {
                   $(this).val(val + ' ');
               } else {
                   $(this).val(val);
               }  
            }
      } 
    }); 
    
    //Toggle Finish Button Input Amount
    var $finishButton = $('#finishbutton');
    $('#amount').on('keypress', function () {
        if ($(this).val().length === 0) {
           $finishButton.prop('disabled', true);
        } else {
           if($finishButton.prop('disabled')) {
              $finishButton.prop('disabled', false);
           }
        }
    });
    
    //Finish Payment Submittal
    $('#finishbutton').on('click', function () {
       var ccValue = $('#creditcard').val();
       var payment = $('#amount').val().replace(/,/g, "");
       var currentBalance = getCurrentBalance();
       var methodPayment;
       var calculatedBalance = (currentBalance - payment)
       
       if (amount.length > 0) {
           if ( calculatedBalance < 0) {
                  alert("The Payment Is Greater Than the Balance,\nTherefore, You Will Only Be Charged".concat(currentBalance.toString()));             
           } else {
               if ($('#selectpaymenttype').val() === "cc") {          
                  if (validCreditCardFormat(ccValue)) {
                     if (validCardNumber(ccValue)) {
                         methodPayment = "Credit Card"; 
                         populateReviewForm();
                     } else {
                        alert("Incorrect Number");
                     }
                  } else {
                     alert("Invalid Credit Card Format");
                  }  
              } else { //Online Payment Action
                      methodPayment = "Online Payment";
                      var username = $('#username').val();
                      var password = $('#password').val();
                      
                      var ajaxCall = $.ajax({
                               type: 'POST',    
                               url: "/php/verifyUsernamePass.php",
                               data: {email: "johnboy@gmail.com", pass: "chase"},
                               dataType: 'html',
                               cache: false
                          });
                          
                          ajaxCall.done (function(data) {
                             if (data === "valid") {
                                $('#username').val() = "";
                                $('#password').val() = "";                                
                                populateReviewForm();           
                             } else {
                                alert("Invalid Login, Please Try Again.");
                                $('username').focus();
                             }
                          });
                          
                          ajaxCall.fail (function(jqXHR, textStatus, errorThrown) {
                                          alert("Error Getting User Balance");
                          });
              }       
           }               
      } else {
          alert("No Amount Entered, Please Try Again.");
          $('#amount').focus();
      }
    });
    
    // Set Submit Button On Review
    $('#submitButton').on('click', function() {
    
    });
    
    // Set Edit Button
    $('#editbutton').on('click', function() {
        var text = $(this).text();
        if (text === "Edit") {
            $('.contactinput').prop('readonly', false);
            $('.contactinput').css('pointer-events', 'auto');
            $('#streetaddress').css('pointer-events', 'auto');
            $('#streetaddress').prop('readonly', false);
            $('#zipcode').css('pointer-events', 'auto');
            $('#zipcode').prop('readonly', false);
            $('#firstname').focus();
            $(this).text("Save");
            $('#resetdefaultbutton').show();
        } else if (text === "Save"){ // In Save Mode
            var setEditMode = true;
            
            //Check Empty input fields
            $('#contactfieldset > input').each ( function () {
                var enteredValue = $.trim($(this).val());
                if ( enteredValue === "" ) {
                   $(this).addClass('highlightred');
                   setEditMode = false;
                } 
            });
            
            //Check Empty Dropdowns
            
            if ($('#statedropdown :selected').text() === "") {
                 $('#statedropdown').addClass('highlightred');
            }
            
            if ($('#citydropdown :selected').text() === "") {
                 $('#citydropdown').addClass('highlightred');
            }             
                
                if ( setEditMode ) { // All Fields complete    
                   var $email =  $('#email');
                   var regexEmail =  /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
                   var input = $.trim($email.val());
                
                    if (regexEmail.test(input)) {
                        if ( input !== originalEmail ) {
                            var ajaxCall = $.ajax({
                                   type: 'GET',
                                   url: "../php/checkDuplicateUser.php",
                                   data: {
                                            email : input
                                         },
                                   dataType: 'text'
                            });
                            
                            ajaxCall.done( function(data) {
                                var response = $.trim(data);
                                if ( response === "email not in use" ) { 
                                   addUpdates();
                                } else if ( response === "email in use" ) {
                                      $('#errorcontainer').html("ERROR: email already in use");
                                      $email.addClass('highlightred');
                                      $email.focus();  
                                      setEditMode = false; 
                                } else if ( response === "error" ) {
                                    $('#errorcontainer').html("ERROR: Email Check could not be completed!");
                                }
                            });
                            
                            ajaxCall.fail (function(jqHXR, textStatus, errorThrown) {
                                $('#errorcontainer').html("ERROR: check for duplicate email failed?");
                                $('#editbutton').focus();
                                setEditMode = false;
                            });
                        } else {
                           addUpdates();
                        }                            
                    } else {
                       $('#errorcontainer').html("ERROR: invalid email format!");
                       $email.addClass('highlightred');
                       setEditMode = false;
                    }                        
                }  else {
                    $('#errorcontainer').html("ERROR: All Fields Must Be entered!");
                    setEditMode = false; 
                }

           if ( setEditMode ) {            
                $('.contactinput').prop('readonly', true);
                $('.contactinput').css('pointer-events', 'none');
                $('#streetaddress').prop('readonly', true);
                $('#streetaddress').css('pointer-events', 'none');
                $('#zipcode').prop('readonly', true);
                $('#zipcode').css('pointer-events', 'none');
                $(this).text("Edit");
            } 
        }
    });      
    
    $('#resetdefaultbutton').on('click', function() {
         $('#firstname').val(originalFirstName);
         $('#lastname').val(originalLastName);
         $('#streetaddress').val(originalStreetAddress);
         
         $('#countrydropdown option').filter(function() {
             return ($(this).text === originalCountry);
         }).prop('selected', true);
         
         $('#statedropdown option').filter(function() {
              return ($(this).text === originalState);
         }).prop('selected', true);
         
         $('#citydropdown').filter(function() {
              return ($(this).text === originalCity);
         }).prop('selected', true);
         
         $('#zipcode').val(originalZip);
         $('#homephone').val(originalHomePhone);
         $('#mobilephone').val(originalMobilePhone);
         
         $('majordropdown').filter(function() {
              return ($(this).text === originalMajor);
         }).prop('selected', true);
         
         $('#email').val(originalEmail);
         $('#resetdefaultbutton').prop('disabled', true);
    });
    
    //Enable Reset Button on Key Input
    $('#contactfieldset input').on('keyup', function() {
          if ( $('#resetdefaultbutton').prop('disabled') ) {
             $('#resetdefaultbutton').prop('disabled', false);
          }              
    });
    
    //Enable Reset Button on Dropdown Selection
    $('#contactfieldset select').on('change', function () {
       if ( $('#resetdefaultbutton').prop('disabled') ) {
          $('#resetdefaultbutton').prop('disabled', false);
       }
    });
    
    //Switch Password Visbility
    $('#showpasscb').on('click', function () {
        $('#password').attr(type, $(this).prop('checked') ? 'text' : 'password');
    });
    
    //enable change password fields and change text button
    $('#changepasswordbutton').on('click', function() {
        var text = $(this).text();
        var $oldPassField = $('#oldpassword');
        var $newPassField = $('#newpassword');
        var $confirmPassField = $('#confirmpassword');
        var $passwordMessage = $('#passwordMessage');
        
        if (text === "Change Password") {
           $oldPassField.prop('disabled', false);
           $oldPassField.css('pointer-events', 'auto');
           $oldPassField.focus();
           $newPassField.prop('disabled', false);
           $newPassField.css('pointer-events', 'auto');
           $confirmPassField.prop('disabled', false);
           $confirmPassField.css('pointer-events', 'auto');
           $(this).text("Submit Change");
        } else if (text === "Submit Change") {
            var oldPassInput = $oldPassField.val();
           var newPassInput = $newPassField.val();
           var confirmPassInput = $confirmPassField.val();
           
           if ( oldPassInput === "" || newPassInput === "" || confirmPassInput === "" ) {
             $passwordMessage.text("ERROR: All Fields Must Be Entered!");
           } else if ( newPassInput !== confirmPassInput ) {
             $passwordMessage.text("ERROR: New and Confirm Passwords Must Match!");
           } else {
               // Check Password Exists
               var email = $('#email').val();
               ajaxCall = $.ajax({
                  type: 'POST',
                  url: "../php/login.php",
                  data: {
                          username : email,
                          password : oldPassInput
                        },
                  dataType: 'text'                        
               })
               
               ajaxCall.done( function(data) {
                  if ( data === "valid" ) {
                      //Change Password
                      var ajaxCall = $.ajax({
                                              type: 'POST',
                                              url: "../php/changePassword.php",
                                              data: {
                                                       email : email,
                                                       password : newPassInput
                                                    },
                                               dataType: 'text'
                                           });
                      ajaxCall.done( function (data) {
                          console.log(data);
                          if (data.startsWith("ERROR")) {
                             $oldPassField.focus();
                          } else if (data.startsWith("SUCCESS")) {
                             $oldPassField.val("");
                             $oldPassField.prop('disabled', true);
                             $newPassField.val("");
                             $newPassField.prop('disabled', true);
                             $confirmPassField.val("");
                             $confirmPassField.prop('disabled', true);
                             $(this).text("Change Password");                             
                          }
                          $passwordMessage.text(data);
                      });
                      
                      ajaxCall.fail (function(jqHXR, textStatus, errorThrown) {
                            $oldPassField.focus();
                            $passwordMessage.text("SERVER ERROR: Problem Processing Request");
                      });                      
                  } else if ( data === "invalid" ) {
                      $passwordMessage.text("ERROR: Old Password Incorrect!");
                      $oldPassField.focus();
                  }
               });
               
               ajaxCall.fail (function(jqHXR, textStatus, errorThrown) {
                      $passwordMessage.html("SERVER ERROR: failed to update account!");
                      $(this).focus();
               });
           }
        }
    });    
    
    //Populate State Dropdown Based on Country
    $('#countrydropdown').change(function() {		
         var ajaxCall = $.ajax({
                          type: 'POST',
                          url: "findState.php",
                          datatype: 'html',
                          data: { 
                                   country_id : ($('#countrydropdown option:selected').val())
                                }
                        }); 
            
          ajaxCall.done (function(data) { 
                                $("#statedropdown").html(data);
                                $("#statedropdown").prop("selectedIndex", -1);
                                $('#citydropdown').html("<option></option>");
                         });                  
           
           ajaxCall.fail (function(jqHXR, textStatus, errorThrown) { 
                             alert("Error Loading States");
                         });         
    }); 
    
    //Populate City Dropdown Based on State
    $('#statedropdown').on('change',function() {	
          $selected = $('#statedropdown :selected').text();
          if (!($selected === "none" || $selected === "error")) {
               var ajaxCall = $.ajax({
                  type: 'POST',
                  url: "findCity.php",
                  datatype: 'html',
                  data: { 
                          state_id : ($('#statedropdown option:selected').val()) 
                        }
              }); 
              
              ajaxCall.done (function(data) {
                  $('#citydropdown').html(data);
                  $('#citydropdown').prop('selectedIndex', -1);
              });
              
              ajaxCall.fail (function(jqHXR, textStatus, errorThrown) { 
                               alert("Error Loading States");
                            });
           }
	}); 
    
    $('#yeardropdown').on('change', function() {
         var yearSelected = $(this).val();
         var semesterSelected = $('#semesterdropdown :selected').val();
         
         
    });
    
    $('#semesterdropdown').on('change', function() {
       var yearSelected = $('#yeardropdown').val();
       var semesterSelected = $(this).val();          
    });
    
    $('#yeardropdown option:first').prop('selected', true);
    
    var currentDate = new Date();
    var currentMonth = currentDate.getMonth() + 1;
    var semester = "";
    
    //Set Default Semester Based On Month
    if (currentMonth >= 9 && currentMonth <= 12) {
        semester = 'summer';
    } else if (currentMonth >=1 && currentMonth <=5) {
        semester = 'fall';
    } else if (currentMonth >=6 && currentMonth <=8) {
        semester = 'spring';
    }
    $('#semesterdropdown').val(semester);
    
    $('#homephone').mask("999-999-9999");
    $('#mobilephone').mask("999-999-9999");
    
    $('#semesterdropdown').on('change', function() {
        populateGradeTable();
        getSemesterGPA();
        getCumulaitveGPA();
    });
    
    $('#yeardropdown').on('change', function() {
        populateGradeTable();
        getSemesterGPA();
        getCumulaitveGPA();
    });
});

function populateGradeTable() {
    //Instead of passing parameters just get from dropdown
   $.ajax({
           type: 'GET',
           url: "getGradesYearSemester.php",
           data: {  
                    email: originalEmail,
                    year: $('#yeardropdown option:selected').text(),
                    semester: $('#semesterdropdown option:selected').text() 
                 },
           dataType: 'html'
     })
     .done(function(data) {
         $('#tablegrades tbody').remove();
         $('#tablegrades tbody').append(data);
     })
     .fail(function (jqHXR, textStatus, errorThrown) {
         alert("Error Retrieving Grades for " + semester + " " + year);
     });         
}

function getSemesterGPA() {
    $.ajax({
           type: 'GET',
           url: "getSemesterGPA.php",
           data: {  
                    email: originalEmail,
                    year: $('#yeardropdown option:selected').text(),
                    semester: $('#semesterdropdown option:selected').text()
                 },
           dataType: 'html'
     })
     .done( function(data) {
         $('#semestergpalabel').text(data);
     })
     .fail(function (jqHXR, textStatus, errorThrown) {
         $('#semestergpalabel').text("ERR");
     });
}

function getCumulativeGPA() {
    $.ajax({
           type: 'GET',
           url: "getCumulativeGPA.php",
           data: {  
                    email: originalEmail
                 },
           dataType: 'html'
     })
     .done( function(data) {
         $('#cumulativegpalabel').text(data);         
     })
     .fail(function (jqHXR, textStatus, errorThrown) {
         $('#cumulativegpalabel').text("ERR");
     });    
}

function addUpdates() { 
          ajaxCall = $.ajax({
              type: 'POST',
              url: "updateAccount.php",
              data: {
                        firstName: $('#firstname').val(),
                        lastName: $('#lastname').val(),
                        address: $('#streetaddress').val(),
                        country: $('#countrydropdown option:selected').text(),
                        state: $('#statedropdown option:selected').text(),
                        city: $('#citydropdown option:selected').text(),
                        postalCode: $('#zipcode').val(),
                        homePhone: $('#homephone').val(),
                        mobilePhone: $('#mobilephone').val(),
                        major: $('#majordropdown option:selected').text(),
                        email: $('#email').val(),
                        originalEmail: originalEmail
                   }, 
              dataType: 'text'
          })
          
          ajaxCall.done( function(data) {
              var response = $.trim(data);
              if ( response === "success" ) {
                  $('#errorcontainer').html("SUCCESS: completed update of account!");
                  originalEmail = $('email').val();
                  var $resetButton = $('#resetdefaultbutton');
                  $resetButton.prop('disabled', true);
                  $resetButton.hide();
              } else if ( response === "error" ) {
                  $('#errorcontainer').html("ERROR: failed to update account!");
                  setEditMode = false;
              }
          });
          
          ajaxCall.fail (function(jqHXR, textStatus, errorThrown) {
              $('#errorcontainer').html("SERVER ERROR: failed to update account!");
              $('#editbutton').focus();
              setEditMode = false;                                  
          });
}

function isValidKey ( event ) {
    //Check keycodes spacebar devare backspace and number range
   return (event.which === 37 || event.which === 39 || 
           event.which === 8 || event.which === 46 || 
          (event.which >= 48 && event.which <= 57));
}

function populateReviewForm () {
  //Set Date Box For Payment Review
                var d = new Date();
                var month = d.getMonth() + 1;
                var day = d.getDay();
                
                var formattedDate = (d.getFullYear() + "/" +
                                    (month < 10 ? "0" : "") + month + "/" +
                                    (day < 10 ? "0" : "") + day);
                                    
                $('#datelabel').html("Date: " + formattedDate);               
                $('#transactionid').append("Transaction ID: ");
                $('#paymenttype').append("Payment Type: ".concat(methodPayment));
                $('#currentbalance').append("Current Balance: ".concat(currentBalance.toString()));
                $('#payment').append("Payment: ".concat(payment.toString()));
                $('#balance').append("Balance: ".concat(calculatedBalance.toString()));                
}    
    
function validCreditCardFormat (ccNum) {
       var prodArr = [0, 2, 4, 6, 8, 1, 3, 5, 7, 9];
       var len = ccNum.length;
       var bit = 1;
       var sum = 0;
       var val;
            
       while (len) {
            val = parseInt(ccNum.charAt(--len), 10);
            sum += (bit ^= 1) ? arr[val] : val;
        }
        return sum && sum % 10 === 0;
}

function setMakePaymentAction() {
     var $tabs = $('ul.tabs');
     var $links = $tabs.find('a');    
     
     var $active = $($links[0]);
     $active.addClass('active');
     
     var $content = $($active[0].hash);
           
     $links.not($active).each(function () {
        $(this.hash).hide();
     });
     
     $tabs.on('click', 'a', function(e) {
         $active.removeClass('active');
         $content.hide();   
         $active = $(this);
        
         $content = $(this.hash);
         
         $active.addClass('active');
         $content.show();
         
         e.preventDefault();
     });
  
    
  $('#makepaymentbutton').on('click', function()  {
      var $makepaymenttab = $('.tabs li:last-child');
      $makepaymenttab.css('visibility', 'visible'); 
      $active.removeClass('active');
      $content.hide();

      $link = $($makepaymenttab).find('a');
      $active = $($link[0]);
      $content = $($active[0].hash);
      
      $active.addClass('active');
      $content.show();   
              
      $(this).hide();  
  });
}

function setDropDownFilterPayments() {
 $('#selecttype').on('change', function() {
    var selected = $(this).find('option:selected').text();
    if (selected != "All") {
        $('#tablepayments tr td:nth-child(3)').each(function() {
              if($(this).text() != selected) {
                  $(this).parent().hide();
              } else {
                  $(this).parent().show();
              }
          });
    } else {
        showAllRowsPayment();
    }
 });
}

function setDropDownFilterDepartment() {
   $('#departmentfilter').on('change', function() {
      var selected = $(this).find('option:selected').text();
      if (selected != "-- Select Department --") {
          $('#tablecourses tr td:nth-child(4)').each(function() {
               if($(this).text() != selected) {
                  $(this).parent().hide();
               } else {
                  $(this).parent().show();
               }
           });  
       } else {
         showAllRows();
       }           
       showHideDropDownElements();
   });   
}

function setDropDownFilterCode() {
   $('#codefilter').on('change', function() {
      var selected = $(this).find('option:selected').text();
      if (selected != "-- Select Code --") {
          $('#tablecourses tr td:nth-child(2)').each(function() {
               if($(this).text() != selected) {
                  $(this).parent().hide();
               } else {
                  $(this).parent().show();
               }
           });           
       } else {
         showAllRows();
       }           
       showHideDropDownElements();
   });
}

function setDropDownFilterProfessor() {
$('#filterprofessor').on('change', function() {
      var selected = $(this).find('option:selected').text();
      if (selected != "-- Select Professors --") {
          $('#tablecourses tr td:nth-child(5)').each(function() {
               if($(this).text() != selected) {
                  $(this).parent().hide();
               } else {
                  $(this).parent().show();
               }
           });
       } else {
         showAllRows();
       }           
       showHideDropDownElements();
   });
}

function setDropDownFilterLocation() {
 $('#locationfilter').on('change', function() {
      var selected = $(this).find('option:selected').text();
      if (selected != "-- Select Location --") {
          $('#tablecourses tr td:nth-child(7)').each(function() {
               if($(this).text() != selected) {
                  $(this).parent().hide();
               } else {
                  $(this).parent().show();
               }
           });
       } else {
         showAllRows();
       }           
       showHideDropDownElements();
   });
}

function showAllRows() {
    $('#tablecourses tr').each(function() {
          var $row = $(this);
          if(!($row.is(":visible"))) {
                $row.show();
          } 
     });
     $('#departmentfilter').prop('selectedIndex', 0);
     $('#codefilter').prop('selectedIndex', 0);
     $('#professorfilter').prop('selectedIndex', 0);
     $('#locationfilter').prop('selectedIndex', 0);
}

function showAllRowsPayment() {
    $('#tablepayments tr').each(function() {
          var $row = $(this);
          if(!($row.is(":visible"))) {
                $row.show();
          } 
     });
     $('#selecttype').prop('selectedIndex', 0);
}


function showHideCodes() {
   var codeArr = new Array();
  $('#tablecourses tr td:nth-child(2)').each(function() {
         if($(this).is(':visible')) {
             var cellValue = $(this).text();
             var containsCellValue = (codeArr.indexOf(cellValue) > -1);
         
             if(!(containsCellValue)) {
                codeArr.push(cellValue);   
             }
         }
       });
  
     
     $('#codefilter > option').each(function() {
        var dropDownText = $(this).text();

        var dropDownContainsCode = (codeArr.indexOf(dropDownText) > -1);
        var optionIsHidden = $(this).is(':hidden');
                
        if (dropDownContainsCode) {
           $(this).show();
        } else if (!(optionIsHidden) && !(dropDownContainsCode) && (dropDownText != "-- Select Code --")) {
           $(this).hide();
        } 
     });
}

function showHideDepartments() {
    var departmentArr = new Array();
  $('#tablecourses tr td:nth-child(4)').each(function() {
      if($(this).is(':visible')) {
         var cellValue = $(this).text();
         var containsCellValue = (departmentArr.indexOf(cellValue) > -1);
         
         if(!(containsCellValue)) {
            departmentArr.push(cellValue);   
         }     
      }
  });
    
  $('#departmentfilter > option').each(function() {
        var dropDownText = $(this).text();
        var dropDownContainsDepartment = (departmentArr.indexOf(dropDownText) > -1);
        var optionIsHidden = $(this).is(':hidden');
        
        if (dropDownContainsDepartment && optionIsHidden) {
           $(this).show();
        } else if (!(optionIsHidden) && !(dropDownContainsDepartment) && (dropDownText != "-- Select Department --")) {
           $(this).hide();
        }
     });
}

function showHideProfessors() {
   var professorArr = new Array();
  $('#tablecourses tr td:nth-child(5)').each(function() {
      if($(this).is(':visible')) {
         var cellValue = $(this).text();
         var containsCellValue = (professorArr.indexOf(cellValue) > -1);
         
         if(!(containsCellValue)) {
            professorArr.push(cellValue);   
         }
      }
  });
  
  $('#professorfilter > option').each(function() {
        var dropDownText = $(this).text();
        var dropDownContainsProfessor = (professorArr.indexOf(dropDownText) > -1);
        var optionIsHidden = $(this).is(':hidden');
        
        if (dropDownContainsProfessor && optionIsHidden) {
           $(this).show();
        } else if (!(optionIsHidden) && !(dropDownContainsProfessor) && (dropDownText != "-- Select Professors --")) {
           $(this).hide();
        }
     });
}

function showHideLocations() {
  var locationArr = new Array();
  $('#tablecourses tr td:nth-child(7)').each(function() {
       if($(this).is(':visible')) {
         var cellValue = $(this).text();
         var containsCellValue = (locationArr.indexOf(cellValue) > -1);
         
         if(!(containsCellValue)) {
            locationArr.push(cellValue);   
         }
       }
  });
  
  $('#locationfilter > option').each(function() {
        var dropDownText = $(this).text();
        var dropDownContainsLocation = (locationArr.indexOf(dropDownText) > -1);
        var optionIsHidden = $(this).is(':hidden');
        
        if (dropDownContainsLocation && optionIsHidden) {
           $(this).show();
        } else if (!(optionIsHidden) && !(dropDownContainsLocation) && (dropDownText != "-- Select Location --")) {
           $(this).hide();
        }
     });
}

function showHideDropDownElements() {
  showHideDepartments();
  showHideCodes();
  showHideProfessors();
  showHideLocations();
}

function setEditButtonFunctionality() {
  $('#editbutton').on('click', function() {sho
     $('input').each(function() {         
        if($(this).prop('readonly')) {
           $(this).prop("readonly", false);
           $(this).css('border-width', 'thin');
        }              
     });         
  });
}



function setPaymentTypeDropDown() {
 $('#selectpaymenttype').on('change', function() {
         var selectedtype = $(this).val();
         var $companymenu = $('#companydropdown');
         
         if($companymenu.find('option').length >= 1) {
             $companymenu.empty();
         }
         
         if(selectedtype == "cc") {
                  $companymenu.append(" <option value=\"\" style=\"display:none;\"></option>\
                                        <option value=\"visa\">Visa</option>\
                                        <option value=\"mc\">MasterCard</option>\
                                        <option value=\"ae\">America Express</option>\
                                        <option value=\"disc\">Discover</option>");
         } else if(selectedtype = "op") {
                 $companymenu.append("  <option value=\"\" style=\"display:none;\"></option>\
                                       <option value=\"ap\">Amazon Payments</option>\
                                        <option value=\"gc\">Google Checkout</option>\
                                        <option value=\"pp\">PayPal</option>");
         }         
         
         // RESET STEP TWO CONTAINERS
         var $credit = $('#creditvincontainer');
         var $online = $('#onlineinputcontainer');
         
         if (!($credit.css('visiblity') == 'hidden')) {
            $credit.css('visibility', 'hidden');
         } else if (!($online.css('visibility') == 'hidden')) {
            $online.css('visibility', 'hidden');
         }
   });       
}


function validCardNumber(number) {
   var company = $('#companydropdown').val();
   var filter;
   
   switch(company) {
     case "visa":
        filter = /^(?:4[0-9]{12}(?:[0-9]{3})?)$/;
        break;
     case "mc":
        filter = /^(?:5[1-5][0-9]{14})$/;
        break;
     case "ae":
        filter = /^(?:3[47][0-9]{13})$/;
        break;
     case "disc":
        filter = /^(?:6(?:011|5[0-9][0-9])[0-9]{12})$/; 
        break;
   }
   return filter.test(number);
}

function loadTableData() {
  var ajaxCall = $.ajax({
             type: 'POST',
             url: "/php/getCourses.php",
             data: {includeCheckbox: true},
             dataType: 'html',
             cache: false             
         });
         
    ajaxCall.done (function(data) {         
            $('#tablecourses tbody').append(data);
            $('tr:odd').css('background-color', '#D3D3D3');
            $('#tablecourses').tablesorter({
                headers: { 0: { sorter: false} } 
            });             
         }); 
         
         ajaxCall.fail (function(jqXHR, textStatus, errorThrown) { 
                          alert("Error Loading Courses");
         });
}

function getCurrentBalance() {
            var ajaxCall = $.ajax({
                               type: 'POST',    
                               url: "/php/getUserBalance.php",
                               data: {email: "johnboy@gmail.com"},
                               dataType: 'html',
                               cache: false
                          });
                          
                          ajaxCall.done (function(data) {
                             return data;
                          });
                          
                          ajaxCall.fail (function(jqXHR, textStatus, errorThrown) {
                                          alert("Error Getting User Balance");
                          });
}