<?php 
  $conn = new mysqli("localhost", "root", "chase", "enrollment"); 
   
   if(mysqli_connect_errno()) {
      die("Error Connecting to Database" . mysqli_connect_error());
   }
?>