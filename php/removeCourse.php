<?php 
   require_once('config.php');
   session_start();
   
   if (isset($_POST['username']) && isset($_POST['codes'])) {
          $username = $_POST['username'];
          $codes = json_decode(stripslashes($_POST['codes']));
          
          $current_date = new DateTime(null, new DateTimeZone("UTC"));
          $current_date->setTimeZone(new DateTimeZone("America/New_York"));
          $current_year = $current_date->format("Y");      
          $today_timestamp_semester = $current_date->getTimestamp();
      
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
          $sql1 = "DELETE FROM enrolled_" . $current_year . " WHERE user_email_" . $current_year . " = ? 
                  AND user_course_code = ? AND user_semester_" . $current_year " = ?";

          
          foreach ($codes as $code) {     
                  if ($stmt = $conn->prepare($sql1)) {
                       $stmt->bind_param("sss", $username, $code, $semester);
                       if ($stmt->execute()) {
                           $stmt->close();
                         $sql = "UPDATE current_courses_capacity SET current_capacity = current_capacity - 1 WHERE code = ?";
                         if ($stmt = $conn->prepare($sql)) {
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
              }     
    } else {
        echo "ERROR : Paramters not set for removeCourse.php";
    }
   ?>