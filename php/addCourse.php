<?php
  require_once("config.php");
  require_once('getSemester.php');
  session_start();
  
  if (isset($_POST['username']) && isset($_POST['codes'])) {
      $username = $_POST['username'];
      $code = json_decode($_POST['codes']);
      
      $today_date_semester = new DateTime(null, new DateTimeZone("UTC"));
      $today_date_semester->setTimeZone(new DateTimeZone("America/New_York"));
      $current_year = $today_date_semester->format("Y");
       
      $sql = "INSERT INTO enrolled_" . $current_year " user_email_" . $current_year .
            ", user_grade_" . $current_year . ", user_semester_" . 
            $current_year_", user_course_code VALUES(?, ?, ?)";

     $semester = get_semester();        
     if ($stmt = $conn->prepare($sql)) {
         $stmt->bind_param("ssss", $username, "-", $semester, $code);
         if ($stmt->execute()) {
             $stmt->close();
             $sql = "UPDATE current_courses_capacity SET current_capacity = current_capacity + 1 WHERE code = ?";
             if ($stmt = $conn->prepare("s", $sql)) {
                 $stmt->bind_param("s", $code);
                 if ($stmt->execute()) {
                    echo "SUCCESS ";
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