<!DOCTYPE html>

<?php
    include("config.php");

     $cumulativeGPA = 0;
     $email = $_GET['email'];
     $year = $_GET['year'];
     $semester = $_GET['semester'];
        
     if ( (isset($year) && $year != "") &&
          ( isset($semester) && $semester != "") &&
          ( isset($email) && $email !="") ) {
        session_start();
        $callYearsAttended = $conn->prepare("CALL getYearsAttended(?)");
        $callYearsAttended->bind_param('s', $_GET['email']);
        $callYearsAttended->execute();      
        $result = $callYearsAttended->fetch();
        $yearsAttended = $result[//column name not sure
        $callYearsAttended->close();        
        
        $call = $conn->prepare("CALL getTotalGPA(?, ?)"          
        $call->bind_param('ss', $email, $yearsAttended);
        $call->execute();
        $result = call->fetch();
        $cumulativeGPA = $result[//column name not sure        
     }         
     return $cumulativeGPA;     
?>