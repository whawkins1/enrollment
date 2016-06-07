<!DOCTYPE html>

<?php
    include("config.php");

     $year = $_GET['year'];
     $semester = $_GET['semester'];
        
     if ( (isset($year) && $year != "") && ( isset($semester) && $semester != "") ) {
        session_start();
      
        $call = $conn->prepare("CALL getSemesterGPA(?, ?, @gradetotal, @credithours)"          
        $call->bind_param('si', $_GET['year'], $_GET['semester']);
        $call->execute();
        $call->close();

        $select = $conn->query("SELECT @gradetotal, @credithours");
        $result = $select->fetch_assoc();
        $GPA = ($result['@gradetotal'] / $result['@credithours']);
        
        $zero = 0;
        // Clear gradetotal variable
        $stmt = $conn->prepare('SET @gradetotal = ?, @credithours = ?');
        $stmt->bind_param('ii', $zero, $zero);
        $stmt->execute();
     }         
?>