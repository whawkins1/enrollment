
$(function() {
   $('#inputcoursecode').on('keypress', function(e) {
       if (e.which === 13) {
           $('#quickfindbutton').click();
       } else {
           var allowedChars = new RegExp("^[a-zA-Z0-9\-]+$");
           var text = String.fromCharCode(e.which);
           var keyCodes = [8, 37, 39, 46, 116];
           var code = e.keyCode;
           
           if (allowedChars.test(text) || $.inArray(code, keyCodes) > -1 || e.ctrlKey || e.shiftKey) {
               return true;           
           }
           return false;
       }
   });
   
   $('#inputcoursecode').on('keyup', function(e) {
        var $button = $('#quickfindbutton');
        var disableButton;
        if ($button.prop('disabled') && $('#inputcoursecode').val().length > 0) {
            disableButton = false;
        } else if((!($button.prop('disabled'))) && $('#inputcoursecode').val().length === 0) {
            disableButton = true;
        }
        $button.prop('disabled', disableButton);
   });
   
   $('#quickfindbutton').on('click', function() {
       $.ajax({
           type: 'GET',
           url: 'quickfind.php',
           cache: false,
           data: {
                    code: $('#inputcoursecode').val();
                 }           
       })
       .done(function(data){
           if (data.match("ERROR_EXECUTING_STATEMENT")) {
              alert("Error Executing Statment");
           } else if (data.match("ERROR_PREPARING_STATEMENT")) {
              alert("Error Preparing Statment");
           }
       })
       .fail(function(jqHXR, textStats, errorThrown){
           alert ("Error Retrieving Course Code " + $('#inputcoursecode').val();
       });
   });
});