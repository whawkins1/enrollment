<?php 
  $conn = new mysqli("localhost", "root", "chase", "enrollment"); 
   
   if (!$conn) {
      trigger_error("mysqli Connection Failed!" . htmlspecialchars(mysqli_connect_error()), E_USER_ERROR);
   }
?>