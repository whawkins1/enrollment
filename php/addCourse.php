<?php
  require_once("config.php");
  session_start();
  
  if (isset($_POST['username']) && isset($_POST['code'])) {
      $username = $_POST['username'];
      $code = $_POST['code'];
      
      $current_date = new simpleDate();
      $current_year = $current_date->now()->getYear();
      $today_date_semester = new DateTime('Y-m-d H:i:s');
      
      $fall_start_date = new DateTime("Sep 1");
      $fall_end_date = new DateTime("Jan 14");
        
       if ($fall_start_date < $fall_end_date ) { 
            $between_fall_date = ($fall_start_date <  $today_date_semster && $today_date_semester < $fall_end_date); 
       } else if ($fall_start_date > $fall_end_date) {
            $between_fall_date = ($today_date_semester < $fall_end_date || $today_date_semester > $fall_start_date);          
       }           
       
       if (!(isset($between_fall_date))) {
           $spring_start_date = new DateTime("Jan 15");
           $spring_end_date = new DateTime("May 15");
           
           if ($spring_start_date < $spring_end_date) {
              $between_spring_date = ($spring_start_date <= $today_date_semester && $today_date_semester <= $spring_end_date);
           } else if ($spring_start_date > $spring_end_date) {
              $between_spring_date = ($today_date_semester  <= $spring_end_date || $today_date_semester >= $spring_start_date);
           }
       }
       
       if (!(isset($between_fall_date) && isset($between_spring_date))) {
            $summer_start_date = new DateTime("Jun 1");
            $summer_end_date = new DateTime("Aug 30");
            
            if ($summer_start_date < $summer_end_date ) { 
               $between_summer_date = ($summer_start_date <  $today_date_semester && $today_date_semester < $summer_end_date); 
            } else if ($summer_start_date > $summer_end_date) {
               $between_summer_date = ($today_date_semester < $summer_end_date || $today_date_semester > $summer_start_date);          
            }    
       }
       
       if ($between_fall_date) {
            $current_semester = "spring";
       } else if ($between_spring_date) {
            $current_semester = "summer";
       } else if ($between_summer_date) {
            $current_semester = "fall";
       }
       
      $sql = "INSERT INTO enrolled_" . $current_year " user_email_" . $current_year .
            ", user_grade_" . $current_year . ", user_semester_" . 
            $current_year_", user_course_code VALUES(?, ?, ?)";
            
     if ($stmt = $conn->prepare($sql)) {
         $stmt->bind_param($username, "-", $current_semester, $code);
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