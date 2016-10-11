<?php
   session_start();
   include("config.php");
   
   if (isset($_POST['email']) && 
       isset($_POST['pass']) &&
       isset($_POST['checkType']) {
           
       $email = $_POST['email'];
       $pass = $_POST['pass'];
       $check_type = $_POST['checkType'];
       
       if (strcmp($checkType, "users") === 0) {
           $sql = "SELECT EXISTS(SELECT 1 FROM users WHERE user_email = ? AND user_password = ? LIMIT 1)";
           if ($stmt = $conn->prepare($sql)) {
              $stmt->bind_param('ss', $email, $pass);  
              $stmt->bind_result($user_exists);
              if($result = $stmt->execute()) {
                  if($user_exists === 1) {
                     echo "VALID"; 
                  } else {
                     echo "INVALID";
                  }
                  $result->free();
              } else {
                 echo "ERROR : executing sql";
              }
           } else {
               echo "ERROR : preparing sql";
           }
       } else if (substr($check_type, 0, 6) === 'online') {
          $check_type_split = explode(' ', $check_type);
          $payment_company = trim($check_type_split[1]);
          
          switch ($payment_company) {
              case "amazon":
                   break;
              case "google":
                   break;
              case "paypal":
                   break;
              default:
                   echo "ERROR : Does Not Support ", $payment_company;
          }
       }
   }
?>   