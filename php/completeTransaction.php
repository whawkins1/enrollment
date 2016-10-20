<?php
   session_start();
   include("config.php");
   
   if(isset($_POST['todaysDate']) &&
      isset($_POST['transID']) &&
      isset($_POST['currentBalance']) &&
      isset($_POST['paymentMethod']) &&
      isset($_POST['paymentType']) &&
      isset($_POST['paymentCompany']) &&
      isset($_POST['finalBalance'])) {
          
          $todays_date = $_POST['todaysDate'];
          $trans_id = $_POST['transID'];
          $current_balance = $_POST['currentBalance'];
          $payment_method = $_POST['paymentMethod'];
          $payment_type = $_POST['paymentType'];
          $payment_company = $_POST['paymentCompany'];
          $final_balance = $_POST['finalBalance'];
          
            switch($payment_company) {
                case "amazon":
                     break;
                case "american express":
                     break;
                case "discover":
                     break;
                case "google":
                     break;
                case "mastercard":
                     break;
                case "paypal":
                     break;
                case "visa":
                     break;                
                default:
                     echo "ERROR : payment company not recognized";
            }          
      }
?>