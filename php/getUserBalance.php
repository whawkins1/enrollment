<?php
   include ("config.php");
   $email = $POST['email'];
    $result = mysqli_query($conn, "SELECT balance FROM users WHERE user_email='$email'");
    
    if($result) {
       echo $result;
    }
        mysqli_free_result($result);
        mysqli_close($conn);
    ?>    