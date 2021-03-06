<!DOCTYPE html>

<?php
    include("config.php");

     $GPA = 0;
     $email = $_GET['email'];
     $year = $_GET['year'];
     $semester = $_GET['semester'];
     $gpa = "ERROR";
       
     if ( (isset($year) && (!empty($year))) && 
          ( isset($semester) && (!empty($semester))) &&
          ( isset($email) && (!empty($email))) ){
        session_start();
         $sql = "SELECT getYearsAttended(?)";           
               $stmt = $conn->prepare($sql);
               $stmt->bind_param('s', $username);
               if($stmt->execute()) {
                  $stmt->bind_result($years_attended_commas);
                  $stmt->fetch();
                  $stmt->close();
               }
        $sql = "CALL getSemesterGPA(?, ?, ?, @semesterGPA");
        $statement = $conn->prepare($sql);         
        $statement->bind_param('ssi', $email, $year, $semester);
        if($stmt->execute()) {
            $stmt->close();
            $sql = "SELECT @semesterGPA";
            $gpa = $conn->query($sql);
        }       
     }
     echo $gpa;
?>