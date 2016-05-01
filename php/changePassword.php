<?php
   include ("config.php");

     if ( isset( $_GET['email'], $_GET['password'] ) ) {
          $password = $conn->real_escape_string($_GET['password']);
          $email = $conn->real_escape_string($_GET['password']);
          $password_hash = password_hash($_POST['password'], PASSWORD_BCRYPT, array('cost' => 11);
          
          $sql = "UPDATE users SET user_password = ? WHERE user_email = ?";
          
          if ( $stmt->prepare($sql) ) {
              $stmt->bind_param('ss', $password_hash, $email);
              
              if (stmt->execute) {
                  echo "SUCCESS: Password Changed!";
              } else 
                 trigger_error("Error Executing Update: ", E_USER_ERROR);
                 echo "ERROR: failed to properly execute statement!";
              }
          } else {
              echo "ERROR: Invalid SQL Format!";
          }
     }
?>