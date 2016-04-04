<?php
  include("config.php");
if($_POST) {	
        $username = mysqli_real_escape_string($conn, $_POST['username']);
                
		$query = "SELECT password From users WHERE username='$username'";
		$result = mysqli_query($conn,$query);
        
        if ($result) {
            if(mysqli_num_rows($result) === 1) {
                $entered_pass = mysqli_real_escape_string($conn, $_POST['password']);
                $user_db_pass = $result['password'];
                
                if (crypt($entered_pass, $user_db_pass) === $user_db_pass) {
                      session_start();
                    _$SESSION['username'] = $username;
                    echo "valid";
                } else {
                    echo "invalid";
                }
            } else {
                echo "invalid";
            }
        } 
}
?>