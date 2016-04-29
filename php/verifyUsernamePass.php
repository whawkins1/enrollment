<?php
   session_start();
   include("config.php");
   $email = $_POST['email'];
   $pass = $_POST['pass'];

   $result = mysqli_query($conn, "SELECT * FROM users WHERE user_email='$email' AND user_password = '$pass'");
    
    if ($result) {
        if (mysqli_num_rows($result) == 1) {
           echo "valid";
        }  else {
           echod "invalid";
        }            
    }   
    
    mysqli_free_result($result);
    mysqli_close($conn);
?>   