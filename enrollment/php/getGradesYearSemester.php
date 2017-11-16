<!DOCTYPE html>

<?php
   include("config.php");
   
   $email = $_GET['email'];
   $year = $_GET['year'];
   $semester = $_GET['semester'];
   
   if( (isset($email) && (!empty($year))
       && (isset($year) && (!empty($year))) 
       && (isset($semester) && (!empty($semester))) {
     session_start();     
     
            $sql = "SELECT enrolled_grades_", $year, 
                   " FROM enrolled_", $year, 
                   " WHERE enrolled_semester = ? AND user_email = ?";
            if ( $stmt = $conn->prepare($sql)) {
                $stmt->bind_param('s', $semester, $user_email);
                
                if ($stmt->execute()) {
                   $result = $stmt->get_result();
                   $enrolled_grade_str = "enrolled_grades_", $year;
                   while ($row = $result->fetch_array(MYSQLI_ASSOC)) {
                     echo "<tr>";
                         echo "<td>", $row['code'], "</td>";
                         echo "<td>", $row['name'], "</td>";
                         echo "<td>", $row['credits'], "</td>";
                         echo "<td>", $row[enrolled_grade_str], "</td>";
                     echo "</tr>";
                   }                   
                }
            }             
   }       
   ?>






















?>