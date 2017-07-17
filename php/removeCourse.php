<?php 
   require_once('config.php');
   require_once('getSemester.php');
   session_start();
   
   if (isset($_SESSION['username']) && isset($_POST['codes'])) {
          $username = $_SESSION['username'];
          $codes = json_decode(stripslashes($_POST['codes']));
          
          $current_date = new DateTime(null, new DateTimeZone("UTC"));
          $current_date->setTimeZone(new DateTimeZone("America/New_York"));
          $current_year = $current_date->format("Y");
          
          $sql_delete = "DELETE FROM enrolled_" . $current_year . " WHERE user_email_" . $current_year . " = ? 
                        AND user_course_code = ? AND user_semester_" . $current_year " = ?";

          $semester = get_semester();
          foreach ($codes as $code) {     
                  if ($stmt = $conn->prepare($sql_delete)) {
                       $stmt->bind_param("sss", $username, $code, $semester);
                       if ($stmt->execute()) {
                           $stmt->close();
                         $sql_update = "UPDATE current_courses_capacity SET current_capacity = current_capacity - 1 WHERE code = ?";
                         if ($stmt = $conn->prepare($sql_update)) {
                             $stmt->bind_param("s", $code);
                             if ($stmt->execute()) {
                                echo "SUCCESS";
                             } else {
                                echo "ERROR : Subtracting course capacity for ", $code;
                             }
                         }
                       } else {
                           echo "ERROR : Executing Remove Course for " . $code;
                       }
                  } else {
                      echo "ERROR : Preparing Remove Course for " . $code;
                  }     
              }     
    } else {
        echo "ERROR : Paramters not set for removeCourse.php";
    }
   ?>