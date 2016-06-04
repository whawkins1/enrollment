<!DOCTYPE html>

<?php
   include("config.php");
   
   $year = $_GET['year'];
   $semester = $_GET['semester'];
   
   if( (isset($year) && $year != '') && (isset($semester) && $semester != '') ) {
     session_start();     
     
            $sql = "SELECT enrolled_grades_" . $year . " FROM enrolled_" . $year . " WHERE enrolled_semester = ?";
            if ( $stmt = $conn->prepare($sql)) {
                $stmt->bind_param('s', $_GET['semester']);
                
                if ($stmt->execute()) {
                   $result = $stmt->get_result();
                   $enrolled_grade_str = "enrolled_grades_" . $year;
                   while ($row = $result->fetch_array(MYSQLI_ASSOC)) {
                    echo "<tr>" . $row['code'] . "</tr>"
                    echo "<tr>" . $row['name'] . "</tr>"
                    echo "<tr>" . $row['credits'] . "</tr>"
                    echo "<tr>" . $row[enrolled_grade_str] . "</tr>"
                 }
                   
                }
            }             
   }       
   ?>






















?>