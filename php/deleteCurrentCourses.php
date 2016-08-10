<?php
   require("config.php");   
   
       $email = $_POST['email'];
       $code = $_POST['code'];
       $semester = $_POST['semester'];
       
       if (isset($email) && !empty($email) &&
           isset($code) && !empty($code) && 
           isset($semester) && !empty($semester) 
           ) {
          
            $year = "2010"; 
            $sql = "DELETE from enrolled_". $year . " WHERE user_email_" . $year . " = ? 
                   AND user_course_code = ? 
                   AND user_semester_" . $year . " = ?;";
            
            if ($stmt = $conn->prepare($sql)) {
               $stmt->bind_param("sss", $email, $code, $semester);
                 if (!$stmt->execute()) {
                    echo "ERROR_DELETE";
                 }                                 
            } else { 
                echo "ERROR_DELETE";
            }
      }
?>