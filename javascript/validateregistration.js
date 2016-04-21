var noErrors = true;
var htmlErrors;
    
$(function()  {
    populateCountryDropDown();
    populateMajorDropDown();
    
    $('#submit').on('click', function(e) {
        submitInformation();
        });// end submit
        
    $(document).on('keypress', 'form', function(e) {
       if(e.keyCode == 13) {
        submitInformation(); 
      }
    });    

         $('#postalcode').on('keydown', function(e) {
             //Allow Keyboard Shortcuts include cut paste
             var arr = [8,9,16,17,20,35,36,37,38,39,40,45,46,86,88];
             
             for (var i = 48; i <= 57; i++) {
                    arr.push(i);
             }
             
             if (!(e.ctrlKey && (e.which == 90 || e.which == 86 || e.which == 88))) {
                 if ($.inArray(e.which, arr)  === -1) {
                   e.preventDefault();
                 }
             }
         });
               
         $('#postalcode').on('keypress', function() {
             var inputValue = this.value;
             if (inputValue.match(/[^0-9]/g)) {
                inputValue( inputValue.replace(regexpnumbers, ''));
             }
         });             
         
         $('.inputfieldletters').on('keydown', function(e) {
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
         
         $('.inputfieldletters').on('keypress', function() {
           var inputValue = this.value;
           
           if (inputValue.match(/[^a-zA-Z]/g)) {
              inputValue( inputValue.replace(regexpletters, ''));
           }
         });
     
    $("#country_drop_down").change(function() {		
              $('#loading_state_image').css('visibility', 'visible');
              $.ajax({
                  type: 'POST',
                  url: "/php/findState.php",
                  datatype: 'html',
                  data: { country_id : ($('#country_drop_down option:selected').val()) }
              }) // end ajax
              .done (function(data) { 
                            $("#stateselect").html(data);
                            $("#stateselect").prop("selectedIndex", -1);
                            $('#cityselect').html("<option></option>");})                  
              .fail (function() { alert("Error Loading States");})         
              ;           
              $("#loading_state_image").css('visibility', 'hidden');
    }); // end change country drop down
    
    
	$("#state_drop_down").change(function() {	
          $selected = $('#state_drop_down :selected').text();
          if (!($selected == "none" || $selected == "error")) {
              $("loading_city_image").css('visibility', 'visible'); 
              var ajaxCall = $.ajax({
                  type: 'POST',
                  url: "findCity.php",
                  datatype: 'html',
                  data: { state_id : ($('#state_drop_down option:selected').val()) }
              }); 
              
              ajaxCall.done (function(data) {
                  $('#cityselect').html(data);});
              
              ajaxCall.fail (function() { alert("Error Loading States");});
              
              $('#loading_city_image').css('visibility', 'hidden');
          }
	}); // end change city drop down
    
    $('#phonehome').mask("999-999-9999");
    $('#phonemobile').mask("999-999-9999");
}); // end document ready

function submitInformation() {
      var noEmptyTextFields = true;       
        $('.dropdown').each(function() {
               if($.trim($(this).text()) == "") {
                 noEmptyTextFields = false;
                     $(this).css( {
                           "border": "1px solid red",
                           "background": "#FFCECE"
                     });
               } else {
                  $(this).css({
                               "border": "",
                               "background": ""
                             });
               }            
        }); // end check empty dropdowns 
           
             $('.inputfield').each(function() {
                 if(this.id != "#phonemobile") {
                   if ($.trim($(this).val()) == "") {
                       
                         noEmptyTextFields = false;
                         $(this).css( {
                               "border": "1px solid red",
                               "background": "#FFCECE"
                         });
                   } else {
                      $(this).css({
                                   "border": "",
                                   "background": ""
                                 });
                   }         
                 }
            }); // end check empty fields 
           
           if(noEmptyTextFields) {
               var phoneHome = $.trim($('#phonehome').val());
               var phoneMobile = $.trim($('#phonemobile').text);
               
               var regexEmail =  /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
               var input = $.trim($('#email').val());
                
                if (!(regexEmail.test(input))) {
                    setTextFieldRed($('#email'));
                    alert("Error Email");
                    noErrors = false;
                }
                
                var password = $('#password').val();
                var confirm = $('#confirm').val();
               
               if (password != confirm) {
                  setTextFieldRed('#password, #confirm');
               } else {
                 var passwordRegEx = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z]{8,}$/;
                 if (!(passwordRegEx.test(password))) {
                    alert("Password Error Must Include at least 8 Characters, One Uppercase, One Number");
                    noErrors = false;
                 } 
               }                   
                
               if(noErrors) {
                   var firstName = $('#firstname').val();
                   var lastName = $('#lastname').val();
                   var country = $('#countryselect :selected').text();
                   var state = $('#stateselect :selected').text();
                   var city = $('#cityselect :selected').text();
                   var address = $('#address').val();
                   var postalCode = $('#postalcode').val();
                   var phoneHome = $('#phonehome').val();
                   var phoneMobile = $('#phonemobile').val();
                   var major = $('#majorselect :selected').text();
                   var email = $('#email').val();
                   
                   console.log(firstName);
                   console.log(lastName);
                   console.log(country);
                   console.log(state);
                   console.log(city);
                   console.log(address);
                   console.log(postalCode);
                   console.log(phoneHome);
                   console.log(phoneMobile);
                   console.log(major);
                   console.log(email);
                   console.log(password);  
               
                    var ajaxCall = $.ajax({
                             type: 'POST',
                             url: "submitRegistration.php",
                             data: {firstName: firstName,
                                    lastName:  lastName,
                                    country: country,
                                    state: state,
                                    city: city,
                                    address: address,
                                    postalCode: postalCode,
                                    phoneHome: phoneHome,
                                    phoneMobile: phoneMobile,
                                    major: major,
                                    email: email,
                                    password: password }
                             });
                    ajaxCall.done (function(data) { alert("Register Complete "); });
                                                //window.open("welcome.php" + "?email=" + $email);});
                    ajaxCall.fail (function() { alert("Error Processing Registration"); });                      
               } 
           } else {
               alert("Error Phone Home");
             htmlErrors += "<p>Empty Fields All With * Must Be completed</p>";
           }
}


function populateCountryDropDown() {
       var ajaxCall = $.ajax({
              type: 'GET',
              url: "/php/getCountries.php",
              datatype: 'html',
              cache: false
          });
          
         ajaxCall.done (function(data) {                      
                      $("#countryselect").html(data)  
                      $("#countryselect").prop("selectedIndex", -1);});
                      
         ajaxCall.fail (function() { alert("Error Loading Countries");});       
         
         
}  

function populateMajorDropDown() {
    var ajaxCall = $.ajax({
                    type: 'GET',
                    url: "/php/getMajors.php",
                    datatype: 'html',
                    cache: false
                });
                
    ajaxCall.done (function(data) {
                      $("#majorselect").html(data)
                      $("#majorselect").prop("selectedIndex", -1); });
    
    ajaxCall.fail (function() { alert("Error Loading Majors");});  
}

function setTextFieldRed(textField, errorMessage) {
    noErrors = false;
    htmlErrors += errorMessage;
  textField.css( {
                    "border": "1px solid red",
                   "background": "#FFCECE"
                  })
}