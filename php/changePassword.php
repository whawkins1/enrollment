<?php
   include ("config.php");

     if ( isset( $_POST['email'], $_POST['password'] ) ) {
          $password_hash = password_hash($_POST['password'], PASSWORD_BCRYPT, array('cost' => 11));
          $sql = "UPDATE users SET user_password=? WHERE user_email=?";
          
           $stmt = $conn->prepare($sql);
           $stmt->bind_param('ss', $password_hash, $_POST['email']);
           $stmt->execute();   

           if ($stmt->errno) {
               echo "ERROR: failed to properly execute statement!"; 
           } else {
               echo "SUCCESS: Password Changed!";
           }
     }
?>