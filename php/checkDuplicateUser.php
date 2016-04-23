<?php
   include("config.php");
   
   $sql = "SELECT user_email FROM users WHERE email = ?";
   
   if ($stmt->$conn->prepare($sql)) {
        $stmt->bind_param('s', $conn->real_escape_string($_POST['email']));
        
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
   }