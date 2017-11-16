<?php 
  $conn = new mysqli("localhost", "root", "chase", "enrollment"); 
   
   if ($conn->connect_error) {
      trigger_error("Database Connection Failed: " . $conn->connect_error, E_USER_ERROR);
   }
?>