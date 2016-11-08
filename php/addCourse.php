<?php
  require_once("config.php");
  session_start();
  
  if (isset($_POST['username']) && isset($_POST['codes'])) {
      $username = $_POST['username'];
      $code = json_decode($_POST['codes']);
      
      $today_date_semester = new DateTime(null, new DateTimeZone("UTC"));
      $today_date_semester->setTimeZone(new DateTimeZone("America/New_York"));
      $current_year = $today_date_semester->format("Y");
      $today_timestamp_semester = $today_date_semester->getTimestamp();
      
       $fall_start_date = new DateTime($current_year . "-09-01");
       $fall_end_date = new DateTime($current_year . "-01-14");      
      
       if ($fall_start_date->getTimestamp() < $today_timestamp_semester &&
           $fall_end_date->getTimestamp() > $today_timestamp_semester  ) {
           $semester = "spring";               
       }          
       
       if (!(isset($semester))) {
           $spring_start_date = new DateTime($current_year . "-01-15");
           $spring_end_date = new DateTime($current_year . "-05-15");
           
           if ($spring_start_date->getTimestamp() < $today_timestamp_semester &&
               $spring_end_date->getTimestamp() > $today_timestamp_semester) {
               $semester = "summer";
           } 
       }
       
       if (!(isset($semester))) {
            $summer_start_date = new DateTime($current_year . "-06-01");
            $summer_end_date = new DateTime($current_year . "-08-30");
            
            if ($summer_start_date->getTimestamp() < $today_timestamp_semester &&
                $summer_end_date->getTimestamp() < $today_timestamp_ ) { 
                $semester = 'fall'; 
            }     
       }
       
      $sql = "INSERT INTO enrolled_" . $current_year " user_email_" . $current_year .
            ", user_grade_" . $current_year . ", user_semester_" . 
            $current_year_", user_course_code VALUES(?, ?, ?)";
            
     if ($stmt = $conn->prepare($sql)) {
         $stmt->bind_param("ssss", $username, "-", $current_semester, $code);
         if ($stmt->execute()) {
             $stmt->close();
             $sql = "UPDATE current_courses_capacity SET current_capacity = current_capacity - 1 WHERE code = ?";
             if ($stmt = $conn->prepare("s", $sql)) {
                 $stmt->bind_param("s", $code);
                 if ($stmt->execute()) {
                    echo "SUCCESS";
                 } else {
                    echo "ERROR : Subtracting course capacity for ", $code;
                 }
             }
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