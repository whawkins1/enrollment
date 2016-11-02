<?php 
   require_once('config.php');
   session_start();
   
   if (isset($_POST['username']) && isset($_POST['code'])) {
      $username = $_POST['username'];
      $code = $_POST['code'];
      
      $current_date = new simpleDate();
      $current_year = $current_date->now()->getYear();
      $sql = "DELETE FROM enrolled_" . $current_year . " WHERE user_email_" .
             $current_year . " = ? AND user_course_code = ?";
             
      if ($stmt = $conn->prepare($sql)) {
           $stmt->bind_param("ss", $username, $code);
           if ($stmt->execute()) {
               $stmt->close();
             $sql = "UPDATE current_courses_capacity SET current_capacity = current_capacity + 1 WHERE code = ?";
             if ($stmt = $conn->prepare("s", $sql)) {
                 $stmt->bind_param("s", $code);
                 if ($stmt->execute()) {
                    echo "SUCCESS";
                 } else {
                    echo "ERROR : Subtracting course capacity for ", $code;
                 }
             }
           } else {
               echo "ERROR : Executing Remove Course";
           }
      } else {
          echo "ERROR : Preparing Remove Course";
      }     
   } else {
       echo "ERROR : Paramters not set for removeCourse.php";
   }
   ?>