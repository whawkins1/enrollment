
$(function() {
   $('#inputcoursecode').on('keypress', function(e) {
       if (e.which === 13) {
           $('#quickfindbutton').click();
       } else {
           var allowedChars = new RegExp("^[a-zA-Z0-9\-]+$");
           var text = String.fromCharCode(e.which);
           var keyCodes = [8, 37, 39, 46, 116];
           var code = e.keyCode;
           
           console.log(code);
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
                    term: text
                 }           
       })
       .done(function(data){
       })
       .fail(function(jqHXR, textStats, errorThrown){
       });
   });
});