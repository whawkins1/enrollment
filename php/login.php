<?php
  session_start();
  include("config.php");
if( isset($_POST['username'], $_POST['password'])) {	
        $username = $conn->real_escape_string($_POST['username']);
        $password = $conn->real_escape_string($_POST['password']); 
        
        $sql = "SELECT user_password FROM users WHERE user_email = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param('s', $username);
        if ($stmt->execute()) {
            $stmt->store_result();
            if ($stmt->num_rows == 1) { //Username Match
                $stmt->bind_result($user_db_hash);
                $stmt->fetch();
                        
                if (PASSWORD_VERIFY($password, $user_db_hash)) {
                     $_SESSION['username'] = $username;
                     echo "valid";
                } else {
                     echo "invalid";
                }
            } else {
               echo $stmt->num_rows;
            }            
        }
        $stmt->free_result();
        $stmt->close();      
        $conn->close();
      }
?>