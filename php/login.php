<?php
  session_start();
  include("config.php");
if($_POST) {	
        $username = $conn->real_escape_string($conn, $_POST['username']);
        $stmt = $conn->prepare("SELECT password From users WHERE username = ?");
        $stmt->bind_param('s', $username);
        $stmt->execute();
        if ($stmt->num_rows == 1) { //No Username Match
            $result = $stmt->get_result();
            $row = $result->fetch_array();
            $user_db_hash = $row['password'];
                    
            if (PASSWORD_VERIFY($_POST['password'], $user_db_hash)) {
                 _$SESSION['username'] = $username;
                 echo "valid";
            } else {
                 echo "invalid";
            }
        } else {
           echo "invalid";
        }
      }
      $stmt->free_result();
      $stmt->close();      
      $conn->close();
}
?>