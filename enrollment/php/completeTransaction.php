<?php
   session_start();
   include("config.php");
   
   if(isset($_POST['username']) &&
      isset($_POST['todaysDate']) &&
      isset($_POST['transID']) &&
      isset($_POST['currentBalance']) &&
      isset($_POST['paymentMethod']) &&
      isset($_POST['payment']) &&
      isset($_POST['paymentType']) &&
      isset($_POST['paymentCompany']) &&
      isset($_POST['finalBalance'])) {
          
          $username = $_POST['username'];
          $todays_date = $_POST['todaysDate'];
          $trans_id = $_POST['transID'];
          $current_balance = $_POST['currentBalance'];
          $payment_method = $_POST['paymentMethod'];
          $payment = $_POST['payment'];
          $payment_type = $_POST['paymentType'];
          $payment_company = $_POST['paymentCompany'];
          $final_balance = $_POST['finalBalance'];
          
          $noError = true;
            switch($payment_company) {
                case "amazon":
                         $sqlSubtractBalance = "SELECT online_payment_amazon WHERE online_amazon_username = ?";
                         $sqlUpdateBalance = "UPDATE online_payment_amazon SET online_payment_amazon = ? WHERE online_amazon_username = ?";
                     break;
                case "american express":
                         $sqlSubtractBalance = "SELECT credit_card_american_express WHERE american_express_number_hash = ?";
                         $sqlUpdateBalance = "UPDATE credit_card_american_express SET american_express_balance = ? WHERE american_express_number_hash = ?";
                     break;
                case "discover":
                         $sqlSubtractBalance = "SELECT credit_card_discover WHERE discover_number_hash = ?";
                         $sqlUpdateBalance = "UPDATE credit_card_discover SET discover_balance = ? WHERE discover_number_hash = ?";
                     break;
                case "google":
                         $sqlSubtractBalance = "SELECT online_payment_goodle WHERE online_google_username = ?";
                         $sqlUpdateBalance = "UPDATE online_payment_google SET online_payment_google = ? WHERE online_google_username = ?";
                     break;
                case "mastercard":
                         $sqlSubtractBalance = "SELECT credit_card_mastercard WHERE mastercard_number_hash = ?";
                         $sqlUpdateBalance = "UPDATE credit_card_mastercard SET mastercard_balance = ? WHERE mastercard_number_hash = ?";
                     break;
                case "paypal":
                         $sqlSubtractBalance = "SELECT online_payment_paypal WHERE online_paypal_username = ?";
                         $sqlUpdateBalance = "UPDATE online_payment_paypal SET online_payment_paypal = ? WHERE online_paypal_username = ?";
                     break;
                case "visa":
                         $sqlSubtractBalance = "SELECT credit_card_visa WHERE visa_number_hash = ?";
                         $sqlUpdateBalance = "UPDATE credit_card_visa SET visa_balance = ? WHERE visa_number_hash = ?";
                     break;                
                default:
                     echo "ERROR : payment company not recognized";
                     $noError = false;
                     
                     if ($noError) {
                         subtractPaymentFromBalance($sqlSubtractBalance, $sqlUpdateBalance, $payment, $username);
                         subtractPaymentFromUserBalance($payment, $username);
                     } 
            }          
      }
      
      function subtractPaymentFromUserBalance($payment, $username) {
           $sql_get_user_balance = "SELECT user_balance FROM users WHERE user_email = ?";
           $sql_update_user_balance = "UPDATE users SET user_balance = ? WHERE user_email = ?";
           
           if ($stmt = $conn->prepare($sql_get_user_balance)) {
               $stmt->bind_param("s", $username);
               $stmt->bind_result($userBalance);
               if ($stmt->execute()) {
                   $recalculated_user_balance = ($user_balance - $payment);
                   $stmt->close();
                   if ($stmt = $conn->prepare($sql_update_user_balance)) {
                       $stmt->bind_param("ds", $recalculated_user_balance, $username);
                       if ($stmt->execute()) {
                          echo "SUCCESS";
                       }  else {
                          echo "ERROR : Executing Update Users Balance";
                       }
                   } else { 
                       echo "ERROR : Preparing Update For Users Balance";
                   }
               } else {
                  "ERROR : Executing Get User Balance";
               }
           } else {
              "ERROR : Preparing Get User Balance";
           }
      }
      
      function subtractPaymentFromCompanyBalance($sqlSubtractBalance, 
                                                 $sqlUpdateBalance, 
                                                 $payment, 
                                                 $username) {
                                              
           if ($stmt = $conn->prepare($sqlSubtractBalance)) {
                  $stmt->bind_param($username);
                  $stmt->bind_result($balance);
                  if ($stmt->execute()) {
                       $recalculated_balance = ($balance - $payment);
                       $stmt->close();
                       if ($stmt = $conn->prepare($sqlUpdateBalance)) {
                          $stmt->bind_param("ds", $recalculated_balance, $username);
                          if ($stmt->execute()) {
                              echo "SUCCESS";
                          } else {
                               echo "ERROR : Executing Update Balance";
                          }                              
                       } else {
                           echo "ERROR : Preparing Update For Balance";
                       }
                  } else {
                     echo "ERROR : Executing Subtract Balance";
                  }
         } else {
            echo "ERROR : Preparing Update For Substract Balance";
         }             
    }
?>