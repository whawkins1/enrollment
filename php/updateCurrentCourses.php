
<?php
   require("config.php");   
   
       $email = $_POST['email'];
       $code = $_POST['code'];
       $semester = $_POST['semester'];
       $year = $_POST['year'];
       
       if (isset($email) && !empty($email) &&
           isset($code) && !empty($code) && 
           isset($semester) && !empty($semester) && 
           isset($year) && !empty($year)) {
          
            $sql = "SELECT EXISTS(SELECT 1 FROM enrolled_" . $year . " WHERE user_email" . $year . "= ? AND enrolled_semester" . $year . "= ? LIMIT 1)";
            
            if ($stmt = $conn->prepare($sql)) {
                $stmt->bind_param("ss", $email, $semester);
                if ($stmt->execute()) {
                    $stmt->bind_result($result);
                    $stmt->fetch();
                    $stmt->close();
                    
                    // If row Does not exist add
                    if ($result == 0) {
                        $sql = "INSERT INTO enrolled_". $year . " SELECT c.* FROM courses c WHERE c.code = ?";
                        
                        if ($stmt = $conn->prepare($sql)) {
                           $stmt->bind_param("s", $code);
                           $stmt->execute(); 
                        }
                    }                   
                }
            }
      }
?>