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
var delCurrCoursesArr = [];
var origCurrCoursesArr = [];
var updateCurrCoursesArr = [];
var methodPayment;

$(function() { 
    //Remove all Data Fields to avoid caching previous results
    $(window).on('unload', function () {
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
    });
    
    //disable possible elements based on row rount of courses table
    if ($('#tablecourses tbody tr').length === 0) {            
           $('#checkboxhead').prop('disabled', false);
           $('#buttonaddcourses').prop('disabled', false);
           $('#departmentfilter').prop('disabled', false);
           $('#codefilter').prop('disabled', false);
           $('#professorfilter').prop('disabled', false);
           $('#locationfilter').prop('disabled', false);
    }
    
    //Populate codes from current courses into array
    $('#tablecourses tbody').find('tr').each(function() {
           var code = $(this).find("td").eq(1).html();
           origCurrCoursesArr.push(code);
    });
    
    //Sort financial table descending
    $('#tablepayments tbody tr').sort( function(a, b) {
        return new Date($(a).find('td:eq(0)').html()).getTime() < new Date($(b).find('td:eq(0)').html()).getTime();
    }).appendTo('#tablepayments tbody');
    
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
    
    setDropDownFilterDepartment();
    setDropDownFilterCode();
    setDropDownFilterProfessor();
    setDropDownFilterLocation();
    setDropDownFilterPayments();
    setPaymentTypeDropDown();
    setMakePaymentAction();
    $('#amount').autoNumeric('init');
    $('#vin').val("");        
    
    //Add Row To Current Courses and Remove It From Catalog
    $('#buttonaddcourses').on('click', function() {
       $('#tablecatalog tbody input[type="checkbox"]').each(function () {
           if($(this).prop("checked")) {
               if ($('#tablecourses tbody tr').length === 0) {
                  $('#buttonupdatecourses').prop('disabled', false);    
               }               
               $(this).prop('checked', false);
               var checkedRow = $(this).closest("tr").remove().clone();
               var code = checkedRow.find("td").eq(1).html();
               
               if ($.contains(code, delCurrCoursesArr)) {
                   delCurrCoursesArr.splice($.inArray(code, deleCurrCourseArr), 1);
               }
               // If course not in original array add to update
               if (!($.contains(code, origCurrCoursesArr))) {
                   updateCurrCoursesArr.push(code);
               }
           }
        });

        var rowCount = $('#tablecourses tbody tr').length;
        if (($('#departmentfilter').prop('disabled') && $('#codefilter').prop('disabled') && $('#professorfilter').prop('disabled')
                                                     && $('#locationfilter').prop('disabled')) && rowCount !== 0) {
                         $('#checkboxhead').prop('disabled', false);
                         $(this).prop('disabled', false);
                         $('#departmentfilter').prop('disabled', false);
                         $('#codefilter').prop('disabled', false);
                         $('#professorfilter').prop('disabled', false);
                         $('#locationfilter').prop('disabled', false);
        } else if (!($('#departmentfilter').prop('disabled') && $('#codefilter').prop('disabled') 
                    && $('#professorfilter').prop('disabled')
                    && $('#locationfilter').prop('disabled')) && rowCount === 0) {
                        $('#checkboxhead').prop('disabled', true);
                         $(this).prop('disabled', true);
                         $('#departmentfilter').prop('disabled', true);
                         $('#codefilter').prop('disabled', true);
                         $('#professorfilter').prop('disabled', true);
                         $('#locationfilter').prop('disabled', true);
        }
                
        var currentTotal = +($('#labelcurrentcredittotal').text());        
        var selectedTotal = +($('#labelselectedcredits').text()); 
        var newTotal = (currentTotal + selectedTotal);
        $('#labelcurrentcredittotal').text(newTotal);
        $('#labelselectedcredits').text("0");
        $(this).prop('disabled', true);   
        
        if (!($('buttonupdatecourses').prop('enabled'))) {
               $(this).prop('enabled', true);
        }
    });
    
    //Remove Row From Current Courses And Add it back to Catalog
    $('#buttonremovecourses').on('click', function() {
        var currentTotal = +($('#labelcurrentcredittotal').text());
        $('#tablecourses tbody input[type="checkbox"]').each(function() {
           if($(this).prop("checked")) {
              $(this).prop('checked', false); 
              var $removedRow = $(this).closest("tr").remove().clone();
              var code = $removedRow.find("td").eq(1).html();
              var credits = $removedRow.find("td").eq(7).html();
              currentTotal = (currentTotal - credits);
              $removedRow.appendTo($('#tablecatalog tbody'));
              if ($.inArray(code, origCurrCoursesArr) > -1) {
                   delCurrCoursesArr.push(code);
              }
           }
        });
        
        var rowCount = $('#tablecourses tbody tr').length;
        var $checkBoxHead = $('#checkboxhead');
        var headChecked = $checkBoxHead.prop('checked');
        
        if (rowCount === 0 && headChecked) {
            $('#labelcurrentcredittotal').text("here");
            $checkBoxHead.prop('checked', false);
            $('#departmentfilter').prop('disabled', true);
            $('#codefilter').prop('disabled', true);
            $('#professorfilter').prop('disabled', true);
            $('#locationfilter').prop('disabled', true);
            $checkBoxHead.prop('disabled', true);
        }
        $(this).prop('disabled', true);
        $('#labelcurrentcredittotal').text(currentTotal);       
    });         
    
     //Check All Boxes and enable or disable remove button   
     $('#checkboxhead').on('change', function() {
        var checked = $(this).prop('checked');
        $button = $('#buttonremovecourses');
       
        $('#tablecourses tbody input[type="checkbox"]').each(function() {
             $(this).prop('checked', checked);
        });
        
        if ( ($button.prop('disabled')) && (checked) ) {
             $button.prop('disabled', false); 
        } else  {
             $button.prop('disabled', true);
        }            
     });
    
    //Enable remove button and check or uncheck header checkbox
    $('#tablecourses').on('click', 'tbody input[type="checkbox"]', function() {
        var indivChecked = $(this).prop('checked');
        
        var $checkboxHead = $('#checkboxhead');
        var headChecked = $checkboxHead.prop('checked');
        if((headChecked) && (!indivChecked)) {
            $checkboxHead.prop('checked', false);
        } else if (!headChecked) {
            var allChecked = true;
            
               $('#tablecourses tbody input[type="checkbox"]').each(function () {
                    if(!($(this).prop('checked'))) {
                       allChecked = false;
                       return false;
                    }
                });
            $checkboxHead.prop('checked', allChecked);
        }
        
        var noneChecked = true;
        if (indivChecked) {
            noneChecked = false;
        } else if (!indivChecked) {
            $('#tablecourses input[type="checkbox"]').each(function() {
                if($(this).prop('checked')) {
                    noneChecked = false;
                    return false;
                }
            });            
        } 
        
        var $buttonRemove = $('#buttonremovecourses');
        var buttonRemoveDisabled = $buttonRemove.prop('disabled');
        
        var enable = !buttonRemoveDisabled && noneChecked ? true : false;
        $buttonRemove.prop('disabled', enable);
    });
    
    $('#tablecatalog').on('click', 'input[type="checkbox"]', function() {
        var indivChecked = $(this).prop('checked');
        
        var noneChecked = true;
        var $labelselectedcredits = $('#labelselectedcredits');
        var selectedCredits = +($labelselectedcredits.text());
        var rowCredits = +($(this).closest('tr').find('td:eq(7)').text());
        if (indivChecked) {                       
            var addCredits = (selectedCredits + rowCredits);
            $labelselectedcredits.text(addCredits);
            noneChecked = false;  
        } else if (!indivChecked) {            
            $('#tablecatalog input[type="checkbox"]').each(function() {
                if($(this).prop('checked')) {
                    noneChecked = false;
                    return false;
                }
            });            
            var subCredits = (selectedCredits - rowCredits);
            $labelselectedcredits.text(subCredits);
        }
        
        var $buttonAdd = $('#buttonaddcourses');
        var buttonAddDisabled = $buttonAdd.prop('disabled');
        
        var disable = false;
        if (!buttonAddDisabled && noneChecked) {
            disable = true;
        }

        $buttonAdd.prop('disabled', disable);
    });
    
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
       var calculatedBalance = (currentBalance - payment)
       
       if (amount.length > 0) {
           if ( calculatedBalance < 0) {
                  alert("The Payment Is Greater Than the Balance,\nTherefore, You Will Only Be Charged".concat(currentBalance.toString()));             
           } else {
               if ($('#selectpaymenttype').val() === "cc") {          
                  if (validCreditCardFormat(ccValue)) {
                     if (validCardNumber(ccValue)) {
                         methodPayment = "Credit Card"; 
                         populateReviewForm(payment, currentBalance, calculatedBalance);
                     } else {
                        alert("Incorrect Number");
                     }
                  } else {
                     alert("Invalid Credit Card Format");
                  }  
              } else { //Online Payment Action
                      methodPayment = "Online Payment";
                      
                      $.ajax({
                               type: 'POST',    
                               url: "/php/verifyUsernamePass.php",
                               dataType: 'html',
                               data: {
                                      email: $('#username').val(), 
                                      pass: $('#password').val(),
                                      checkType: $('#companydropdown :selected').text()
                                      },
                          })
                          .done (function(data) {
                             if (data === "VALID") {
                                $('#username').val() = "";
                                $('#password').val() = "";                                
                                populateReviewForm();
                             } else if (data === "INVALID") {
                                alert("Invalid Login, Please Try Again.");
                                $('#username').focus();
                             } else if (data.startsWith("ERROR")) {
                                alert(data);
                                $('#username').focus();
                             }
                          })
                          .fail (function(jqXHR, textStatus, errorThrown) {
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
         $.ajax({
             type: 'POST',
             url: "/php/completeTransaction.php",
             data: {
                       username: $('#email').text(),
                       todaysDate: $('#datelabel').text(),           
                       transID: $('#transactionid'),
                       currentBalance: $('#currentbalance'),
                       paymentMethod: $methodPayment,
                       payment: ('#payment').text(),
                       paymentType: $('#paymenttypelabel').text(),
                       paymentCompany: $('#companydropdown :selected').text(),
                       finalBalance: $('#balance')
                  }
         })
         .done (function(data) {
             
         })
         .fail (function(jqXHR, textStatus, errorThrown) {
             alert("Error Performing Transaction, Please Try Again.");
         });
         
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
            $('#resetButton').show();
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
                             $.ajax({
                                   type: 'GET',
                                   url: "../php/checkDuplicateUser.php",
                                   data: {
                                            email : input
                                         },
                                   dataType: 'text'
                            })
                            .done( function(data) {
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
                            })
                            .fail (function(jqHXR, textStatus, errorThrown) {
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
    
    $('#resetButton').on('click', function() {
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
         $('#resetButton').prop('disabled', true);
    });
    
    //Enable Reset Button on Key Input
    $('#contactfieldset input').on('keyup', function() {
          if ( $('#resetButton').prop('disabled') ) {
             $('#resetButton').prop('disabled', false);
          }              
    });
    
    //Enable Reset Button on Dropdown Selection
    $('#contactfieldset select').on('change', function () {
       if ( $('#resetButton').prop('disabled') ) {
          $('#resetButton').prop('disabled', false);
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
               $.ajax({
                  type: 'POST',
                  url: "../php/login.php",
                  data: {
                          username : email,
                          password : oldPassInput
                        },
                  dataType: 'text'                        
               })
               .done( function(data) {
                  if ( data === "valid" ) {
                      //Change Password
                      $.ajax({
                              type: 'POST',
                              url: "../php/changePassword.php",
                              data: {
                                        email : email,
                                        password : newPassInput
                                    },
                              dataType: 'text'
                      })
                      .done( function (data) {
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
                      })
                      .fail (function(jqHXR, textStatus, errorThrown) {
                            $oldPassField.focus();
                            $passwordMessage.text("SERVER ERROR: Problem Processing Request");
                      });                      
                  } else if ( data === "invalid" ) {
                      $passwordMessage.text("ERROR: Old Password Incorrect!");
                      $oldPassField.focus();
                  }
               })
               .fail (function(jqHXR, textStatus, errorThrown) {
                      $passwordMessage.html("SERVER ERROR: failed to update account!");
                      $(this).focus();
               });
           }
        }
    });    
    
    //Populate State Dropdown Based on Country
    $('#countrydropdown').on('change', function() {		
          $.ajax({
              type: 'POST',
              url: "findState.php",
              datatype: 'html',
              data: { 
                       country_id : ($('#countrydropdown option:selected').val())
                    }
            })
            .done (function(data) { 
                    $("#statedropdown").html(data);
                    $("#statedropdown").prop("selectedIndex", -1);
                    $('#citydropdown').html("<option></option>");
             })
             .fail (function(jqHXR, textStatus, errorThrown) { 
                 alert("Error Loading States");
             });         
    }); 
    
    //Populate City Dropdown Based on State
    $('#statedropdown').on('change',function() {	
          $selected = $('#statedropdown :selected').text();
          if (!($selected === "none" || $selected === "error")) {
               $.ajax({
                  type: 'POST',
                  url: "findCity.php",
                  datatype: 'html',
                  data: { 
                          state_id : ($('#statedropdown option:selected').val()) 
                        }
              })
              .done (function(data) {
                  $('#citydropdown').html(data);
                  $('#citydropdown').prop('selectedIndex', -1);
              })
              .fail (function(jqHXR, textStatus, errorThrown) { 
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
        semester = 'Summer';
    } else if (currentMonth >=1 && currentMonth <=5) {
        semester = 'Fall';
    } else if (currentMonth >=6 && currentMonth <=8) {
        semester = 'Spring';
    }
    $('#semesterdropdown').val(semester);
    
    $('#homephone').mask("999-999-9999");
    $('#mobilephone').mask("999-999-9999");
    
    $('#semesterdropdown').on('change', function() {
        populateGradeTable();
        getSemesterGPA();
        getCumulativeGPA();
    });
    
    $('#yeardropdown').on('change', function() {
        populateGradeTable();
        getSemesterGPA();
        getCumulativeGPA();
    });
    
    $('#tablegrades').tablesorter();
    
    $('#buttonupdatecourses').on('click', function() {
        //Delete Rows in enrolled table based on code
        $(this).css('background-image', 'url(/images/loader.gif');        
               $.ajax({
                   type: 'POST',
                   url: "removeCourses.php",
                   data: { codes: json.stringify(delCurrCoursesArr)}                         
               })
               .done(function(data) {
                     if (data.indexOf("ERROR") === 0) {
                         var message = data.split(':');
                         alert("Error " + message[1]);
                     } else if (data.indexOf("SUCCESS") === 0) {
                          //Insert Rows into enrolled based on code
                            origCurrCoursesArr.length = 0;
                            //Insert new values into original courses array
                            $.each(updateCurrCoursesArr, function(index, value) {
                                      origCurrCoursesArr.push(value);
                            });
                                    $.ajax({
                                             type: 'POST',
                                             url: "addCourses.php",
                                             data: {
                                                     email: originalEmail,
                                                     code: value,
                                             }
                                    })
                                    .done(function(data) {
                                        if(data.indexOf("ERROR") === 0) {
                                           var message = data.split(':');
                                           alert("Error" + $message[1]);
                                        } else if(data.indexOf("SUCCESS") === 0) {
                                            alert("Update Successfully Completed");
                                            $(this).prop('enabled', false);
                                        }
                                    })
                                    .fail(function (jqHXR, textStats, errorThrown) {
                                        alert("Error updating current courses");
                                    });
                 }
               })
               .fail(function (jqHXR, textStatus, errorThrown) {
                     alert("Error Removing Previous Courses");
               });                               
      $(this).css('background-image', '');
      $(this).html("Update");  
    });
    
    //Hide or Show Rows Based on Payment Method
    $('#selecttype').on('change', function() {
        var type = $(this).val();
        var $rows = ('#tablepayments tbody tr');
        if (type !== "All") {
            ($rows).find("td:nth-child(2)").filter(function() {
                 return $(this).text !== type;
            }).parent.hide();
        } else {
            $rows.each(function() {
                if($(this).is(':hidden')) {
                    $(this).hide();
                }
            });
        }
    });
});

function populateGradeTable() {
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
          $.ajax({
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
          .done( function(data) {
              var response = $.trim(data);
              if ( response === "success" ) {
                  $('#errorcontainer').html("SUCCESS: completed update of account!");
                  originalEmail = $('email').val();
                  var $resetButton = $('#resetButton');
                  $resetButton.prop('disabled', true);
                  $resetButton.hide();
              } else if ( response === "error" ) {
                  $('#errorcontainer').html("ERROR: failed to update account!");
                  setEditMode = false;
              }
          })
          .fail (function(jqHXR, textStatus, errorThrown) {
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

function populateReviewForm (payment, currentBalance, calculatedBalance) {
  //Set Date Box For Payment Review
                /*var d = new Date();
                var month = d.getMonth() + 1;
                var day = d.getDay();
                
                var formattedDate = (d.getFullYear() + "/" +
                                    (month < 10 ? "0" : "") + month + "/" +
                                    (day < 10 ? "0" : "") + day); */
                                    
                $('#datelabel').text(new Date().toIOString().splice(0, 10));  
                $transID = 0;
                $.ajax({
                      type: 'GET',
                      url: "getHighestTransactionID.php",
                      dataType: 'text'
          })
          .done( function(data) {
              if ( data.indexOf("ERROR") == 0 ) {
                  var message = data.split(':');
                  alert("ERROR : " + message[1]);
              } else {
                  transID = (parseInt(data, 10) + 1);
              }
          })
          .fail (function(jqHXR, textStatus, errorThrown) {
              $('#errorcontainer').html("SERVER ERROR: failed to update account!");
              $('#editbutton').focus();
              setEditMode = false;                                  
          });                
                $('#transactionidlabel').text(transID.toString());
                $('#paymenttype').text(methodPayment);
                $('#currentbalance').text(currentBalance.toString());
                $('#payment').text(payment.toString());
                $('#balance').text(calculatedBalance.toString());                
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
         //Check if make payments tab active
         $link = $($makepaymenttab).find('a');
      $paymenttabactive = $($link[0]);
      if($paymenttabactive.hasClass('active')) {
           
      }
      $active.addClass('active');

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

function getCurrentBalance() {
    $.ajax({
        type: 'POST',    
              url: "/php/getUserBalance.php",
              data: {email: "johnboy@gmail.com"},
              dataType: 'html',
      })
      .done (function(data) {
               return data;
      })
      .fail (function(jqXHR, textStatus, errorThrown) {
                   alert("Error Getting User Balance");
      });
}