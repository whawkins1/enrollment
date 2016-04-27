<?php
   include("config.php");
   
   if (isset($_GET['email'])) {
       $sql = "SELECT user_email FROM users WHERE user_email = ?";
       
       if ($stmt=$conn->prepare($sql)) {
            $email = $conn->real_escape_string($_GET['email']);
             
            $stmt->bind_param('s', $email);
            
            if ($stmt->execute() ) {
               $stmt->store_result();
               $stmt->bind_result($email_check);
               $stmt->fetch();
               
               if ($stmt->num_rows === 1) {
                   echo "email in use".PHP_EOL;
               } else {
                   echo "email not in use".PHP_EOL;
               }           
            }   
       } else {
          echo "error";
       }
   } else {
      echo "email not set";
   }
 ?> 