<?php
   require_once("config.php");
   session_start();
   
   if (isset($_POST['email']) && 
       isset($_POST['pass']) &&
       isset($_POST['checkType']) {
           
       $email = $_POST['email'];
       $pass = $_POST['pass'];
       $check_type = $_POST['checkType'];
       
       if (strcmp($checkType, "users") === 0) {
           $sql = "SELECT EXISTS(SELECT 1 FROM users WHERE user_email = ? AND user_password = ? LIMIT 1)";
       } else if (substr($check_type, 0, 6) === 'online') {
          $check_type_split = explode(' ', $check_type);
          $payment_company = trim($check_type_split[1]);
          
          switch ($payment_company) {
              case "amazon":
                   $sql = "SELECT EXITS(SELECT 1 FROM online_payment_amazon online_amazon_username = ? LIMIT 1)";
                   break;
              case "google":
                   $sql = "SELECT EXITS(SELECT 1 FROM online_payment_google online_google_username = ? LIMIT 1)";
                   break;
              case "paypal":
                   $sql = "SELECT EXITS(SELECT 1 FROM online_payment_amazon online_amazon_username = ? LIMIT 1)";
                   break;
              default:
                   echo "ERROR Does Not Support ", $payment_company;
          }          
       }
       if (isset($sql)) {
           executeQuery($sql, $username, $pass);
       }
   }
   
   function executeQuery($sql, $username, $pass) {
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
                 echo "ERROR executing sql";
              }
           } else {
               echo "ERROR preparing sql";
           }
   }
?>   