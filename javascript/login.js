
$(function() {
  ('#login_form').validate({
         rules:
      {

      password: {
          required: true,
      },
      
      username: {
         required: true;
      },
      
      messages: {
        password: {
                     required: "Please enter your password"
                  },
        
        username: {
                     required: "Please enter your username"
                  },
               
        submitHandler: submitForm
               
      )};

      
  function submitForm() {
      var data = $('#login_form').serialize();
      
      var ajaxCall = $.ajax({
            type: 'POST',
            url: "login.php",
            data: data
      });
      
      ajaxCall.done (function(data) {
          if (data === "valid") {
             window.open("account.php?username=" + ('#username').val().trim());
          } else if (data === "invalid") {
            alert("Invalid Login, Please Try Again");
            ('#username').focus();
            ('#password').val("");
            ('#password').attr('placeholder', "Password");           
          }
      }
  }

  $('#username').on('keyup', function() {
      var empty = $(this).val().length === 0;
     
      if (empty) {
          $(this).attr('placeholder', "Username");
      }
  });
  
  $('#password').on('keyup', function() {
      var empty = $(this).val().length === 0;
      
      if (empty) {
          $(this)attr('placeholder', "Username");
      }
  }  
});