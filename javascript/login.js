
(function() {
  ('#login_button').on('click', function () {
      var username = ('#username').val().trim();
      var password = ('#password').val().trim();
      
  if ( (username === "") && (password !== "")) {
      alert("Username Field Required!");
      ('#username').focus();
  } else if ( (username !== "") && (password === "")) {
      alert("Password Field Required!");
      ('#password').focus();
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
              if (data === "valid") {
                 alert("Valid Login");
                 //window.open("account.php?username=" + username);
              } else if (data === "invalid") {
                alert("Invalid Login, Please Try Again");                
              }
          });   
          
          ajaxCall.fail (function(jqHXR, textStatus, errorThrown) {
                alert("Error Logging in, Please Try Again!");
          });
          ('#login_form').[0].reset();
          ('#username').focus();
  }      
  });

  $('#username').on('keyup', function() {
      var empty = $(this).val().length === 0;
     
      if (empty) {
          $(this).attr('placeholder', "Username");
      }
  });
  
  $('#password').on('keyup', function() {
      var empty = $(this).val().length === 0;
      
      if (empty) {
          $(this).attr('placeholder', "Username");
      }
  });  
});

function submitForm() {
    
}