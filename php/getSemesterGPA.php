<!DOCTYPE html>

<?php
    include("config.php");

     $GPA = 0;
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
        $GPAConv = strval(number_format((float)$GPA, 2, ".", ","));    
     
        $zero = 0;
        // Clear gradetotal variable
        $stmt = $conn->prepare('SET @gradetotal = ?, @credithours = ?');
        $stmt->bind_param('ii', $zero, $zero);
        $stmt->execute();
     }
     echo $GPAConv;
?>