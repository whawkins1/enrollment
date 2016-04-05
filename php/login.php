<?php
  session_start();
  include("config.php");
if($_POST) {	
        $username = mysqli_real_escape_string($conn, $_POST['username']);
                
		$query = "SELECT password From users WHERE username = ?";
		
        $statement = mysqli_prepare($conn,$query);
        
        if ($statement === false) {
          trigger_error("Statement Failed!") . htmlspecialchars(mysqli_error($conn)), E_USER_ERROR);
        }
        
        $bind = mysqli_stmt_bind_param($stmt, 's', $username);
        
        if ($bind === false) {
           trigger_error("Bind param failed", E_USER_ERROR);
        }
        
        $exec = mysqli_stmt_execute($stmt);
        
        if ($exec === false) {
           trigger_error("Statement execute failed!" . htmlspecialchars(mysqli_error($conn)), E_USER_ERROR); 
        }
        
        mysqli_stmt_store_result($stmt);
        
        mysqli_stmt_bind_result($stmt, $user_db_hash);
         
        if (mysqli_stmt_num_rows($stmt) === 1) {  //No Username Match
                mysqli_stmt_fetch($stmt);
                
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
      mysqli_stmt_close($stmt);
      mysqli_close($conn);
}
?>