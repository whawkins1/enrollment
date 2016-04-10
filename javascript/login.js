
(function() {
  ('#login_form').validate({
      rules: {
          password: "required",
          username: "required"
      },
      
      messages: {
        password:  "Please enter your password",
        username:  "Please enter your username"
      },
                  
        submitHandler: submitForm
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
    var data = $('#login_form').serialize();
            console.log("here");
      
         /* var ajaxCall = $.ajax({
                type: 'POST',
                url: "../php/login.php",
                data: data
          });
      
          ajaxCall.done (function(data) {
              if (data === "valid") {
                 alert("Valid Login");
                 //window.open("account.php?username=" + ('#username').val().trim());
              } else if (data === "invalid") {
                alert("Invalid Login, Please Try Again");
                /*('#username').focus();
                ('#password').val("");
                ('#password').attr('placeholder', "Password");           
              }
          });  */  
}