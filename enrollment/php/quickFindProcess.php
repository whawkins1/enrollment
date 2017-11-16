<?php
    require_once('config.php');
    
    if (isSet($_GET['term']) && (!empty($_GET['term'])) {
        $code = $_GET['term'];
        
        $sql = "SELECT FROM courses * WHERE code = ?;";
        
        if ($stmt = $conn->prepare($sql)) {
            $stmt->bind_param('s', $code);
            if ($stmt->execute()) {
                $stmt->store_result();
                if ($stmt->num_rows > 0) {
                   echo "<div id='containerresultstitle'>";
                    echo "<label class='labelresultstitle'>Results</label>";
                    echo "</div>";
                    echo "<div id='containerresultstable'>";
                    echo "<table id='tableresults' class='tablesorter'>";
                    echo "<thead>";
                    echo    "<tr id='headerRow'>";
                    echo       "<th class='code'>Code</th>";
                    echo       "<th class='name'>Name</th>";
                    echo       "<th class='department'>Department</th>";
                    echo       "<th class='professor'>Professor</th>";
                    echo       "<th class='time'>Time</th>";
                    echo       "<th class='location'>Location</th>";
                    echo       "<th class='credits'>Credits</th>";
                    echo    "</tr>";
                    echo  "</thead>"; 
                    echo "<tbody>";
                    
                    $stmt->bind_result($code, $title, $days, $begin_time, 
                                       $end_time, $credits , $professor_last_name, 
                                       $professor_first_name, $location ,
                                       $department, $am_pm);
                                       
                    echo "<tr>";
                          echo "<td id='code'>", $code, "</td>";
                          echo "<td id='title'>", $title, "</td>";
                          echo "<td id='department'>", $department, "</td>";
                          echo "<td id='professorname'>",  $professor_last_name, ", ", $professor_first_name, "</td>";
                          echo "<td id='time'>", $begin_time, '-', $end_time, $am_pm,  ", ",  $days, "</td>";
                          echo "<td id='location'>", $location, "</td>";
                          echo "<td id='credits'>", $credits, "</td>";
                    echo "</tr>";
                    echo "</tbody>";
                } else {
                    echo "<label id='labelnoresults'>NO RESULTS</label>";
                }
            } else {
                echo "ERROR_EXECUTING_STATEMENT";
            }
        } else {
          echo "ERROR_PREPARING_STATEMENT";
        }
    }
?>