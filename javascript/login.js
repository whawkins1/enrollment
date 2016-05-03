
$(function() {
  $('#login_button').on('click', function () {
      var username = $('#username').val().trim();
      var password = $('#password').val().trim();
      
      var regexEmail = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
      
      if ( (username === "") && (password !== "")) {
          $('#errorlogin').text("Error: Username Must Be Entered!");
          $('#username').focus();
          $('#password').val("");
      } else if ( (username !== "") && (password === "")) {
          $('#errorlogin').text("Error: Password Must Be Entered!");
          $('#password').focus();
      } else if ( (username === "") && (password === "")) {
          $('#errorlogin').text("Error: Both Fields Must Be Entered!");
          $('#username').focus();   
      } else if (!(regexEmail.test(username))) {
          $('#errorlogin').text("Invalid Username Format");
          $('#username').focus();
      } else {        
             $(this).val("");
             $(this).css({'background-image': 'url(../images/loader.gif)',
                       'background-repeat': 'no-repeat',
                       'background-position': 'center'});
             
             var ajaxCall = $.ajax({
                    type: 'POST',
                    url: "../php/login.php",
                    data: { 
                            username : username,
                            password : password
                          },
                    dataType: 'text'
              });
          
              ajaxCall.done (function(data) {
                  if (data === "valid") {
                     window.open("http://localhost/php/account.php?username=" + username, "_self", "", true);
                  } else if (data === "invalid") {
                    $('#errorlogin').text("Invalid Login, Please Try Again!");
                    $('#username').focus();                
                    $(this).html("Login");
                  }                   
              });   
              
              ajaxCall.fail (function(jqHXR, textStatus, errorThrown) {
                    $('#errorlogin').text("Error Logging in, Please Try Again!");
                    $('#password').val("");
                    $('#username').focus();      
                    
              });          
              $(this).css('background-image', 'none');
              $(this).val("OK");
      }      
  });
  $('.input_text').on('keypress', function (e) { triggerEnter(e); });
});

function triggerEnter ( event ) {
  var keyCode = event.which;
    
  if (keyCode === 13) {
       $('#login_button').trigger('click');
       event.preventDefault();
  }
}
