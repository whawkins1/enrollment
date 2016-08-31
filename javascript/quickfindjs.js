
$(function() {
   $('#inputcoursecode').on('keypress', function(e) {
       var allowedChars = new RegExp("^[a-zA-Z0-9\-]+$");
       var text = String.fromCharCode(e.which);
       if (allowedChars.test(text) || e.keyCode === 8) {
           return true;           
       }
       return false;
   });
   
   $('#inputcoursecode').on('keyup', function() {
        var $button = $('#quickfindbutton');
        var enableButton = ($button.prop('disabled') && $('#inputcoursecode').val().length > 0  ?  false : true);
        $button.prop('disabled', enableButton);
   });
   
   $('#quickfindbutton').on('click', function() {
       //Process request with ajax
   });
});