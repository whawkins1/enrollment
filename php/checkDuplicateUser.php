<?php
   include("config.php");
   
   if isset($_POST['email']) {
       $sql = "SELECT user_email FROM users WHERE user_email = ?";
       
       if ($stmt=$conn->prepare($sql)) {
             //$email = $conn->real_escape_string();
             
            $stmt->bind_param('s', $_GET['email']);
            
            if ($stmt->execute() ) {
               $stmt->store_result();
               $stmt->bind_result($email_check);
               $stmt->fetch();
               
               if ($stmt->num_rows === 1) {
                   echo "email in use";
               } else {
                   echo "email not in use";
               }           
            }   
       } else {
          echo "error";
       }
   } else {
      echo "email not set";
   }
 ?> 