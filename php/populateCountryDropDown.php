 <?php 
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="validateregistration.js"></script> 
   require_once ("config.php");
     $.ajax({
              type: "POST",
              url: "getCountries.php",
              async: true,
              success: function(text) {
                  $("#countryselect").append(text)                                             
              }
     )};
     
                            