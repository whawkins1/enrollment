 <?php 
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="validateregistration.js"></script> 
   require_once ("config.php");
     $.ajax({
              type: "POST",
              url: "findState.php",
              async: true,
              success: function(text) {
                  $("#stateselect").append(text)                                             
              }
     )};