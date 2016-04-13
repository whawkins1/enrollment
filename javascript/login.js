
$(function() {
  $('#login_button').on('click', function () {
      var username = $('#username').val().trim();
      var password = $('#password').val().trim();
      var regexEmail = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
      
  if ( (username === "") && (password !== "")) {
      alert("Username Field Required!");
      $('#username').focus();
      $('#password').val("");
  } else if ( (username !== "") && (password === "")) {
      alert("Password Field Required!");
      $('#password').focus();
  } else if ( (username === "") && (password === "")) {
      alert("Both Fields Required");
      $('#username').focus();   
  } else if (!(regexEmail.test(username)) {
      alert("Invalid Username Format");
      $('#username').focus();
  } else {            
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
              console.log(data);
              if (data === "valid") {
                 alert("Valid Login");
                 //window.open("account.php?username=" + username);
                 $('#login_form')[0].reset();
              } else if (data === "invalid") {
                alert("Invalid Login, Please Try Again");
                $('#username').focus();                
              } 
          });   
          
          ajaxCall.fail (function(jqHXR, textStatus, errorThrown) {
                alert("Error Logging in, Please Try Again!");
                $('#password').val("");
                $('#username').focus();      
          });          
  }      
  });
  
  $('#username').on('keypress', function (e) { triggerEnter(e); });
  $('#password').on('keypress', function (e) { triggerEnter(e); });
});

function triggerEnter ( event ) {
  var keyCode = event.which;
    
  if (keyCode === 13) {
       $('#login_button').trigger('click');
       event.preventDefault();
  }
}
