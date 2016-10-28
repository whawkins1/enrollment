<?php 
   require_once('config.php');
   session_start();
   
   if (isset($_POST['username']) && isset($_POST['code'])) {
      $username = $_POST['username'];
      $code = $_POST['code'];
      
      $current_date = new simpleDate();
      $current_year = $current_date->now()->getYear();
      $sql = "DELETE FROM enrolled_" . $current_year . " WHERE user_email_" . $current_year . "='" . $username ."'" .
             " AND user_course_code " . "='" . $code . "'";
             
      
      
   }



?>