<?php
  require_once("config.php");
  session_start();
  
  if (isset($_POST['username']) && isset($_POST['code'])) {
      $username = $_POST['username'];
      $code = $_POST['code'];
      
      $current_date = new simpleDate();
      $current_year = $current_date->now()->getYear();
      
       if () { //Fall 9-1 to 1-14
        } elseif() { //Spring 1-15 to 5-15
        } elseif() { //Summer 6-1 to 8-30
        }
      
      $sql = "INSERT INTO enrolled_" . $current_year " user_email_" . $current_year .
            ", user_grade_" . $current_year . ", user_semester_" . 
            $current_year_", user_course_code VALUES(?, ?, ?)";
            
     if ($stmt = $conn->prepare($sql)) {
         $stmt->bind_param($current_year, "-");
         if ($stmt->execute()) {
             echo "SUCCESS";
         } else {
             echo "ERROR : Executing Add Course";
         }         
     } else {
         echo "ERROR : Preparing Add Course";
     }       
  } else {
      echo "ERROR : Parameters not set for addCourse.php";
  }
?>