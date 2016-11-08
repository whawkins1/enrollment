<?php 
   require_once('config.php');
   session_start();
   
   if (isset($_POST['username']) && isset($_POST['codes'])) {
      $username = $_POST['username'];
      $code = json_encode($_POST['codes']);
      
      $current_date = new DateTime(null, new DateTimeZone("UTC"));
      $today_date_semester->setTimeZone(new DateTimeZone("America/New_York"));
      $current_year = $current_date->format("Y");      
      $sql = "DELETE FROM enrolled_" . $current_year . 
             " WHERE user_email_" . $current_year . " = ? AND user_course_code = ?";
             
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