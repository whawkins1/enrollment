
$(function() {    
    var firstNameChanged = false;
    var lastNameChanged = false;
    var addressChanged = false;
    var cityChanged = false;
    var stateChanged = false;
    var zipchanged = false;
    var homePhoneChanged = false;
    var mobilePhoneChanged = false;
    var emailChanged = false;
    
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
        //Check keycodes spacebar devare backspace and number range
        
        return (e.which === 37 || e.which === 39 || e.which === 8 || e.which === 46 || (e.which >= 48 && e.which <= 57)); 
    });
    
    $('#creditcard').on('keydown', function(e) {
        //Check keycodes spacebar devare backspace and number range
        
        return (e.which === 37 || e.which === 39 || e.which === 8 || e.which === 46 || (e.which >= 48 && e.which <= 57)); 
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
    $('#editButton').on('click', function() {
        var text = $(this).text();
        if (text === "Edit") {
            $('.contactinput').prop('readonly', false);
            $(this).text("Save");
        } else { // In Save Mode
          //Validate and check info then write to server
          $('.contactinput').prop('readonly', true);
          $(this).text("Edit");
        }
    });   
    
    //Switch Password Visbility
    $('#showpasscb').on('click', function () {
        $('#password').attr(type, $(this).prop('checked') ? 'text' : 'password');
    });
    
    $('.contactinput').on('keyup keydown keypress change blur', function () {
       if ( $(this).val() !==  $.data(this, 'lastvalue') {
          select( this.id ) {
             case "firstname":
                  firstNameChanged = true;
                  break;
             case "lastName":
                  break;
             case "streetaddress":
                  break;
             case "city":
                  break;
             case "state":
                  break;
             case "zipcode":
                  break;
             case "homephone":
                  break;
             case "mobilephone":
                  break;
             case "email":
                  break;
          }
          $.data(this, "lastvalue", $(this).val());
       }
    });
});

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
