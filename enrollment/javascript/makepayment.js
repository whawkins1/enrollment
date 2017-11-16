
$(function() {
   $('#selectpaymenttype').on('change', function() {
         var selectedtype = $(this).val();
         if(selectedtype == "cc") {
             $('#companydropdown').append("<option disabled="disabled" selected="selected">-- Select --</option>
                        <option value="visa">Visa</option>
                        <option value="mc">MasterCard</option>
                        <option value="ae">America Express</option>
                        <option value="disc">Discover</option>");
         } else {
             $('#companydropdown').append("<option disabled="disabled" selected="selected">-- Select --</option>
                    <option value="ap">Amazon Payments</option>
                    <option value="gc">Google Checkout</option>
                    <option value="pp">PayPal</option>");
         }
   });       
    
   $('#nextbutton').on('click', function() {
       var regexCardNo = getRegex();
       var isValidNumber
       
       window.close();
       
       window.open("http://localhost/php/makepayment?.php", "Payment", 
               "height=" + height + ", width= " + width + "\
               , status=yes, toolbar=no, menubar=no, location=no, left=\
               " + fromleft + ", top=" + fromtop );
   });
});

function isValidCardNumber(inputText, regex, cardName) {
    if(inputText.value.match(regex) {
       return true;
    } else {
       alert("Not a Valid " + cardName + " Credit Card Number, Please Try Again.");
       return false;
    }
}

function getRegex(cardName) {
   var regexCardNo;
   
   switch(cardName) {
     case "visa":
        regexCardNo = /^(?:4[0-9]{12}(?:[0-9]{3})?)$/;
        break;
     case "mc":
        regexCardNo = /^(?:5[1-5][0-9]{14})$/;  
        break;
     case "ae":
        regexCardNo = /^(?:3[47][0-9]{13})$/;
        break;
     case "disc";
        regexCardNo = /^(?:6(?:011|5[0-9][0-9])[0-9]{12})$/; 
        break;
   }
   return regexCardNo;
}