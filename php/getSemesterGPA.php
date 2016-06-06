<!DOCTYPE html>

<?php
    include("config.php");

     $year = $_GET['year'];
     $semester = $_GET['semester'];
        
     if ( (isset($year) && $year != "") && ( isset($semester) && $semester != "") ) {
        session_start();
        IN email VARCHAR(30), 
                                IN semester VARCHAR(6), 
                                IN year INT(4), 
                                INOUT gradeTotal INT(3), 
                                INOUT creditHours INT(3)
        $call = $conn->prepare("CALL getSemesterGPA(?, ?, @gradetotal, @credithours)"          
        $call = $conn->bind_param('si', $_GET['year'], $_GET['semester']);
        $call->execute();

        $select = $conn->query("SELECT @gradetotal, @credithours");
        $result = $select->fetch_assoc();
        $GPA = ($result['@gradetotal'] / $result['@credithours']);
        
        $call->close();
        $zero = 0;
        // Clear gradetotal variable
        $stmt = $conn->prepare('SET @gradetotal = ?, @credithours = ?');
        $stmt->bind_param('ii', $zero, $zero);
        $stmt->execute();
     }         
?>