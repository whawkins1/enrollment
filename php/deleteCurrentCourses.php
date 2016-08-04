<?php
   require("config.php");   
   
       $email = $_POST['email'];
       $code = $_POST['code'];
       $semester = $_POST['semester'];
       //$year = $_POST['year'];
       
       if (isset($email) && !empty($email) &&
           isset($code) && !empty($code) && 
           isset($semester) && !empty($semester) //&& 
           //isset($year) && !empty($year)
           ) {
          
            $year = new simpleDate()->now()->getYear();
            /*$sql = "SELECT EXISTS(SELECT 1 FROM enrolled_" . $year . " WHERE user_email_" . $year . "= ? AND enrolled_semester_" . $year . "= ? AND user_course_code = ? LIMIT 1);";
            
            if ($stmt = $conn->prepare($sql)) {
                $stmt->bind_param("ss", $email, $semester, $code);
                if ($stmt->execute()) {
                    $stmt->bind_result($result);
                    $stmt->fetch();
                    $stmt->close();
                    
                    // If row Does exist remove
                    if ($result == 1) { */
                        $sql = "DELETE from enrolled_". $year . " WHERE user_email_" . $year . "=? AND user_course_code = ? AND enrolled_semester_" . $year . "= ? LIMIT 1;";
                        
                        if ($stmt = $conn->prepare($sql)) {
                           $stmt->bind_param("ss", $email, $code, $semester);
                             if (!$stmt->execute()) {
                                echo "ERROR_DELETE";
                             }                                 
                        } else { 
                            echo "ERROR_DELETE";
                        }
                  /* }                   
                }
            } */
      }
?>