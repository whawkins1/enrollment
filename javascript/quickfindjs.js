
$(function() {
   $('#inputcoursecode').on('keypress', function(e) {
       var allowedChars = new RegExp("^[a-zA-Z0-9\-]+$");
       var text = String.fromCharCode(e.which);
       var $button = $('#quickfindbutton');
       if (allowedChars.test(text) || e.keyCode === 8) {
           var enableButton = ($button.prop('disabled') && $(this).val().length > 0  ?  false : true);
           console.log($(this).val().length);
           $button.prop('disabled', enableButton);
           return true;           
       }
       return false;
   });
});