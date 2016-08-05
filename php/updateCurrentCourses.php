
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
           //$year = new simpleDate()->now()->getYear();
            $sql = "INSERT INTO enrolled_". $year . " SELECT c.* FROM courses AS c WHERE c.code = ? LIMIT 1;";
            
            if ($stmt = $conn->prepare($sql)) {
               $stmt->bind_param("s", $code);
               if(!$stmt->execute()) {
                  echo "ERROR_UPDATE";
               }                               
            } else {
                 echo "ERROR_UPDATE";
            }
      }
?>