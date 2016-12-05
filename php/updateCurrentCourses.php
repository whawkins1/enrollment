
<?php
   require("config.php");   
   require("utilityFunctions.php");
   
       $email = $_POST['email'];
       $code = $_POST['code'];
       $semester = $_POST['semester'];
       $grade = $_POST['grade'];
       
       if (isset($email) && !empty($email) &&
           isset($code) && !empty($code) && 
           isset($semester) && !empty($semester) &&
           isset($grade) && !empty($grade)            
           ) {
           
          $current_date = getCurrentDateObject(); 
          $year = $current_date->format("Y");
          
          //temporary
           $year = "2010"; 
           
            $sql = "INSERT INTO enrolled_". $year . " (user_email_" . $year . ", user_grade_" . $year . 
                                                    ", user_semester_" . $year . ", user_course_code 
                   ) VALUES( '" . $email . "', '" . $grade . "', '" . $semester . "', '" . $code . "');";
            
            if ($stmt = $conn->prepare($sql)) {
               if(!$stmt->execute()) {
                  echo "ERROR : Executing update to courses";
               }                               
            } else {
                 echo "ERROR : Preparing update to courses";
            }
      }
?>