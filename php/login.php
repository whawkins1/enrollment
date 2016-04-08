<?php
  session_start();
  include("config.php");
if( isset($_POST['username'], $_POST['password'])) {	
        $username = $_POST['username'];
        $password = $_POST['password'];
        $stmt = $conn->prepare("SELECT password FROM users WHERE username = ?");
        $stmt->bind_param('s', $username);
        $stmt->execute();
        if ($stmt->num_rows == 1) { //Username Match
            $result = $stmt->get_result();
            $row = $result->fetch_array();
            $user_db_hash = $row['password'];
                    
            if (PASSWORD_VERIFY($password, $user_db_hash)) {
                 $_SESSION['username'] = $username;
                 echo "valid";
            } else {
                 echo "invalid";
            }
        } else {
           echo "invalid";
        }
        $stmt->free_result();
        $stmt->close();      
        $conn->close();
      }
?>